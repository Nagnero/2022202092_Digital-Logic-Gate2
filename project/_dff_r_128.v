module _dff_r_128(clk, reset_n, d, q);
	input clk,reset_n;
	input [127:0] d;
	output reg [127:0] q;
	
	// 128 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 0;
		else q <= d;
	end
endmodule
	