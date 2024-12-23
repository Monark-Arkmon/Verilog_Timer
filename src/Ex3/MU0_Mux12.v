// COMP12111 Exercise 3 - MU0_Mux12 
// Version 2024. P W Nutter
// 
// 2-to-1 12-bit MUX implementation
//
// Implement using behavioural Verilog
//
// Comments:
// Made a combinatorial always block for 12 bit multiplexer.
// Made conditional statements according to the function of the multiplexer.
//

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

// module definition

module MU0_Mux12 (
input  wire [11:0] A, 
input  wire [11:0] B, 
input  wire        S, 
output reg  [11:0] Q);


// Combinatorial logic for 2to1 multiplexor
// S is select, A channel0, B channel1

always @ (*)
case(S)
0: Q = A;        // When S is 0, output A
1: Q = B;        // When S is 1, output B
default: Q = 12'hxxx; // Default case: output unknown value
endcase

endmodule


// for simulation purposes, do not delete
`default_nettype wire
