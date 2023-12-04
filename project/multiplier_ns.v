module multiplier_ns(op_start, op_clear, state, cnt, n_state);
	input op_start, op_clear;
	input [1:0] state;
	input [6:0] cnt; // count for cycle
	output reg [1:0] n_state;
	
	parameter INIT = 2'b00;
	parameter FIRST = 2'b10;
	parameter OPERATE = 2'b01;
	parameter DONE = 2'b11;
	
	always @(*)
	begin
		case(state)
			INIT: begin
				if (op_clear == 1)
					n_state = INIT;
				else if (op_start == 1'b1) 
					n_state = OPERATE;
				else
					n_state = INIT;
			end
			
			OPERATE: begin
				if (op_clear == 1'b1) 
					n_state = INIT;
				else if (cnt == 7'b011_1110)
					n_state = DONE;
				else
					n_state = OPERATE;
			end
			
			DONE: begin
				if (op_clear == 1'b1)
					n_state = INIT;
				else
					n_state = DONE;
			end
			
			default:
				n_state = 2'bxx;
		endcase
	end
endmodule