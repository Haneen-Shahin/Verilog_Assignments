module D_FF_tb();
reg rstn,clk,D;
wire Q_golden,Qbar_golden;
D_FF D_FF(.D(D),.rstn(rstn),.clk(clk),.Q(Q_golden),.Qbar(Qbar_golden));
parameterized_ff #("D") DFF(.D(D),.T(T),.rstn(rstn),.clk(clk),.Q(Q),.Qbar(Qbar));
integer i;
initial begin
    clk=0;
    forever begin
    #1;
    clk=~clk;    
    end
end
initial begin
    rstn=0;
    @(negedge clk);
     rstn=1;
    for(i=0;i<20;i=i+1) begin
        rstn=$random;
        D=$random;
        @(negedge clk);
        if(Q!==Q_golden || Qbar!==Qbar_golden) begin
            $display("error");
             $stop;
        end
    end
    #10
    $stop;
end
initial begin
    $monitor("rstn=%b D=%b T=%b clk=%b Q=%b Qbar=%b",rstn,D,T,clk,Q_golden,Qbar_golden);
end
endmodule