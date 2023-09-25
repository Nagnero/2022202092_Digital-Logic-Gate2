module ha(a, b, s, co); // define module
	input a, b; // set input and output variables
	output s, co;
	
	_xor2 U0_xor2(.a(a), .b(b), .y(s)); // exclusive or calculation of a and b for sum
	_and2 U1_and2(.a(a), .b(b), .y(co)); // and calculation of a and b for cout

endmodule
