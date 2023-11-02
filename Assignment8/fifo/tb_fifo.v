`timescale 1ns/100ps

module tb_fifo;
	reg clk, reset_n, rd_en, wr_en;
	reg [31:0] d_in;
	
	wire [31:0] d_out;
	wire full, empty, wr_ack, wr_err, rd_ack, rd_err;
	wire [3:0] data_count;

	fifo DUT(clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	
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
		#10;	d_in = 32'h0000_0022;
		#10;	d_in = 32'h0000_0033;
		#10;	d_in = 32'h0000_0044;
		#10;	d_in = 32'h0000_0055;
		#10;	d_in = 32'h0000_0066;
		#10;	d_in = 32'h0000_0077;
		#10;	d_in = 32'h0000_0088;
		#10;	d_in = 32'h0000_0099;
		#10;	d_in = 32'h0000_00aa;
		#10;	d_in = 32'h0000_00bb;
		#20;
		#10;	wr_en = 0;
		#20;	rd_en = 1;
		#20;	rd_en = 0; wr_en = 1;
		#10;	d_in = 32'h0000_00cc;
		#10;	rd_en = 1; wr_en = 0;
		#20;	rd_en = 0;
		#10;	rd_en = 1;
		#80;

		
		#10;	$stop;
	end

endmodule
