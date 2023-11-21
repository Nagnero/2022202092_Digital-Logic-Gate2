module multiplier_ns(op_start, op_clear, op_done, state, cnt, n_state);
	input op_start, op_clear, op_done;
	input [1:0] state;
	input [5:0] cnt; // count for cycle
	output reg [1:0] n_state;
	
	parameter INIT = 2'b00;
	parameter OPERATE = 2'b01;
	parameter DONE = 2'b11;
	
	always @(op_start or op_clear or state or cnt)
	begin
		case(state)
			INIT: begin
				if (op_start == 1'b1) 
					n_state = OPERATE;
				else 
					n_state = INIT;
			end
			
			OPERATE: begin
				if (op_clear == 1'b1) 
					n_state = INIT;
				else if (cnt == 6'b111111)
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
