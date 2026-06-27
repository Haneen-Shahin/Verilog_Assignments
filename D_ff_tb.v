module D_ff_tb;
reg D,E,pre_n,clk;
wire Q;
D_ff U1(.D(D),.E(E),.pre_n(pre_n),.clk(clk),.Q(Q));
integer i;
initial begin
clk=0;
forever begin
    #1 clk=~clk;
end
end
initial begin
    D=0;E=0;
    pre_n=0;
    @(negedge clk);
    pre_n=1;
    for(i=0;i<100;i=i+1) begin
        @(negedge clk);
       D=$random;
       E=$random;
    end
    #10;
     $stop;
end
 endmodule