module ns_controller(opstart, opdone, opclear, operand, m_opdone, multiplier, state, n_state);
	input opstart, opclear, m_opdone;
	input [1:0] opdone;
	input [2:0] state;
	input [63:0] multiplier, operand;
	output reg [2:0] n_state;

	parameter INIT = 3'b000;
	parameter CLEAR = 3'b001;
	parameter START = 3'b010;
	parameter WAIT = 3'b011; // wait for multiplier calc
	parameter M_CLEAR = 3'b100; // multiplier clear
	parameter OP = 3'b101; // m_operand deduction
	parameter DONE = 3'b110;
	parameter ONE = 3'b111;
	
	always @(*) begin
		case(state)
			INIT: begin
				n_state = CLEAR;
			end
			CLEAR: begin
				if (opstart == 1) n_state = START;
			end
			START: begin
				if (operand == 0 || operand == 1) n_state = ONE;
				else n_state = WAIT;
			end
			WAIT: begin
				if (m_opdone != 1) n_state = WAIT;
				else begin
					if (multiplier == 64'h2) n_state = DONE;
					else n_state = M_CLEAR;
				end
			end
			M_CLEAR: begin
				n_state = OP;
			end
			OP: begin
				if (m_opdone == 1) n_state = OP;
				else n_state = WAIT;
			end
			DONE: begin
				if (opclear == 1) n_state = INIT;
			end
			ONE: begin
				n_state = DONE;
			end
		endcase
	end

endmodule
