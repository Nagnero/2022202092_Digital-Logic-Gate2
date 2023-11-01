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
	wire we, re;
	
	fifo_ns U0_fifo_ns(.wr_en(wr_en), .rd_en(rd_en), .state(state), .data_count(data_count), .next_state(next_state));
	
	fifo_cal_addr U1_fifo_cal_addr(.state(state), .head(head), .tail(tail), .data_count(data_count),
		.we(we), .re(re), .next_head(next_head), .next_tail(next_tail), .next_data_count(next_data_count));
		
	fifo_out U2_fifo_out(.state(state), .data_count(data_count), 
		.full(full), .empty(empty), .wr_ack(wrack), .wr_err(wr_err), .rd_ack(rd_ack), .rd_err(rd_err));
		
	Register_file U3_Register_file(.clk(clk), .reset_n(reset_n), .wAddr(tail), .wData(d_in), .we(we), .rAddr(head), .rData(d_dout));
endmodule
