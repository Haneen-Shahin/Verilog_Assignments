module
     always@(cs,unlock_doors,accelerate_car) begin
  if(cs == ACCELERATE)begin
    unlock_doors<=0;
    accelerate_car<=1;
  end
  else if(cs == STOP)begin
    unlock_doors<=1;
    accelerate_car<=0;
  end
 else if (cs ==DECELERATE)begin
    unlock_doors<=0;
    accelerate_car<=0;
end
end
endmodule
always@(cs)begin
    case(cs)
 ACCELERATE:
 out <= 2'b01;
STOP:
out <= 2'b10;
DECELERATE:
out <= 2'b11;
    endcase
assign out = {unlock_doors,accelerate_car};
end