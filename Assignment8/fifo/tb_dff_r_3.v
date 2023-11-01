`timescale 1ns/100ps

module tb_dff_r_3;		
	reg clk,reset_n;		//clk,reset,enable,
	reg [2:0] d;
	wire [2:0]q;					//output
	
	_dff_r_3 test(clk,reset_n,d,q);		
	
	always #10 clk = ~clk;		//clk cycle
	
	
	initial begin
	clk = 0; reset_n = 0; #10;
	
	#10; reset_n = 1; d = 3'b000;
	#10; d = 3'b001;
	#10; d = 3'b010;
	end
	
endmodule
