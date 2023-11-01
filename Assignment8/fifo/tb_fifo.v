`timescale 1ns/100ps

module tb_fifo;
	reg clk, reset_n, rd_en, wr_en;
	reg [31:0] d_in;
	wire [31:0] d_out;
	wire full, empty, wr_ack, wr_err, rd_ack, rd_err;
	wire [3:0] data_count;

	reg [2:0] state;
	wire [2:0] next_state;

	fifo DUT(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	fifo_ns DUT1(wr_en, rd_en, state, data_count, next_state);

	
	always begin
		#5; clk = ~clk;
	end
	
	initial begin
		#0;	clk = 0; reset_n = 0; rd_en = 0; wr_en = 0; d_in = 32'b 0;
		#5;	reset_n = 1;
		#5;	reset_n = 0;
		#12;	reset_n = 1;
		#10;	rd_en = 1;
		#10;	rd_en = 0; wr_en = 1; d_in = 32'h0000_0011;
		#10;	$stop;
	end

endmodule
