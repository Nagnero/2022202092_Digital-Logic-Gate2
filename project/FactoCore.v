module FactoCore(clk, reset_n, s_sel, s_wr, s_addr, s_din, s_dout, interrupt);
	input clk, reset_n, s_sel, s_wr;
	input [15:0] s_addr;
	input [63:0] s_din;
	output [63:0] s_dout;
	output interrupt;
	
	opstart, opclear, opdone, intrEn, operand, result_h, result_l
	

endmodule
