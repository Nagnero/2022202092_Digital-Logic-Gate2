module multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result);
	input clk, reset_n, op_start, op_clear;
	input [63:0] multiplier, multiplicand;
	output op_done;
	output [127:0] result;
	
	wire [1:0] state, n_state;
	wire [5:0] cnt, n_cnt;
	wire [63:0] temp, n_temp;
	wire [127:0] n_result;
	
	// next state logic
	multiplier_ns U0_multiplier_ns(op_start, op_clear, state, cnt, n_state);
	_dff_r_2 U1_dff_ns(clk, reset_n, n_state, state);
	
	// calculate data logic
	multiplier_cal U2_multiplier_cal(state, cnt, multiplicand, temp, result, op_done, n_cnt, n_result, n_temp);
	_dff_r_6 U3_dff_cnt(clk, reset_n, n_cnt, cnt); // cnt flip-flop
	_dff_r_64 U4_dff_temp(clk, reset_n, cnt, multiplier, n_temp, temp); // temp flip-flop
	_dff_r_128 U5_dff_result(clk, reset_n, n_result, result); // result flip-flop
	
endmodule
