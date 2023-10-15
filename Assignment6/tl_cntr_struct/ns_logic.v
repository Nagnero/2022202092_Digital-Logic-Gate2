module ns_logic(Q1, Q0, Ta, Tb, D1, D0);
	input Q1, Q0, Ta, Tb;
	output D1, D0;
	
	wire n_Q1, n_Q0, n_Ta, n_Tb;
	
	// not outputs of inputs
	_inv U0_inv(.a(Q1), .y(n_Q1));
	_inv U1_inv(.a(Q0), .y(n_Q0));
	_inv U2_inv(.a(Ta), .y(n_Ta));
	_inv U3_inv(.a(Tb), .y(n_Tb));
	
	// calculate D1
	_xor2 U4_xor2(.a(Q1), .b(Q0), .y(D1));
	
	// calculate D0
	_and3 U5_and3(.a(n_Q1), .b(n_Q0), .c(n_Ta), .y(d0_0));
	_and3 U6_and3(.a(Q1), .b(n_Q0), .c(n_Tb), .y(d0_1));
	_or2 U7_or2(.a(d0_0), .b(d0_1), .y(D0));
endmodule