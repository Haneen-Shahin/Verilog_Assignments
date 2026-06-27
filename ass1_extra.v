module extra(A,B,C,Y);
input A,B,C;
output Y;   
wire w1,w2,w3,w4;
assign w1 = ~(B & C);
assign w2 =  B & w1;
assign w3 = w2 ^(~w1);
assign w4 = ~((~A) & w2);
assign Y = w3 | w4;
endmodule
