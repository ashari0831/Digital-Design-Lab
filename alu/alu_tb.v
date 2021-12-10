`timescale 1ns/1ns
`include "alu.v"

module alu_tb;

parameter n = 64;
reg operand1, operand2;
reg [3:0] operation;
wire [n - 1:0] result;
wire zero;

alu UUT(
    .operand1(operand1),
    .operand2(operand2),
    .operation(operation),
    .res(result),
    .zero(zero)
);

initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);
end

initial begin
    operand1 = 0;
    operand2 = 1;
    operation = 4'b0000;
    #10;
    
    operand1 = 0;
    operand2 = 0;
    operation = 4'b0001;
    #10;

    operand1 = 0;
    operand2 = 1;
    operation = 4'b0010;
    #10;

    operand1 = 0;
    operand2 = 1;
    operation = 4'b0110;
    #10;

    operand1 = 1;
    operand2 = 1;
    operation = 4'b0010;
    #10;

    $finish;
end

endmodule

