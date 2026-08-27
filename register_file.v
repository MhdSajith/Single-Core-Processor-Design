module register_file(
    input        clk,
    input        reset,
    input        write_en,
    input  [2:0] reg_addr,
    input  [7:0] write_data,
    output [7:0] reg_out
);

    reg [7:0] registers [7:0];
    integer i;

    // Write operation and reset
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                registers[i] <= 8'b0;
        end
        else if (write_en) begin
            registers[reg_addr] <= write_data;
        end
    end

    // Read selected register
    assign reg_out = registers[reg_addr];

endmodule
