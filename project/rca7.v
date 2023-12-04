module rca7(a, b, ci, s);
	input [6:0] a, b;
	input ci;
	output [6:0] s;

	wire [6:0] c;
	
	fa U0_fa(.a(a[0]), .b(b[0]), .ci(ci),.s(s[0]), .co(c[0]));
	fa U1_fa(.a(a[1]), .b(b[1]), .ci(c[0]),.s(s[1]), .co(c[1]));
	fa U2_fa(.a(a[2]), .b(b[2]), .ci(c[1]),.s(s[2]), .co(c[2]));
	fa U3_fa(.a(a[3]), .b(b[3]), .ci(c[2]),.s(s[3]), .co(c[3]));
	fa U4_fa(.a(a[4]), .b(b[4]), .ci(c[3]),.s(s[4]), .co(c[4]));
	fa U5_fa(.a(a[5]), .b(b[5]), .ci(c[4]),.s(s[5]), .co(c[5]));
	fa U6_fa(.a(a[6]), .b(b[6]), .ci(c[5]),.s(s[6]), .co(c[6]));
endmodule