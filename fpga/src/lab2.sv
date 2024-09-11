// Luke Summers lsummers@g.hmc.edu 9/10/24
// takes two four bit inputs and displays both on a seven segment display and calculates their sum
module lab2(
    input  logic [3:0] s1, s2,
    input  logic reset,
    output logic en1, en2,
    output logic [6:0] sevSegOut,
    output logic [4:0] sum
);
    logic clk;
    lab2_oscillator oscillator(reset, clk);

    adder add(s1, s2, sum);

    logic [3:0] sevSegInput;
    inputMultiplexer inLogic(reset, clk, s1, s2, en1, en2, sevSegInput);

    sevSegLogic outputLogic(sevSegInput, sevSegOut);
endmodule