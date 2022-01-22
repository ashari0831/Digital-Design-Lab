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
`include "./if_id_register/if_id_reg.v"
`include "./id_ex_register/id_ex_reg.v"
`include "./ex_mem_register/ex_mem_reg.v"
`include "./mem_wb_register/mem_wb_reg.v"

module pipeline_riscv;

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
    //
    wire [95:0] if_id_reg_output;
    wire [278:0] id_ex_reg_output;
    wire [202:0] ex_mem_reg_output;
    wire [134:0] mem_wb_reg_output; 
    

    
    always #5 clk = ~clk;

    initial begin
        $dumpfile("pl_cpu.vcd");
        $dumpvars(0, pipeline_riscv);
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


    mux2_64bit mux_to_pc ( {ex_mem_reg_output[68:5], pc_plus_4}, ex_mem_reg_output[69] & ex_mem_reg_output[4], new_pc);
    //PC
    register pc (new_pc, pc_write, clk, old_pc, pc_reset);
    //ADDER1
    addern adderPC_in_addition_4(1'b0, old_pc, 64'd4, pc_plus_4);
    //INSTRUCTION MEMORY
    insMem instructionMemory(old_pc, instruction);

    if_id_reg if_id_reg ({instruction, old_pc}, pc_write, clk, if_id_reg_output, pc_reset);
    
    register_file regfile(if_id_reg_output[83:79], if_id_reg_output[88:84], mem_wb_reg_output[134:130], write_data, read_data_one, read_data_two, clk, mem_wb_reg_output[1]); 
    //IMMEDIATE GENERATOR
    immGenerator immgen(if_id_reg_output[95:64], imm_out);

    Control_Unit control_unit(if_id_reg_output[70:64], alu_op, mem_read, mem_write, alu_src, branch, mem_to_reg, reg_write);

    id_ex_reg id_ex_reg ({if_id_reg_output[75:71], if_id_reg_output[95:89], if_id_reg_output[78:76], imm_out, read_data_two, read_data_one, if_id_reg_output[63:0], alu_src, alu_op, branch, mem_write, mem_read, reg_write, mem_to_reg}, pc_write, clk, id_ex_reg_output, pc_reset);
    //ADDER2
    addern adder_pc_immout(1'b0, id_ex_reg_output[71:8], id_ex_reg_output[263:200], pc_plus_immout);

    mux2_64bit mux_for_regfile_immGen({id_ex_reg_output[263:200], id_ex_reg_output[199:136]}, id_ex_reg_output[7], alu_in);

    alu_control alu_cnt(alu_control_o, id_ex_reg_output[6:5], id_ex_reg_output[266:264], id_ex_reg_output[273:267]);
    
    alu ALU(id_ex_reg_output[135:72], alu_in, alu_control_o, alu_result, zero);

    ex_mem_reg ex_mem_reg ({id_ex_reg_output[278:274], id_ex_reg_output[199:136], alu_result, zero, pc_plus_immout, id_ex_reg_output[4:0]}, pc_write, clk, ex_mem_reg_output, pc_reset);
    
    data_memory data_mem( ex_mem_reg_output[3], ex_mem_reg_output[133:70], clk, data_from_data_mem, ex_mem_reg_output[197:134], ex_mem_reg_output[2]);

    mem_wb_reg mem_wb_reg ({ex_mem_reg_output[202:198], ex_mem_reg_output[133:70], data_from_data_mem, ex_mem_reg_output[1:0]}, pc_write, clk, mem_wb_reg_output, pc_reset);
    
    mux2_64bit mux_for_datamem_output({mem_wb_reg_output[65:2], mem_wb_reg_output[129:66]}, mem_wb_reg_output[0], write_data);



    initial begin
        clk = 1;

        #100;

        $finish;
    end


endmodule