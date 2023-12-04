module _dff_r_7(clk, reset_n, d, q);
	input clk,reset_n;
	input [6:0] d;
	output reg [6:0] q;
	
	// 7 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 0;
		else q <= d;
	end
endmodule
	