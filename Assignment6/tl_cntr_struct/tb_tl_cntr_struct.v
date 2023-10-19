`timescale 1ns/100ps

module tb_tl_cntr_struct;
	reg tb_clk,tb_reset_n,tb_Ta,tb_Tb;
	wire[1:0] tb_La,tb_Lb;
	
	tl_cntr_struct test(.clk(tb_clk),.reset_n(tb_reset_n),.Ta(tb_Ta),.Tb(tb_Tb),.La(tb_La),.Lb(tb_Lb));
	
	always
		begin
			tb_clk = 1; #5;		//clk cycle
			tb_clk = 0;  #5;
		end
	
	// Stimulus generation
  initial 
  begin
    // Initialize inputs
    tb_clk = 0;
    tb_reset_n = 0;
    tb_Ta = 0;
    tb_Tb = 0;
    
    // Apply reset
    tb_reset_n = 0;
    #10;	tb_reset_n = 1;
    
    // Test case 1
    #10;	tb_Ta = 1;
    #10;	tb_Tb = 1;
    
    // Test case 2
    #10;	tb_Ta = 1;
    #10;	tb_Tb = 0;
    
    // Test case 3
    #10;	tb_Ta = 0;
    #10;	tb_Tb = 1;
    
    // Test case 4
    #10;	tb_Ta = 0;
    #10;	tb_Tb = 0;
    
    // Finish simulation
    #10;	$stop;
  end
endmodule
