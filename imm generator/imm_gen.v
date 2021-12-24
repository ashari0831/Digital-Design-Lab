
// module adder_testbench;
//    reg reset_; initial begin reset_=0; #22 reset_=1; #600; $stop; end
//    reg clock;  initial clock<=0;   always #5 clock<=(!clock);
//    reg [31:0] IR;
//    wire [31:0] immOut = IMMGEN.immOut;
//    initial begin
//       wait(reset_==1);
//       @(posedge clock); IR = 32'hFFD08013;  // addi x0, x1, -3
//       @(posedge clock); IR = 32'h00012423;  // SW   x0, 8(x2)
//       @(posedge clock); IR = 32'h00028017;  // auipc x0, 40
//       @(posedge clock); IR = 32'h01022003;  // lw x0, 16(x4)
//       @(posedge clock); IR = 32'h004000EF;  // jal
//       @(posedge clock); IR = 32'h00100863;  // beq
//       @(posedge clock); IR = 32'h00104263;  // blt
//       #20
//       $finish;
//    end
//    immGenerator IMMGEN(IR, immOut);
// endmodule

module immGenerator(instruction, immOut);
   input [31:0] instruction;
   output[63:0] immOut;
   reg[63:0] IMM_OUT;
   wire[6:0] opcode;
   wire[2:0] funct3;

   assign immOut = IMM_OUT;
   assign opcode = instruction[6:0];
   assign funct3 = instruction[14:12];
   always @(instruction) #0.1
   casex(opcode)
        7'b0100011: IMM_OUT <= { {52{instruction[31]}}, instruction[11:5], instruction[4:0]};     // SW       
        7'b0000011: IMM_OUT <= { {52{instruction[31]}}, instruction[11:0]};   // LW      
        7'b1100011: IMM_OUT <= { {52{instruction[31]}}, instruction[12], instruction[10:5], instruction[4:1], instruction[11]};  // BEQ
        default: IMM_OUT <= 32'bx;
    endcase
endmodule