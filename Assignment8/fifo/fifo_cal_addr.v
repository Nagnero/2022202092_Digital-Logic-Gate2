module fifo_cal_addr(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);
	input [2:0] state;
	input [2:0] head;
	input [2:0] tail;
	input [3:0] data_count;
	output reg we, re;
	output reg [2:0] next_head;
	output reg [2:0] next_tail;
	output reg [3:0] next_data_count;
	
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter READ = 3'b010;
	parameter WR_ERROR = 3'b101;
	parameter RD_ERROR = 3'b110;
	parameter NO_OP = 3'b111;
	
	always@(state or head or tail or data_count)
	begin
		case(state)
			INIT: begin // INIT state
				we = 1'b0;
				re = 1'b0;
				next_head = head; // head, tail, and count is same
				next_tail = tail;
				next_data_count = data_count;
			end
			WRITE: begin // WRITE state
				we = 1'b1;
				re = 1'b0;
				next_head = head; // head is same
				case (tail) // increase tail by 1
					3'b000: next_tail = 3'b001;
					3'b001: next_tail = 3'b010;
					3'b010: next_tail = 3'b011;
					3'b011: next_tail = 3'b100;
					3'b100: next_tail = 3'b101;
					3'b101: next_tail = 3'b110;
					3'b110: next_tail = 3'b111;
					3'b111: next_tail = 3'b000;
					default: next_tail = 3'bx;
				endcase
				next_data_count = data_count + 1; // increase count
			end
			READ: begin
				we = 1'b0;
				re = 1'b1;
				case (head) // increase head by 1
					3'b000: next_head = 3'b001;
					3'b001: next_head = 3'b010;
					3'b010: next_head = 3'b011;
					3'b011: next_head = 3'b100;
					3'b100: next_head = 3'b101;
					3'b101: next_head = 3'b110;
					3'b110: next_head = 3'b111;
					3'b111: next_head = 3'b000;
					default: next_head = 3'bx;
				endcase
				next_tail = tail; // tail is same
				next_data_count = data_count - 4'b0001; // decrease count
			end
			WR_ERROR: begin
				we = 1'b0;
				re = 1'b0;
				next_head = head; // head, tail, and count is same
				next_tail = tail;
				next_data_count = data_count;
			end
			RD_ERROR: begin
				we = 1'b0;
				re = 1'b0;
				next_head = head; // head, tail, and count is same
				next_tail = tail;
				next_data_count = data_count;
			end
			NO_OP: begin
				we = 1'b0;
				re = 1'b0;
				next_head = head; // head, tail, and count is same
				next_tail = tail;
				next_data_count = data_count;
			end
		endcase
	end
endmodule
	