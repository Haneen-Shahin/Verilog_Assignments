module tb_param_shift_reg #(
parameter LOAD_AVALUE = 2,
parameter LOAD_SVALUE = 4,
parameter SHIFT_WIDTH =8,
parameter SHIFT_DIRECTION = "LEFT"
);
reg sclr,sset,shiftin,load,clk,en,aclr,aset;
reg [SHIFT_WIDTH-1:0] data;
wire [SHIFT_WIDTH-1:0] q ;
reg [SHIFT_WIDTH-1:0] old_q;
wire shiftout;
param_shift_reg #(LOAD_AVALUE, LOAD_SVALUE, SHIFT_WIDTH, SHIFT_DIRECTION)
 uut (.sclr(sclr),.sset(sset),.shiftin(shiftin),.load(load),.clk(clk),.en(en),.aclr(aclr),.aset(aset),.data(data),.q(q),.shiftout(shiftout));
integer i;
always #5 clk = ~clk;
task randomize_inputs;
    begin
        shiftin = $random;
        data    = $random;
        en      = 1; 
    end
endtask
 initial begin
    clk = 0; sclr=0; sset=0; load=0; en=0;
    aclr=1; aset=1;
    for( i=0 ; i<20 ; i = i+1) begin
        randomize_inputs();
        #10;
        @(negedge clk);
        if(q !== 0)begin
           $display("aclr failed at %0t: q=%h", $time, q);
        end
    end
      aclr=0; aset=1;
    for( i=0 ; i<20 ; i = i+1) begin
        randomize_inputs();
        #10;
        @(negedge clk);
        if(q !== LOAD_AVALUE)begin
            $display("aset failed at %0t: q=%h, expected q=%h", $time, q, LOAD_AVALUE);
        end
    end
    aclr=0; aset=0; sclr=1; sset=0;
    for( i=0 ; i<20 ; i = i+1) begin
        randomize_inputs();
        #10;
        @(negedge clk);
        if(q !== 0)begin
            $display("sclr failed at %0t: q=%h", $time, q);
        end
    end 
    aclr=0; aset=0; sclr=0; sset=1;
    for( i=0 ; i<20 ; i = i+1) begin
        randomize_inputs();
        #10;
        @(negedge clk);
        if(q !== LOAD_SVALUE)begin
            $display("sset failed at %0t: q=%h, expected q=%h", $time, q, LOAD_SVALUE);
        end
    end
        aclr=0; aset=0; sclr=0; sset=0; load=1;
    for( i=0 ; i<20 ; i = i+1) begin
        randomize_inputs();
        #10;
        @(negedge clk);
        if(q !== data)begin
          $display("load failed at %0t: q = %h, expected q = %h", $time, q, data);
        end
    end
     aclr=0; aset=0; sclr=0; sset=0; load=0;
    for( i=0 ; i<20 ; i = i+1) begin
        old_q = q;
        randomize_inputs();
        #10;
        @(negedge clk);
        if(q !== {old_q[SHIFT_WIDTH-2:0], shiftin} )begin
            $display("shift failed at %0t: q = %h, expected q = %h", $time, q, {old_q[SHIFT_WIDTH-2:0], shiftin});
        end
      end
    $display("Test completed at %0t", $time);
    $finish;
 end
endmodule