module D_ff(
    input D,E,pre_n,clk,
    output reg Q
    );
always @(posedge clk , negedge pre_n) begin
        if(!pre_n)
            Q <= 1'b1;
        else if(E) begin
            Q <= D;
        end
    end
endmodule