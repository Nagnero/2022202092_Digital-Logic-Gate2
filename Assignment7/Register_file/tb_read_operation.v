`timescale 1ns/100ps

module tb_read_operation;
	reg [31:0] tb_from_reg0, tb_from_reg1, tb_from_reg2, tb_from_reg3, tb_from_reg4, tb_from_reg5, tb_from_reg6, tb_from_reg7;
	reg [2:0] tb_Addr; //sign
	wire [31:0] tb_Data; //output 

	read_operation DUT(.Addr(tb_Addr), .Data(tb_Data), .from_reg0(tb_from_reg0), .from_reg1(tb_from_reg1), .from_reg2(tb_from_reg2), 
			.from_reg3(tb_from_reg3), .from_reg4(tb_from_reg4), .from_reg5(tb_from_reg5), .from_reg6(tb_from_reg6), .from_reg7(tb_from_reg7));

	initial
	begin																					
		#0;	tb_from_reg0 = 32'h0000_0000;
				tb_from_reg1 = 32'h0000_0001;
				tb_from_reg2 = 32'h0000_0011;
				tb_from_reg3 = 32'h0000_0111;
				tb_from_reg4 = 32'h0000_1111;
				tb_from_reg5 = 32'h0001_1111;
				tb_from_reg6 = 32'h0011_1111;
				tb_from_reg7 = 32'h0111_1111;
		#5;	tb_Addr = 3'b000;
				
		#20;	tb_Addr = 3'b000;
		#20;	tb_Addr = 3'b001;
		#20;	tb_Addr = 3'b010;
		#20;	tb_Addr = 3'b011;
		#20;	tb_Addr = 3'b100;
		#20;	tb_Addr = 3'b101;
		#20;	tb_Addr = 3'b110;
		#20;	tb_Addr = 3'b111;
		#20;	$stop;
	end	
endmodule
