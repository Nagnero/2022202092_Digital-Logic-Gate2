module bus_arbit(clk, reset_n, m_req, m_grant);
	input clk, reset_n, m_req;
	output reg m_grant;
	
	always @(posedge clk or negedge reset_n) begin
		if (reset_n == 0)
			m_grant = 0;
		else begin
			if (m_req == 0)
				m_grant = 0;
			else
				m_grant = 1;
		end
	end

endmodule