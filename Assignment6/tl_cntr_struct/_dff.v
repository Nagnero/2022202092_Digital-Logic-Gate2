module _dff(clk, d, q, q_bar); // define module
	input clk, d; //input port 
	output q, q_bar; //output port
	
	wire clk_bar, w_q; //wire
	
	_inv U0_inv(.a(clk), .y(clk_bar)); //not gate
	_dlatch U1_dlatch(.clk(clk_bar), .d(d), .q(w_q)); // d-latch
	_dlatch U2_dlatch(.clk(clk), .d(w_q), .q(q), .q_bar(q_bar));
endmodule
