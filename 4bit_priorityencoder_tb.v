module tb_priorityencoder_4bit();
reg [3:0] x;    
wire [1:0] y;
priorityencoder_4bit pe1(
    .x(x),
    .y(y)
);
initial begin
    x=4'b0000; #10;
    x=4'b0001; #10;
    x=4'b0010; #10;
    x=4'b0100; #10;
    x=4'b1000; #10;
    x=4'b1010; #10;
    x=4'b1111; #10;
end
endmodule