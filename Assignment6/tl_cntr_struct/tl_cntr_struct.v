module tl_cntr_struct(clk, reset_n, Ta, Tb, La, Lb);
	input clk, reset_n, Ta, Tb;
	output [1:0] La, Lb;
	
	wire [1:0] D, Q;
	
	// next state logic
	ns_logic U0_ns_logic(.Q1(Q[1]), .Q0(Q[0]), .Ta(Ta), .Tb(Tb), .D1(D[1]), .D0(D[0]));
	
	// save current state
	_register2_r_async U1_register(.clk(clk), .reset(reset_n), .d(D), .q(Q));
	
	// output logic
	o_logic U2_o_logic(.Q1(Q[1]), .Q0(Q[0]), .La(La), .Lb(Lb));
endmodule
