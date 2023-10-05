module clb4(a, b, ci, c1, c2, c3, co);
	input[3:0] a, b;
	input ci;
	output c1, c2, c3, co;
	wire[3:0] g, p;
	wire w0_c1;
	wire w0_c2, w1_c2;
	wire w0_c3, w1_c3, w2_c3;
	wire w0_co, w1_co, w2_co, w3_co;
	
	// Generate
	_and2 U0_and2(.a(a[0]), .b(b[0]), .y(g[0]));
	_and2 U1_and2(.a(a[1]), .b(b[1]), .y(g[1]));
	_and2 U2_and2(.a(a[2]), .b(b[2]), .y(g[2]));
	_and2 U3_and2(.a(a[3]), .b(b[3]), .y(g[3]));
	
	// Propagate
	_or2 U4_or2(.a(a[0]), .b(b[0]), .y(p[0]));
	_or2 U5_or2(.a(a[1]), .b(b[1]), .y(p[1]));
	_or2 U6_or2(.a(a[2]), .b(b[2]), .y(p[2]));
	_or2 U7_or2(.a(a[3]), .b(b[3]), .y(p[3]));
	
	// c1 = g[0] | (p[0] & ci);
	_and2 U8_and2(.a(p[0]), .b(ci), .y(w0_c1));
	_or2 U9_or2(.a(w0_c1), .b(g[0]), .y(c1));
	
	// c2 = g[1] | p[1]&g[0] | p[0]&p[1]&ci
	_and2 U10_and2(.a(p[1]), .b(p[0]), .y(w0_c2));
	_and3 U11_and3(.a(p[0]), .b(p[1]), .c(ci), .y(w1_c2));
	_or3 U12_or3(.a(), .b(), .c(), .y());

endmodule
