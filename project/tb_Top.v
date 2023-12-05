`timescale 1ns/100ps

module tb_Top;
	reg clk, reset_n, m_req, m_wr;
	reg [15:0] m_addr;
	reg [63:0] m_dout;
	wire m_grant, interrupt;
	wire [63:0] m_din;
	
	Top DUT(clk, reset_n, m_req, m_wr, m_addr, m_dout, m_grant, m_din, interrupt);
	
	always #5 clk = ~clk;
	
	initial begin
		#0;	clk = 1; reset_n = 0; m_req = 0; m_wr = 0; m_addr = 0; m_dout = 0;
		#7;	reset_n = 1;
		
		#10;	m_addr = 16'hfff0; m_req = 1;
		#50;
		
		#10;	m_addr = 16'h0000; m_dout = 0; m_req = 0; m_wr = 0;
		#10;	m_wr = 1;
		#10;	m_req = 1; m_dout = 64'h0000_0000_0000_1111;
		#10;	m_wr = 0;
		#10;	m_addr = 16'h0010; m_wr = 1; m_dout = 64'h0000_0000_0000_2222;
		#10;	m_addr = 16'h0020; m_wr = 1; m_dout = 64'h0000_0000_0000_3333;
		#10;	m_addr = 16'h0010; m_wr = 0;
		#10;	m_addr = 16'h0020; m_wr = 0;
		
		#10;	m_addr = 16'h7020; m_dout = 0; m_req = 1; m_wr = 1;
		#10;	m_addr = 16'h7018; m_dout = 1;
		#10;	m_addr = 16'h7000; m_dout = 1;
		while(interrupt == 0) #10;
		#10;	m_addr = 16'h7028; m_wr = 0;
		#10;	m_addr = 16'h7030; m_wr = 0;
		
		
		#10	m_wr = 1; m_addr = 16'h7008; m_dout = 1;	// reset data
		#10;	m_dout = 0;
		#20;	m_addr = 16'h7020; m_dout = 1;
		#10;	m_addr = 16'h7018; m_dout = 1;
		#10	m_addr = 16'h7000; m_dout = 1;
		while(interrupt == 0) #10;
		#10;	m_addr = 16'h7028; m_wr = 0;
		#10;	m_addr = 16'h7030; m_wr = 0;
		
		#10	m_wr = 1; m_addr = 16'h7008; m_dout = 1;	// reset data
		#10;	m_dout = 0;
		#20;	m_addr = 16'h7020; m_dout = 2;
		#10;	m_addr = 16'h7018; m_dout = 1;
		#10	m_addr = 16'h7000; m_dout = 1;
		while(interrupt == 0) #10;
		#10;	m_addr = 16'h7028; m_wr = 0;
		#10;	m_addr = 16'h7030; m_wr = 0;
		
		#10	m_wr = 1; m_addr = 16'h7008; m_dout = 1;	// reset data
		#10;	m_dout = 0;
		#20;	m_addr = 16'h7020; m_dout = 9;
		#10;	m_addr = 16'h7018; m_dout = 1;
		#10	m_addr = 16'h7000; m_dout = 1;
		while(interrupt == 0) #10;
		#10;	m_addr = 16'h7028; m_wr = 0;
		#10;	m_addr = 16'h7030; m_wr = 0;
		
		#10	m_wr = 1; m_addr = 16'h7008; m_dout = 1;	// reset data
		#10;	m_dout = 0;
		#20;	m_addr = 16'h7020; m_dout = 10;
		#10;	m_addr = 16'h7018; m_dout = 1;
		#10	m_addr = 16'h7000; m_dout = 1;
		while(interrupt == 0) #10;
		#10;	m_addr = 16'h7028; m_wr = 0;
		#10;	m_addr = 16'h7030; m_wr = 0;
		
		#10	m_wr = 1; m_addr = 16'h7008; m_dout = 1;	// reset data
		#10;	m_dout = 0;
		#20;	m_addr = 16'h7020; m_dout = 200;
		#10;	m_addr = 16'h7018; m_dout = 1;
		#10	m_addr = 16'h7000; m_dout = 1;
		while(interrupt == 0) #10;
		#10;	m_addr = 16'h7028; m_wr = 0;
		#10;	m_addr = 16'h7030; m_wr = 0;
		
		#10	m_wr = 1; m_addr = 16'h7008; m_dout = 1;	// reset data
		#10;	m_dout = 0;
		#20;	m_addr = 16'h7020; m_dout = 299;
		#10;	m_addr = 16'h7018; m_dout = 1;
		#10	m_addr = 16'h7000; m_dout = 1;
		while(interrupt == 0) #10;
		#10;	m_addr = 16'h7028; m_wr = 0;
		#10;	m_addr = 16'h7030; m_wr = 0;
		
		#50;	$stop;
	end
	
endmodule
