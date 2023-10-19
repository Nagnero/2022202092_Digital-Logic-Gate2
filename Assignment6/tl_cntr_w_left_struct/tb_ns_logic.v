`timescale 1ns/100ps				//timescale

module tb_ns_logic;
	reg tb_Q2, tb_Q1, tb_Q0, tb_Ta, tb_Tal, tb_Tbl, tb_Tb;
	
	wire tb_D2, tb_D1, tb_D0;
	
	ns_logic DUT(.Q2(tb_Q2), .Q1(tb_Q1), .Q0(tb_Q0), .Ta(tb_Ta), .Tal(tb_Tal), .Tb(tb_Tb), .Tbl(tb_Tbl), .D2(tb_D2), .D1(tb_D1), .D0(tb_D0));
	
	initial 
	begin
		// Initialize inputs
		#0;	tb_Q2 = 0; tb_Q1 = 0; tb_Q0 = 0; tb_Ta = 1; tb_Tal = 1; tb_Tb = 1; tb_Tbl = 1;
		#10;	tb_Ta = 0;
		#10;	tb_Q0 = 1; tb_Ta = 1;
		#10;	tb_Q0 = 0; tb_Q1 = 1;
		#10;	tb_Tal = 0;
		#10;	tb_Q0 = 1; tb_Q1 = 1; tb_Tal = 1;
		#10;	tb_Q0 = 0; tb_Q1 = 0; tb_Q2 = 1;
		#10;	tb_Tb = 0;
		#10;	tb_Q0 = 1; tb_Tb = 1;
		#10;	tb_Q0 = 0; tb_Q1 = 1;
		#10;	tb_Tbl = 0;
		#10;	tb_Q0 = 1; tb_Tbl = 0;
		// Finish simulation
		#10;	$stop;
	end
endmodule
