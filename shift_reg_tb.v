module shift_reg_tb;
reg C,SI,LR;
wire [7:0] po;
shift_reg UUT(.C(C),.SI(SI),.LR(LR),.po(po));
integer i;
initial begin
    C=0;SI=0;LR=0;
    #10 LR=1;
    for(i=0;i<8;i=i+1) begin
        #10 SI=i;C=1;
        #10 C=0;
    end
    #10 LR=0;
    for(i=0;i<8;i=i+1) begin
        #10 SI=i;C=1;
        #10 C=0;
    end
end
initial begin 
    $monitor("At time %t, SI=%b, LR=%b, po=%b",$time,SI,LR,po);
end
endmodule 