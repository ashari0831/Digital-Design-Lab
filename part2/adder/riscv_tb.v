`timescale 1ns/1ns
`include "clk.v"

module riscv;

parameter delay = 100;

wire clk;
clock(clk);

initial begin
    $dumpfile("riscv_tb.vcd");
    $dumpvars(0, riscv);
    #300;
end
    
endmodule