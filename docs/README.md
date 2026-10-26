# Project documentation

**Hands on Algorithm Acceleration using Heterogeneous Computing Systems** explores the implementation of Sneaky Snake genome pre-alignment filtering on CPUs, cloud virtual machines, and FPGAs.

## Reading guide

| Document | Contents |
| --- | --- |
| [Algorithm and architecture](architecture.md) | Sequence filtering, the chip maze, escape segments, and computing platforms |
| [CPU implementation](../software/cpu/README.md) | C++ structure, OpenMP processing, build commands, input format, and API |
| [Cloud implementation](history/README.md) | Azure experiment configuration and execution of the CPU program on a VM |
| [FPGA implementation](../hardware/fpga/README.md) | DNA encoding, Verilog hierarchy, and processing stages |
| [Board integration](../hardware/fpga/board/README.md) | VC707, ROM organization, clock IP, pin assignments, and project creation |
| [Input data](../data/README.md) | Sequence-pair text files and binary ROM examples |
| [Program checks and simulation](testing.md) | CPU integration checks and Vivado simulation commands |

## Thesis and presentation

The [thesis](../Hetergenous_Thesis_FYP_Thesis.pdf) presents the project's background, methodology, implementations, and results. The [presentation](presentations/FYP_Presentation_Ver3.pptx) provides the project overview and implementation discussion.
