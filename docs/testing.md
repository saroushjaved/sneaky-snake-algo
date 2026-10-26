# Program checks and simulation

## CPU checks

After building the C++ executable, run the Python integration-check script from the repository root:

```sh
python tests/check_runner.py build/sneaky_snake
```

For MinGW use `build/sneaky_snake.exe`; for Visual Studio Release builds use `build/Release/sneaky_snake.exe`.

The script exercises sequence-pair examples, edit thresholds, single-thread and multithread counts, input parsing, and command-line arguments. Python 3 is required to run it.

## FPGA simulation

With Vivado Simulator tools available on `PATH`:

```sh
python hardware/fpga/scripts/review.py
```

To supply the tool directory explicitly:

```sh
python hardware/fpga/scripts/review.py --vivado-bin /path/to/Vivado/bin
```

The script compiles the Verilog sources, runs `component_checks`, and elaborates `sneaky_snake_tb`. `--components-only` selects only the component checks.

The component testbench covers the four-bit LZC, eight-bit LZC, comparator, and chip-maze tracks. It compares encoded counts, validity signals, and mismatch bits with expected values, including shifted sequence boundaries.

Vivado output and numbered logs are written to `build/fpga-review/`. Individual stimulus benches are stored in `hardware/fpga/tb/original/`.
