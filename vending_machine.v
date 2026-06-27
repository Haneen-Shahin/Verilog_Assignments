module vending_machine #(
    parameter wait = 2'b00,
    parameter Q_25 = 2'b01,
    parameter Q_50 = 2'b10
)(
    input clk,rstn,D_in,Q_in,
    output reg change,
    output reg dispense
);
reg cs,ns;
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      cs<= wait;
    end else begin
      cs<= ns;
    end
always @(*) begin
    case (cs)

end
endmodule