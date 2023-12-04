module multiplier_cal(state, cnt, multiplicand, temp, result, op_done, n_cnt, n_result, n_temp);
	input [1:0] state;
	input [6:0] cnt; // count cycle
	input [63:0] multiplicand, temp; // temp is multiplier
	input [127:0] result;
	output reg op_done;
	output reg [6:0] n_cnt;
	output reg [127:0] n_result;
	output reg [63:0] n_temp; // next multiplier
	
	wire [63:0] temp_add, temp_min, temp_add2, temp_min2;
	wire [6:0] temp_n_cnt;
	
	parameter INIT = 2'b00;
	parameter FIRST = 2'b10;
	parameter OPERATE = 2'b01;
	parameter DONE = 2'b11;
	
	parameter zzz = 3'b000;
	parameter zoz = 3'b010;
	parameter ozz = 3'b100;
	parameter ooz = 3'b110;
	parameter zzo = 3'b001;
	parameter zoo = 3'b011;
	parameter ozo = 3'b101;
	parameter ooo = 3'b111;

	cla64 U0_add(result[127:64], multiplicand, 1'b0, temp_add);
	cla64 U1_minus(result[127:64], ~multiplicand, 1'b1, temp_min);
	cla64 U2_add2(temp_add, multiplicand, 1'b0, temp_add2);
	cla64 U3_minus2(temp_min, ~multiplicand, 1'b1, temp_min2);
	rca7 U4_cnt(cnt, 7'b000_0001, 1'b1, temp_n_cnt);
	
	always @(*)
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
					case (temp[2:0])
						zzz: begin
							n_result = {n_result[127], n_result[127], n_result[127:2]};
						end
						zoz: begin
							n_result [127:64] = temp_add;
							n_result = {n_result[127], n_result[127], n_result[127:2]};
						end
						ozz: begin
							n_result [127:64] = temp_min2;
							n_result = {n_result[127], n_result[127], n_result[127:2]};
						end
						ooz: begin
							n_result [127:64] = temp_min;
							n_result = {n_result[127], n_result[127], n_result[127:2]};
						end
						zzo: begin
							n_result [127:64] = temp_add;
							n_result = {n_result[127], n_result[127], n_result[127:2]};
						end
						zoo: begin
							n_result [127:64] = temp_add2;
							n_result = {n_result[127], n_result[127], n_result[127:2]};
						end
						ozo: begin
							n_result [127:64] = temp_min;
							n_result = {n_result[127], n_result[127], n_result[127:2]};
						end
						ooo: begin
							n_result = {n_result[127], n_result[127], n_result[127:2]};
						end
					endcase
					n_temp = {temp[63], temp[63], temp[63:2]};					
				end
				// if cnt is 0, first cycle
				else begin
					if (temp[1:0] == 2'b01) begin
						n_result = {temp_add, 64'b0};
						n_result = {n_result[127], n_result[127], n_result[127:2]};
					end
					else if (temp[1:0] == 2'b10) begin
						n_result = {temp_min2, 64'b0};
						n_result = {n_result[127], n_result[127], n_result[127:2]};
					end
					else if (temp[1:0] == 2'b11) begin
						n_result = {temp_min, 64'b0};
						n_result = {n_result[127], n_result[127], n_result[127:2]};
					end
					n_temp = {temp[63], temp[63:1]};
				end
				
				// shift multiplier (temp)
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
