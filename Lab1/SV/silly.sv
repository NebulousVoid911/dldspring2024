module silly (input  logic a, b, c, output logic s, cout);
   
  assign s = ~a & b & ~c | a & ~b & ~c | ~a & ~b & c | a & b & c;
  assign cout =  a & b & ~c | ~a & b & c | a & ~b & c | a & b & c;

endmodule

module RCA (input logic [3:0]a, b, input logic c, output logic [3:0] s, output logic cout);

logic [2:0]carry; 

silly FA0 (a[0], b[0], c, s[0], carry[0]);
silly FA1 (a[1], b[1],carry[0], s[1], carry[1]  );
silly FA2 (a[2], b[2], carry[1], s[2], carry[2] );
silly FA3 (a[3], b[3], carry[2], s[3], cout );

endmodule