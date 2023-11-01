module fifo_ns(wr_en, rd_en, state, data_count, next_state);
	input wr_en, rd_en;
	input [2:0] state;
	input [3:0] data_count;
	output reg [2:0] next_state;
	
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter READ = 3'b010;
	parameter WR_ERROR = 3'b101;
	parameter RD_ERROR = 3'b110;
	parameter NO_OP = 3'b111;
	
	always@(state, wr_en, rd_en, data_count)
	begin
		case(state)
			INIT: begin
				if (wr_en === 0 && rd_en === 0)
					next_state = INIT;
				else if(wr_en === 1) begin
					if (data_count < 4'b1000) next_state = WRITE;
					else next_state = WR_ERROR;
				end
				else begin
					if (data_count > 4'b0000) next_state = READ;
					else next_state = RD_ERROR;
				end
			end
			WRITE: begin
				if(wr_en === 1) begin
					if (data_count < 4'b1000) next_state = WRITE;
					else next_state = WR_ERROR;
				end
				else begin
					if (data_count > 4'b0000) next_state = READ;
					else next_state = RD_ERROR;
				end
			end
			READ: begin
				if(wr_en === 1) begin
					if (data_count < 4'b1000) next_state = WRITE;
					else next_state = WR_ERROR;
				end
				else begin
					if (data_count > 4'b0000) next_state = READ;
					else next_state = RD_ERROR;
				end
			end
			WR_ERROR: begin
				if(wr_en === 1) begin
					if (data_count < 4'b1000) next_state = WRITE;
					else next_state = WR_ERROR;
				end
				else begin
					if (data_count > 4'b0000) next_state = READ;
					else next_state = RD_ERROR;
				end
			end
			RD_ERROR: begin
				if(wr_en === 1) begin
					if (data_count < 4'b1000) next_state = WRITE;
					else next_state = WR_ERROR;
				end
				else begin
					if (data_count > 4'b0000) next_state = READ;
					else next_state = RD_ERROR;
				end
			end
			NO_OP: begin
				if(wr_en === 1) begin
					if (data_count < 4'b1000) next_state = WRITE;
					else next_state = WR_ERROR;
				end
				else begin
					if (data_count > 4'b0000) next_state = READ;
					else next_state = RD_ERROR;
				end
			end
		endcase
	end
endmodule
	