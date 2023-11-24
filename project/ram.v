module ram(clk, cen, wen, s_addr, s_din, s_dout);
	input clk, cen, wen;
	input [7:0] s_addr;
	input [63:0] s_din;
	output reg [63:0] s_dout;
	
	reg [63:0] mem [255:0];
	
	integer i;
	
	initial begin
		for (i = 0; i < 256; i = i + 1) 
			mem[i] = 0;
	end
	
	always @(posedge clk) begin
		if (cen == 1 && wen == 1) begin
			mem[s_addr] = s_din;
			s_dout = 0;
		end
		else if (cen == 1 && wen == 0)
			s_dout = mem[s_addr];
		else if (cen == 0)
			s_dout = 0;
	end

endmodule
