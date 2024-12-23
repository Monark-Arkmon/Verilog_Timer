// COMP12111 Exercise 3 - MU0_Reg16 
// Version 2024. P W Nutter
// 
// 16-bit Register implementation
//
// Implement using behavioural Verilog
//
// Comments:
// Made a sequential always block for 16 bit register.
// Made an asynchronous reset.
// Made conditional statements according to the function of the register.

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

// module definition

module MU0_Reg16 (
input  wire        Clk, 
input  wire        Reset,     
input  wire        En, 
input  wire [15:0] D, 
output reg  [15:0] Q
 );

// behavioural code - clock driven

always @ (posedge Clk or posedge Reset)
if (Reset)
Q <= 16'h0000;  // Reset Q to 16'h0000
else if (En)
Q <= D;         // Load D into Q when En is high
else
Q <= Q;         // Hold Q value when En is low

endmodule  

// for simulation purposes, do not delete
`default_nettype wire
