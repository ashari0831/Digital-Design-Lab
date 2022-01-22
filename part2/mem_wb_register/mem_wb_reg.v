module mem_wb_reg (
    r, l, clk, q, reset
);
    parameter n = 135;
    input [n-1:0]r;
    input l, clk, reset;
    output reg [n-1:0]q;
    integer k;

    always @(posedge clk) begin
        if(reset)
            q <= 135'd0;
        if(l)
            q <= r;
        
    end
endmodule