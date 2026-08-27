# Single-Core 8-Bit ALU/Processor Design

## 📌 Project Overview

This project implements a simple **single-core 8-bit processor datapath** using **Verilog HDL**. The design consists of an **8-bit ALU, Register File, and FSM-based Control Unit**. The ALU performs arithmetic and logical operations, the Register File stores temporary data, and the Control Unit manages the processor operation through Fetch, Decode, and Execute states.

The design was developed, simulated, and synthesized using **Xilinx Vivado** for FPGA implementation.

## 🛠️ Tools & Technologies

- Verilog HDL
- Xilinx Vivado
- FPGA
- Digital Logic Design

## 🧩 Main Components

### 1. 8-Bit ALU
The ALU performs the following operations:

| Opcode | Operation |
|--------|-----------|
| `000` | Addition |
| `001` | Subtraction |
| `010` | AND |
| `011` | OR |
| `100` | XOR |
| `101` | NOT |

The ALU also generates a **Zero Flag** when the result is zero.

### 2. Register File

- 8 registers
- Each register is 8 bits
- 3-bit register address
- Supports data write operation
- Provides selected register data as output

### 3. Control Unit

The Control Unit is implemented using a Finite State Machine (FSM).

```text
FETCH → DECODE → EXECUTE → FETCH
