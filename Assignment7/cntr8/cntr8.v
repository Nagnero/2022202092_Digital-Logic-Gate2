module cntr8(clk, reset_n, inc, load, d_in, d_out, o_state);
	input clk, reset_n, inc, load; // inputs
	input [7:0] d_in;
	output [7:0] d_out; // outputs
	output [2:0] o_state;
	
	wire [2:0] next_state;
	wire [2:0] state;
	
	assign o_state = state;
	
	_register3_r U0_register3_1(.clk(clk),.reset_n(reset_n),.d(next_state),.q(state));
	
	ns_logic U1_ns_logic(.load(load), .inc(inc), .state(o_state), .next_state(next_state));
	os_logic U2_os_logic(.state(state), .d_in(d_in), .d_out(d_out));
endmodule
