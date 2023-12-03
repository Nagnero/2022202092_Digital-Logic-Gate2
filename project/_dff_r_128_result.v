module _dff_r_128_result(clk, reset_n, operand, n_result, m_result, result);
	input clk,reset_n;
	input [63:0] operand;
	input [127:0] n_result, m_result;
	output reg [127:0] result;
	
	// 128 bit flip flop
	always@(posedge clk or negedge reset_n)
	begin
		if(reset_n == 0) result <= 0;
		else begin
			if (operand >= 64'd2) result <= m_result;
			else result <= n_result;
		end
	end
endmodule
	