module tb_multiplier;
	reg clk, reset_n, op_start, op_clear;
	reg [63:0] multiplier, multiplicand;
	wire op_done;
	wire [127:0] result;
	
	multiplier DUT(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result);
	
	always #5 clk = ~clk;
	
	initial begin
		#0;	clk = 0; reset_n = 0; op_start = 0; op_clear = 0; multiplier = 64'b1001; multiplicand = 64'b0111;
		#10;	reset_n = 1; op_start= 1;
		#2000;	op_clear = 1;
		#30;	$stop;
	end
	
endmodule
