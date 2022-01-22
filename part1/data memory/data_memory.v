

module data_memory (
     
    l, //   l is mem_write
    address, 
    clk, 
    q,
    write_data,
    mem_read
);

reg [63:0]r[0:63];
input l, clk;
input [5:0]address;
input [63:0] write_data;
input mem_read;
output [63:0][0:0]q;
integer i;

assign q = r[address];
always @(posedge clk)
if (l) r[address] <= write_data;

initial begin
    for (i = 0; i<2048; i++) begin
        r[i] = 64'd0;
    end
end


// always @(posedge clk) begin
//     if(l) begin
//         r[address] <= #3 write_data;
//     end
//     if(mem_read == 1'b1) begin
//         q <= r[address];
//     end
//     if(mem_read == 1'b0) begin
//         q <= 64'd0;
//     end
    
// end

endmodule