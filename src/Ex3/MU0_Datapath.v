// COMP12111 Exercise 3 - MU0_Datapath 
// Version 2024. P W Nutter
//
// MU0 datapath design - structural Verilog
// Design is incomplet - functional components of the
// MU0 datapath need instantiation.
// Use the names used in the lab instructions.
//
// Comments:
// Instantiated all components of datapath accordingly.
// Checked if all inputs and outputs of all instantiation is correct by running the simulation.
//

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

module MU0_Datapath(
    input  wire        Clk,
    input  wire        Reset,
    input  wire [15:0] Din,
    input  wire        X_sel,
    input  wire        Y_sel,
    input  wire        Addr_sel,
    input  wire        PC_En,
    input  wire        IR_En,
    input  wire        Acc_En,
    input  wire [1:0]  M,
    output wire [3:0]  F,            // top 4 bits of the instruction
    output wire [11:0] Address,
    output wire [15:0] Dout,
    output wire        N,
    output wire        Z,
    output wire [11:0] PC,
    output wire [15:0] Acc
);

// Define internal signals using names from the datapath schematic

wire [15:0] X;        // input to the ALU and XMux
wire [15:0] Y;        // input to the ALU and YMux
wire [15:0] IR;       // Instruction Register
wire [15:0] ALU;      // ALU output

// Instantiate Datapath components

// MU0 registers

// Program Counter Register (PCReg)
MU0_Reg12 PCReg (
    .Clk(Clk),
    .Reset(Reset),
    .En(PC_En),
    .D(ALU[11:0]),        // Data input: lower 12 bits of ALU output
    .Q(PC)                // Program Counter output
);

// Accumulator Register (AccReg)
MU0_Reg16 AccReg (
    .Clk(Clk),
    .Reset(Reset),
    .En(Acc_En),
    .D(ALU),              // Data input: ALU output
    .Q(Acc)               // Accumulator output
);

// Instruction Register (IRReg)
MU0_Reg16 IRReg (
    .Clk(Clk),
    .Reset(Reset),
    .En(IR_En),
    .D(Din),              // Data input (from external source)
    .Q(IR)                // Instruction Register output
);

// MU0 multiplexors

// XMux
MU0_Mux16 XMux (
    .A(Acc),              // Option A: Accumulator output
    .B({4'b0000, PC}),     // Option B: Program Counter (12 bits, extended to 16)
    .S(X_sel),
    .Q(X)                 // Output X
);

// YMux
MU0_Mux16 YMux (
    .A(Din),              // Option A: Data input
    .B(IR),               // Option B: Instruction Register output
    .S(Y_sel),
    .Q(Y)                 // Output Y
);

// Address Multiplexer (AddrMux)
MU0_Mux12 AddrMuxInst (
    .A(PC),               // Option A: Program Counter
    .B(IR[11:0]),         // Option B: Lower 12 bits of Instruction Register
    .S(Addr_sel),
    .Q(Address)           // Output Address
);

// MU0 ALU
MU0_Alu MU0_ALU (
    .X(X),                // Input X
    .Y(Y),                // Input Y
    .M(M),                // ALU operation mode
    .Q(ALU)               // ALU result output (directly to Dout)
);

// MU0 Flag
MU0_Flags FLAGS (
    .Acc(Acc),            // Accumulator input
    .N(N),                // Negative flag output
    .Z(Z)                 // Zero flag output
);


// The following connects X and Dout together, there's no need for you to do so
// use X when defining your datapath structure
assign Dout = X;
// Buffer added F is op 4 bits of the instruction
assign F = IR[15:12];

endmodule

// for simulation purposes, do not delete
`default_nettype wire

