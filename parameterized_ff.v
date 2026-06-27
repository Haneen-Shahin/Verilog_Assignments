module parameterized_ff #(parameter FF_TYPE="D_FF")(
input D,T,rstn,clk,
output reg Q,Qbar
);
localparam D_FF="D"; 
localparam T_FF="T";
generate
if(FF_TYPE==D_FF) begin
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
end
else if(FF_TYPE==T_FF) begin
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
end
endgenerate
endmodule