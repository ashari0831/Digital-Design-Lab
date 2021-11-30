`timescale 1ns/1ns
`include "adder.v"

module adder_tb;

integer i;

//instruction memory credentials
reg clk;
reg [31:0][0:31]r_insMem;
reg l_insMem;
reg e_insMem;
reg [31:0]address_insMem;
wire [31:0][0:0]q_insMem;

//register credentials
reg [31:0]r_reg;
reg l_reg;
reg e_reg;
reg w_reg;
wire [31:0]q_reg;

//adder credentials
reg carryin;
reg [31:0]x;
reg [31:0]y;
wire [31:0]s;
wire carryout;
wire overflow;


insMem_reg_adder UUT ( 
    .r_insMem(r_insMem),
    .l_insMem(l_insMem),
    .address_insMem(address_insMem),
    .clk(clk),
    .q_insMem(q_insMem),
    .e_insMem(e_insMem),
    .r_reg(r_reg), 
    .l_reg(l_reg), 
    .e_reg(e_reg), 
    .w_reg(w_reg), 
    .q_reg(q_reg), 
    .carryin(carryin), 
    .sum(s), 
    .carryout(carryout), 
    .overflow(overflow)
    );




initial begin
    $dumpfile("adder_tb.vcd");
    $dumpvars(0, adder_tb);

    e_insMem = 1;
    e_reg = 1;
    clk = 1;
    l_insMem = 1;
    l_reg = 1;

    address_insMem = 0;
    r_insMem[0] = 32'b00001111000011110000111100001110;
    r_insMem[1] = 32'b00001100000011000000110000001100;
    for (i = 30; i>1; i--) begin
        r_insMem[i] = 32'b10000000000000000000000000000000;
    end
        r_insMem[31] = 32'b11111100000011000000110000001100;


    r_reg[0] = 1;
    r_reg[1] = 0;
    r_reg[2] = 1;
    for (i = 3; i<32; i++) begin
        r_reg[i] = 0;
    end
    #100;

    carryin = 0;
    x = q_insMem;
    y = q_reg;
    #100;

    $display("sum: %b", s);
    $display("carryout: %b", carryout);
    $display("overflow: %b", overflow);
end

endmodule