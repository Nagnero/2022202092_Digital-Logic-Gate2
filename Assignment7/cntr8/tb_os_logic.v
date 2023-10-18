`timescale 1ns/100ps //timescale

module tb_os_logic;
	reg tb_inc; 
	reg [7:0] tb_d_in; 
	
	wire [7:0] tb_d_out; 
	reg [2:0] tb_state; 
	
	os_logic	test(.state(tb_state), .d_in(tb_d_in), .d_out(tb_d_out));
	
	initial 
	begin 
		#0;	tb_d_in = 1; 
				tb_inc = 1; tb_state=3'b000;
		#10;	tb_inc = 1; tb_state=3'b001;
		#10;	tb_inc = 0; tb_state=3'b010;
		#10;	tb_inc = 0; tb_state=3'b011;
		#10;	tb_inc = 1; tb_state=3'b100;
		#10;	tb_inc = 0; tb_state=3'b101;
		#10;	$stop;
	end
endmodule
		