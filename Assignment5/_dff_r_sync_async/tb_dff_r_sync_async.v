`timescale 1ns/100ps

module tb_dff_r_sync_async; // define module

	reg tb_clk, tb_reset_n, tb_d;	//input clk, reset, d
	wire tb_q_sync, tb_q_async; //outputs

	// instantiate test module
	_dff_r_sync_async test(.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q_sync(tb_q_sync), .q_async(tb_q_async));	//insert module


	always
	begin
		#7; tb_clk = 1;		//clk cycle
		#7; tb_clk = 0;
	end

	always			
	begin
		#5; tb_reset_n = 0; 	//reset cycle
		#5; tb_reset_n = 1; 
	end

	always	
	begin
		#2 tb_d = 0;			//D cycle
		#2 tb_d = 1; 	
	end
	
	initial 
	begin #100; $stop; end

endmodule
