`timescale 1ns/100ps

module tb_fifo_out;
	reg [2:0] state;
	reg [3:0] data_count;
	
	wire full, empty, wr_ack, wr_err, rd_ack, rd_err;
		
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter READ = 3'b010;
	parameter WR_ERROR = 3'b101;
	parameter RD_ERROR = 3'b110;
	parameter NO_OP = 3'b111;
	
	fifo_out DUT(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);
	
	initial
	begin
		#0;	state = INIT; data_count = 0;
		#10;	data_count = 4;
		#10;	data_count = 8;
		#10;	state = WRITE; data_count = 0;
		#10;	data_count = 4;
		#10;	data_count = 8;
		#10;	state = READ; data_count = 0;
		#10;	data_count = 4;
		#10;	data_count = 8;
		#10;	state = WR_ERROR; data_count = 0;
		#10;	data_count = 4;
		#10;	data_count = 8;
		#10;	state = RD_ERROR; data_count = 0;
		#10;	data_count = 4;
		#10;	data_count = 8;
		#10;	state = NO_OP; data_count = 0;
		#10;	data_count = 4;
		#10;	data_count = 8;
		#10;	$stop;
	end
endmodule
	