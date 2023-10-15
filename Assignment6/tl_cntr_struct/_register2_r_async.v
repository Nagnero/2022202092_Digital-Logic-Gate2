module _register2_r_async(clk, reset, d, q); // define module
	
	input clk, reset;
	input[1:0] d;
	output[1:0] q;
	
	_dff_r_async d1(.clk(clk),.reset_n(reset),.d(d[0]),.q(q[0]));
	_dff_r_async d2(.clk(clk),.reset_n(reset),.d(d[1]),.q(q[1]));
	
endmodule
