// Luke Summers lsummers@g.hmc.edu 9/10/24
// testbench for adder module
module lab2_adder_tb();
    logic [3:0] a, b;
    logic [4:0] y, yExpected;
    adder dut(a, b, y);

    initial begin 
        a = 4'b1111;
        b = 4'b1111;
        yExpected = 5'b11110;
        #10;
        if (y != yExpected) begin
            $display(" y = %b yExpected = %b with a = %b and b = %b", y, yExpected, a, b);
        end
        a = 4'b0110;
        b = 4'b1111;
        yExpected = 5'b10101;
        #10;
        if (y != yExpected) begin
            $display(" y = %b yExpected = %b with a = %b and b = %b", y, yExpected, a, b);
        end
        a = 4'b0111;
        b = 4'b1001;
        yExpected = 5'b10000;
        #10;
        if (y != yExpected) begin
            $display(" y = %b yExpected = %b with a = %b and b = %b", y, yExpected, a, b);
        end
    end
endmodule