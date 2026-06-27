module Tesla_tb();
    parameter STOP=2'b00;
    parameter ACCELERATE =2'b01;
    parameter DECELERATE=2'b10;
    parameter MIN_DISTANCE = 7'd40;
reg[7:0]speed_limit_tb,car_speed_tb;
reg[6:0]leading_distance_tb;
reg clk_tb,rst_tb;
wire unlock_doors_tb , accelerate_car_tb;
integer i;
Tesla dut(speed_limit_tb,car_speed_tb,leading_distance_tb,clk_tb,rst_tb,unlock_doors_tb,accelerate_car_tb);
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
for(i=0 ; i<100; i=i+1) begin
    rst_tb=$random;
    speed_limit_tb=$random;
    car_speed_tb=$random;
    leading_distance_tb=$random;
    @(negedge clk_tb);
end
 #10;
$stop;
end
initial begin
$monitor("rst=%d clk=%d leading_distance=%d speed_limit=%d car_speed=%d unlock_doors=%d accelerate_car=%d ",rst_tb,clk_tb,leading_distance_tb,speed_limit_tb,car_speed_tb,unlock_doors_tb,accelerate_car_tb);
end
endmodule