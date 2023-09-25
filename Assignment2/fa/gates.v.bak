module _nand2(y, a, b);	// define nand-gate module
   input a, b;	// set input variable
   output y;	// set output variable
   
   assign y = ~(a & b);	// assign output variable (y) as nand operation of a and b

endmodule	// finish nand-gate module


module _and2(a, b, y);
	input a, b;
	output y;

	assign y = a & b;
endmodule


module _nor2(a, b, y);
	input a, b;
	output y;

	assign y = ~(a|b);
endmodule


module _or2(a, b, y);
	input a, b;
	output y;

	assign y = a|b;
endmodule


module _inv(y, a);	// define inverter-gate module
   input a;		// set input variable
   output y;	// set output variable
   
   assign y = ~a;	// assign output variable (y) as not operation of a
   
endmodule	// finish inverter-gate module


module _xor2(a, b, y);
	input a, b;
	output y;
	
	wire inv_a, inv_b;
	wire w0, w1;
	
	_inv U0_inv(.a(a), .y(inv_a));
	_inv U1_inv(.a(b), .y(inv_b));
	_and2 U2_and2(.a(inv_a), .b(b), .y(w0));
	_and2 U3_and2(.a(a), .b(inv_b), .y(w1));
	_or2 U4_or2(.a(w0), .b(w1), .y(y));

endmodule
