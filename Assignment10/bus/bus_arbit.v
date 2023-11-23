module bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);
	input clk, reset_n, m0_req, m1_req;
	output reg m0_grant, m1_grant;
	
	always @(posedge clk or negedge reset_n) begin
		if (reset_n == 0) begin
			m0_grant = 1;
			m1_grant = 0;
		end
		else begin
			casex({m0_req, m1_req}) // current state check
				2'bx0:
					{m0_grant, m1_grant} = 2'b10;
				2'b01:
					{m0_grant, m1_grant} = 2'b01;
				default:
					{m0_grant, m1_grant} = 2'bxx;
			endcase
		end
	end

endmodule
