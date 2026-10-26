# Sneaky Snake Algorithm

## Hands on Algorithm Acceleration using Heterogeneous Computing Systems

**Authors:** Mahgul Adnan and Soroush Javed Sulehri

**Institution:** Pakistan Institute of Engineering and Applied Sciences (PIEAS)

This final year project explores genome pre-alignment filtering using the Sneaky Snake algorithm on multicore CPUs, cloud virtual machines, and FPGA hardware. The repository contains C++ and OpenMP implementations, Verilog modules, board integration files, and the project thesis and presentation.

## Project overview

Genome read alignment compares a query sequence with a reference sequence. Pre-alignment filtering reduces the number of pairs sent to an alignment algorithm by first estimating whether they fall within a chosen edit threshold.

Sneaky Snake represents comparisons as a chip maze. Horizontal tracks describe matches and mismatches at different sequence offsets. The algorithm searches for long matching segments, advances through the maze, and accumulates an edit estimate to decide whether to accept the pair for alignment.

The project explores this computation through three approaches:

- **CPU:** C++ implements the filtering algorithm, with OpenMP distributing independent sequence pairs across threads.
- **Cloud:** The CPU implementation runs on a Linux virtual machine, allowing experiments with different thread counts and machine resources.
- **FPGA:** Verilog modules generate mismatch tracks, count leading zeros, select escape segments, and combine local processing stages into an acceptance decision.

## Repository structure

```text
software/cpu/        C++ filtering kernel, OpenMP runner, and implementation variants
hardware/fpga/       Verilog modules, testbenches, board files, and simulation tools
data/samples/        Example sequence pairs and FPGA ROM data
docs/                Project documentation and presentation
tests/               CPU program checks
CMakeLists.txt       CPU build configuration
```

## Build and run the CPU implementation

Requires a C++17 compiler with OpenMP and CMake 3.16 or newer:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
./build/sneaky_snake data/samples/smoke.txt 0 4
```

With Visual Studio on Windows:

```powershell
./build/Release/sneaky_snake.exe data/samples/smoke.txt 0 4
```

The command accepts an input file, edit threshold, and optional thread count. Each input line contains a query and reference sequence separated by whitespace. The program reports accepted and rejected pair counts and filtering time.

See the [CPU guide](software/cpu/README.md) for direct GCC/MinGW commands, input format, and the filtering API.

## FPGA implementation

The FPGA design uses two-bit DNA encoding and eleven comparison tracks: one main track and five shifted tracks in each direction. Leading-zero counters and a comparator tree identify escape segments for eight-base processing blocks.

The board design connects the filter to a block ROM and clock generator on a Virtex-7 VC707 platform. Each 400-bit ROM word stores a 100-base query and a 100-base reference.

See the [FPGA guide](hardware/fpga/README.md) for the module hierarchy and simulation commands, and the [board guide](hardware/fpga/board/README.md) for project setup.

## Documentation

- [Project guide](docs/README.md)
- [Algorithm and architecture](docs/architecture.md)
- [Cloud implementation](docs/history/README.md)
- [Input data](data/README.md)
- [Running program checks and simulations](docs/testing.md)
- [Project thesis](Hetergenous_Thesis_FYP_Thesis.pdf)
- [Project presentation](docs/presentations/FYP_Presentation_Ver3.pptx)

Sneaky Snake is the underlying pre-alignment filtering algorithm studied in this project. The repository documents the authors' implementations and experiments using heterogeneous computing systems.

## Publication

Mahgul Adnan, Soroush Javed Sulehri, Muhammad Ali Akhtar, and Muhammad Aqil, **“Accelerating Genome Sequence Analysis via Pre-Alignment Filtering: A Review of Sneaky Snake Algorithm,”** *2024 21st International Bhurban Conference on Applied Sciences and Technology (IBCAST)*, 2024.

**DOI:** [10.1109/IBCAST61650.2024.10877257](https://doi.org/10.1109/IBCAST61650.2024.10877257)
