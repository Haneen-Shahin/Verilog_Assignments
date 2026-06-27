module alu_random_tb;
reg [3:0] A, B;
reg [1:0] opcode;
wire [3:0] result;
Nbit_alu #(.N(4)) alu (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result)
);
integer i;
initial begin
    for (i = 0; i < 16; i = i + 1) begin
        A = $random;
        B = $random;
        opcode = $random % 4; 
        #10; 
    end
    $stop;
end
initial begin
    $monitor("A=%b,B=%b,Opcode=%b",A,B,opcode);
end
endmodule