module cla64(a, b, ci, s);
	input [63:0] a, b;
	input ci;
	output [63:0] s;

	wire [15:0] c;
	
	// call cla for 16 times to get outputs
	cla4 U0_cla4 (.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c[0]));
	cla4 U1_cla4 (.a(a[7:4]), .b(b[7:4]), .ci(c[0]), .s(s[7:4]), .co(c[1]));
	cla4 U2_cla4 (.a(a[11:8]), .b(b[11:8]), .ci(c[1]), .s(s[11:8]), .co(c[2]));
	cla4 U3_cla4 (.a(a[15:12]), .b(b[15:12]), .ci(c[2]), .s(s[15:12]), .co(c[3]));
	cla4 U4_cla4 (.a(a[19:16]), .b(b[19:16]), .ci(c[3]), .s(s[19:16]), .co(c[4]));
	cla4 U5_cla4 (.a(a[23:20]), .b(b[23:20]), .ci(c[4]), .s(s[23:20]), .co(c[5]));
	cla4 U6_cla4 (.a(a[27:24]), .b(b[27:24]), .ci(c[5]), .s(s[27:24]), .co(c[6]));
	cla4 U7_cla4 (.a(a[31:28]), .b(b[31:28]), .ci(c[6]), .s(s[31:28]), .co(c[7]));
	
	cla4 U8_cla4 (.a(a[35:32]), .b(b[35:32]), .ci(c[7]), .s(s[35:32]), .co(c[8]));
	cla4 U9_cla4 (.a(a[39:36]), .b(b[39:36]), .ci(c[8]), .s(s[39:36]), .co(c[9]));
	cla4 U10_cla4 (.a(a[43:40]), .b(b[43:40]), .ci(c[9]), .s(s[43:40]), .co(c[10]));
	cla4 U11_cla4 (.a(a[47:44]), .b(b[47:44]), .ci(c[10]), .s(s[47:44]), .co(c[11]));
	cla4 U12_cla4 (.a(a[51:48]), .b(b[51:48]), .ci(c[11]), .s(s[51:48]), .co(c[12]));
	cla4 U13_cla4 (.a(a[55:52]), .b(b[55:52]), .ci(c[12]), .s(s[55:52]), .co(c[13]));
	cla4 U14_cla4 (.a(a[59:56]), .b(b[59:56]), .ci(c[13]), .s(s[59:56]), .co(c[14]));
	cla4 U15_cla4 (.a(a[63:60]), .b(b[63:60]), .ci(c[14]), .s(s[63:60]), .co(c[15]));
	
endmodule
