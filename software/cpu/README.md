# CPU implementation

The CPU implementation uses C++ for Sneaky Snake filtering and OpenMP for parallel processing of independent query/reference pairs.

## Source organization

| Path | Role |
| --- | --- |
| `src/main.cpp` | Command-line arguments, sequence loading, OpenMP loop, counters, and timing |
| `src/SneakySnake.cpp` | Checkpoint traversal and horizontal routing-track functions |
| `include/SneakySnake.h` | Filter function declaration |
| `archive/runners/` | CPU and cloud runner variants |
| `archive/experiments/` | Chip-maze, threading, and sequence-conversion experiments |
| `archive/recovered/` | Additional CPU and cloud implementation variants |

## Build

Run commands from the repository root. Requires C++17 and OpenMP. With CMake 3.16 or newer:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
```

Direct GCC build on a POSIX shell:

```sh
mkdir -p build
g++ -std=c++17 -O2 -fopenmp -Isoftware/cpu/include software/cpu/src/main.cpp software/cpu/src/SneakySnake.cpp -o build/sneaky_snake
```

Direct MinGW build in PowerShell:

```powershell
New-Item -ItemType Directory -Force build | Out-Null
g++ -std=c++17 -O2 -fopenmp -Isoftware/cpu/include software/cpu/src/main.cpp software/cpu/src/SneakySnake.cpp -o build/sneaky_snake.exe
```

For Windows builds, keep the compiler's runtime DLL directory on `PATH`. Visual Studio multi-configuration builds place the executable under `build/Release/` when building with `--config Release`.

## Usage

```text
sneaky_snake <dataset> <edit-threshold> [threads]
```

| Argument | Meaning |
| --- | --- |
| `dataset` | Path to a sequence-pair text file |
| `edit-threshold` | Nonnegative integer controlling filtering |
| `threads` | Positive OpenMP thread count; defaults to 1 |

Example:

```sh
./build/sneaky_snake data/samples/smoke.txt 0 4
```

On Windows, use `build/sneaky_snake.exe` for MinGW or `build/Release/sneaky_snake.exe` for Visual Studio.

## Input and output

Each row contains exactly two whitespace-separated uppercase sequences of equal, nonzero length:

```text
ACGT ACGT
AAAA TTTT
ACGT ACGA
```

The accepted alphabet is `A`, `C`, `G`, `T`, and `N`. The program compares `N` literally. It reads all pairs before parallel filtering, and reports the number of pairs, requested threads, accepted pairs, rejected pairs, and filtering time in milliseconds. Timing covers filtering and OpenMP loop overhead; input parsing occurs before the measured interval.

## Filtering API

```cpp
int SneakySnake(int ReadLength, char* Ref, char* Que,
                int EditThreshold, int KmerSize,
                int DebugMode, int IterationNo);
```

`ReadLength` is the length of each sequence. `Ref` and `Que` point to the reference and query, and `EditThreshold` supplies the threshold. The runner passes zero for `KmerSize`, `DebugMode`, and `IterationNo`, which are compatibility arguments in this implementation.

The function returns `1` for acceptance and `0` for rejection. `main_hrt`, `upper_hrt`, and `lower_hrt` find matching runs on the main and shifted tracks; the filter chooses the longest run to advance its checkpoint.

See the [algorithm guide](../../docs/architecture.md) and [program-check instructions](../../docs/testing.md) for further details.
