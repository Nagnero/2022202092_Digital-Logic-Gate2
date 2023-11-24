module _dff_r_2(clk, reset_n, d, q);
	input clk,reset_n;
	input [1:0] d;
	output reg [1:0] q;
	
	// 2 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 0;
		else q <= d;
	end
endmodule
	