module counter_4_bit_structural (
input rstn,clk,
output [3:0] out
);
wire [3:0]q,qn;
D_FF dff0(.D(qn[0]),.rstn(rstn),.clk(clk),.Q(q[0]),.Qbar(qn[0]));
D_FF dff1(.D(qn[1]),.rstn(rstn),.clk(q[0]),.Q(q[1]),.Qbar(qn[1]));
D_FF dff2(.D(qn[2]),.rstn(rstn),.clk(q[1]),.Q(q[2]),.Qbar(qn[2]));
D_FF dff3(.D(qn[3]),.rstn(rstn),.clk(q[2]),.Q(q[3]),.Qbar(qn[3]));
assign out=qn;
endmodule
