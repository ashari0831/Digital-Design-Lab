

module alu (
    operand1, operand2, operation, res, zero  
);
    parameter n = 64;
    input [n-1:0]operand1, operand2;
    input [3:0] operation;
    output reg [n-1:0]res;
    output reg zero;

    wire[n-1:0] addition, difference, and_res, or_res;

    assign addition = operand1 + operand2;
    assign difference = operand1 - operand2;
    assign and_res = operand1 & operand2;
    assign or_res = operand1 | operand2;

    always @(addition, difference, and_res, or_res, operation) begin
        case(operation)
            0: res = and_res;
            1: res = or_res;
            2: res = addition;
            6: res = difference;
        endcase

        if(res == 64'd0)
            zero = 1;
        else
            zero = 0;
    end

endmodule