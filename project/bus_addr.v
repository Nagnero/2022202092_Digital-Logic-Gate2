module bus_addr(s_addr, s0_sel, s1_sel);
	input [15:0] s_addr;
	output reg s0_sel, s1_sel;
	
	always @(s_addr) begin
		if((s_addr >= 4'h0000) && (s_addr <= 4'h07FF))
			{s0_sel, s1_sel} = 2'b10; // s0 out
		else if((s_addr >= 4'h7000) && (s_addr <= 4'h71FF))
			{s0_sel, s1_sel} = 2'b01; // s1 out
		else
			{s0_sel, s1_sel} = 2'b00; // no output
	end

endmodule
