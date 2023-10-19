`timescale 1ns/100ps				//timescale

module tb_ns_logic;
	reg tb_Q1, tb_Q0, tb_Ta, tb_Tb;
	
	wire tb_D1, tb_D0;
	
	ns_logic DUT(.Q1(tb_Q1), .Q0(tb_Q0), .Ta(tb_Ta), .Tb(tb_Tb), .D1(tb_D1), .D0(tb_D0));

	initial 
	begin
		#0;	tb_Q1 = 0; tb_Q0 = 0; tb_Ta = 1; tb_Tb = 0;
		#10;	tb_Ta = 0;
		#10;	tb_Q0 = 1; tb_Ta = 1;
		#10;	tb_Q0 = 0; tb_Q1 = 1; tb_Tb = 1;
		#10;	tb_Tb = 0;
		#10;	tb_Q0 = 1;
		// Finish simulation
		#10;	$stop;
	end
endmodule
