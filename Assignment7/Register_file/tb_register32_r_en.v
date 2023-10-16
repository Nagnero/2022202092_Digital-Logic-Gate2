`timescale 1ns/100ps

module tb_register32_r_en;

	reg tb_clk, tb_reset_n, tb_en; //clk,reset,enable
	reg [31:0] tb_d; //input
	wire [31:0] tb_q; //output

	register32_r_en DUT(.clk(tb_clk), .reset_n(tb_reset_n), .en(tb_en), .d(tb_d), .q(tb_q));

	always //clk cycle
	begin
		#5; tb_clk = ~tb_clk;
	end
		
	initial begin	
		#0;	tb_clk = 0; tb_reset_n = 0; tb_en = 1;
		#10;	tb_reset_n = 1;
		#10;	tb_d = 32'h0000_0000;
		#10;	tb_d = 32'h0000_0001;
		#10;	tb_d = 32'hffff_ffff;
		#10;	tb_en = 0;
		#10;	tb_d = 32'h1111_1111;
		#10;	tb_d = 32'h0000_0000;
		#10;	$stop;
	end	
endmodule
