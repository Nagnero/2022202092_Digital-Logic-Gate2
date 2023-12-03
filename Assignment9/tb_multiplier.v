`timescale 1ns/100ps
module tb_multiplier;							//multiplier test module
	reg clk, reset_n, op_start, op_clear;
	reg [63:0] multiplier, multiplicand;	//reg define
	
	wire op_done;
	wire [127:0] result;							//wire define
	
	multiplier U0(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result);	//instance top module

	always begin
		clk = 1; #5; clk=0; #5;					//clock setting
	end

	initial begin
		#0;	reset_n = 0; op_start = 0; op_clear = 0; multiplier = 64'h8000_0000_0000_0000; multiplicand = 10;
		#9;	reset_n = 1;
		#10;	op_start = 1;
		#10;	op_start = 0;
		#700;	op_clear = 1;
		#10;	$finish;
	end
	
endmodule
