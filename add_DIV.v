module add_DIV (
input clk, setn,
output reg [3:0] out,
output DIV_2,DIV_4
);
integer i;
always @(posedge clk or negedge setn) begin
     if (!setn) begin
        out <= 4'b1111;
    end 
    else begin
        out <= out + 1;
    end
  end
assign DIV_2 = out[0];
assign DIV_4 = out[1];
endmodule