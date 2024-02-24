`timescale 1ns / 1ps
module tb ();
   logic        [3:0]a,b;
   logic 	c;
   logic 	[4:0]sum;
   logic    [4:0]sum_correct;
   logic        clk;   
   integer handle3;
integer desc3;
integer i;
// instantiate device under test
RCA dut (a, b, c, sum[3:0], sum[4]);
assign sum_correct = a + b + c;
// 20 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end
initial
begin
	handle3 = $fopen("rca.out");
	desc3 = handle3;
	#3020 $finish;
end
initial
begin
for (i=0; i < 150; i=i+1)
begin
// Put vectors before beginning of clk
@(posedge clk)
begin
a = $random;
b = $random;
c = $random;
end
@(negedge clk)
begin
$fdisplay(desc3, "%h %h |%h | %h | %h | %b", a, b, c,  sum, sum_correct, (sum == sum_correct));
end
end // @(negedge clk)
end
   
endmodule
