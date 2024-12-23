// COMP12111 Exercise 3 - MU0_Mux12 Testbench
// Version 2024. P W Nutter
//
// Testbench for the 2-to-1 12-bit MUX
// DUT is instantiated for you.
// Need to complete the test stimulus.
//
// Comments:
// Tested 7 different cases in test stimulus.
// Code works as expected.
//

// Do not touch the following lines as they required for simulation 
`timescale  1ns / 100ps
`default_nettype none

module MU0_Mux12_Testbench();

//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter the names of these signals 

reg   [11:0] A, B;
reg          S; 
wire  [11:0] Q; 


// The design has been instantiated for you below:

MU0_Mux12 top(.A(A), .B(B), .S(S), .Q(Q) );


/* Comment block

#VALUE      creates a delay of VALUE ps
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

initial
begin
// Enter your stimulus below this line
// -------------------------------------------------------

// Set S to 'x' (unknown state), A and B to unknown values (xxx).
S = 1'bx;   
A = 12'hxxx;
B = 12'hxxx;
// Expected Value Q = 12'bxxx


#100

// Set S to 0, A and B remain unknown.
S = 1'b0;
A = 12'hxxx;
B = 12'hxxx;
// Expected Value Q = 12'bxxx

#100

// Set S to 1, A and B remain unknown.
S = 1'b1;
A = 12'hxxx;
B = 12'hxxx;
// Expected Value Q = 12'bxxx

#100

// Set S to 0, A and B to some known values.
S = 1'b0;
A = 12'hxxx;
B = 12'hDEF;
// Expected Value Q = 12'bxxx

#100

// Set S to 1, A and B to the same known values.
S = 1'b1;
A = 12'hxxx;
B = 12'hDEF;
// Expected Value Q = 12'bDEF

#100

// Set S to 0, A is 12'hABC, and B is still unknown.
S = 1'b0;
A = 12'hABC;
B = 12'hxxx;
// Expected Value Q = 12'bABC

#100

// Set S to 1, A is 12'hABC, and B is still unknown.
S = 1'b1;
A = 12'hABC;
B = 12'hxxx;
// Expected Value Q = 12'bxxx

#100

// Set S to 0, A and B are both known values.
S = 1'b0;
A = 12'hABC;
B = 12'hDEF;
// Expected Value Q = 12'hABC

#100

// Set S to 1, A and B are both known values.
S = 1'b1;
A = 12'hABC;
B = 12'hDEF;
// Expected Value Q = 12'hDEF


// -------------------------------------------------------
// Please make sure your stimulus is above this line


#100 $stop;
end

endmodule

`default_nettype wire
