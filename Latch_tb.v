module Latch_tb;
parameter LAT_WIDTH = 8;
reg aset,aclr,gate;
reg [LAT_WIDTH-1:0] data;
wire [LAT_WIDTH-1:0] q;
Latch #(.LAT_WIDTH(LAT_WIDTH)) dut (
.aset(aset),
.aclr(aclr),.gate(gate),
.data(data),.q(q)
);  
reg [LAT_WIDTH-1:0] q_expected;
integer i;
initial begin
    aset = 0; aclr = 0; gate = 0; data = 0; q_expected = 0;
   for(i=0; i<16; i=i+1) begin
       data = $random;
       gate = $random;
       aset = $random;
       aclr = $random;
       #1;
    if (aclr) begin
       q_expected = {LAT_WIDTH{1'b0}};
    end
    else if(aset) begin
       q_expected = {LAT_WIDTH{1'b1}};
   end 
   else if (gate) begin
       q_expected = data;
   end
   if(q !== q_expected) begin
       $display("error");
       $stop;
   end
end
end
   initial begin
       $monitor("time=%0t, aset=%b, aclr=%b, gate=%b, data=%h, q=%h", $time, aset, aclr, gate, data, q);
   end
 endmodule