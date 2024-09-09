module inputMultiplexer(
    input reset, clk,
        input [3:0] s1, s2,
    output logic en1, en2,
    output logic [3:0] sevSegInput
);
    assign en2 = ~en1;
    always_ff @(posedge clk) begin
        if (reset == 0) begin
            en1 <= 0;
            sevSegInput = s1;
        end else begin
            if (en1) sevSegInput = s2;
            else sevSegInput = s1;
            en1 <= ~en1;
        end
    end
endmodule