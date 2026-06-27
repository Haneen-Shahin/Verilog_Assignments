module param_shift_reg #(
parameter LOAD_AVALUE = 1,
parameter LOAD_SVALUE = 1,
parameter SHIFT_WIDTH =8,
parameter SHIFT_DIRECTION = "LEFT")
(input sclr,sset,shiftin,load,clk,en,aclr,aset,
input [SHIFT_WIDTH-1:0]data,
output reg [SHIFT_WIDTH-1:0] q ,
output shiftout
);
assign shiftout = (SHIFT_DIRECTION == "LEFT") ? q[SHIFT_WIDTH-1] : q[0];
always@(posedge clk or posedge aclr or posedge aset)begin
    if(aclr)begin
    q<=0; end
else if(aset)begin
    q<=LOAD_AVALUE; end
else if(en) begin
   if(sclr)begin 
    q<=0;  end
else if(sset)begin
    q<=LOAD_SVALUE; end
else if(load)begin
    q<=data; end
else begin
    if(SHIFT_DIRECTION=="LEFT")
        q<={q[SHIFT_WIDTH-2:0],shiftin};
    else if(SHIFT_DIRECTION=="RIGHT")
        q<={shiftin,q[SHIFT_WIDTH-1:1]};
end
end
end
endmodule