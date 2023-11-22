module tb_multiplier_cal;
	reg [1:0] state;
	reg [5:0] cnt; // count cycle
	reg [63:0] multiplicand, temp; // temp is multiplier
	reg [127:0] result;
	
	wire op_done;
	wire [5:0] n_cnt;
	wire [127:0] n_result;
	wire [63:0] n_temp; // next multiplier
	
	parameter INIT = 2'b00;
	parameter OPERATE = 2'b01;
	parameter DONE = 2'b11;

	multiplier_cal DUT(state, cnt, multiplicand, temp, result, op_done, n_cnt, n_result, n_temp);
	
	initial begin
		#0;	state = INIT; cnt = 0; temp = 0; multiplicand = 64'b0111;
				temp = 64'b1001; result = 0;
		#10;	state = OPERATE;
		#10;	cnt = 1; temp = 64'h8000_0000_0000_0004; result = 128'hffff_ffff_ffff_fffc_8000_0000_0000_0000; 
		#10;	cnt = 2; temp = 64'h4000_0000_0000_0002; result = 128'hffff_ffff_ffff_fffe_4000_0000_0000_0000;
		#10;	cnt = 3; temp = 64'h2000_0000_0000_0001; result = 128'hffff_ffff_ffff_fffb_a000_0000_0000_0000;
		#10;	cnt = 4;
		#10;	$stop;
	end
	
endmodule
