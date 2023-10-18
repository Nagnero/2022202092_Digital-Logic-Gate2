`timescale 1ns/100ps

module tb_dff_r;
	reg tb_clk, tb_reset_n, tb_d; //input clk, EN, D
	wire tb_q; //output Q
	
	_dff_r DUT(.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q(tb_q));				//insert module
	
	initial 
	begin
		#0;	tb_reset_n = 1;
		#20; 	tb_reset_n = 0;
		#20;	$stop;
	end
	
	always //clk cycle
	begin
		tb_clk = 1; #1;
		tb_clk=0;  #1;
	end
		
	always @(posedge tb_clk) //D cycle
	begin		
		#3 tb_d = 0;
		#3 tb_d = 1; 	
	end
		

	
endmodule
		