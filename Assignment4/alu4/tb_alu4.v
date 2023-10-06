module tb_alu4();
	reg clk;
	reg [3:0] tb_a, tb_b;
	reg [2:0] tb_op;
	
	wire [3:0] tb_result;
	wire tb_c, tb_n, tb_z, tb_v;
	
	reg [31:0] vectornum, errors; // bookkeeping variables
	reg [3:0] testvectors[10000:0]; // array of testvectors
	
	parameter STEP = 10;

	// instantiate device under test
	alu4 U0_alu4(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), 
		.c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));

	// generate clock
	always #(STEP/2) clk = ~clk;

	// at start of test, load vectors
	// and pulse reset
	initial
	begin
		$readmemb("example.txt", testvectors);
		vectornum = 0; errors = 0;
		reset = 1; #27; reset = 0;
	end

	// apply test vectors on rising edge of clk
	always @(posedge clk)
	begin
		#1; {a, b, c, yexpected} =	testvectors[vectornum];
	end
	
	// apply test vectors on rising edge of clk
	always @(posedge clk) #1; {a, b, c, yexpected} =	testvectors[vectornum];
 
	// increment array index and read next testvector
	vectornum = vectornum + 1;
	if (testvectors[vectornum] === 4'bx) begin
		$display("%d tests completed with %d errors", vectornum, errors);
		$finish;
	end
endmodule
