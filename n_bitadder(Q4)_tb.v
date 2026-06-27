module tb_n_bitadder();
parameter N = 4;
reg [N-1:0] A;        
reg [N-1:0] B;
wire [N-1:0] C;       
n_bitadder #(N) nba1(
    .A(A),
    .B(B),
    .C(C)
);
initial begin
    A=4'b0000; B=4'b0000; #10;
    A=4'b0001; B=4'b0001; #10;
    A=4'b0010; B=4'b0010; #10;
    A=4'b0100; B=4'b0100; #10;
end
endmodule