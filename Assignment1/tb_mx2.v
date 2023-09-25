`timescale 1ns/100ps

module tb_mx2;

	reg tb_a, tb_b, tb_s;
	wire tb_y;
	
	mx2 mx2_top(.y(tb_y), .d0(tb_a), .d1(tb_b), .s(tb_s));
	
	initial begin
	
	#0		tb_a = 0;	tb_b = 0;	tb_s = 0;
	#10	tb_a = 0;	tb_b = 1;	tb_s = 0;
	#10	tb_a = 1;	tb_b = 1;	tb_s = 0;
	#10	tb_a = 1;	tb_b = 0;	tb_s = 0;
	#10	tb_a = 0;	tb_b = 0;	tb_s = 1;
	#10	tb_a = 0;	tb_b = 1;	tb_s = 1;
	#10	tb_a = 1;	tb_b = 1;	tb_s = 1;
	#10	tb_a = 1;	tb_b = 0;	tb_s = 1;
	#10	tb_a = 0;	tb_b = 0;	tb_s = 0;

	end

endmodule
