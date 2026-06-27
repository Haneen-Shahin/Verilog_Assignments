module SLE_FForlatch_tb;
reg D,CLK,EN,ALn,ADn,SLn,SD,LAT;
wire Q;
SLE_FForlatch uut (
    .D(D),.CLK(CLK),.EN(EN),.ALn(ALn),.ADn(ADn),.SLn(SLn),.SD(SD),.LAT(LAT),.Q(Q)
);
integer i;
always #5 CLK = ~CLK;
initial begin
    CLK = 0; D=0; EN=0; ALn=1; ADn=1; SLn=1; SD=0; LAT=0;
    #5; ADn=0; ALn=0; 
    #10; ADn=1;
    LAT=0;
    for(i=0; i<20; i=i+1) begin
        @(negedge CLK);
        D = $random;
        EN = $random;
        SLn = $random;
        SD = $random;
        #10;
    end
    LAT=1;
    for(i=0; i<20; i=i+1) begin
        D = $random;
        EN = $random;
        SLn = $random;
        SD = $random;
        #10;
    end
    #50 $finish;
end
 endmodule