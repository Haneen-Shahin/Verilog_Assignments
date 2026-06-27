module tb_7segment();
reg [3:0] A,B;
reg [1:0] opcode;
reg enable;
wire [6:0] out;
seven_segment seg1(
    .A(A),
    .B(B),
    .opcode(opcode),
    .enable(enable),
    .out(out)
);
initial begin
    enable = 1;
    A=4'b0000; B=4'b0000; opcode=2'b00; #10;
    A=4'b0001; B=4'b0001; opcode=2'b01; #10;
    A=4'b0010; B=4'b0010; opcode=2'b10; #10;
    A=4'b0100; B=4'b0100; opcode=2'b11; #10;
end
endmodule