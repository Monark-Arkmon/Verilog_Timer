// COMP12111 Exercise 3 - MU0_Alu 
// Version 2024. P W Nutter
//
// MU0 ALU design 
//
// Comments:
// Made a combinatorial always block for the ALU.
// Made conditional statements according to the function of the ALU.
//

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps
`default_nettype none

// module header

module MU0_Alu (
               input  wire [15:0]  X, 
               input  wire [15:0]  Y, 
               input  wire [1:0]   M, 
               output reg  [15:0]  Q
	       );

// behavioural description for the ALU
always @ (*)

case(M)
2'b00: Q = Y;                           // If M = 00, set Q = Y
2'b01: Q = X + Y;                       // If M = 01, set Q = X + Y
2'b10: Q = X + 16'b0000_0000_0000_0001; // If M = 10, set Q = X + 1
2'b11: Q = X + ~Y + 16'd1;               // If M = 11, set Q = X - Y (2's complement)
default: Q = 16'hxxxx;                  // Default case: set Q to unknown
endcase

endmodule 

// for simulation purposes, do not delete
`default_nettype wire
