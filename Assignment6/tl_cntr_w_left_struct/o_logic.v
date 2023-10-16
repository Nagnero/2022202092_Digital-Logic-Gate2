module o_logic(Q2, Q1, Q0, La, Lb);
	input Q2, Q1, Q0;
	output [1:0] La, Lb;
	
	_inv U0_inv(.a(Q2), .y(n_Q2));
	_inv U1_inv(.a(Q0), .y(n_Q0));
	
	// outcome of La
	_and3 U2_and3(.a(n_Q2), .b(Q1), .c(n_Q0), .y(w0_La1));
	_or2 U3_or2(.a(w0_La1), .b(Q2), .y(La[1]));
	_and2 U4_and2(.a(n_Q2), .b(n_Q0), .y(w0_La0));
	_or2 U5_or2(.a(w0_La0), .b(Q2), .y(La[0]));
	
	// outcome of Lb
	_and3 U6_and3(.a(Q2), .b(Q1), .c(n_Q0), .y(w0_Lb1));
	_or2 U7_or2(.a(n_Q2), .b(w0_Lb1), .y(Lb[1]));
	_and2 U8_and2(.a(Q2), .b(Q0), .y(w0_Lb0));
	_or2 U0_or2(.a(n_Q2), .b(w0_Lb0), .y(Lb[0]));
endmodule
