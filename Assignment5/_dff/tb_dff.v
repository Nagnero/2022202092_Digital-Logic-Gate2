`timescale 1ns/100ps

module tb_dff;
	reg tb_clk, tb_d, q, q_bar;
	wire tb_q_bar, tb_q;
	
	_dff U0_dff(.clk(tb_clk), .d(tb_d), .q(q), .q_bar(q_bar));
	
	always 
	begin
		#10; tb_clk = ~tb_clk; #10; tb_clk = ~tb_clk;
	end
	
	always@(posedge tb_clk)
	begin
		tb_q <= q;
		tb_q_bar <= q_bar;
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
