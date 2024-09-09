module 4adder(
    input  logic [3:0] a, b,
    output logic [5:0] y
);
    assign y = a + b;
endmodule