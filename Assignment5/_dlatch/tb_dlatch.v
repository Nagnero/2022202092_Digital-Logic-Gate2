`timescale 1ns/100ps

module tb_dlatch;
	reg tb_clk, tb_d;
	wire tb_q_bar, tb_q;
	
	_dlatch U0_dlatch(.clk(tb_clk), .d(tb_d), .q(tb_q), .q_bar(tb_q_bar));
	
	always 
	begin
		#10; tb_clk = ~tb_clk; #10; tb_clk = ~tb_clk;
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
