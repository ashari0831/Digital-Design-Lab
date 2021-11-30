module register (
    r, l, e, w, clk, q
);
    parameter n = 32;
    input [n-1:0]r;
    input l, e, w, clk;
    output reg [n-1:0]q;
    integer k;

    always @(posedge clk) begin
        if(l)
            q <= r;
        else if(e)
        begin
            q[n-1] <= w;
            for (k = n-2; k >= 0; k=k-1) begin
                q[k] <= q[k+1];
            end
        end
    end
endmodule