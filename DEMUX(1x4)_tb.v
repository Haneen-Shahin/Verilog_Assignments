module DEMUX_1x4_tb;
    reg D;
    reg [1:0]S;
    wire [3:0] Y;
DEMUX_1x4 uut (
    .D(D),
    .S(S),
    .Y(Y)
);
integer i, j;
initial begin 
    for(i=0; i<2; i=i+1) begin
        D = i;
        for(j=0; j<4; j=j+1) begin
            S = j;
        #10;
        end
    end
   $finish;
end
initial begin
    $monitor("At time %t, D = %b, S = %b, Y = %b", $time, D, S, Y);
end
endmodule