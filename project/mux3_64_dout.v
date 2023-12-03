module mux3_64_dout(d0, d1, d2, dff_en, y);
	input [63:0] d0, d1, d2;
	input [6:0] dff_en;
	output reg [63:0] y;

	always @(d0 or d1 or d2 or dff_en) begin
		if (dff_en == 7'b0000_100)
			y = d0;
		else if (dff_en == 7'b0100_000)
			y = d1;
		else if (dff_en == 7'b1000_000) 
			y = d2;
		else
			y = 0;
	end
endmodule