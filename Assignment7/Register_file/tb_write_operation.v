`timescale 1ns/100ps

module tb_write_operation;

	reg tb_we; //write enable
	reg [2:0]tb_Addr; //decoder input
	wire [7:0]tb_wEn; //en signal 

	write_operation DUT(.Addr(tb_Addr), .we(tb_we), .wEn(tb_wEn));
	
	initial
	begin 
		#0;	tb_we = 0;
		#10;	tb_Addr = 3'b000;
		#10;	tb_Addr = 3'b001;
		#10;	tb_Addr = 3'b010;
		
		#30;	tb_we = 1;	tb_Addr = 3'b000;
		#10;	tb_Addr = 3'b000;
		#10;	tb_Addr = 3'b001;
		#10;	tb_Addr = 3'b010;
		#10;	tb_Addr = 3'b011;
		#10;	tb_Addr = 3'b100;
		#10;	tb_Addr = 3'b101;
		#10;	tb_Addr = 3'b110;
		#10;	tb_Addr = 3'b111;
		#10;	$stop;
	end	
endmodule