# ⏲️ MU0 Countdown Timer with Traffic Light Control

A countdown timer implementation using a custom MU0 microprocessor architecture with integrated traffic light control, built in Verilog and RISC assembly.

## Overview

The system consists of:
- Custom MU0 microprocessor (Verilog)
- Fourteen-segment displays showing countdown time
- Traffic light controls that alternate between red/green during countdown
- Keypad input for setting timer duration
- End-of-countdown buzzer

## Features

- Accepts 3-digit input (MMM format) for countdown duration
- Displays "HELLO" on startup
- Alternates traffic lights during countdown
- Visual feedback through 7-segment displays
- Audio buzzer when countdown completes
- Reset functionality to start new countdown

## Implementation

The microprocessor is coded in Verilog (.v files), handling the core processing logic and hardware interfaces. The countdown behavior, input processing, and display control are implemented in RISC-V assembly (.s file).

Source code location:
- Microprocessor: `src/ex3/*.v and *.v.kmd`
- Timer logic: `MU0 Code/try.s`

This project demonstrates hardware-software co-design principles through the integration of custom processor architecture with application-specific assembly code.
