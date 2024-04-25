module top (input logic [7:0] a, 
	    input logic        selector, seed, reset,
	    output logic [7:0] out);

   logic [7:0] 		       sum;
   logic [7:0] 		       sub;
   logic [7:0] 		       regin;   

   
   
   assign regin = sel ? sub : sum;
   flopr p3 (clk, reset);

endmodule // top

