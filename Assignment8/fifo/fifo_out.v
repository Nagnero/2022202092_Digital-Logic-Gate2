module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);
	input [2:0] state;
	input [3:0] data_count;
	output reg full, empty, wr_ack, wr_err, rd_ack, rd_err;
	
	parameter INIT = 3'b000;
	parameter WRITE = 3'b001;
	parameter READ = 3'b010;
	parameter WR_ERROR = 3'b101;
	parameter RD_ERROR = 3'b110;
	parameter NO_OP = 3'b111;
	
	always@(state, data_count)
	begin
		case(state) // update conditions due to states
			INIT: begin // INIT state
				full = 0;
				empty = 1;
				wr_ack = 0;
				wr_err = 0;
				rd_ack = 0;
				rd_err = 0;
			end
			WRITE: begin // WRITE state
				if(data_count < 8) full = 0;
				else full = 1; // full condition on
				empty = 0;
				wr_ack = 1;
				wr_err = 0;
				rd_ack = 0;
				rd_err = 0;
			end
			READ: begin // READ state
				if(data_count > 0) empty = 0;
				else empty = 1; // empty condition on
				full = 0;
				wr_ack = 0;
				wr_err = 0;
				rd_ack = 1;
				rd_err = 0;
			end
			WR_ERROR: begin // Write error state
				full = 1;
				empty = 0;
				wr_ack = 0;
				wr_err = 1;
				rd_ack = 0;
				rd_err = 0;
			end
			RD_ERROR: begin // read error state
				full = 0;
				empty = 1;
				wr_ack = 0;
				wr_err = 0;
				rd_ack = 0;
				rd_err = 1;
			end
			NO_OP: begin // no operation (IDLE) state
				if(data_count < 8) full = 0;
				else full = 1; // full condition on
				if(data_count > 0) empty = 0;
				else empty = 1; // empty condition on
				wr_ack = 0;
				wr_err = 0;
				rd_ack = 0;
				rd_err = 0;
			end
		endcase
	end
endmodule
