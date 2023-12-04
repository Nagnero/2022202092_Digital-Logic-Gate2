`timescale 1ns/100ps

module tb_FactoCore;
	reg clk, reset_n, s_sel, s_wr;
	reg [15:0] s_addr;
	reg [63:0] s_din;
	wire interrupt;
	wire [63:0] s_dout;
	
	FactoCore DUT(clk, reset_n, s_sel, s_wr, s_addr, s_din, s_dout, interrupt);
	
	always #5 clk = ~clk;
	
	initial begin
		#0;	clk = 1; reset_n = 0; s_sel = 1; s_wr = 1; s_addr = 16'h7020; s_din = 0;
		#7;	reset_n = 1;
		
		#10;	s_addr = 16'h7018; s_din = 1;
		#10;	s_addr = 16'h7000; s_din = 1;
		while(interrupt == 0) #10;
		#10;	s_addr = 16'h7030; s_wr = 0;
		
		#10	s_wr = 1; s_addr = 16'h7008; s_din = 1;
		#10;	s_din = 0;
		#20;	s_addr = 16'h7020; s_din = 1;
		#10;	s_addr = 16'h7018; s_din = 1;
		#10	s_addr = 16'h7000; s_din = 1;
		while(interrupt == 0) #10;
		#0;	s_addr = 16'h7030; s_wr = 0;
		
		#10;	s_wr = 1; s_addr = 16'h7008; s_din = 1;
		#10;	s_din = 0;
		#20;	s_addr = 16'h7020; s_din = 2;
		#10;	s_addr = 16'h7018; s_din = 1;
		#10;	s_addr = 16'h7000; s_din = 1;
		while(interrupt == 0) #10;
		#0;	s_addr = 16'h7030; s_wr = 0;
		
		#10;	s_wr = 1; s_addr = 16'h7008; s_din = 1;
		#10;	s_din = 0;
		#20;	s_addr = 16'h7020; s_din = 5;
		#10;	s_addr = 16'h7018; s_din = 1;
		#10;	s_addr = 16'h7000; s_din = 1;
		while(interrupt == 0) #10;
		#0;	s_addr = 16'h7030; s_wr = 0;
		
		#10;	s_wr = 1; s_addr = 16'h7008; s_din = 1;
		#10;	s_din = 0;
		#20;	s_addr = 16'h7020; s_din = 72;
		#10;	s_addr = 16'h7018; s_din = 1;
		#10;	s_addr = 16'h7000; s_din = 1;
		while(interrupt == 0) #10;
		#0;	s_addr = 16'h7030; s_wr = 0;
		
		#10;	s_wr = 1; s_addr = 16'h7008; s_din = 1;
		#10;	s_din = 0;
		#20;	s_addr = 16'h7020; s_din = 100;
		#10;	s_addr = 16'h7018; s_din = 1;
		#10;	s_addr = 16'h7000; s_din = 1;
		while(interrupt == 0) #10;
		#0;	s_addr = 16'h7030; s_wr = 0;
		
		#50;	$stop;
	end
endmodule
