module Nbit_alu #(parameter N =4) (
    input [N-1:0] A,B,
    input [1:0] opcode,
    output reg [N-1:0] result
);
always @(*) begin
    case (opcode)
        2'b00: result = A + B;
        2'b01: result = A | B;
        2'b10: result = A - B;
        2'b11: result = A ^ B;
    endcase
end
endmodule //Nbit_alu