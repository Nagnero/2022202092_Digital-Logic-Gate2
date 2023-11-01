module write_operation(Addr, we, wEn);
	input we; // input port
	input [2:0] Addr; // input port
	output [7:0] wEn; // output port

	wire [7:0] w_a; // set wire
	
	// instantiate decoder
	_3_to_8_decoder U0_3_to_8_decoder(.d(Addr), .q(w_a));
	// instantiate 8 and gates
	_and2 U1_and2(.a(we), .b(w_a[0]), .y(wEn[0]));
	_and2 U2_and2(.a(we), .b(w_a[1]), .y(wEn[1]));
	_and2 U3_and2(.a(we), .b(w_a[2]), .y(wEn[2]));
	_and2 U4_and2(.a(we), .b(w_a[3]), .y(wEn[3]));
	_and2 U5_and2(.a(we), .b(w_a[4]), .y(wEn[4]));
	_and2 U6_and2(.a(we), .b(w_a[5]), .y(wEn[5]));
	_and2 U7_and2(.a(we), .b(w_a[6]), .y(wEn[6]));
	_and2 U8_and2(.a(we), .b(w_a[7]), .y(wEn[7]));
endmodule
