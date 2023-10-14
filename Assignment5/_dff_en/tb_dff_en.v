`timescale 1ns/100ps //timescale

module tb_dff_en; // define module
	reg tb_clk, tb_en, tb_d; // input clk, en, d
	wire tb_q; // output q, !q
	
	parameter STEP = 10;
	_dff_en U0_dff_en(.clk(tb_clk), .en(tb_en), .d(tb_d), .q(tb_q));
	
	always 
	begin
		#(STEP); tb_clk = ~tb_clk; // clk cycle
	end
	
	initial
	begin
		#0				tb_clk = 0;
						tb_d = 0; tb_en = 1;
		#(STEP/2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0; tb_en = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	tb_d = 1;
		#(STEP*2);	tb_d = 0;
		#(STEP*2);	$stop;
	end
	
endmodule
