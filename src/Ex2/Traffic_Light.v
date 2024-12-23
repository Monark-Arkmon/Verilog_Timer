// Verilog HDL for "COMP12111", "trafficlight" "functional"
//
// COMP12111 - Exercise 2 – Sequential Circuits
//
// Version 2024. P W Nutter
//
// This is the Verilog module for the traffic light junction
//
// The aim of this exercise is complete the finite state machine using the
// state transition diagram given in the laboratory notes. 
//
// DO NOT change the interface to this design or it may not be marked completely
// when submitted.
//
// Make sure you document your code and marks may be awarded/lost for the 
// quality of the comments given.
//
// Add your comments:
// Defined a module called Traffic_Light with inputs: lightseq, clock, reset, D1 and D2.
// Defined 2 variables called current_state, next_state, the former holds the current state of the FSM and the latter one holds the next step of the FSM.
// Naming the state identifiers using 'localparam' to make it more readable instead of just using 4 digit binary every time.
// To make it easier to read and understand, using '`define' to define the light sequence using macros.
// In the next state combinatorial logic block of the FSM, for any change happening in the current_state the case block get considered and the 4 digit binary current_state is assigned the next_state like 4'b0000 becomes 4'b0001.
// If buttons are pressed the respective states get skipped, like if D2 is pressed it skips from state 4 directly to state 7.
// The current assignment block which is sequential in nature gets implemeted on every posedge side of the clock and made the clock asynchronous using posedge reset.
// The current assignment block assigns the value of next state to the current register, this is the main block that drives the whole FSM model.
// The output logic block assigns the current state's 4 digit binary number to a light sequence on the board.

`timescale  1ns / 100ps
`default_nettype none

module Traffic_Light ( 	output reg [5:0] lightseq,	//the 6-bit light sequence
		         		input  wire      clock,		//clock that drives the fsm
		         		input  wire      reset,		//reset signal 
		         		input  wire      D1, D2);	//inputs from cars


// State definitions

localparam [3:0] 
    S0 = 4'b0000,
    S1 = 4'b0001,
    S2 = 4'b0010,
    S3 = 4'b0011,
    S4 = 4'b0100,
    S5 = 4'b0101,
    S6 = 4'b0110,
    S7 = 4'b0111,
    S8 = 4'b1000,
    S9 = 4'b1001,
    S10 = 4'b1010,
    S11 = 4'b1011,
    S12 = 4'b1100,
    S13 = 4'b1101,
    S14 = 4'b1110,
    S15 = 4'b1111;


// Light sequence definitions using macros

`define R__R  6'b1001_00  // lights in state 0
`define RA_R  6'b1101_00  // state 1
`define G__R  6'b0011_00  // state 2-6
`define A__R  6'b0101_00  // state 7
`define R__R  6'b1001_00  // state 8
`define R_RA  6'b1001_10  // state 9
`define R__G  6'b1000_01  // state 10-14
`define R__A  6'b1000_10  // state 15


// declare internal variables here

reg [3:0] current_state;
reg [3:0] next_state;


// implement your next state combinatorial logic block here

always @ (current_state)
case(current_state)
S0: next_state = S1;
S1: next_state = S2;
S2: next_state = S3;
S3: next_state = S4;
S4: begin if (D2) next_state = S7; else next_state = S5; end
S5: begin if (D2) next_state = S7; else next_state = S6; end
S6: next_state = S7;
S7: next_state = S8;
S8: next_state = S9;
S9: next_state = S10;
S10: next_state = S11;
S11: next_state = S12;
S12: begin if (D1) next_state = S15; else next_state = S13; end
S13: begin if (D1) next_state = S15; else next_state = S14; end
S14: next_state = S15;
S15: next_state = S0;
default: next_state = S0;
endcase


// implement your current state assignment, register, here

always @ (posedge clock, posedge reset)
if (reset)
current_state <= S0;
else
current_state <= next_state;


// implement your output logic here

always @ (*)
case(current_state)
S0: lightseq = `R__R;
S1: lightseq = `RA_R;
S2: lightseq = `G__R;
S3: lightseq = `G__R;
S3: lightseq = `G__R;
S4: lightseq = `G__R;
S4: lightseq = `G__R;
S5: lightseq = `G__R;
S6: lightseq = `G__R;
S7: lightseq = `A__R;
S8: lightseq = `R__R;
S9: lightseq = `R_RA;
S10: lightseq = `R__G;
S11: lightseq = `R__G;
S12: lightseq = `R__G;
S13: lightseq = `R__G;
S14: lightseq = `R__G;
S15: lightseq = `R__A;
default: lightseq = `R__R;
endcase

endmodule

`default_nettype wire
