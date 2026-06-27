module  add_DIV_tb;
reg clk, setn;
wire [3:0] out;
wire DIV_2, DIV_4;
add_DIV dut(.clk(clk), .setn(setn), .out(out), .DIV_2(DIV_2), .DIV_4(DIV_4));
initial begin
    clk = 0;
    forever #5 clk = ~clk;  
end
integer i;
initial begin
    setn = 0;
    @(negedge clk);
    setn = 1;
       for(i=0; i<16; i=i+1) begin
            @(negedge clk);
            if(DIV_2 !== out[0] ) begin
              $display("error");
          end
            if(DIV_4 !== out[1] ) begin
                $display("error");
            end
      end
  $stop;
end
initial begin
    $monitor("time=%0t, clk=%b, set=%b, out_behavioral=%b, out_structural=%b", $time, clk, setn, out, DIV_2, DIV_4);
end
endmodule