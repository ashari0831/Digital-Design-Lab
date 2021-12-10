

module register_file (
    r_19_15, r_24_10, r_11_7_w, write_data, read_data_one, read_data_two, clk, regWr
);
input [4:0] r_19_15, r_24_10, r_11_7_w;
input [63:0] write_data;
input clk;
input regWr;
output [63:0] read_data_one;
output [63:0] read_data_two;

reg [63:0] registers [31:0];

assign #2 read_data_one = registers[r_19_15];
assign #2 read_data_two = registers[r_24_10];

always @(posedge clk) begin
    if(regWr)
        registers[r_11_7_w] <= #3 write_data;
        
end
    
endmodule