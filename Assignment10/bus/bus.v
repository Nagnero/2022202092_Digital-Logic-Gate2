module bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout, s0_dout, s1_dout,
			m0_grant, m1_grant, m_din, s0_sel, s1_sel, s_address, s_wr, s_din);
	input clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
	input [7:0] m0_address, m1_address;
	input [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	output m0_grant, m1_grant;
	output [31:0] m_din;
	output s0_sel, s1_sel, s_wr;
	output [7:0] s_address;
	output [31:0] s_din;
	
	wire mux_s;
	wire [1:0] s_sel;
	
	// instnatiate arbiter
	bus_arbit U0_bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);
	mux2 U1_mux_s_wr(m0_wr, m1_wr, m1_grant, s_wr);
	mux2_8bit U2_mux_s_addr(m0_address, m1_address, m1_grant, s_address);
	mux2_32bit U3_mux_s_din(m0_dout, m1_dout, m1_grant, s_din);
	
	// instantiate address decoder
	bus_addr U4_bus_addr(s_address, s0_sel, s1_sel);
	// flip-flop before 3 input mux
	_dff_r_2 U5_dff2(clk, reset_n, {s0_sel, s1_sel}, s_sel);
	mux3_32bit U6_mux_m_din(.d0(32'h0), .d1(s0_dout), .d2(s1_dout), .s(s_sel), .y(m_din));

endmodule
