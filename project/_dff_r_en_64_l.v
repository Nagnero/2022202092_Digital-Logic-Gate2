module _dff_r_en_64_l(clk, reset_n, en, d, q);
	input clk, reset_n, en;
	input [63:0] d;
	output reg [63:0] q;
	
	// 64 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 1;
		else if (en) q <= d;
	end
endmodule
	