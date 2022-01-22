module register (
    r, l, clk, q, reset
);
    parameter n = 64;
    input [n-1:0]r;
    input l, clk, reset;
    output reg [n-1:0]q;
    integer k;

    always @(posedge clk) begin
        if(reset)
            q <= 64'd0;
        if(l)
            q <= r;
        // else if(e)
        // begin
        //     q[n-1] <= w;
        //     for (k = n-2; k >= 0; k=k-1) begin
        //         q[k] <= q[k+1];
        //     end
        // end
    end
endmodule