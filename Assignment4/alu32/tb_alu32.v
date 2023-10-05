`timescale 1ns/1ps

module tb_alu32;
    reg [31:0] a, b;
    reg [2:0] op;
    wire [31:0] result;
    wire c, n, z, v;
    
    alu32 uut(.a(a), .b(b), .op(op), .result(result), .c(c), .n(n), .z(z), .v(v));

    initial 
	 begin
        // Test case 1
        a = 32'h11111111;
        b = 32'h11111111;
        op = 3'b110; // Example operation
        #10; // Wait for a few simulation steps
        // Check the expected results using $display or assertions

        // Test case 2
        // ...
        // Add more test cases as needed
        
        $stop;
    end
endmodule
