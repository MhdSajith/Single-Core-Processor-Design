module control_unit(
    input        clk,
    input        reset,
    output reg [1:0] state
);

    parameter FETCH   = 2'b00;
    parameter DECODE  = 2'b01;
    parameter EXECUTE = 2'b10;

    // FSM state transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= FETCH;
        else begin
            case (state)

                FETCH:
                    state <= DECODE;

                DECODE:
                    state <= EXECUTE;

                EXECUTE:
                    state <= FETCH;

                default:
                    state <= FETCH;

            endcase
        end
    end

endmodule
