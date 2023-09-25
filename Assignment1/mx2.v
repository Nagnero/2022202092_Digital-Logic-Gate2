module mx2(y, d0, d1, s); // define top module (mx2)
   input s, d0, d1; 		// set input variable
   output y; 				// set output variable
   
_inv iv0(.y(sb), .a(s));					// call inverter
_nand2 nd20(.y(w0), .a(d0), .b(sb));	// call first nand-gate
_nand2 nd21(.y(w1), .a(d1), .b(s));		// call second nand-gate
_nand2 nd22(.y(y), .a(w0), .b(w1));   	// call third nand-gate
   
endmodule	// finish mx2 module

