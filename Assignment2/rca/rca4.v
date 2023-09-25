module rca4(a, b, ci, s, co); // ripple carry adder module
	input [3:0] a, b; // 4 bit input of a and b
	input ci; // input cin
	output [3:0] s; // 4bit ouput of s
	output co; // ouput cout
	wire [2:0] c;

	fa U0_fa(.a(a[0]), .b(b[0]), .ci(ci), .s(s[0]), .co(c[0])); // call full adder four times
	fa U1_fa(.a(a[1]), .b(b[1]), .ci(c[0]), .s(s[1]), .co(c[1]));
	fa U2_fa(.a(a[2]), .b(b[2]), .ci(c[1]), .s(s[2]), .co(c[2]));
	fa U3_fa(.a(a[3]), .b(b[3]), .ci(c[2]), .s(s[3]), .co(co));
endmodule
	