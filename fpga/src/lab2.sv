

module lab2(
input  logic [3:0] s1, s2,
output logic en1, en2,
output logic sevSegOut[6:0]
);
logic clk;
lab2_oscillator oscillator(reset, clk);

logic [3:0] sevSegInput;
inputMultiplexer inLogic(reset, clk, s1, s2, en1, en2, sevSegInput);

sevSegLogic(sevSegInput, sevSegOut);
endmodule