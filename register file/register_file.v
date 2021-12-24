

module register_file (
    r_19_15, r_24_20, r_11_7_w, write_data, read_data_one, read_data_two, clk, regWr
);
input [4:0] r_19_15, r_24_20, r_11_7_w;
input [63:0] write_data;
input clk;
input regWr;
output reg[63:0] read_data_one;
output reg[63:0] read_data_two;
integer i;

reg [63:0]registers[0:63];

always @(negedge clk) if (regWr == 1) registers[r_11_7_w] <= write_data;
always @(r_19_15) read_data_one <= (r_19_15 != 0) ? registers[r_19_15] : 0;
always @(r_24_20) read_data_two <= (r_24_20 != 0) ? registers[r_24_20] : 0;

initial begin
    for (i = 0; i<2048; i++) begin
        registers[i] = 64'd0;
    end
end



// always @(posedge clk) begin
//     if(regWr) begin
//         registers[r_11_7_w] <= write_data;
//     end
      
// end

// assign read_data_one = registers[r_19_15];
// assign read_data_two = registers[r_24_20];


    
endmodule

