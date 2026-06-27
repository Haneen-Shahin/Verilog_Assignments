module mux_3x1compare_tb;
reg D0, D1, D2, S0, S1; 
wire Y_gold, Y_test;
mux_3x1_gold gold (.D0(D0),.D1(D1),.D2(D2),.S0(S0),.S1(S1),.Y_gold(Y_gold));
mux_3x1_test test (.D0(D0),.D1(D1),.D2(D2),.S0(S0),.S1(S1),.Y_test(Y_test)); 
integer i;
initial begin
    for(i = 0; i < 10; i = i + 1) begin
    D0 = $random ;
    D1 = $random ;
    D2 = $random ;
    S0 = $random ;
    S1 = $random ;
    #10; 
    if(Y_gold != Y_test) begin
        $display("Error");
        $stop;
    end
    end
    $stop;
end
initial begin
 $monitor("D0=%b,D1=%b,D2=%b,S0=%b,S1=%b,Y_gold=%b,Y_test=%b",D0,D1,D2,S0,S1,Y_gold,Y_test);
end
endmodule