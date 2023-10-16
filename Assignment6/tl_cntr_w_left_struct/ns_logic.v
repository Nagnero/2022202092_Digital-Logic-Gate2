module ns_logic(Q2, Q1, Q0, Ta, Tal, Tb, Tbl, D2, D1, D0);
	input Q2, Q1, Q0, Ta, Tb, Tal, Tbl;
	output D2, D1, D0;
	
	wire n_Q2, n_Q1, n_Q0, n_Ta, n_Tb;
	
	// not outputs of inputs
	_inv U0_inv(.a(Q2), .y(n_Q2));
	_inv U1_inv(.a(Q1), .y(n_Q1));
	_inv U2_inv(.a(Q0), .y(n_Q0));
	_inv U3_inv(.a(Ta), .y(n_Ta));
	_inv U4_inv(.a(Tal), .y(n_Tal));
	_inv U5_inv(.a(Tb), .y(n_Tb));
	_inv U6_inv(.a(Tbl), .y(n_Tbl));
	
	// calculate D2
	_and3 U7_and3(.a(n_Q2), .b(Q1), .c(Q0), .y(w0_d2));
	_and2 U8_and2(.a(Q2), .b(n_Q1), .y(w1_d2));
	_and2 U9_and2(.a(Q2), .b(n_Q0), .y(w2_d2));
	_or3 U10_or3(.a(w0_d2), .b(w1_d2), .c(w2_d2), .y(D2));
	
	// calculate D1
	_xor2 U11_xor2(.a(Q1), .b(Q0), .y(D1));
	
	// calculate D0
	_and4 U12_and4(.a(n_Q2), .b(n_Q1), .c(n_Q0), .d(n_Ta), .y(w0_d0));
	_and4 U13_and4(.a(n_Q2), .b(Q1), .c(n_Q0), .d(n_Tal), .y(w1_d0));
	_and4 U14_and4(.a(Q2), .b(n_Q1), .c(n_Q0), .d(n_Tb), .y(w2_d0));
	_and4 U15_and4(.a(Q2), .b(Q1), .c(n_Q0), .d(n_Tbl), .y(w3_d0));
	_or4 U16_or4(.a(w0_d0), .b(w1_d0), .c(w2_d0), .d(w3_d0), .y(D0));
endmodule
