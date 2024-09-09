module inputMultiplexer(
input reset, clk,
input [3:0] s1, s2,
output logic en1, en2,
output logic [3:0] sevSegInput
);
    logic en1, en2;


    logic [3:0] logicInput;

    logic [7:0] fullInput;
    assign fullInput = s1 + s2;

    always_ff @(posedge clk) begin
        if (reset == 0) begin
            en1 <= 1;
            en2 <= 0;
            logicInput <= fullInput[3:0];
        end else begin
            if (en1) logicInput <= fullInput[3:0];
            else logicInput <= fullInput[7:4];
            en1 <= ~en1;
            en2 <= ~en2;
        end
    end
endmodule