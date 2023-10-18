module shifter8(clk, reset_n, op, shamt, d_in, d_out);
	input clk, reset_n;
	input [2:0] op;
	input [1:0] shamt;
	input [7:0] d_in;
	output [7:0] d_out;
	
	wire [7:0] w_next;
	
	// instanitate logic
	_register8_r U0_register8_r(.clk(clk), .reset_n(reset_n), .d(w_next), .q(d_out));
	
	cc_logic U1_cc_logic(.op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out), .d_next(w_next));
endmodule
