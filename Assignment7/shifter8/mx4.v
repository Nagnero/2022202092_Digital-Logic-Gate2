module mx4(d0, d1, d2, d3, s, y);
	input d0, d1, d2, d3;
	input [1:0] s;
	output y;
	
	mx2 U0_mx2(.d0(d0), .d1(d1), .s(s[0]), .y(w_y0));
	mx2 U1_mx2(.d0(d2), .d1(d3), .s(s[0]), .y(w_y1));
	
	mx2 U2_mx2(.d0(w_y0), .d1(w_y1), .s(s[1]), .y(y));
endmodule
