`timescale 1ns/100ps //timescale

module tb_register32; // define module
	reg tb_clk; // input clk
	reg [31:0] tb_d; // input d
	wire [31:0] tb_q; // output q
	
	parameter STEP = 10;
	
	_register32 U0_register32(.clk(tb_clk), .d(tb_d), .q(tb_q));
	
	always 
	begin
		#(STEP); tb_clk = ~tb_clk; // clk cycle
	end
	
	initial
	begin
		#0				tb_clk = 0;
						tb_d = 32'h12345678;
		#(STEP/2);	tb_d = 32'h98765432;
		#(STEP/2+2);tb_d = 32'hffeeddcc;
		#(STEP);		tb_d = 32'hbbaabbaa;
		#(STEP/2+2);tb_d = 32'h77665544;
		#(STEP/2+2);tb_d = 32'h33221100;
		#(STEP/2+2);tb_d = 32'h12345678;
		#(STEP+2);	$stop;
	end
	
endmodule
