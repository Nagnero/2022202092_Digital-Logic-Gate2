module _dff_r_6(clk, reset_n, d, q);
	input clk,reset_n;
	input [5:0] d;
	output reg [5:0] q;
	
	// 6 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 0;
		else q <= d;
	end
endmodule
	