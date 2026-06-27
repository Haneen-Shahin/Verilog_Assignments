module T_FF(
input T,rstn,clk,  
output reg Q,Qbar
); 
always @(posedge clk or negedge rstn) begin
if(~rstn) begin
    Q<=1'b0;
    Qbar<=1'b1;
end
else begin
     if (T) begin
     Q<=Qbar;    
     Qbar<=~Q;
     end
end
end
endmodule