// COMP12111 Exercise 3 - MU0_Reg12 Testbench
// Version 2024. P W Nutter
//
// Testbench for the 12-bit Register
// DUT is instantiated for you.
// Need to complete the test stimulus.
//
// Comments:
// Implemented 1Hz clock.
// Tested 7 different cases in test stimulus.
// Code works as expected.

// Do not touch the following lines as they required for simulation 
`timescale  1ns / 100ps
`default_nettype none

module MU0_Reg12_Testbench();

//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter the names of these signals 

reg   [11:0] D;
reg          Clk;
reg          Reset;
reg          En; 
wire  [11:0] Q;


// The design has been instantiated for you below:

MU0_Reg12 top(.D(D), .Clk(Clk), .Reset(Reset), .En(En), .Q(Q) );


/* Comment block

#VALUE      creates a delay of VALUE ps
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

// Clk setup
initial Clk = 0;
always
#50
Clk=~Clk;     //1Hz clock as 100 ns clock with 50 ns half-cycle

initial
begin
// Enter you stimulus below this line
// -------------------------------------------------------

// Apply reset.
Reset = 1'b1;  
#50
Reset = 1'b0;
// Expected Value Q = 12'h000

#100

// Load new value into D.
D = 12'hABC;
En = 1'b0;
// Expected Value Q = 12'h000

#100       
En = 1'b1;      
// Expected Value Q = 12'hABC

#100

// Load new value into D.
D = 12'hDEF;
En = 1'b0;
// Expected Value Q = 12'hABC

#100 
En = 1'b1;        
// Expected Value Q = 12'hDEF

#100

// Apply reset again.
Reset = 1'b1;  
#50
Reset = 1'b0;  
// Expected Value Q = 12'h000

// Check if the register holds the value after reset when En is off.
D = 12'h777;
En = 1'b0;         
// Expected Value Q = 12'h000

#100
En = 1'b1;
// Expected Value Q = 12'h777


// -------------------------------------------------------
// Please make sure your stimulus is above this line

#100 $stop;
end


endmodule

`default_nettype wire
