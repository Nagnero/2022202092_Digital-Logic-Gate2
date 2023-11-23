module mux2_8bit(d0, d1, s, y);
	input [7:0] d0, d1;
	input s;
	output reg [7:0] y;
	
	always @(d0 or d1 or s) begin
		if (s == 0)
			y = d0;
		else
			y = d1;
	end
endmodule
