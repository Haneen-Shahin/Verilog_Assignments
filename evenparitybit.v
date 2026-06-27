module evenparitygenerator(
input [7:0] A,
output [8:0] out_with_parity
);
wire paritybit;
assign  paritybit = ^A;
assign out_with_parity = {A, paritybit};
endmodule