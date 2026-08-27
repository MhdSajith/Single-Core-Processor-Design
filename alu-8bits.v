`timescale 1ns / 1ps

// ================= 8-bit ALU =================
module alu_8bit(
    input  [7:0] a,
    input  [7:0] b,
    input  [2:0] opcode,
    output reg [7:0] result,
    output reg zero
);
    always @(*) begin
        case(opcode)
            3'b000: result = a + b;
            3'b001: result = a - b;
            3'b010: result = a & b;
            3'b011: result = a | b;
            3'b100: result = a ^ b;
            3'b101: result = ~a;
            default: result = 8'b0;
        endcase
        zero = (result == 8'b0);
    end
endmodule


// ================= Register File =================
module register_file(
    input clk,
    input reset,
    input write_en,
    input [2:0] reg_addr,
    input [7:0] write_data,
    output [7:0] reg_out
);
    reg [7:0] registers [7:0];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                registers[i] <= 8'b0;
        end else if (write_en) begin
            registers[reg_addr] <= write_data;
        end
    end

    assign reg_out = registers[reg_addr];
endmodule


// ================= Control Unit (FSM) =================
module control_unit(
    input clk,
    input reset,
    output reg [1:0] state
);
    parameter FETCH = 2'b00,
              DECODE = 2'b01,
              EXECUTE = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= FETCH;
        else begin
            case(state)
                FETCH:   state <= DECODE;
                DECODE:  state <= EXECUTE;
                EXECUTE: state <= FETCH;
                default: state <= FETCH;
            endcase
        end
    end
endmodule

