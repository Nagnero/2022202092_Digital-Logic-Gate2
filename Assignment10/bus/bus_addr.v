module bus_addr(s_address, s0_sel, s1_sel);
	input [31:0] s_address;
	output reg s0_sel, s1_sel;
	
	always @(s_address) begin
		if((s_address >= 8'h0000_0000) && (s_address <= 8'h0000_001F) || s_address[7:5] == 3'b000)
			{s0_sel, s1_sel} = 2'b10; // s0 out
		else if((s_address >= 8'h0000_0020) && (s_address <= 8'h0000_003F) || s_address[7:5] == 3'b001)
			{s0_sel, s1_sel} = 2'b01; // s1 out
		else
			{s0_sel, s1_sel} = 2'b00; // no output
	end

endmodule
