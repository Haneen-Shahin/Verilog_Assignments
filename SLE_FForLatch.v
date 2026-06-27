module SLE_FForlatch(
input D,CLK,EN,ALn,ADn,SLn,SD,LAT,
output reg Q
);
always @(posedge CLK or negedge ALn) begin
    if(!ALn) begin
        Q <= !ADn;
    end
    else begin
        if(LAT==0)begin
         if(EN) begin
           if(!SLn) begin
            Q <= SD;
            end
         else begin
            Q <= D;
        end
    end
end
        else begin
            if(CLK && EN) begin
                if(!SLn) begin
                 Q <= SD;
               end
            end
               else begin
                Q <= D;
            end
       end

    end
end
endmodule