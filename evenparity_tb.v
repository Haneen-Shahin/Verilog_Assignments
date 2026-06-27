module tb_evenparitygenerator();
reg [7:0] A;        
wire [8:0] out_with_parity;
evenparitygenerator epg1(
    .A(A),
    .out_with_parity(out_with_parity)
);
initial begin
    A=8'b00000000; #10;
    A=8'b00000001; #10;
    A=8'b00000011; #10;
    A=8'b00000111; #10;
    A=8'b00001111; #10;
    A=8'b00011111; #10;
    A=8'b00111111; #10;
    A=8'b01111111; #10;
    A=8'b11111111; #10;
end
endmodule