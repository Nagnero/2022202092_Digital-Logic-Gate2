module _dff_en(clk, en, d, q); // define module
	input clk, en, d; //input port 
	output q; //output port
	
	wire w_d;
	
	mx2 U0_mx2(.d0(q), .d1(d), .s(en), .y(w_d)); // 2-input mux
	_dff U1_dff(.clk(clk), .d(w_d), .q(q));
endmodule
