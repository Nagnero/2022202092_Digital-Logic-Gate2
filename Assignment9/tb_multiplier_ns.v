module tb_multiplier_ns;
	reg op_start, op_clear, op_done;
	reg [1:0] state;
	reg [5:0] cnt;
	
	wire [1:0] n_state;
	
	parameter INIT = 2'b00;
	parameter OPERATE = 2'b01;
	parameter DONE = 2'b11;
	
	multiplier_ns DUT(op_start, op_clear, op_done, state, cnt, n_state);
	
	initial begin
		#0;	cnt = 0;
		#1;	state = INIT; op_start = 0; op_clear = 0; op_done = 0;
		#10;	op_start = 1;
		#10;	state = OPERATE; cnt = 6'b010000;
		#10;	cnt = 6'b111111;
		#10;	$stop;
	end
	
endmodule
