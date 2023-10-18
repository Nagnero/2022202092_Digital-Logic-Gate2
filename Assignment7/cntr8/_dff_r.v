module _dff_r(clk, reset_n, d, q); // define module
	input clk, d, reset_n; //input port 
	output reg q; //output port
	
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) q <= 1'b0;
		else q <= d;
	end
endmodule
