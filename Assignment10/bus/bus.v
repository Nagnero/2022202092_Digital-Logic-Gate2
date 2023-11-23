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
	
	//implement arbiter
	bus_arbit U0_bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);
	
	mux2(m0_wr, m1_wr, m1_grant, s_wr);
	mux2_8bit(m0_address, m1_address, m1_grant, s_address);

endmodule
