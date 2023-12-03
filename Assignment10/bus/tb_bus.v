`timescale 1ns/100ps

module tb_bus;
	reg clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
	reg [7:0] m0_address, m1_address;
	reg [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	
	wire m0_grant, m1_grant;
	wire [31:0] m_din;
	wire s0_sel, s1_sel, s_wr;
	wire [7:0] s_address;
	wire [31:0] s_din;
	
	bus DUT(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout, s0_dout, s1_dout,
			m0_grant, m1_grant, m_din, s0_sel, s1_sel, s_address, s_wr, s_din);
	
	always #5 clk = ~clk;
	
	initial begin
		// initialization
		#0;	clk = 1; reset_n = 0; m0_req = 0; m1_req = 0; m0_wr = 0; m1_wr = 0;
				m0_address = 0; m1_address = 0;
				m0_dout = 0; m1_dout = 0; s0_dout = 0; s1_dout = 0;
				
		#10;	reset_n = 1; m0_req  = 1; s0_dout = 32'h0000_1111; s1_dout = 32'h0000_2222;
				m0_wr = 0; m1_wr = 0; m0_address = 8'h11;
		
		#10;	m0_wr = 1; m1_wr = 0; m0_address = 8'h22;
				m0_dout=32'h0001_1110; m1_dout = 32'h0002_2220;
   
		#10;	m0_req=0; m1_req=1; m0_address=8'h33;
				m0_dout = 32'h0011_1100; m1_dout = 32'h0022_2200;
		
		#10;	m0_req = 0; m1_req = 1; m1_address = 8'h44;
				m0_dout = 32'h0111_1000; m1_dout = 32'h0222_2000;
		
		#10;	m0_wr = 1; m1_wr = 1; m0_req = 0; m1_req = 1; m1_address = 8'h55;
				m0_dout = 32'h1111_0000; m1_dout = 32'h2222_0000;
		
		#10;	$stop;
	end

endmodule
