module _dff_r_64_(clk, reset_n, d, q);
	input clk, reset_n;
	input [63:0] d;
	output reg [63:0] q;
	
	// 64 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 0;
		else q <= d;
	end
endmodule
	