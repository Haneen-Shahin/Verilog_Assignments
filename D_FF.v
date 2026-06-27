module D_FF(
input D,rstn,clk,  
output reg Q,Qbar
); 
always @(posedge clk or negedge rstn) begin
if(~rstn) begin
    Q<=1'b0;
    Qbar<=1'b1;
end
else begin
    Q<=D;
    Qbar<=~D;
  end
end 
endmodule