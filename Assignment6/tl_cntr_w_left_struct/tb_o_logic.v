`timescale 1ns/100ps				//timescale

module tb_o_logic;
	reg tb_Q2, tb_Q1, tb_Q0;
	
	wire [1:0] tb_La, tb_Lb;
	
	o_logic DUT(.Q2(tb_Q2), .Q1(tb_Q1), .Q0(tb_Q0), .La(tb_La), .Lb(tb_Lb));

	initial 
	begin
		// Initialize inputs
		#0;	tb_Q2 = 0; tb_Q1 = 0; tb_Q0 = 0;
		#10;	tb_Q0 = 1;
		#10;	tb_Q1 = 1; tb_Q0 = 0;
		#10;	tb_Q0 = 1;
		#10;	tb_Q2 = 1; tb_Q1 = 0; tb_Q0 = 0;
		#10;	tb_Q0 = 1;
		#10;	tb_Q1 = 1; tb_Q0 = 0;
		#10;	tb_Q0 = 1;
		// Finish simulation
		#10;	$stop;
	end
endmodule
