`timescale 1ns/100ps

module tb_ram;
	reg clk;
	reg cen, wen;
	reg [4:0] addr;
	reg [31:0] din;
	wire [31:0] dout;
	
	ram DUT(clk, cen, wen, addr, din, dout);
	
	always #5 clk = ~clk;
	
	initial begin
	#0;	clk = 1; cen = 0;	wen = 0; addr = 0; din =0;
	#10;	din = 32'h0000_ffff;
	#10;	cen = 1; wen = 1;
	#10;	din = 32'hffff_0000; addr = 1;
	#10;	addr = 2;
	#10;	wen = 0; addr = 0;
	#10;	addr = 1;
	#10;	addr = 2;
	#10;	addr = 5'b00000;
	#10;	$stop;
	end
	
endmodule
