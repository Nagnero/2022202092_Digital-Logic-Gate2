module FactoCore(clk, reset_n, s_sel, s_wr, s_addr, s_din, s_dout, interrupt);
	input clk, reset_n, s_sel, s_wr;
	input [15:0] s_addr;
	input [63:0] s_din;
	output [63:0] s_dout;
	output interrupt;
	
	wire [63:0] opstart, opclear, opdone, intrEn, operand, result_h, result_l, opstart_din;
	wire [63:0] n_opdone, n_result_h, n_result_l;
	wire [6:0] dff_en;
	wire opstart_en;
	
	// decode address and get each flip flop enable signal
	Facto_decodder U0_decodder(s_addr[7:0], s_sel, s_wr, dff_en);
	
	mux2 mux_start_en(dff_en[0], 1'b1, opclear[0], opstart_en);
	mux2_64bit mux_start_din(s_din, 64'b0, opclear[0], opstart_din);
	
	_dff_r_en_64 dff_opstart(clk, reset_n, opstart_en, opstart_din, opstart);
	_dff_r_en_64 dff_opclear(clk, reset_n, dff_en[1], s_din, opclear);
	_dff_r_en_64 dff_opdone(clk, reset_n, 1'd1, n_opdone, opdone);
	_dff_r_en_64 dff_intrEn(clk, reset_n, dff_en[3], s_din, intrEn);
	_dff_r_en_64 dff_operand(clk, reset_n, dff_en[4], s_din, operand);
	_dff_r_en_64 dff_result_h(clk, reset_n, 1'd1, n_result_h, result_h);
	_dff_r_en_64_l dff_result_l(clk, reset_n, 1'd1, n_result_l, result_l);
	
	Facto_Controller U1_controller(clk, reset_n, opstart[0], opclear[0], opdone[1:0], operand, result_h, result_l, n_opdone, n_result_h, n_result_l);
	
	mux7 mux_dout(64'b0, 64'b0, opdone, 64'b0, 64'b0, result_h, result_l, dff_en, s_dout);
	
	assign interrupt = opdone[0] & intrEn[0];

endmodule
