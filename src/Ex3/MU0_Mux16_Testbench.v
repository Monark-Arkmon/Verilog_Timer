// COMP12111 Exercise 3 - MU0_Mux16 Testbench
// Version 2024. P W Nutter
//
// Testbench for the 2-to-1 16-bit MUX
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

module MU0_Mux16_Testbench();

//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter the names of these signals 

reg   [15:0] A, B;
reg          S; 
wire  [15:0] Q;


// The design has been instantiated for you below:

MU0_Mux16 top(.A(A), .B(B), .S(S), .Q(Q) );


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
A = 16'hxxxx;
B = 16'hxxxx;
// Expected Value Q = 16'bxxxx

#100

// Set S to 0, A and B remain unknown.
S = 1'b0;
A = 16'hxxxx;
B = 16'hxxxx;
// Expected Value Q = 16'bxxxx

#100

// Set S to 1, A and B remain unknown.
S = 1'b1;
A = 16'hxxxx;
B = 16'hxxxx;
// Expected Value Q = 16'bxxxx

#100

// Set S to 0, A is unknown, B is known.
S = 1'b0;
A = 16'hxxxx;
B = 16'hEF12;
// Expected Value Q = 16'bxxxx

#100

// Set S to 1, A is unknown, B is known.
S = 1'b1;
A = 16'hxxxx;
B = 16'hEF12;
// Expected Value Q = 16'hEF12

#100

// Set S to 0, A is known, B is unknown.
S = 1'b0;
A = 16'hABCD;
B = 16'hxxxx;
// Expected Value Q = 16'hABCD

#100

// Set S to 1, A is known, B is unknown.
S = 1'b1;
A = 16'hABCD;
B = 16'hxxxx;
// Expected Value Q = 16'bxxxx

#100

// Set S to 0, A and B are both known values.
S = 1'b0;
A = 16'hABCD;
B = 16'hEF12;
// Expected Value Q = 16'hABCD

#100

// Set S to 1, A and B are both known values.
S = 1'b1;
A = 16'hABCD;
B = 16'hEF12;
// Expected Value Q = 16'hEF12


// -------------------------------------------------------
// Please make sure your stimulus is above this line

#100 $stop;
end

endmodule


`default_nettype wire
