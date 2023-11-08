`timescale 1ns/100ps

module tb_fifo_ns;
	reg wr_en, rd_en;
	reg [2:0] state;
	reg [3:0] data_count;
	
	wire [2:0] next_state;
	
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter READ = 3'b010;
	parameter WR_ERROR = 3'b101;
	parameter RD_ERROR = 3'b110;
	parameter NO_OP = 3'b111;
	
	fifo_ns DUT(wr_en, rd_en, state, data_count, next_state);
	
	initial 
	begin
		#0;	state = INIT; wr_en = 0; rd_en = 0; data_count = 0; // initialize inputs
		
		// test code for INIT state
		#10;	wr_en = 0; rd_en = 0;
		#10;	wr_en = 1;
		#10;	data_count = 4'b1000;
		#10;	wr_en = 0; rd_en = 1;
		#10;	data_count = 4'b0000;
		#10;	rd_en = 0;
		#10;	wr_en = 1; rd_en = 1;
		#10;
		// test code for WRITE state
		#10;	state = WRITE; wr_en = 0; rd_en = 0;
		#10;	wr_en = 1;
		#10;	data_count = 4'b1000;
		#10;	wr_en = 0; rd_en = 1;
		#10;	data_count = 4'b0000;
		#10;	rd_en = 0;
		#10;	wr_en = 1; rd_en = 1;
		#10;
		// test code for READ state
		#10;	state = READ; wr_en = 0; rd_en = 0;
		#10;	wr_en = 1;
		#10;	data_count = 4'b1000;
		#10;	wr_en = 0; rd_en = 1;
		#10;	data_count = 4'b0000;
		#10;	rd_en = 0;
		#10;	wr_en = 1; rd_en = 1;
		#10;
		// test code for WRITE ERROR state
		#10;	state = WR_ERROR; wr_en = 0; rd_en = 0;
		#10;	wr_en = 1;
		#10;	data_count = 4'b1000;
		#10;	wr_en = 0; rd_en = 1;
		#10;	data_count = 4'b0000;
		#10;	rd_en = 0;
		#10;	wr_en = 1; rd_en = 1;
		#10;
		// test code for READ ERROR state
		#10;	state = RD_ERROR; wr_en = 0; rd_en = 0;
		#10;	wr_en = 1;
		#10;	data_count = 4'b1000;
		#10;	wr_en = 0; rd_en = 1;
		#10;	data_count = 4'b0000;
		#10;	rd_en = 0;
		#10;	wr_en = 1; rd_en = 1;
		#10;
		// test code for NO_OP state
		#10;	state = NO_OP; wr_en = 0; rd_en = 0;
		#10;	wr_en = 1;
		#10;	data_count = 4'b1000;
		#10;	wr_en = 0; rd_en = 1;
		#10;	data_count = 4'b0000;
		#10;	rd_en = 0;
		#10;	wr_en = 1; rd_en = 1;
		#10;
		
		#10;
	end
endmodule
