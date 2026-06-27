module Data_Latch(
input clr,D,G,
output reg Q
);
always @(*) begin
    if(~clr) begin
    Q<=1'b0;
    end
    else begin
        if(G==1'b1)
        Q<=D;
    end
end
endmodule