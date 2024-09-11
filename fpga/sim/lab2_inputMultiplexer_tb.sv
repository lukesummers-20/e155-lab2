module lab2_inputMultiplexer_tb();
    logic [3:0] s1, s2;
    logic [3:0] sevSegInput, sevSegInputExpected;
    logic en1, en1Expected;
    logic en2, en2Expected;
    logic clk, reset;

    inputMultiplexer dut(reset, clk, s1, s2, en1, en2, sevSegInput);
    initial begin
        clk = 0;
	reset = 0;
	s1 = 4'b1111;
	s2 = 4'b1010;
	sevSegInputExpected = 4'b1111;
	en1Expected = 1;
	en2Expected = 0;
	#10;
	clk  = 1;
	#10;
	if (sevSegInput != sevSegInputExpected) begin
            $display(" sevSegInput = %b sevSegInputExpected = %b with s1 = %b and s2 = %b", sevSegInput, sevSegInputExpected, s1, s2);
        end if (en1 != en1Expected) begin
            $display(" en1 = %b en1Expected = %b with s1 = %b and s2 = %b", en1, en1Expected, s1, s2);
        end if (en2 != en2Expected) begin
            $display(" en2 = %b en2Expected = %b with s1 = %b and s2 = %b", en2, en2Expected, s1, s2);
        end
	clk = 0;
	reset = 1; 
	s1 = 4'b0110;
	s2 = 4'b1001;
	en1Expected = 0;
	en2Expected = 1;
	sevSegInputExpected = 4'b1001;
	#10;
	clk = 1;
	#10;
	if (sevSegInput != sevSegInputExpected) begin
            $display(" sevSegInput = %b sevSegInputExpected = %b with s1 = %b and s2 = %b", sevSegInput, sevSegInputExpected, s1, s2);
        end if (en1 != en1Expected) begin
            $display(" en1 = %b en1Expected = %b with s1 = %b and s2 = %b", en1, en1Expected, s1, s2);
        end if (en2 != en2Expected) begin
            $display(" en2 = %b en2Expected = %b with s1 = %b and s2 = %b", en2, en2Expected, s1, s2);
        end
	clk = 0; 
	s1 = 4'b1100;
	s2 = 4'b0011;
	en1Expected = 1;
	en2Expected = 0;
	sevSegInputExpected = 4'b1100;
	#10;
	clk = 1;
	#10;
	if (sevSegInput != sevSegInputExpected) begin
            $display(" sevSegInput = %b sevSegInputExpected = %b with s1 = %b and s2 = %b", sevSegInput, sevSegInputExpected, s1, s2);
        end if (en1 != en1Expected) begin
            $display(" en1 = %b en1Expected = %b with s1 = %b and s2 = %b", en1, en1Expected, s1, s2);
        end if (en2 != en2Expected) begin
            $display(" en2 = %b en2Expected = %b with s1 = %b and s2 = %b", en2, en2Expected, s1, s2);
        end
    end
endmodule