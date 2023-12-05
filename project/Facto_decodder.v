module Facto_decodder(s_addr, s_sel, s_wr, dff_en);
	input s_sel, s_wr;
	input [7:0] s_addr;
	output reg [6:0] dff_en;
	
	parameter NO_OP = 7'b0000_000;
	parameter START = 7'b0000_001;
	parameter CLEAR = 7'b0000_010;
	parameter DONE = 7'b0000_100;
	parameter INTREN = 7'b0001_000;
	parameter OPERAND = 7'b0010_000;
	parameter RESULT_H = 7'b0100_000;
	parameter RESULT_L = 7'b1000_000;
	
	always @(*) begin
		if (s_sel == 0) dff_en = 0;
		else begin
			if (s_addr >= 8'h00 && s_addr < 8'h08) dff_en = START;
			else if (s_addr >= 8'h08 && s_addr < 8'h10) dff_en = CLEAR;
			else if (s_addr >= 8'h10 && s_addr < 8'h18) dff_en = DONE;
			else if (s_addr >= 8'h18 && s_addr < 8'h20) dff_en = INTREN;
			else if (s_addr >= 8'h20 && s_addr < 8'h28) dff_en = OPERAND;
			else if (s_addr >= 8'h28 && s_addr < 8'h30) dff_en = RESULT_H;
			else if (s_addr >= 8'h30 && s_addr < 8'h38) dff_en = RESULT_L;
			else dff_en = NO_OP;
		end
	end

endmodule
