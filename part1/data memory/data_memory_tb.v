`timescale 1ns/1ns
`include "data_memory.v"

module data_memory_tb;

reg clk;
reg l;
reg [63:0]write_data;
reg [63:0]address;
wire [63:0][0:0]q;
integer i;

data_memory UUT(
    .l(l),
    .address(address),
    .clk(clk),
    .q(q),
    .write_data(write_data)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("data_memory_tb.vcd");
    $dumpvars(0, data_memory_tb);
end

initial begin
    
    clk=1;

    l=1;  // if l == 1 then it writes the data in data memory
    write_data = 64'd1;
    address = 64'd0;
    #10;
    if(q != 64'd1)
        $display("Error occured in first test");
/////////////////

    l=0;
    write_data = 64'd2;
    address = 64'd0;
    //in this test, content of data memory is as same as before.
    #10;
    if(q != 64'd1)
        $display("Error occured in second test");


    l=1;
    write_data = 64'd100;
    address = 64'd12;
    #10;
    if(q != 64'd100)
        $display("Error occured in third test");

    
    l=0;
    write_data = 64'd125;
    address = 64'd111;
    #10;
    if(q != 64'd0)
        $display("Error occured in forth test");

    l=1;
    write_data = 64'd150;
    address = 64'd300;
    #10;
    if(q != 64'd150)
        $display("Error occured in fifth test");

    
    l=1;
    write_data = 64'd322;
    address = 64'd300;
    #10;
    if(q != 64'd322)
        $display("Error occured in sixth test");


    l=0;
    write_data = 64'd322;
    address = 64'd0;
    #10;
    if(q != 64'd1)
        $display("Error occured in sixth test");
    $finish;
end

endmodule