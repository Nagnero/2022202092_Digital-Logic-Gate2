module tb_Facto_Controller;
	reg clk, reset_n, opstart, opclear;
	reg [1:0] opdone;
	reg [63:0] operand, result_h, result_l;
	wire [63:0] n_opdone, n_result_h, n_result_l;
	
	Facto_Controller DUT(clk, reset_n, opstart, opclear, opdone, operand, result_h, result_l, n_opdone, n_result_h, n_result_l);
	
	always #5 clk = ~clk;
	
	initial begin
		#0;	clk = 1; reset_n = 0; opstart = 0; opclear = 0; opdone = 0; operand = 0; result_h = 0; result_l = 1;
		#7;	reset_n = 1; opstart = 1;
		#30;	opclear = 1; 
		#10;	opclear = 0; operand = 1;
		#50;	opclear = 1; 
		#10;	opclear = 0; operand = 5;
		#10000;
		
		#50;	$stop;
	end
	
endmodule
