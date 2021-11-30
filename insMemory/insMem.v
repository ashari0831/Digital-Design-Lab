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