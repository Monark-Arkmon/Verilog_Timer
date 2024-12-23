// COMP12111 Exercise 2 - Sequential Design Testbench
//
// Version 2024. P W Nutter
//
// This is the Verilog module for the traffic light testbench
// Tests for the traffic light should be added to this file
//
// Make sure you document your code and marks may be awarded/lost for the 
// quality of the comments given.
//
// Add your comments:
// When simulation starts, clock is initialized to 0.
// After every 50 ns delay, the clock direction is reversed, hence making it a 100 ns clock.
// Ran the simulation for 16000 ns to see all state changes clearly, keeping D1/D2 key switched one at a time for 3000ns each.

`timescale  1ns / 100ps
`default_nettype none


module Traffic_Light_Testbench;
 
//  Internal signals have been defined for you
//  and must be used for this excercise 
//  DO NOT alter names, and ensure that your signals
//  are wired up correctly to your design under test 

wire [5:0]  lightseq; 
reg   clock;
reg   reset;
reg   D1;
reg   D2;

// The design has been instantiated for you below:

Traffic_Light top(.clock(clock), .reset(reset), .D1(D1), .D2(D2), .lightseq(lightseq));


//
// Testing of a sequential design requires you to implement
// a clock - see the advice in Blackboard on how to do this
//

/*

#VALUE      creates a delay of VALUE ns
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

// Implement your clock here
// -----------------------------------------------------
initial clock=0;
always
#50
clock = ~ clock;
// -----------------------------------------------------


// Set input signals here, using delays where appropriate
// -----------------------------------------------------
initial 
begin
#100
reset = 1;
D1 = 0;
D2 = 0;
#150
reset = 0;
#500
D1 = 1;
#3000
D1 = 0;
#500
D2 = 1;
#3000
D2 = 0;
#500
D1 = 1;
#3000
D1 = 0;
#500
D2 = 1;
#3000
D2 = 0;
#500
#500 $stop;
end

endmodule

`default_nettype wire
