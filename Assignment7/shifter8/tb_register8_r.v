`timescale 1ns/100ps

module tb_register8_r;
	reg tb_clk,tb_reset_n; //input clk, reset
	reg [7:0] tb_d; //input
	
	wire [7:0] tb_q; //output
	
	_register8_r DUT(.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q(tb_q));		//insert module
	
	always 
	begin
		#20 tb_clk = ~tb_clk;		//clk cycle
	end
	
	initial
	begin
		#0;	tb_clk = 1; tb_reset_n = 1;
				tb_d = 8'b10101101;
		#50;	tb_reset_n = 0;
		#90; tb_reset_n = 1;
		#30;	$stop;
	end

			
endmodule	//end module
		

