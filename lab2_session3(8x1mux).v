module mux2x1(
input In0,In1,Sel, 
output Y);
assign Y = (Sel == 1'b0)? In0 : In1 ;
endmodule
module mux8x1_using_mux2x1(
    input in0,in1,in2,in3,in4,in5,in6,in7,
    input sel1,sel2,sel3,
    output y            
);
wire w1,w2,w3,w4,w5,w6;
// Level 1
mux2x1 m1(.In0(in0),.In1(in1),.Sel(sel1),.Y(w1));
mux2x1 m2(.In0(in2),.In1(in3),.Sel(sel1),.Y(w2));
mux2x1 m3(.In0(in4),.In1(in5),.Sel(sel1),.Y(w3));
mux2x1 m4(.In0(in6),.In1(in7),.Sel(sel1),.Y(w4));
// Level 2
mux2x1 m5(.In0(w1),.In1(w2),.Sel(sel2),.Y(w5));
mux2x1 m6(.In0(w3),.In1(w4),.Sel(sel2),.Y(w6));
// Level 3
mux2x1 m7(.In0(w5),.In1(w6),.Sel(sel3),.Y(y));
endmodule