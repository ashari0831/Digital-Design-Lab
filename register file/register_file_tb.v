 `timescale 1ns/1ns
 `include "register_file.v"
 
 module register_file_tb;

 reg clk;
 reg [63:0] W;
 reg [4:0] R1, R2, RW;
 reg rw;
 wire [63:0] one, two;

register_file UUT(
    .r_19_15(R1),
    .r_24_10(R2),
    .r_11_7_w(RW),
    .clk(clk),
    .write_data(W),
    .read_data_one(one),
    .read_data_two(two),
    .regWr(rw)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("register_file_tb.vcd");
    $dumpvars(0, register_file_tb);
end

initial begin
      clk = 1;
      rw = 0;
      R1  = 5'd0;
      R2  = 5'd0;
      RW  = 5'd0;
      W   = 64'd0;
      
      #80 W   = 64'd2500;
      #2  RW  = 5'd2;
      #2  rw = 1;
      #30 rw = 0;
          W   = 64'd0;
          RW  = 5'd0;
      
      #80 W   = 64'd2555;
      #2  RW  = 5'd19;
      #2  rw = 1;
      #30 rw = 0;
          W   = 64'd0;
          RW  = 5'd0;
      
      #80 W   = 64'd2555;
      #2  RW  = 5'd31;
      #2  rw = 1;
      #30 rw = 0;
          W   = 64'd0;
          RW  = 5'd0;
 
      #80 R1  = 5'd31;
          R2  = 5'd19;
      #10 R1  = 5'd19;
          R2  = 5'd2;
      #30
    $finish;
    end

 endmodule