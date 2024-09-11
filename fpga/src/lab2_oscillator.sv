// Luke Summers lsummers@g.hmc.edu 9/10/24
// oscillating signal producing module
module lab2_oscillator(
    input  logic reset,
    output logic oscOut
);
    logic intOsc;
    logic [25:0] counter;

    // Internal high-speed oscillator
    HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(intOsc));

    always_ff @(posedge intOsc)
        if (reset == 0) begin
            counter <= 0;
            oscOut <= 0;
        end else if (counter == 100000) begin
            oscOut <= ~oscOut;
            counter <= 0;
        end else counter <= counter + 1;
endmodule