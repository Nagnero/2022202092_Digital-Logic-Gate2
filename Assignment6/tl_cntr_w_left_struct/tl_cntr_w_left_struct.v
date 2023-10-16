module tl_cntr_w_left_struct(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);
	input clk, reset_n, Ta, Tal, Tb, Tbl;
	output [1:0] La, Lb;
	
	wire [2:0] D, Q;
	
	// next state logic
	ns_logic U0_ns_logic(.Q2(Q[2]), .Q1(Q[1]), .Q0(Q[0]), .Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .D2(D[2]), .D1(D[1]), .D0(D[0]));
	
	// save current state
	_register3_r U1_register(.clk(clk), .reset(reset_n), .d(D), .q(Q));
	
	// output logic
	o_logic U2_o_logic(.Q2(Q[2]), .Q1(Q[1]), .Q0(Q[0]), .La(La), .Lb(Lb));
endmodule
