module _dff_r_3_state(clk, reset_n, d, q);
	input clk,reset_n;
	input [2:0] d;
	output reg [2:0] q;
	
	// 3 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 0;
		else q <= d;
	end
endmodule
	