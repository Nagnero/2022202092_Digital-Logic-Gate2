module multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result);
	input clk, reset_n, op_start, op_clear;
	input [63:0] multiplier, multiplicand;
	output op_done;
	output [127:0] result;
	
	wire [1:0] state, n_state;
	wire [5:0] cnt, n_cnt;
	wire [127:0] n_result;
	
	// next state logic
	multiplier_ns U0_multiplier_ns(op_start, op_clear, op_done, state, cnt, n_state);
	_dff_r_2 U1_dff_ns(clk, reset_n, next_state, state);
	
	// calculate data logic
	multiplier_cal U2_multiplier_cal(state, cnt, multiplier,recoded,result,op_done,n_cnt, n_result,next_recoded);
	_dff_r_6 U3_dff_cnt();
	
endmodule
