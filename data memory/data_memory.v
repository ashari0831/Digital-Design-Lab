

module data_memory (
     
    l, 
    address, 
    clk, 
    q,
    write_data
);

reg [63:0][0:31]r;
input l, clk;
input [63:0]address;
input [63:0] write_data;
output [63:0][0:0]q;

assign #2 q = r[address];

always @(posedge clk) begin
    if(l) begin
        r[address] <= #3 write_data;
    end
    
end

endmodule