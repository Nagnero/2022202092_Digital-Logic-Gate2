module LSR8(d_in, shamt, d_out);
	input [7:0] d_in;
	input [1:0] shamt;
	output [7:0] d_out;
	
	// instanitate mux4
	mx4 U0_mx4(.d0(d_in[0]), .d1(d_in[1]), .d2(d_in[2]), .d3(d_in[3]), .s(shamt), .y(d_out[0]));
	mx4 U1_mx4(.d0(d_in[1]), .d1(d_in[2]), .d2(d_in[3]), .d3(d_in[4]), .s(shamt), .y(d_out[1]));
	mx4 U2_mx4(.d0(d_in[2]), .d1(d_in[3]), .d2(d_in[4]), .d3(d_in[5]), .s(shamt), .y(d_out[2]));
	mx4 U3_mx4(.d0(d_in[3]), .d1(d_in[4]), .d2(d_in[5]), .d3(d_in[6]), .s(shamt), .y(d_out[3]));
	mx4 U4_mx4(.d0(d_in[4]), .d1(d_in[5]), .d2(d_in[6]), .d3(d_in[7]), .s(shamt), .y(d_out[4]));
	mx4 U5_mx4(.d0(d_in[5]), .d1(d_in[6]), .d2(d_in[7]), .d3(1'b0), .s(shamt), .y(d_out[5]));
	mx4 U6_mx4(.d0(d_in[6]), .d1(d_in[7]), .d2(1'b0), .d3(1'b0), .s(shamt), .y(d_out[6]));
	mx4 U7_mx4(.d0(d_in[7]), .d1(1'b0), .d2(1'b0), .d3(1'b0), .s(shamt), .y(d_out[7]));
endmodule