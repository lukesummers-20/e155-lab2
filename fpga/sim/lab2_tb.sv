module tb();
    logic clk, reset;

    logic [6:0] sevSegOut, sevSegOutExpected;
    logic [3:0] s1, s2;

    logic [13:0] testvectors[15:0];
    logic [4:0] vecNum, errors;

    lab1 dut(s, reset, sevSegOut, ledOut);

    initial begin
        $readmemb("lab2_tv.tv", testvectors);
        vecNum = 0;
        errors = 0;
        reset = 1;
        #20;
        reset = 0;
    end
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    always @(posedge clk) begin
        #1; {s, ledOutExpected, sevSegOutExpected} = testvectors[vecNum];
    end
    always @(negedge clk) begin
        vecNum = vecNum + 1;
        if (ledOut[1:0] != ledOutExpected) begin
            $display(" ledOut = %b ledOutExpected = %b with s = %b", ledOut[1:0], ledOutExpected, s);
            errors = errors + 1;
        end if (sevSegOut != sevSegOutExpected) begin
            $display(" sevSegOut = %b sevSegOutExpected = %b with s = %b", sevSegOut, sevSegOutExpected, s);
            errors = errors + 1;
        end if (vecNum > 15) begin
            $display("test completed with %d errors", errors);
            $stop;
        end
    end


endmodule