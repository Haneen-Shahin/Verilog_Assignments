module testbench();
parameter N1 = 8;
    reg [N1-1:0] A,B;
    reg [1:0] opcode;
    wire [N1-1:0] result;
    Nbit_alu #(.N(N1)) alu1(
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result)
    );
initial begin

    A=30; B=20; opcode=2'b00;
    #10;
    A=30; B=20; opcode=2'b01;
    #10;
    A=30; B=20; opcode=2'b10;
    #10;
    A=30; B=20; opcode=2'b11;
    #10;
end



endmodule