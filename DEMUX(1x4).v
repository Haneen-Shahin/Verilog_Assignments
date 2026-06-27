module DEMUX_1x4(
    input D,
    input [1:0]S,
    output reg [3:0] Y
);
always @(*) begin
    case(S)
        3'b000: Y = {3'b000,D};
        3'b001: Y = {2'b00,D,1'b0};
        3'b010: Y = {1'b0,D,2'b00};
        3'b011: Y = {D,3'b000};
        default: Y = 4'b0000;
    endcase
end
endmodule