module _register3_r(clk, reset, d, q);
	input clk, reset;
	input [2:0] d;
	output [2:0] q;
	
	_dff_r_async U0_dff_r_async(.clk(clk), .reset_n(reset), .d(d[0]), .q(q[0]));
	_dff_r_async U1_dff_r_async(.clk(clk), .reset_n(reset), .d(d[1]), .q(q[1]));
	_dff_r_async U2_dff_r_async(.clk(clk), .reset_n(reset), .d(d[2]), .q(q[2]));
endmodule
