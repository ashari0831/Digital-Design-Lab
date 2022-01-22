`timescale 1ns/1ns
`include "insMem.v"

module insMem_tb;
reg clk;
reg l;
reg [31:0]address;
wire [31:0][0:0]q;
integer i;


insMem UUT (
    .l(l),
    .address(address),
    .q(q)
    );

initial begin
    $dumpfile("insMem_tb.vcd");
    $dumpvars(0, insMem_tb);

    l=1;
    address = 0;

    #10;
    if(q != 32'd30)
        $display("Error occured in first test");
    ///////////////////

        clk=0;
        l=1;
    #10;
    if(q != 32'd30)
        $display("Error occured in second test");
    ///////////////////

    l=0;
    address = 1;
    #10;
    if(q != 32'd30)
        $display("Error occured in third test");
    ///////////////////

    
end

endmodule