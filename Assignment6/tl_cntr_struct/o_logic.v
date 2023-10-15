module o_logic(Q1, Q0, La, Lb);
	input Q1, Q0;
	output [1:0] La, Lb;
	
	// outcome of La
	assign La[1] = Q1;
	_or2 U0_or2(.a(Q1), .b(Q0), .y(La[0]));
	
	// outcome of Lb
	_inv U1_inv(.a(Q1), .y(n_Q1));
	assign Lb[1] = n_Q1;
	_or2 U2_or2(.a(n_Q1), .b(Q0), .y(Lb[0]));
endmodule
