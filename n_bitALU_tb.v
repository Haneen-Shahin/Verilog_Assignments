module tb_n_bitALU #(parameter N = 4) ();
   reg [N-1:0] A, B;
   reg [1:0] opcode;
   wire [N-1:0] result;
n_bitALU #(N) alu1(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result)
);
    initial begin
    opcode = 2'b00;  A=4'b0000; B=4'b0000;  #10;
                     A=4'b0001; B=4'b0001;  #10;
                     A=4'b0010; B=4'b0010;  #10;
                     A=4'b0100; B=4'b0100;  #10;
   opcode = 2'b01;   A=4'b0000; B=4'b0000;  #10;
                     A=4'b0001; B=4'b0001;  #10;
                     A=4'b0010; B=4'b0010;  #10;
                     A=4'b0100; B=4'b0100;  #10;
    opcode = 2'b10;  A=4'b0000; B=4'b0000;  #10;
                     A=4'b0001; B=4'b0001;  #10;
                     A=4'b0010; B=4'b0010;  #10;
                     A=4'b0100; B=4'b0100;  #10;
    opcode = 2'b11;  A=4'b0000; B=4'b0000;  #10;
                     A=4'b0001; B=4'b0001;  #10;
                     A=4'b0010; B=4'b0010;  #10;
                     A=4'b0100; B=4'b0100;  #10;
end
endmodule