module tb_alu32();
	reg clk, reset;
	reg [31:0] tb_a, tb_b, result_expected;
	reg [2:0] tb_op;
	// expected cnzv
	reg c, n, z, v;
	
	// result of alu32
	wire [31:0] tb_result;
	wire tb_c, tb_n, tb_z, tb_v;
	
	reg [31:0] vectornum, errors; // bookkeeping variables
	reg [95:0] testvectors1[100:0]; // array of testvectors and expected_result; get hexadecimal num
	reg [6:0] testvectors2[100:0]; // array of opcode and cnzv; get binary num
	
	parameter STEP = 10;

	// instantiate device under test
	alu32 U0_alu32(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), 
		.c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v));

	// generate clock
	always 
	begin
		clk = 1; #(STEP/2); clk = 0; #(STEP/2);
	end

	// at start of test, load vectors and pulse reset
	initial
	begin
		$readmemh("testvectors1.tv", testvectors1);
		$readmemb("testvectors2.tv", testvectors2);
		vectornum = 0; errors = 0;
		reset = 1; #27; reset = 0;
	end

	// apply test vectors on rising edge of clk
	always @(posedge clk)
	begin
		#1; 	{tb_a, tb_b, result_expected} = testvectors1[vectornum];
				{tb_op, c, n, z, v} = testvectors2[vectornum];
	end
 
	// check results on falling edge of clk
	always @(negedge clk)
		if (~reset) // skip during reset
		begin 
			if ((tb_result !== result_expected) || ({c, n, z, v} !== {tb_c, tb_n, tb_z, tb_v})) 
			begin
				$display("Error: inputs = %h_%h", tb_a, tb_b);
				$display("	outputs = %h (%h expected), %b (%b expected)", tb_result, result_expected, {tb_c, tb_n, tb_z, tb_v}, {c, n, z, v});
				errors = errors + 1;
			end
 
			// increment array index and read next testvector
			vectornum = vectornum + 1;
			// end program when unexpected input
			if (testvectors2[vectornum] === 7'bx) 
			begin
				#5;
				$display("%d tests completed with %d errors", vectornum, errors);
				$finish;
			end
		end
endmodule
