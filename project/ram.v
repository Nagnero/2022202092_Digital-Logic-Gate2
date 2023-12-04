module ram(clk, cen, wen, s_addr, s_din, s_dout);
	input clk, cen, wen;
	input [7:0] s_addr;
	input [63:0] s_din;
	output reg [63:0] s_dout;
	
	reg [63:0] mem [0:255];
	
	integer i;
	
	initial begin
		for (i = 0; i < 256; i = i + 1) 
			mem[i] = 64'b0;
	end
	
	always @(posedge clk) begin
		if (cen == 1'b1) begin
			if (wen == 1'b1) begin
				mem[s_addr] = s_din;
				s_dout = 64'b0;
			end
			else begin
				s_dout = mem[s_addr];
			end
		end
		else begin
			s_dout = 64'b0;
		end
	end

endmodule
