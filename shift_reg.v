module shift_reg(
input C,SI,LR,
output reg [7:0] po
);
always @(posedge C) begin
    if(LR==1'b0)
    begin 
        po<={po[6:0],SI};
    end
    else begin
        po<={SI,po[7:1]};
    end
end
endmodule