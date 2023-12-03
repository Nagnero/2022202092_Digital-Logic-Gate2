module _dff_r(clk, reset_n, d, q);
	input clk,reset_n;
	input d;
	output reg q;
	
	// 2 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 0;
		else q <= d;
	end
endmodule
	