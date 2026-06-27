module mux_3x1_test (
    input D0, D1, D2, S0, S1,
    output reg Y_test
);
    always @(*) begin
      case({S1,S0})
        2'b00: Y_test = D0;
        2'b01: Y_test = D1;
        2'b10,2'b11: Y_test = D2;
        endcase
    end
endmodule