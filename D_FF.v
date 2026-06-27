module D_FF(
input D,rstn,clk,  
output reg Q,
output Qbar
); 
always @(posedge clk or negedge rstn) begin
if(!rstn) begin
    Q<=1'b0;
end
else begin
    Q<=D;
  end
end
  assign Qbar = ~Q;
endmodule