module BUS(clk, reset_n, m_req, m_wr, m_addr, m_dout, s0_dout, s1_dout,
			m_grant, m_din, s0_sel, s1_sel, s_addr, s_wr, s_din);
	input clk, reset_n, m_req, m_wr; // input signals
	input [15:0] m_addr;
	input [63:0] m_dout, s0_dout, s1_dout;
	output m_grant; // output signals
	output [63:0] m_din;
	output s0_sel, s1_sel, s_wr;
	output [15:0] s_addr;
	output [63:0] s_din;
	
	wire [1:0] s_sel;
	
	bus_arbit U0_arbiter(clk, reset_n, m_req, m_grant); // arbiter decide grant
	
	mux2 U1_mux_wr(0, m_wr, m_grant, s_wr);
	mux2_16bit U2_mux_addr(0, m_addr, m_grant, s_addr);
	mux2_64bit U3_mux_din(64'h0, m_dout, m_grant, s_din);
	
	// set s select signal via bus_addr
	bus_addr U1_addr(s_addr, s0_sel, s1_sel);
	// filp-flop before 3 input mux
	_dff_r_2 U2_dff2(clk, reset_n, {s0_sel, s1_sel}, s_sel);
	mux3_64bit U3_mux_m_din(.d0(64'h0), .d1(s0_dout), .d2(s1_dout), .s(s_sel), .y(m_din));

endmodule
