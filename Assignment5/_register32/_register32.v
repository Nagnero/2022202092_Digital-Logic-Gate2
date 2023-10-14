module _register32 (clk, d, q);		//define module

	input clk; //input clk
	input[31:0] d; //input d
	output[31:0] q; //output q
	
	// instantiate 8-bit registers
	_register8 U0_reg8(.clk(clk),.d(d[7:0]),.q(q[7:0]));
	_register8 U1_reg8(.clk(clk),.d(d[15:8]),.q(q[15:8]));
	_register8 U2_reg8(.clk(clk),.d(d[23:16]),.q(q[23:16]));
	_register8 U3_reg8(.clk(clk),.d(d[31:24]),.q(q[31:24]));
endmodule


