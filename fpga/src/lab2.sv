module lab2(
    input  logic [3:0] s1, s2,
    input  logic reset,
    output logic en1, en2,
    output logic [6:0] sevSegOut
);
    logic clk;
    lab2_oscillator oscillator(reset, clk);

    logic [5:0] sum;
    4adder adder(s1, s2, sum);

    logic [3:0] sevSegInput;
    inputMultiplexer inLogic(reset, clk, s1, s2, en1, en2, sevSegInput);

    sevSegLogic outputLogic(sevSegInput, sevSegOut);
endmodule