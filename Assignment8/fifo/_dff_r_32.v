module _dff_r_32(clk, reset_n, d, q);
	input clk,reset_n;
	input [31:0] d;
	output reg [31:0]q;
	
	// 32 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 31'b0;
		else q <= d;
	end
endmodule
	