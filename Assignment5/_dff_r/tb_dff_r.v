`timescale 1ns/100ps //timescale

module tb_dff_r; // define module
	reg tb_clk, tb_reset_n, tb_d; // input clk, en, d
	wire tb_q; // output q, !q
	
	parameter STEP = 10;
	_dff_r U0_dff_r(.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q(tb_q));
	
	always 
	begin
		#(STEP); tb_clk = ~tb_clk; // clk cycle
	end
	
	initial
	begin
		#0				tb_clk = 0;
						tb_d = 0; tb_reset_n = 0;
		#(STEP/2);	tb_d = 1;
		#(STEP*2);	tb_d = 0; tb_reset_n = 1;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;	
		#(STEP*4);	tb_d = 1; tb_reset_n = 0;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	$stop;
	end
	
endmodule
