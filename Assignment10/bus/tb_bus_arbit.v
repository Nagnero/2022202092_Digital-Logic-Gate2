`timescale 1ns/100ps

module tb_bus_arbit;
	reg clk, reset_n, m0_req, m1_req;
	
	wire m0_grant, m1_grant;

	bus_arbit DUT(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);
	
	always #5 clk = ~clk;
	
	initial begin
		#0;	clk = 1; reset_n = 0; m0_req = 0; m1_req = 0;
		#10;	reset_n = 1;
		#10;	m0_req = 1;
		#10;	m0_req = 0; m1_req = 1;
		#10;	m0_req = 1;
		#10;	$stop;
	end
	
endmodule