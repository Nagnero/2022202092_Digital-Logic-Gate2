module tb_fifo_cal_addr;
	reg [2:0] state;
	reg [2:0] head;
	reg [2:0] tail;
	reg [3:0] data_count;
	
	wire we, re;
	wire [2:0] next_head;
	wire [2:0] next_tail;
	wire [3:0] next_data_count;
	
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter READ = 3'b010;
	parameter WR_ERROR = 3'b101;
	parameter RD_ERROR = 3'b110;
	parameter NO_OP = 3'b111;

	fifo_cal_addr DUT(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);
	
	initial
	begin
		#0;	state = INIT; head = 0; tail = 0; data_count = 0; // initialize inputs
		
		// test code for INIT state
		#10;	head = 0; tail = 3;
		#10;	data_count = 4'b1000;
		#10;	head = 0; tail = 1;
		#10;	data_count = 4'b0000;
		#10;
		// test code for WRITE state
		#10;	state = WRITE; head = 0; tail = 1; data_count = 4'b0000;
		#10;	tail = 2; data_count = 3;
		#10;	tail = 3; data_count = 4;
		#10;	tail = 7; data_count = 5;
		#10;	data_count = 8; // this case won't happen
		#10;
		// test code for READ state
		#10;	state = READ; head = 0; tail = 1; data_count = 1;
		#10;	head = 1; data_count = 0; // this case won't happen
		#10;	head = 7; tail = 6; data_count = 8; 
		#10;
		// test code for WRITE ERROR state
		#10;	state = WR_ERROR; head = 0; tail = 0; data_count = 0;
		#10;	head = 1;
		#10;	data_count = 8;
		#10;
		// test code for READ ERROR state
		#10;	state = RD_ERROR; head = 0; tail = 0; data_count = 0;
		#10;	head = 1;
		#10;	data_count = 8;
		#10;
		// test code for NO_OP state
		#10;	state = NO_OP; head = 0; tail = 0; data_count = 0;
		#10;	head = 1;
		#10;	data_count = 8;
		#10;
	end
endmodule