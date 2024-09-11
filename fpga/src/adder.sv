// Luke Summers lsummers@g.hmc.edu 9/10/24
// adds two four bit signals
module adder(
    input  logic [3:0] a, b,
    output logic [4:0] y
);
    assign y = a + b;
endmodule