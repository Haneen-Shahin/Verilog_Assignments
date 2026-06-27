module counter_4_bit_behavioral (
input clk, setn,
output reg [3:0] out
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
endmodule