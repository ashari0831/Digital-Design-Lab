`timescale 1ns/1ns
`include "dec4_16.v"

module dec4_16_tb;
reg En;
reg [3:0]W;
wire [0:15]Y;
integer i;
integer bit_value_one_loc = 2;
reg clk;

dec4to16 UUT (.W(W),  .Y(Y), .En(En));

// initial begin
//     $dumpfile("dec4_16_tb.vcd");
//     $dumpvars(0, dec4_16_tb);


// end

initial begin
    $dumpfile("dec4_16_tb.vcd");
    $dumpvars(0, dec4_16_tb);

    En=0;
    W[0] = 0;
    W[1] = 0;
    W[2] = 0;
    W[3] = 0;
    #10;  
                for (i = 0;i < 1 ; i++) begin
                    if(Y[i] != 0)
                        $display("test failed 1");
                end
    for (i = 0;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed -1");
    end
    

    En=1;
    W[3] = 0;
    W[2] = 0;
    W[1] = 0;
    W[0] = 0;
      #10;
                
    if(Y[i] != 1)
        $display("test failed 1");
               
    if(Y[0] != 1)
        $display("test failed 0");
    for (i = 1;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed 0.1");
    end
    

    En=1;
    W[3]=0;
    W[2]=0;
    W[1]=0;
    W[0]=1;
    #10;
      
                
    if(Y[0] != 0)
        $display("test failed 1");
                
    if(Y[1] != 1)
        $display("test failed 1.1");
    for (i = 2;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed 1.2");
    end
    

    bit_value_one_loc = 2;

    En=1;
    W[0]=0;
    W[1]=1;
    W[2]=0;
    W[3]=0;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed 2");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed 2.1");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed 2.2");
    end
    
    bit_value_one_loc += 1;


    En=1;
    W[0]=1;
    W[1]=1;
    W[2]=0;
    W[3]=0;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed3");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=0;
    W[1]=0;
    W[2]=1;
    W[3]=0;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed4");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=1;
    W[1]=0;
    W[2]=1;
    W[3]=0;
      
    for (i = 0;i < bit_value_one_loc-1 ; i++) begin
        if(Y[i] != 0)
            $display("test failed5");
    end
    if(Y[bit_value_one_loc-1] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=0;
    W[1]=1;
    W[2]=1;
    W[3]=0;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed6");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=1;
    W[1]=1;
    W[2]=1;
    W[3]=0;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed7");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=0;
    W[1]=0;
    W[2]=0;
    W[3]=1;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed8");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=1;
    W[1]=0;
    W[2]=0;
    W[3]=1;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed9");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=0;
    W[1]=1;
    W[2]=0;
    W[3]=1;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed10");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=1;
    W[1]=1;
    W[2]=0;
    W[3]=1;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed11");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=0;
    W[1]=0;
    W[2]=1;
    W[3]=1;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed12");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=1;
    W[1]=0;
    W[2]=1;
    W[3]=1;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed 13");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed 13.1");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed 13.2");
    end
    #10;
    bit_value_one_loc += 1;

    En=1;
    W[0]=0;
    W[1]=1;
    W[2]=1;
    W[3]=1;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("test failed 14");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed 14.1");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed 14.2");
    end
    #10;
    bit_value_one_loc += 1;
    En=1;
    W[0]=1;
    W[1]=1;
    W[2]=1;
    W[3]=1;
    #10;
      
    for (i = 0;i < bit_value_one_loc ; i++) begin
        if(Y[i] != 0)
            $display("failed15");
    end
    if(Y[bit_value_one_loc] != 1)
        $display("test failed 15.1");
    for (i = bit_value_one_loc+1 ;i < 16 ; i++) begin
        if(Y[i] != 0)
            $display("test failed 15.2");
    end
    #10;
    $display("test complete");
   
end

endmodule

