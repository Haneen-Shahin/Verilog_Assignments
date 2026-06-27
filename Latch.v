module Latch#(
   parameter LAT_WIDTH = 8
)
(
input aset,aclr,gate,
input [LAT_WIDTH-1:0] data,
output reg [LAT_WIDTH-1:0] q
);
always @(*) begin
 if (aclr) begin
    q = {LAT_WIDTH{1'b0}};
end else if (aset) begin
    q = {LAT_WIDTH{1'b1}};
end else if (gate) begin
    q = data;
end
end
endmodule