module counterFSM #(
    parameter A = 2'b00,
    parameter B = 2'b01,
    parameter C = 2'b10,
    parameter D = 2'b11
)(
    input clk,rstn,
    output reg [1:0] y
);
reg [1:0] cs,ns;
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      cs<= A;
    end else begin
      cs<= ns;
    end
end
always @(cs) begin
    case (cs)
    A:ns =B;
    B:ns =C;
    C:ns =D;
    D:ns =A;
    default:ns =A;
    endcase
end
always @(cs) begin
    case (cs)
    A:y = 2'b00;
    B:y = 2'b01;
    C:y = 2'b11;
    D:y = 2'b10;
    default:y = 2'b00;
    endcase
end
endmodule