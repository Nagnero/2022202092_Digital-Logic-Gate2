module tb_multiplier;//top module testbench
	reg clk,reset_n,op_start,op_clear;
	reg [63:0] multiplier,multiplicand;
	wire [127:0] result;
	wire op_done;
	
	multiplier U0(clk,reset_n,multiplier,multiplicand,op_start,op_clear,op_done,result);//module instance
	
	always begin//set clk
		clk = 0; #5; clk=1; #5;
	end
	
	initial begin
		reset_n=1; op_start=0; op_clear=0; multiplier=0; multiplicand=0; #8;
		reset_n=0; #5;
		reset_n=1; multiplier=5; multiplicand=7; #5;//test1
		op_start=1; #450;
		op_clear=1; op_start=0; #10;
		op_clear=0; multiplier=64'h2d9f9217; multiplicand=64'h23cac3; #10;//test2
		op_start=1; #450;
		op_clear=1; op_start=0; #20;
		op_clear=0; multiplier=4753895; multiplicand=-2345; #10;//test3
		op_start=1; #450;
		$stop;
	end
endmodule
