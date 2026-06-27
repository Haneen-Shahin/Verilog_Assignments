module Data_Latch_tb();
reg clr_tb,D_tb,G_tb;
wire Q_tb;
Data_Latch dl(.clr(clr_tb),.D(D_tb),.G(G_tb),.Q(Q_tb));
integer i;
initial begin
    for(i=0;i<30;i=i+1) begin
        clr_tb=$random;
        D_tb=$random;
        G_tb=$random;
        #1;
    end
    #10
    $stop;
end
initial begin
    $monitor("clr=%b D=%b G=%b Q=%b",clr_tb,D_tb,G_tb,Q_tb);
end
endmodule