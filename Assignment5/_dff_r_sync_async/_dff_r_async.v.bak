module _dff_r_async(clk, reset_n, d, q); // define module
	input clk, reset_n, d;
	output q;
	reg q;
	
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 1'b0; //reset == 0
		else q <= d;
	end			

endmodule
