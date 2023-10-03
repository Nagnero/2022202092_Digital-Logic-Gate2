`timescale 1ns/100ps

module tb_cla_clk;
	reg clk;
	reg [31:0] tb_a, tb_b;
	reg tb_ci;
	wire [31:0] tb_s_cla;
	wire tb_co_cla;
	
	parameter STEP = 10; // set parameter STEP as 10
	
	cla_clk U0_cla_clk(.clk(clk), .a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s_cla), .co(tb_co_cla));
	
	always #(STEP/2) clk = ~clk; // change clock every 5 unit time
	
	initial
	begin
							clk = 1'b1; // set clk as 1 in start
							tb_a = 32'h0; 				tb_b = 32'h0; 				tb_ci = 1'b0; // set start value as all 0
							
		#(STEP); 		tb_a = 32'hFFFF_FFFF; 	tb_b = 32'h0; 				tb_ci = 1'b1; // a is max and cin or b is 1
		#(STEP);			tb_a = 32'hFFFF_FFFF; 	tb_b = 32'h1; 				tb_ci = 1'b0;
		
		#(STEP);			tb_a = 32'hffff_0000; 	tb_b = 32'h0000_ffff; 	tb_ci = 1'b0; // result is ffff_ffff
		#(STEP);			tb_a = 32'hffff_0000; 	tb_b = 32'h0000_ffff; 	tb_ci = 1'b1; // when overflow happens
		
		#(STEP); 		tb_a = 32'h135f_a562; 	tb_b = 32'h3561_4642; 	tb_ci = 1'b0;
		#(STEP*2); 		$stop;
	end
	
endmodule
