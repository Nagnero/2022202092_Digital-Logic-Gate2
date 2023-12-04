module Facto_Controller(clk, reset_n, opstart, opclear, opdone, operand, result_h, result_l, n_opdone, n_result_h, n_result_l);
	input clk, reset_n, opstart, opclear;
	input [1:0] opdone;
	input [63:0] operand, result_h, result_l;
	output reg [63:0] n_opdone, n_result_h, n_result_l;
	// multiplier wire
	wire m_opdone, m_opstart, m_opclear, n_m_opdone;
	wire [63:0] multiplier, multiplicand;
	wire [127:0] m_result;
	
	reg n_m_opstart, n_m_opclear;
	reg [63:0] n_multiplier, n_multiplicand;
	
	wire [2:0] state, n_state;
	
	parameter INIT = 3'b000;
	parameter CLEAR = 3'b001;
	parameter START = 3'b010;
	parameter WAIT = 3'b011; // wait for multiplier calc
	parameter M_CLEAR = 3'b100; // multiplier clear
	parameter OP = 3'b101; // m_operand deduction
	parameter DONE = 3'b110;
	parameter ONE = 3'b111;
	
	// next state logic
	ns_controller U0_ns_logic(opstart, opdone, opclear, operand, m_opdone, multiplier, state, n_state);
	
	_dff_r_3_state dff_state(clk, reset_n, n_state, state);
	_dff_r_64_ dff_multiplier(clk, reset_n, n_multiplier, multiplier);
	_dff_r_64_ dff_multiplicand(clk, reset_n, n_multiplicand, multiplicand);
	_dff_r dff_m_opstart(clk, reset_n, n_m_opstart, m_opstart);
	_dff_r dff_m_opclear(clk, reset_n, n_m_opclear, m_opclear);
	_dff_r dff_m_opdone(clk, reset_n, n_m_opdone, m_opdone);
	
	// multiplier
	multiplier U2_multiplier(clk, reset_n, multiplicand, multiplier, m_opstart, m_opclear, n_m_opdone, m_result);
	
	always @(*) begin
		case(state)
			INIT: begin
				n_opdone = 64'b0;
				n_result_h = 64'b0;
				n_result_l = 64'b1;
				n_m_opstart = 64'b0;
				n_m_opclear = 64'b1;
				n_multiplier = 0;
				n_multiplicand = 0;
			end
			CLEAR: begin
				n_opdone = 64'h0;
				n_result_h = 64'b0;
				n_result_l = 64'b1;
				n_m_opstart = 0;
				n_m_opclear = 1;
			end
			START: begin
				n_opdone = 64'h0000_0000_0000_0002;
				n_multiplier = operand;
				n_multiplicand = result_l;
				n_m_opstart = 1;
				n_m_opclear = 0;
			end
			WAIT: begin
				n_result_h = m_result[127:64];
				n_result_l = m_result[63:0];
			end
			M_CLEAR: begin
				n_multiplier = multiplier - 1;
				n_multiplicand = m_result[63:0] ? m_result[63:0] : m_result[127:64];
				n_m_opstart = 0;
				n_m_opclear = 1;
			end
			OP: begin
				n_m_opstart = 1;
				n_m_opclear = 0;
			end
			DONE: begin
				n_opdone = 64'h0000_0000_0000_0003;
			end
			ONE: begin
				n_m_opstart = 0;
				n_m_opclear = 1;
			end
		endcase
	end

endmodule
