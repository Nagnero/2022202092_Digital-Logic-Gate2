module _dff_r_4(clk, reset_n, d, q);
	input clk,reset_n;
	input [3:0] d;
	output reg [3:0]q;
	
	// 4 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 4'b0000;
		else q <= d;
	end
endmodule
	