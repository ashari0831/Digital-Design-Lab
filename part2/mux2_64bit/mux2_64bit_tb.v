`timescale 1ns/1ns
`include "mux2_64bit.v"

module mux2_64bit_tb;

reg [127:0]w;
reg s;
wire [0:63]f;
integer i;

mux2_64bit UUT (.w(w), .s(s), .f(f));

initial begin
    $dumpfile("mux2_64bit_tb.vcd");
    $dumpvars(0, mux2_64bit_tb);

    for ( i=0 ; i<128; i++) begin
        w[i] = 0;
    end
    s=0;
    #10;
    for (i = 0 ; i<64; i++) begin
        if(f[i] != 0)
            $display("test failed");;
    end
      
    s=1;
    #10;

      
    for (i = 0 ; i<64; i++) begin
        if(f[i] != 0)
            $display("test failed");;
    end
w[0] = 1;
    for ( i=1 ; i<128; i++) begin
        w[i] = 0;
    end
    s=0;
    #10;

      
    
    
    if(f[63] != 1)
        $display("test failed1");
    for (i = 62 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed1.1");
    end
    s=1;
    #10;
      
    if(f[0] != 0)
        $display("test failed2");
    for (i = 1 ; i<64; i++) begin
        if(f[i] != 0)
            $display("test failed2.2");
    end
    w[0] = 0;
    w[1] = 1;
    for ( i=2 ; i<128; i++) begin
        w[i] = 0;
    end
    s=0;
    #10;


    
    if(f[63] != 0)
        $display("test failed");
    for (i = 62 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    s=1;
    #10;
    
    if(f[63] != 1)
        $display("test failed");
    for (i = 62 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    w[0] = 1;
    w[1] = 1;
    for ( i=2 ; i<128; i++) begin
        w[i] = 0;
    end
    s=0;
    #10;


    
    if(f[63] != 1)
        $display("test failed");
    for (i = 62 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    s=1;
    #10;
    
    if(f[63] != 1)
        $display("test failed");
    for (i = 62 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    w[0] = 0;
    w[1] = 0;
    w[2] = 1;
    for ( i=3 ; i<128; i++) begin
        w[i] = 0;
    end
    s=0;
    #10;


    
    if(f[63] != 0)
        $display("test failed");
    if(f[62] != 1)
        $display("test failed");
    for (i = 61 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    s=1;
    #10;
    
    if(f[63] != 0)
        $display("test failed");
    if(f[62] != 0)
        $display("test failed");
    for (i = 61 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    w[0] = 0;
    w[1] = 1;
    w[2] = 1;
    for ( i=3 ; i<128; i++) begin
        w[i] = 0;
    end
    s=0;
    #10;


    
    if(f[63] != 0)
        $display("test failed");
    if(f[62] != 1)
        $display("test failed");
    for (i = 61 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    s=1;
    #10;
    
    if(f[63] != 1)
        $display("test failed");
    if(f[62] != 0)
        $display("test failed");
    for (i = 61 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    w[0] = 1;
    w[1] = 0;
    w[2] = 1;
    for ( i=3 ; i<128; i++) begin
        w[i] = 0;
    end
    s=0;
    #10;


    
    if(f[63] != 1)
        $display("test failed");
    if(f[62] != 1)
        $display("test failed");
    for (i = 61 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    s=1;
    #10;
    
    if(f[63] != 0)
        $display("test failed");
    if(f[62] != 0)
        $display("test failed");
    for (i = 61 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    w[0] = 1;
    w[1] = 1;
    w[2] = 1;
    for ( i=3 ; i<128; i++) begin
        w[i] = 0;
    end
    s=0;
    #10;


    
    if(f[63] != 1)
        $display("test failed");
    if(f[62] != 1)
        $display("test failed");
    for (i = 61 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    s=1;
    #10;
    
    if(f[63] != 1)
        $display("test failed");
    if(f[62] != 0)
        $display("test failed");
    for (i = 61 ; i>=0; i--) begin
        if(f[i] != 0)
            $display("test failed");
    end
    #10;

    $display("test completed");
end

endmodule