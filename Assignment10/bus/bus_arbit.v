module bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);
	input clk, reset_n, m0_req, m1_req;
	output reg m0_grant, m1_grant;
	
	always @(posedge clk or negedge reset_n) begin
		if (reset_n == 0) begin
			m0_grant = 1;
			m1_grant = 0;
		end
		else begin
			case({m0_req, m1_req}) // current state check
				2'bx0: begin
					m0_grant = 1;
					m1_grant = 0;
				end
				2'b01: begin
					m0_grant = 0;
					m1_grant = 1;
				end
				default: begin
					m0_grant = 1'bx;
					m1_grant = 1'bx;
				end
			endcase
		end
	end

endmodule
