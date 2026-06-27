module always_mux4x1(
input in0,in1,in2,in3,
input [1:0] sel,
output reg y 
);
always@(*)begin
    if(sel== 2'b00)
       y=in0;
    else if(sel== 2'b01)
       y=in1;
     else if(sel== 2'b10)
       y=in2;
     else if(sel== 2'b11)
       y=in3;
end
endmodule