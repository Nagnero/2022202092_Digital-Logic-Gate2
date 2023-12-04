module mux7(d0, d1, d2, d3, d4, d5, d6, dff_en, y);
	input [63:0] d0, d1, d2, d3, d4, d5, d6;
	input [6:0] dff_en;
	output reg [63:0] y;

	always @(d0 or d1 or d2 or dff_en) begin
		if (dff_en == 7'b0000_001)
			y = d0;
		else if (dff_en == 7'b0000_010)
			y = d1;
		else if (dff_en == 7'b0000_100) 
			y = d2;
		else if (dff_en == 7'b0001_000)
			y = d3;
		else if (dff_en == 7'b0010_000)
			y = d4;
		else if (dff_en == 7'b0100_000) 
			y = d5;
		else if (dff_en == 7'b1000_000) 
			y = d6;	
		else
			y = 0;
	end
endmodule