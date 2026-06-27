module tb_counter_4_bit();
reg clk,setn;
wire [3:0] out_behavioral;
wire [3:0] out_structural;
counter_4_bit_behavioral dut1 (.clk(clk), .setn(setn), .out(out_behavioral));
counter_4_bit_structural dut2 (.clk(clk), .rstn(setn), .out(out_structural));
integer i;
initial begin
    clk = 0;
    forever begin #5 clk = ~clk ;  
end
end
initial begin
   setn= 0;
   @(negedge clk)
   setn= 1;
    for(i=0; i<100; i=i+1) begin
            @(negedge clk);
            if(out_behavioral !== out_structural) begin
              $display("error");
          end
end
$stop;
end
initial begin
    $monitor("time=%0t, clk=%b, set=%b, out_behavioral=%b, out_structural=%b", $time, clk, setn, out_behavioral, out_structural);
end
endmodule