module fifo(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	input clk, reset_n, rd_en, wr_en;
	input [31:0] d_in;
	output [31:0] d_out;
	output full, empty, wr_ack, wr_err, rd_ack, rd_err;
	output [3:0] data_count;
	
	wire [2:0] state;
	wire [2:0] next_state;
	wire [2:0] head;
	wire [2:0] next_head;
	wire [2:0] tail;
	wire [2:0] next_tail;
	wire [3:0] next_data_count;
	wire [31:0] rData;
	wire [31:0] rData_to_reg;
	wire we, re;
	
	fifo_ns U0_fifo_ns(.wr_en(wr_en), .rd_en(rd_en), .state(state), .data_count(data_count), .next_state(next_state));
	
	fifo_cal_addr U1_fifo_cal_addr(.state(state), .head(head), .tail(tail), .data_count(data_count),
		.we(we), .re(re), .next_head(next_head), .next_tail(next_tail), .next_data_count(next_data_count));
		
	fifo_out U2_fifo_out(.state(state), .data_count(data_count), 
		.full(full), .empty(empty), .wr_ack(wr_ack), .wr_err(wr_err), .rd_ack(rd_ack), .rd_err(rd_err));
		
	Register_file U3_Register_file(.clk(clk), .reset_n(reset_n), .wAddr(tail), .wData(d_in), .we(we), .rAddr(head), .rData(rData));
	
	// some flip-flops and mux for data process
	_dff_r_3 U4_state_dff(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
	_dff_r_4 U5_data_count_dff(.clk(clk), .reset_n(reset_n), .d(next_data_count), .q(data_count));
	_dff_r_3 U6_head_dff(.clk(clk), .reset_n(reset_n), .d(next_head), .q(head));
	_dff_r_3 U7_tail_dff(.clk(clk), .reset_n(reset_n), .d(next_tail), .q(tail));
	mux_32 U8_mux_32(.re(re), .d1(32'b0), .d2(rData), .q(rData_to_reg));
	_dff_r_32 U9_dout_dff(.clk(clk), .reset_n(reset_n), .d(rData_to_reg), .q(d_out));
endmodule
