`include "./PC/register.v"
`include "./insMemory/insMem.v"
`include "./adder/adder.v"
`include "./mux2_64bit/mux2_64bit.v"
`include "./register file/register_file.v"
`include "./alu/alu.v"
`include "./data memory/data_memory.v"
`include "./control unit/control_unit.v"
`include "./alu control/alu_control.v"
`include "./imm generator/imm_gen.v"

module riscv;

    reg clk;
    wire [63:0]new_pc;
    reg pc_write, pc_reset;
    wire [63:0] old_pc;
    wire [31:0]instruction;
    wire [63:0]pc_plus_4;
    wire [63:0]write_data;
    wire [63:0]read_data_one;
    wire [63:0]read_data_two;
    wire [63:0] alu_in;
    wire [63:0] alu_result;
    wire zero;
    wire [63:0] data_from_data_mem;
    wire [1:0] alu_op;
    wire mem_read, mem_write, alu_src, branch, mem_to_reg, reg_write;
    wire [3:0] alu_control_o;
    wire [63:0] imm_out;
    wire [63:0] pc_plus_immout;


    
    always #5 clk = ~clk;

    initial begin
        $dumpfile("riscv.vcd");
        $dumpvars(0, riscv);
    end

    initial begin
        pc_reset =1;
        #10 pc_reset = 0;
        #10 pc_write = 1;
        // #10;
        // pc_reset =1;
        // #10 pc_reset = 0;
        // #10;
        // pc_write = 0;
        // #10;
        // pc_write = 1;
    end
    //PC
    register pc (new_pc, pc_write, clk, old_pc, pc_reset);
    //ADDER1
    addern adderPC_in_addition_4(1'b0, old_pc, 64'd4, pc_plus_4);
    //INSTRUCTION MEMORY
    insMem instructionMemory(old_pc, instruction);//
    //IMMEDIATE GENERATOR
    immGenerator immgen(instruction[31:0], imm_out);
    //ADDER2
    addern adder_pc_immout(1'b0, old_pc, imm_out, pc_plus_immout);

    Control_Unit control_unit(instruction[6:0], alu_op, mem_read, mem_write, alu_src, branch, mem_to_reg, reg_write);

    register_file regfile(instruction[19:15], instruction[24:20], instruction[11:7], write_data, read_data_one, read_data_two, clk, reg_write); 

    mux2_64bit mux_for_regfile_immGen({imm_out, read_data_two}, alu_src, alu_in);

    alu_control alu_cnt(alu_control_o, alu_op, instruction[14:12], instruction[31:25]);
    
    alu ALU(read_data_one, alu_in, alu_control_o, alu_result, zero);

    data_memory data_mem( mem_write, alu_result, clk, data_from_data_mem, read_data_two, mem_read);

    mux2_64bit mux_for_datamem_output({data_from_data_mem, alu_result}, mem_to_reg, write_data);

    mux2_64bit mux_for_adders({pc_plus_immout, pc_plus_4}, branch & zero, new_pc);


    initial begin
        clk = 1;

        #250;

        $finish;
    end


endmodule