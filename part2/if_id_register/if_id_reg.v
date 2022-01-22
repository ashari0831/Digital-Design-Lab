module if_id_reg (
    r, l, clk, q, reset
);
    parameter n = 96;
    input [n-1:0]r;
    input l, clk, reset;
    output reg [n-1:0]q;
    integer k;

    always @(posedge clk) begin
        if(reset)
            q <= 96'd0;
        if(l)
            q <= r;

    end
endmodule