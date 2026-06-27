module encoder_gray_tb;
  reg [2:0] A;
  wire [6:0] B;
  encoder_gray #(.Use_Gray(0)) uut (
    .A(A),
    .B(B)
  );
  initial begin
    A = 3'b000;  #10;
    A = 3'b001; #10;
    A = 3'b010; #10;
    A = 3'b011; #10;
    A = 3'b100; #10;
    A = 3'b101; #10;
    A = 3'b110; #10;
    A = 3'b111; #10;
    $stop;
  end
  initial begin
    $monitor("At time %t, A = %b, B = %b", $time, A, B);
  end
endmodule