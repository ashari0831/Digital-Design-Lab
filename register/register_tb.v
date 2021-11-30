`timescale 1ns/1ns
`include "register.v"

module register_tb;
reg clk;
reg [31:0]r;
reg l;
reg e;
reg w;
wire [31:0]q;
integer i;


register UUT ( .r(r), .l(l), .e(e), .w(w), .clk(clk), .q(q));

initial begin
    $dumpfile("register_tb.vcd");
    $dumpvars(0, register_tb);

    clk = 1;
    

    w=0;
    e=1;
    l=1;
    r[0] = 1;
    r[1] = 0;
    r[2] = 1;
    for (i = 3; i<32; i++) begin
        r[i] = 0;
    end
    #10;
    

    clk = 0;
    #10;

    if (r[0] != 1) begin
        $display("error while testing");
    end
    if (r[1] != 0) begin
        $display("error while testing");
    end
    if (r[2] != 1) begin
        $display("error while testing");
    end
    for (i = 3; i<32; i++) begin
        if (r[i] != 0) begin
            $display("error while testing");
        end
    end


    clk = 1;
    w=0;
    e=1;
    l=0;
    r[0] = 1;
    r[1] = 0;
    r[2] = 1;
    for (i = 3; i<32; i++) begin
        r[i] = 0;
    end
    #10;

    clk = 0;
    #10;

    if (r[0] != 1) begin
        $display("error while testing");
    end
    if (r[1] != 0) begin
        $display("error while testing");
    end
    if (r[2] != 1) begin
        $display("error while testing");
    end
    for (i = 3; i<32; i++) begin
        if (r[i] != 0) begin
            $display("error while testing");
        end
    end


end


endmodule