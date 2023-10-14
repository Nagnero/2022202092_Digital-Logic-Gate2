`timescale 1ns/100ps //timescale

module tb_dff; // define module
	reg tb_clk, tb_d; // input clk, d
	wire tb_q_bar, tb_q; // output q, !q
	
	_dff U0_dff(.clk(tb_clk), .d(tb_d), .q(tb_q), .q_bar(tb_q_bar));
	
	always 
	begin
		#10; tb_clk = ~tb_clk; #10; tb_clk = ~tb_clk; // clk cycle
	end
	
	initial
	begin
		tb_clk = 0;
				tb_d = 0;
		#5 	tb_d = 1;
		#7		tb_d = 0;
		#11	tb_d = 1;
		#3		tb_d = 0;
		#8		tb_d = 1;
		#8		tb_d = 0;
		#8		$stop;
	end
	
endmodule
