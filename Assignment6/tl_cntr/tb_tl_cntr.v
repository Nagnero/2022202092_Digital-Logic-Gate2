`timescale 1ns/100ps
module tb_tl_cntr;
  reg clk, reset_n, Ta, Tb;
  wire [1:0] La, Lb;
  
  // Instantiate the module
  tl_cntr uut (
    .clk(clk),
    .reset_n(reset_n),
    .Ta(Ta),
    .Tb(Tb),
    .La(La),
    .Lb(Lb)
  );
  
  // Clock generation
  always begin
    #5 clk = ~clk;
  end
  
  // Stimulus generation
  initial begin
    // Initialize inputs
    clk = 0;
    reset_n = 0;
    Ta = 0;
    Tb = 0;
    
    // Apply reset
    reset_n = 0;
    #10 reset_n = 1;
    
    // Test case 1
    #10 Ta = 1;
    #10 Tb = 1;
    
    // Test case 2
    #10 Ta = 1;
    #10 Tb = 0;
    
    // Test case 3
    #10 Ta = 0;
    #10 Tb = 1;
    
    // Test case 4
    #10 Ta = 0;
    #10 Tb = 0;
    
    // Finish simulation
    $stop;
  end
endmodule
