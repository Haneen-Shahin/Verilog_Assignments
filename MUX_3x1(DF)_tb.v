module mux_3x1_tb;
reg D0, D1, D2, S0, S1; 
wire Y;
mux_3x1 uut (
    .D0(D0),
    .D1(D1),
    .D2(D2),
    .S0(S0),
    .S1(S1),
    .Y(Y)
);
integer i;
initial begin
    for(i = 0; i < 10; i = i + 1) begin
    D0 = $random ;
    D1 = $random ;
    D2 = $random ;
    S0 = $random ;
    S1 = $random ;
    #10; 
    end
    $stop;
end
initial begin
    $monitor("D0=%b,D1=%b,D2=%b,S0=%b,S1=%b,Y=%b",D0,D1,D2,S0,S1,Y);
end
endmodule