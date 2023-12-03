module multiplier_cal(state, cnt, multiplicand, temp, result, op_done, n_cnt, n_result, n_temp);
	input [1:0] state;
	input [5:0] cnt; // count cycle
	input [63:0] multiplicand, temp; // temp is multiplier
	input [127:0] result;
	output reg op_done;
	output reg [5:0] n_cnt;
	output reg [127:0] n_result;
	output reg [63:0] n_temp; // next multiplier
	
	wire [63:0] temp_add, temp_min;
	wire [5:0] temp_n_cnt;
	
	parameter INIT = 2'b00;
	parameter OPERATE = 2'b01;
	parameter DONE = 2'b11;

	cla64 U0_add(result[127:64], multiplicand, 1'b0, temp_add);
	cla64 U1_minus(result[127:64], ~multiplicand, 1'b1, temp_min);
	rca6 U2_cnt(cnt, 6'b000000, 1'b1, temp_n_cnt);
	
	always @(multiplicand or temp or state or cnt)
	begin
		case(state)
			INIT: begin
				op_done = 0;
				n_cnt = 0;
				n_temp = 0;
				n_result = 0;
			end
			OPERATE: begin
				// if cnt is not 0
				if (cnt != 0) begin
					if (temp[1] == 0 && temp[0] == 0)
						n_result = {n_result[127], n_result[127:1]};
					else if (temp[1] == 1 && temp[0] == 1)
						n_result = {n_result[127], n_result[127:1]};
					else if (temp[1] == 1 && temp[0] == 0) begin
						n_result [127:64] = temp_min;
						n_result = {n_result[127], n_result[127:1]};
					end
					else begin
						n_result [127:64] = temp_add;
						n_result = {n_result[127], n_result[127:1]};
					end
				end
				// if cnt is 0, first cycle
				else begin
					if (temp[0] == 1) begin
						n_result = {temp_min, 64'b0};
						n_result = {n_result[127], n_result[127:1]};
					end
				end
				
				// shift multiplier (temp)
				n_temp = {temp[0], temp[63:1]};
				n_cnt = temp_n_cnt;
			end
			DONE: begin
				op_done = 1;
			end
			default:
				op_done = 1'bx;
		endcase
	end
	
endmodule
