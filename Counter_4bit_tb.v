module  Counter_4bit_tb();
reg clk_tb,rstn_tb;
wire [3:0] out_tb;  
Counter_4bit c4(.rstn(rstn_tb),.clk(clk_tb),.out(out_tb));
integer i;
initial begin
    clk_tb=0;
    forever begin
    #1;
    clk_tb=~clk_tb;    
    end
end
initial begin
    rstn_tb=0;
    @(negedge clk_tb);
     rstn_tb=1;
    for(i=0;i<40;i=i+1) begin
        rstn_tb=$random;
        @(negedge clk_tb);
    end
    #10
    $stop;
end
initial begin
    $monitor("rstn=%b clk=%b out=%b",rstn_tb,clk_tb,out_tb);
end
 endmodule