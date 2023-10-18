`timescale 1ns/100ps

module tb_cc_logic;	
	reg [2:0] tb_op; //opcode
	reg [1:0] tb_shamt; //sign
	reg [7:0] tb_d_in; //input
	reg [7:0] tb_d_out; //output
	
	wire [7:0] tb_d_next; //wire
	
	cc_logic DUT(.op(tb_op), .shamt(tb_shamt), .d_in(tb_d_in), .d_out(tb_d_out), .d_next(tb_d_next));		//declear module
	
	initial
	begin	
		#0;	tb_op = 3'b000; tb_shamt = 2'b10; tb_d_in = 8'b0000_0000; tb_d_out = 8'b0000_0000;
		#20;	tb_op = 3'b111; tb_d_in = 8'b0000_1111; // LOAD, result: 0000_1111
		#20;	tb_d_in = 8'b1111_1111; // result: 1111_1111
		#20;  tb_op = 3'b001; // LSL2 result: 1111_1100
		#20;	tb_op = 3'b010; // LSR2 result: 0011_1111
		#20;	tb_op = 3'b100; tb_d_in = 8'b1000_0000; // ASR2 result: 1110_0000
		#20;
		#40;	$stop;
	end
endmodule
