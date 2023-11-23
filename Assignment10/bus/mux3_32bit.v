module mux3_32bit(d0, d1, d2, s, y);
	input [31:0] d0, d1, d2;
	input [1:0] s;
	output reg [31:0] y;

	always @(d0 or d1 or s) begin
		if (s == 2'b10)
			y = d0;
		else if (s == 2'b01)
			y = d1;
		else // set zero
			y = d2;
	end
endmodule
