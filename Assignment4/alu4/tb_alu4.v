module tb_alu4();
	reg clk, reset;
	reg [3:0] tb_a, tb_b, result_expected;
	reg [2:0] tb_op;
	reg c, n, z, v;
	
	wire [3:0] tb_result;
	wire tb_c, tb_n, tb_z, tb_v;
	
	reg [31:0] vectornum, errors; // bookkeeping variables
	reg [18:0] testvectors[100:0]; // array of testvectors
	
	parameter STEP = 10;

	// instantiate device under test
	alu4 U0_alu4(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), 
		.c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));

	// generate clock
	always 
	begin
		clk = 1; #(STEP/2); clk = 0; #(STEP/2);
	end

	// at start of test, load vectors and pulse reset
	initial
	begin
		$readmemb("example.tv", testvectors);
		vectornum = 0; errors = 0;
		reset = 1; #27; reset = 0;
	end

	// apply test vectors on rising edge of clk
	always @(posedge clk)
	begin
		#1; {tb_a, tb_b, tb_op, result_expected, c, n, z, v} = testvectors[vectornum];
	end
 
	// check results on falling edge of clk
	always @(negedge clk)
		if (~reset) // skip during reset
		begin 
			if (tb_result !== result_expected) 
			begin
				$display("Error: inputs = %b_%b", tb_a, tb_b);
				$display("	outputs = %b (%b expected)", tb_result, result_expected);
				errors = errors + 1;
			end
 
			// increment array index and read next testvector
			vectornum = vectornum + 1;
			// end program when unexpected input
			if (testvectors[vectornum] === 19'bx) 
			begin
				$display("%d tests completed with %d errors", vectornum, errors);
				$finish;
			end
		end
endmodule
