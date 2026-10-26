# Sneaky Snake Algorithm

Final year project: **Hands on Algorithm Acceleration using Heterogeneous Computing Systems**.

**Authors:** Mahgul Adnan and Soroush Javed Sulehri

**Institution:** Pakistan Institute of Engineering and Applied Sciences (PIEAS)

This repository contains the project's C++/OpenMP implementation, Verilog FPGA design, recovered board integration, thesis, and presentation. Sneaky Snake is an existing genome pre-alignment filtering algorithm; this project explores its implementation and acceleration across heterogeneous computing systems.

A pre-alignment filter accepts candidate sequence pairs for subsequent alignment or rejects dissimilar pairs. Its acceptance result is not an exact edit distance.

## Implementation status

| Area | Current state |
| --- | --- |
| CPU | Portable C++17/OpenMP runner; direct MinGW build and integration checks passed |
| Cloud | Historical CPU/cloud experiments and an Azure VM configuration snapshot; no deployment automation |
| FPGA components | Four- and eight-bit LZCs, comparator, and ChipMaze passed the documented component checks |
| FPGA filter | Full hierarchy elaborates in Vivado 2025.2; functional wiring, width, and sequence-coverage defects remain |
| Board integration | Recovered VC707 ROM/clock/count wrapper, constraints, and IP configurations; project reconstruction tested, but IP migration and clock constraints need work |

The FPGA design is an archived implementation under review. A verified FPGA bitstream or board demonstration is not provided. See the [current FPGA findings](hardware/fpga/REVIEW.md) and [validation record](docs/validation.md).

## CPU quick start

Requires a C++17 compiler with OpenMP. The CMake build definition requires CMake 3.16 or newer:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
./build/sneaky_snake data/samples/smoke.txt 0 4
python tests/check_runner.py build/sneaky_snake
```

With Visual Studio on Windows, use the configuration-specific executable:

```powershell
./build/Release/sneaky_snake.exe data/samples/smoke.txt 0 4
python tests/check_runner.py build/Release/sneaky_snake.exe
```

MinGW typically produces `build/sneaky_snake.exe`. Its runtime DLL directory must be on `PATH`. A direct GCC/MinGW build is documented in the [CPU guide](software/cpu/README.md); that route was used for the recorded local validation. The CMake route has not been exercised in the recorded audit environment.

The three-row smoke sample at threshold zero should report **1 accepted** and **2 rejected** pairs.

## FPGA review and project reconstruction

With Python 3 and Vivado Simulator tools on `PATH`, run:

```sh
python hardware/fpga/scripts/review.py
```

Alternatively, supply `--vivado-bin` with the path to your Vivado `bin` directory. The script runs self-checking component simulations and elaborates the full filter hierarchy. Passing elaboration does not resolve the [known functional defects](hardware/fpga/REVIEW.md).

To prepare the recovered board project using synthetic ROM data:

```sh
vivado -mode batch -source hardware/fpga/board/create_project.tcl -tclargs data/samples/fpga_demo.coe
```

This creates a project under `build/fpga-board/`; it does not generate a bitstream. See the [FPGA guide](hardware/fpga/README.md) and [board guide](hardware/fpga/board/README.md) for tool-version and IP limitations.

## Repository layout

```text
software/cpu/        Maintained CPU runner, original kernel, historical experiments
hardware/fpga/       Verilog RTL, testbenches, board integration, review tools
data/samples/        Public synthetic CPU and FPGA examples
docs/                Guides, validation record, import provenance, presentation
tests/               CPU runner integration checks
CMakeLists.txt       CPU build definition
```

The [documentation index](docs/README.md) links the detailed guides and audit records. The [thesis](Hetergenous_Thesis_FYP_Thesis.pdf) and [versioned presentation](docs/presentations/FYP_Presentation_Ver3.pptx) preserve the original project material; their historical results are separate from the current validation record.

Original benchmark inputs remain in ignored `data/local/` on the working machine and are not included in a GitHub clone. Downloaded reference collections, raw backup folders, generated builds, and unrelated files were removed during cleanup. Commands recreate the required build directories. The paper PDF remains excluded from Git.

## Attribution and license

The project authors are credited above; Sneaky Snake itself predates this project. Downloaded upstream implementations are not bundled as project-authored code. No repository license has been selected. Import manifests document retained source provenance and any deduplication or path changes.
