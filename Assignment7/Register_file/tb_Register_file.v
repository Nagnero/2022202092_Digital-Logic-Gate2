`timescale 1ns/100ps

module tb_Register_file;
	reg tb_clk,tb_reset_n,tb_we; //clk, reset, write enable
	reg[2:0] tb_wAddr,tb_rAddr; //write,read select
	reg[31:0] tb_wData; //input data
	wire[31:0] tb_rData; //output data
	
	Register_file DUT(.clk(tb_clk), .reset_n(tb_reset_n), .we(tb_we), .wAddr(tb_wAddr),
			.rAddr(tb_rAddr), .wData(tb_wData), .rData(tb_rData));
	
	always //clk cycle
	begin
		#5; tb_clk = ~tb_clk;
	end
		
	initial
	begin																					
		#0;	tb_clk = 0;
				tb_reset_n = 0; tb_we = 0; 
		#10;	tb_reset_n = 1;  tb_we = 1;
		#10;	tb_wAddr = 3'b000; tb_wData = 32'h0000_0000; //write 000 -> 0000_0000
		#10;	tb_wAddr = 3'b001; tb_wData = 32'h0001_0001; //write 001 -> 0001_0001
		#10;	tb_wAddr = 3'b010; tb_wData = 32'h0010_0010; //write 010 -> 0010_0010
		#10;	tb_wAddr = 3'b011; tb_wData = 32'h0011_0011; //write 011 -> 0011_0011
		#10;	tb_wAddr = 3'b100; tb_wData = 32'h000f_000f; //write 100 -> 000f_000f
		#10;	tb_wAddr = 3'b101; tb_wData = 32'h0000_00ff; //write 101 -> 0000_00ff
		#10;	tb_wAddr = 3'b110; tb_wData = 32'h0010_ffff; //write 110 -> 0010_ffff
		#10;	tb_wAddr = 3'b111; tb_wData = 32'h0fff_ffff; //write 111 -> ffff_ffff
		#10;	tb_rAddr = 3'b000; //read 000
		#10;	tb_rAddr = 3'b001; //read 001
		#10;	tb_rAddr = 3'b010; //read 010
		#10;	tb_rAddr = 3'b011; //read 011
		#10;	tb_rAddr = 3'b100; //read 100
		#10;	tb_rAddr = 3'b101; //read 101
		#10;	tb_rAddr = 3'b110; //read 110
		#10;	tb_rAddr = 3'b111; //read 111
		
		// some term to seperate
		#30;	tb_we = 0;
		#10;	tb_wAddr = 3'b101;	tb_wData = 32'hffff_ffff; //write 101 -> ffff_ffff
		#10;	tb_wAddr = 3'b111;	tb_wData = 32'h0000_0000; //write 111 -> 0000_0000
		#10;	tb_rAddr = 3'b101; // read 101
		#10;	tb_rAddr = 3'b111; // read 111
		#10;	$stop;
	end	
	
endmodule
