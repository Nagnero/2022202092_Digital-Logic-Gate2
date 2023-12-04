module bus_arbit(clk, reset_n, m_req, m_grant);
	input clk, reset_n, m_req;
	output reg m_grant;
	
	always @(*) begin
		if (reset_n == 0)
			m_grant = 0;
		else begin
			if (m_req == 1)
				m_grant = 1;
			else
				m_grant = 0;
		end
	end

endmodule
