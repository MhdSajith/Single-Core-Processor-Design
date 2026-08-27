`timescale 1ns / 1ps

module tb_alu;

    reg  [7:0] a;
    reg  [7:0] b;
    reg  [2:0] opcode;

    wire [7:0] result;
    wire       zero;

    // ALU instantiation
    alu_8bit DUT (
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result),
        .zero(zero)
    );

    initial begin

        // ADD
        a = 8'd10;
        b = 8'd5;
        opcode = 3'b000;
        #10;

        // SUB
        a = 8'd10;
        b = 8'd5;
        opcode = 3'b001;
        #10;

        // AND
        a = 8'b10101010;
        b = 8'b11001100;
        opcode = 3'b010;
        #10;

        // OR
        a = 8'b10101010;
        b = 8'b11001100;
        opcode = 3'b011;
        #10;

        // XOR
        a = 8'b10101010;
        b = 8'b11001100;
        opcode = 3'b100;
        #10;

        // NOT
        a = 8'b10101010;
        b = 8'b00000000;
        opcode = 3'b101;
        #10;

        // Zero result test
        a = 8'd5;
        b = 8'd5;
        opcode = 3'b001;
        #10;

        $stop;

    end

endmodule
