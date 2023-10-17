`timescale 1ns/100ps

module tb_tl_cntr_w_left;
	reg clk, reset_n, Ta, Tal, Tb, Tbl;
	wire [1:0] La, Lb;
  
	// Instantiate the module
	tl_cntr_w_left DUT(.clk(clk), .reset_n(reset_n), .Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .La(La), .Lb(Lb));

	// Clock generation
	always begin
		#5 clk = ~clk;
	end
  
	// Stimulus generation
	initial 
	begin
		#0; // Initialize inputs
		clk = 0;
		reset_n = 0;
		Ta = 0; Tal = 0;
		Tb = 0; Tbl = 0;
		#10 reset_n = 1;

		// Test case 1
		#10 Ta = 1;
		#10 Tb = 1;

		// Test case 2
		#10 Ta = 1;
		#10 Tb = 0;

		// Test case 3
		#10 Ta = 0;
		#10 Tb = 1;

		// Test case 4
		#10 Ta = 0;
		#10 Tb = 0;
		
		// Test case 5
		#10 Ta = 1; Tal = 1;
		#10 Tb = 1; Tbl = 1;

		// Test case 6
		#10 Ta = 1;
		#10 Tb = 0;

		// Test case 7
		#10 Ta = 0;
		#10 Tb = 1;

		// Test case 8
		#10 Ta = 0;
		#10 Tb = 0;

		// Finish simulation
		$stop;
	end
endmodule
