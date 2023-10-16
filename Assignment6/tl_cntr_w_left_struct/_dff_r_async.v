module _dff_r_async(clk, reset_n, d, q); // define module
	input clk, reset_n, d; // input clk, reset, d
	output q;	// output q
	
	wire w_d;
	
	_and2 U0_and2(.a(d), .b(reset_n), .y(w_d)); // and gate
	_dff U1_dff(.clk(clk), .d(w_d), .q(q)); // D flip-flop
endmodule
