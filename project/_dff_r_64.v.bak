module _dff_r_64(clk, reset_n, cnt, multiplier, n_temp, temp);
	input clk, reset_n;
	input [63:0] n_temp, multiplier;
	input [5:0] cnt;
	output reg [63:0] temp;
	
	// 64 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) 
			temp <= 0;
		else if(cnt != 0) 
			temp <= n_temp;
		else 
			temp <= multiplier;
	end
endmodule
	