module Tesla (speed_limit,car_speed,leading_distance,clk,rst,unlock_doors,accelerate_car);
    parameter STOP=2'b00;
    parameter ACCELERATE =2'b01;
    parameter DECELERATE=2'b10;
    parameter MIN_DISTANCE = 7'd40;
input [7:0]speed_limit,car_speed;
input [6:0]leading_distance;
input clk,rst;
output reg unlock_doors , accelerate_car;
reg[1:0]cs,ns;
 always@(posedge clk or posedge rst) begin
       if(rst)
         cs<=STOP;
       else 
         cs<=ns;
 end
 always@(*) begin
     case(cs)
        STOP:
        if(leading_distance<MIN_DISTANCE)
        ns <= STOP;
        else if(leading_distance>=MIN_DISTANCE)
            ns<=ACCELERATE;
        ACCELERATE:
        if(leading_distance>=MIN_DISTANCE && car_speed < speed_limit)
        ns<=ACCELERATE;
        else if(leading_distance<MIN_DISTANCE || car_speed > speed_limit)
            ns<=DECELERATE;
        DECELERATE:
        if(leading_distance<MIN_DISTANCE || car_speed > speed_limit)
        ns<=DECELERATE;
        else if(leading_distance>=MIN_DISTANCE && car_speed < speed_limit)
        ns<=ACCELERATE;
        else if (car_speed==0)
            ns<=STOP;
            default:
             ns = STOP;
        endcase
end
always@(*) begin
    case(cs)
  ACCELERATE: begin
    unlock_doors=0;
    accelerate_car=1;
end
   STOP: begin
    unlock_doors=1;
    accelerate_car=0;
   end
 DECELERATE: begin
    unlock_doors=0;
    accelerate_car=0;
 end
default :begin
 unlock_doors=0;
 accelerate_car=0;
end
    endcase
end
endmodule