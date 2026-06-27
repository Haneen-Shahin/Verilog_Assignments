module Gate_F (A,B,C,F);
input A,B,C;
output F;
wire w1 , w2 ;
assign w1 = A^B;
assign w2 = B~^C;
assign F = w1 & w2 & C;
endmodule

