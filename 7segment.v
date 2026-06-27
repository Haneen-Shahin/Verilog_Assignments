module seven_segment(
    input [3:0] A,B,
    input [1:0] opcode,
    input enable,
    output reg [6:0] out
);
wire [3:0] result;
n_bitALU #(4) alu1(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result)
);
always @(*) begin
    if(!enable)begin
        out=7'b0000000;
    end
    else begin
    case (result)
        4'b0000: out = 7'b1111110;
        4'b0001: out = 7'b0110000;
        4'b0010: out = 7'b1101101;
        4'b0011: out = 7'b1111001;
        4'b0100: out = 7'b0110011;
        4'b0101: out = 7'b1011011;
        4'b0110: out = 7'b1011111;
        4'b0111: out = 7'b1110000;
        4'b1000: out = 7'b1111111;
        4'b1001: out = 7'b1111011;
        4'b1010: out = 7'b1110111;
        4'b1011: out = 7'b0011111;
        4'b1100: out = 7'b1001110;
        4'b1101: out = 7'b0111101;
        4'b1110: out = 7'b1001111;
        4'b1111: out = 7'b1000111;
            default:begin 
                 out = 7'b0000000;
            end
    endcase
    end
end
endmodule