`timescale 1ns/100ps

module tb_shifter8;	
	reg tb_clk, tb_reset_n; //clk, reset
	reg [2:0] tb_op; // op
	reg [1:0] tb_shamt; // shamt
	reg [7:0] tb_d_in; // d_in
	wire [7:0] tb_d_out; //output 

	shifter8 DUT(.clk(tb_clk), .reset_n(tb_reset_n), .op(tb_op), .shamt(tb_shamt), .d_in(tb_d_in), .d_out(tb_d_out));

	always 
	begin // clock cycle
		#5; tb_clk = ~tb_clk;
	end
	
	initial
	begin
		#0;	tb_clk = 1; tb_reset_n = 0;
				tb_op = 3'b000; tb_shamt = 2'b10; tb_d_in = 8'b0000_0000;
		#20;  tb_reset_n = 1; tb_op = 3'b111; tb_d_in = 8'b0000_1111; // LOAD, result: 0000_1111
		#20;	tb_d_in = 8'b1111_1111; // result: 1111_1111
		#20;  tb_op = 3'b001; // LSL2 result: 1111_1100
		#20;	tb_op = 3'b010; // LSR2 result: 0011_1111
		#20;	tb_op = 3'b100; tb_d_in = 8'b1000_0000; // ASR2 result: 1110_0000
		#20;	tb_reset_n = 0;
		#40;	$stop;
	end																	
endmodule
