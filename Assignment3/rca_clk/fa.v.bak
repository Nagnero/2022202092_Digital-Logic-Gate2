module fa(a, b, ci, s, co); // full adder module
	input a, b, ci;
	output s, co;
	wire c1, c2, sm;

	ha U0_ha(.a(b), .b(ci), .s(sm), .co(c1)); // call half adder twice
	ha U1_ha(.a(a), .b(sm), .s(s), .co(c2));
	_or2 U2_or2(.a(c2), .b(c1), .y(co)); // or calculate for two outputs of half adder
	
endmodule

/*
module fa(a, b, ci, s, co); // full adder without half adder
	input a, b, ci;
	output s, co;

	_xor2 U0_xor2(.a(a), .b(b), .y(w0));
	_xor2 U1_xor2(.a(ci), .b(w0), .y(s));
	_nand2 U2_nand2(.a(a), .b(b), .y(w1));
	_nand2 U3_nand2(.a(a), .b(ci), .y(w2));
	_nand2 U4_nand2(.a(b), .b(ci), .y(w3));
	_nand3 U5_nand3(.a(w1), .b(w2), .c(w3), .y(co));
endmodule

*/