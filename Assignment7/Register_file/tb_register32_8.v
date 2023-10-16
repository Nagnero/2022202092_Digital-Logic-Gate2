`timescale 1ns/100ps

module tb_register32_8;
	reg tb_clk, tb_reset_n; //clk,reset
	reg [7:0] en; //enable
	reg [31:0] d_in; //input
	//each output
	wire [31:0] d_out0,d_out1,d_out2,d_out3,d_out4,d_out5,d_out6,d_out7;

	register32_8 DUT(.clk(tb_clk), .reset_n(tb_reset_n), .en(en), .d_in(d_in), 
		.d_out0(d_out0), .d_out1(d_out1), .d_out2(d_out2), .d_out3(d_out3), 
		.d_out4(d_out4), .d_out5(d_out5), .d_out6(d_out6), .d_out7(d_out7));
	
	always //clk cycle
	begin
		#5; tb_clk = ~tb_clk;
	end
		
	initial begin																					
	   #0;	tb_clk = 0; tb_reset_n = 0;
		#10;	tb_reset_n = 1; 
				d_in = 32'h000f_000f; en = 8'b0000_0000;
		#20;	d_in = 32'hffff_ffff; en = 8'b0000_0001;
		#20;	d_in = 32'h0001_0001; en = 8'b0000_0010;
		#20;	d_in = 32'h0010_0010; en = 8'b0000_0100;
		#20;	d_in = 32'h0000_0011; en = 8'b0000_1000;
		#20;	d_in = 32'h0000_0100; en = 8'b0001_0000;
		#20;	d_in = 32'h0000_0101; en = 8'b0010_0000;
		#20;	d_in = 32'h0000_0110; en = 8'b0100_0000;
		#20;	d_in = 32'h0000_0111; en = 8'b1000_0000;
		#10;	$stop;
		
		
	end	
	
endmodule
