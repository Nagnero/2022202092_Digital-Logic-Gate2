`timescale 1ns/100ps

module tb_ram;
	reg clk;
	reg cen, wen;
	reg [7:0] addr; // Changed to match the module input size
	reg [63:0] din; // Changed to match the module input size
	wire [63:0] dout;
	
	ram DUT(clk, cen, wen, addr, din, dout);
	
	always #5 clk = ~clk;
	
	initial begin
		#0;	clk = 1; cen = 0; wen = 1; addr = 8'b0000_0000; din = 64'b0; // Initialize inputs
		#10;	addr = 8'b0000_0001; din = 64'h0000_0000_0000_ffff; // Set input data
		#10;	addr = 8'b0000_0000; wen = 0;
		#10;	addr = 8'b0000_0001; wen = 0;
		#10;	addr = 8'b0000_0000; din = 64'b0; cen = 1; wen = 1; // Set control signals for write operation
		#10;	din = 64'hffff_ffff_0000_0000; addr = 8'b0000_0001; // Set different address and data for write
		#10;	addr = 8'b0000_0010; // Change address for read
		#10;	wen = 0; addr = 8'b0000_0000; // Set control signal for read operation and reset address
		#10;	addr = 8'b0000_0001; // Read data from a different address
		#10;	addr = 8'b0000_0010; // Read data from a different address
		#10;	addr = 8'b0000_0000; // Read data from initial address
		#10;	$stop; // Stop simulation
	end
	
endmodule
