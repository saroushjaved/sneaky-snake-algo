# Sneaky Snake Algorithm

Final year project: **Hands on Algorithm Acceleration using Heterogeneous Computing Systems**.

This repository archives the project's Sneaky Snake genome pre-alignment filtering implementation and supporting documentation.

## Contents

- `software/cpu/src/`: original filter kernel and portable OpenMP runner.
- `software/cpu/include/`: filtering API.
- `software/cpu/archive/`: distinct historical runners and experiments.
- `hardware/fpga/`: original FPGA RTL, testbenches, component checks, and completeness review.
- `data/samples/`: small synthetic input; `data/local/`: original inputs, ignored by Git.
- `docs/import-manifest.json`: original paths, retained paths, and SHA-256 hashes.
- `docs/cpp-import.md`: cleanup decisions and known limitations.
- `docs/recovered-project-audit.md`: final-project recovery, publication decisions, and current FPGA status.
- `docs/presentations/`: recovered versioned final-project presentation.
- `Hetergenous_Thesis_FYP_Thesis.pdf`: project thesis.

Historical cloud runner and Azure VM configuration are described in [the additional import notes](docs/history/README.md). The [FPGA archive](hardware/fpga/README.md) now includes the recovered LZC and ROM-based board project. Its full filter hierarchy elaborates, but known functional wiring defects and board/IP migration gaps remain; see the [recovery audit](docs/recovered-project-audit.md). Cloud provisioning scripts have not yet been imported. The paper PDF is excluded from Git.

## Build

Requires C++17 and OpenMP. With CMake 3.16 or newer:

```sh
cmake -S . -B build
cmake --build build --config Release
```

Alternatively, create `build/` and compile directly with GCC/MinGW:

```sh
g++ -std=c++17 -O2 -fopenmp -Isoftware/cpu/include software/cpu/src/main.cpp software/cpu/src/SneakySnake.cpp -o build/sneaky_snake
```

## Run

```sh
./build/sneaky_snake data/samples/smoke.txt 0 4
python tests/check_runner.py build/sneaky_snake
```

On Windows use `build/sneaky_snake.exe`, or `build/Release/sneaky_snake.exe` with Visual Studio multi-configuration builds. Compiler runtime DLLs must be on `PATH`.

See [CPU documentation](software/cpu/README.md) for input format, arguments, timing, and limitations. No license has been selected yet; attribution and permissions for upstream material should be established before reuse.

Sneaky Snake is an existing algorithm; this repository documents the final year project's implementations and experiments.
