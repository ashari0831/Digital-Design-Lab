module Control_Unit(
      input[6:0] opcode,
      output reg[1:0] alu_op,
      output reg mem_read,mem_write,alu_src,branch,mem_to_reg,reg_write   
    );


always @(*)
begin
 case(opcode) 
 7'b0000011:  // LW
   begin
    branch = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'b1;
    reg_write = 1'b1;
    mem_read = 1'b1;
    mem_write = 1'b0;
    alu_op = 2'b00;
   end
 7'b0100011:  // SW
   begin
    branch = 1'b0;
    alu_src = 1'b1;
    mem_to_reg = 1'bx;
    reg_write = 1'b0;
    mem_read = 1'b0;
    mem_write = 1'b1;
    alu_op = 2'b00;
   end
 7'b1100011:  // beq
   begin
    branch = 1'b1;
    alu_src = 1'b0;
    mem_to_reg = 1'bx;
    reg_write = 1'b0;
    mem_read = 1'b0;
    mem_write = 1'b0;
    alu_op = 2'b01;
   end
 7'b0110011:  // R-form
   begin
    branch = 1'b0;
    alu_src = 1'b0;
    mem_to_reg = 1'b0;
    reg_write = 1'b1;
    mem_read = 1'b0;
    mem_write = 1'b0;
    alu_op = 2'b10;
   end

 endcase
 end

endmodule