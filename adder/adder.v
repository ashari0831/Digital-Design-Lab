module addern (carryin, X, Y, S, carryout, overflow);
parameter m = 32;
input carryin;
input [m - 1:0] X, Y;
output reg [m - 1:0] S;
output reg carryout, overflow;
always @(X, Y, carryin)
begin
{carryout, S} = X + Y + carryin;
overflow = (X[m- 1] & Y[m- 1] & S[m- 1]) | ( X[m- 1] & Y[m- 1] & S[m- 1]);
end
endmodule


module insMem (
    r, 
    l, 
    address, 
    clk, 
    q,
    e
);

    input wire [31:0][0:31]r;
    input l, clk, e;
    input [31:0]address;
    output reg [31:0][0:0]q;

    

    always @(posedge clk) begin
        if (e) begin
          if(l)
            q <= r[address];  
        end
        
        
    end
    
endmodule



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

module insMem_reg_adder (
    r_insMem,
    l_insMem,
    address_insMem,
    clk,
    q_insMem,
    e_insMem,
    r_reg, l_reg, e_reg, w_reg, q_reg, carryin, sum, carryout, overflow
);

    input wire [31:0][0:31]r_insMem;
    input l_insMem, clk, e_insMem;
    input [31:0]address_insMem;
    inout [31:0][0:0]q_insMem;

    parameter p = 32;
    input [p-1:0]r_reg;
    input l_reg, e_reg, w_reg;
    inout [p-1:0]q_reg;

    parameter n = 32;
    input carryin;
    output [n- 1:0] sum;
    output carryout, overflow;

    insMem im(r_insMem,l_insMem,address_insMem,clk,q_insMem,e_insMem);
    register regis(r_reg, l_reg, e_reg, w_reg, clk, q_reg);
    addern adder(carryin, q_insMem, q_reg, sum, carryout, overflow);
endmodule