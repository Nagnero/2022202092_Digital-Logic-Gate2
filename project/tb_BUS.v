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
   
   BUS DUT(clk,reset_n,m_req,m_wr,m_addr,m_dout,s0_dout,s1_dout,m_grant,m_din,s0_sel,s1_sel,s_addr,s_wr,s_din);
   
   always #5 clk = ~clk;
   
   initial begin
      #0;   clk = 1; reset_n = 0; m_req = 0; m_wr = 0; m_addr = 0; m_dout = 0; s0_dout = 0; s1_dout = 0;
      #9;   reset_n = 1; m_addr = 16'h0001; 
      #10;	m_addr = 16'h7001;
		#10;	m_addr = 16'h0001; m_req = 1; m_dout=32;
      #10;	m_addr = 16'h7001; m_wr=1; s1_dout=5432;
      #10;	m_addr = 16'h00FF; s0_dout=1234;
      #10;	m_addr = 16'h7001; m_wr=0; s1_dout=1234; s0_dout=9;
      #10;	m_addr = 16'h00FF; m_wr=0;
      #10;	$stop;
      
   end
   
endmodule
