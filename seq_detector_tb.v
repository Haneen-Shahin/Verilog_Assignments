module seq_detector_tb();
    parameter S0=2'b00;
    parameter S1=2'b01;
    parameter S2=2'b10;
    parameter S3=2'b11;

reg clk_tb,rst_tb,in_tb;
wire y_dut;
integer i;
seq_detector dut(clk_tb,rst_tb,in_tb,y_dut);
initial begin
clk_tb=0;
forever begin
    #5 
clk_tb=~clk_tb;
end
end
initial begin
     rst_tb =0;
     @(negedge clk_tb);
     rst_tb =1;
for(i=0 ; i<100 ; i=i+1) begin
    rst_tb=$random;
    in_tb=$random;
    @(negedge clk_tb);
end
 #10;
$stop;
end
initial begin
$monitor("rst=%b clk=%b y=%b in=%b",rst_tb,clk_tb,in_tb,y_dut);
end
endmodule