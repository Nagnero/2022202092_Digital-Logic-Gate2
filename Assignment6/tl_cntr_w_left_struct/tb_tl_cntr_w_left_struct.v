`timescale 1ns/100ps				//timescale

module tb_tl_cntr_w_left_struct;

	reg tb_clk,tb_reset_n,tb_Ta,tb_Tb,tb_Tal,tb_Tbl;
	wire[1:0] tb_La,tb_Lb;
	
	tl_cntr_w_left_struct DUT(.clk(tb_clk),.reset_n(tb_reset_n),.Ta(tb_Ta),.Tal(tb_Tal),.Tb(tb_Tb),.Tbl(tb_Tbl),.La(tb_La),.Lb(tb_Lb));
	
	always
		begin
			tb_clk = 1; #5;		//clk cycle
			tb_clk = 0;  #5;
		end
		
	initial begin
		#0;	tb_clk = 1; tb_reset_n = 0;
				tb_Ta = 0; tb_Tal = 0; tb_Tb = 0; tb_Tbl = 0;
		
		#20;	tb_reset_n = 1;
		#20;	tb_Ta = 0;
		#20;	tb_Ta = 0;
		#20;	tb_Tal = 1;
		#20;	tb_Tal = 0;
		#20;	$stop;
	end
endmodule
