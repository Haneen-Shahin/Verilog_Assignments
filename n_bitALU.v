module n_bitALU #(parameter N = 4)(
  input [N-1:0] A, B,
  input [1:0] opcode, 
 output reg [N-1:0] result
);
wire [N-1:0] C;
n_bitadder #(N) nba1(
    .A(A),
    .B(B),
    .C(C)
);
always @(*) begin
    case (opcode)
        2'b00: result = C;
        2'b01: result = A | B;
        2'b10: result = A - B;
        2'b11: result = A ^ B;
    endcase
end
endmodule