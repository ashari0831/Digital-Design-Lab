module id_ex_reg (
    r, l, clk, q, reset
);
    parameter n = 279;
    input [n-1:0]r;
    input l, clk, reset;
    output reg [n-1:0]q;
    integer k;

    always @(posedge clk) begin
        if(reset)
            q <= 279'd0;
        if(l)
            q <= r;
        
    end
endmodule