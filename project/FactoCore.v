module FactoCore(clk, reset_n, s_sel, s_wr, s_addr, s_din, s_dout, interrupt);
	input clk, reset_n, s_sel, s_wr;
	input [15:0] s_addr;
	input [63:0] s_din;
	output [63:0] s_dout;
	output interrupt;
	
	reg [63:0] opstart, opclear, opdone, intrEn, operand, result_h, result_l;
	
	wire [2:0] state, n_state;

	facto
	

endmodule
