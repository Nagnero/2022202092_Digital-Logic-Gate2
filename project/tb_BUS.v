`timescale 1ns/100ps

module tb_BUS;
   reg clk, reset_n, m_req, m_wr; // reg signals
   reg [15:0] m_addr;
   reg [63:0] m_dout, s0_dout, s1_dout;
   
   wire m_grant; // wire signals
   wire [63:0] m_din;
   wire s0_sel, s1_sel, s_wr;
   wire [15:0] s_addr;
   wire [63:0] s_din;
   
   BUS DUT(clk, reset_n, m_req, m_wr, m_addr, m_dout, s0_dout, s1_dout,
			m_grant, m_din, s0_sel, s1_sel, s_addr, s_wr, s_din);
   
   always #5 clk = ~clk;
   
   initial begin
		#0;	clk = 1; reset_n = 0; m_req = 0; m_wr = 0; m_addr = 0; m_dout = 0; s0_dout = 0; s1_dout = 0;
		#7;	reset_n = 1; m_addr = 16'h0001; 
		
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
      
		#10;	$stop;
   end
   
endmodule
