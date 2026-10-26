# FPGA implementation

The FPGA design represents Sneaky Snake filtering as mismatch-map generation, leading-zero counting, escape-segment selection, and eight-base processing stages.

## Source organization

| Directory | Contents |
| --- | --- |
| `rtl/` | Chip maze, LZCs, comparator, escape selection, filtering stages, and top-level filter |
| `tb/original/` | Stimulus testbenches for the design modules |
| `tb/review/` | Self-checking LZC, comparator, and chip-maze testbench |
| `scripts/` | Vivado compilation and simulation runner |
| `board/` | ROM-based board wrapper, constraints, native IP configurations, and project script |
| `tools/archive/` | DNA text-to-binary conversion scripts |

## Module hierarchy

```text
SneakySnake
├── ChipMaze
└── eightbitSneakySnake
    └── longestescape
        ├── leading_zero_8
        │   └── leading_zero_4bit
        └── comp_3bit
```

| Module | Function |
| --- | --- |
| `ChipMaze` | XORs encoded bases at the main and shifted positions, producing eleven mismatch tracks |
| `leading_zero_4bit` | Encodes the leading-zero information for a four-bit group |
| `leading_zero_8` | Combines two four-bit groups into an eight-bit leading-zero result |
| `comp_3bit` | Selects the larger encoded value with its validity information |
| `longestescape` | Uses LZCs and a comparator tree to select an escape segment across tracks |
| `eightbitSneakySnake` | Shifts an eight-base track group and updates local processing information |
| `SneakySnake` | Instantiates processing stages and compares the combined estimate with threshold five |

`longest_escape` in `longestescapesegnment.v` combines chip-maze generation and escape selection in a separate module. `counter.v` contains a standalone counter example.

## DNA encoding and mismatch tracks

The encoding is A=00, T=01, G=10, C=11. `LENGTH` represents the encoded sequence width in bits; 100 bases therefore use `LENGTH=200`.

The main track compares corresponding bases. Five upper and five lower tracks compare positions at offsets from one to five bases in either direction. A track bit of zero represents a match; a one represents a mismatch or an invalid shifted boundary.

The stage hierarchy groups tracks into eight-base slices. Leading-zero results describe matching runs from the beginning of each slice, and the comparator tree selects the longest available run.

## Simulation

Requires Python 3 and Vivado Simulator tools on `PATH`. Run from the repository root:

```sh
python hardware/fpga/scripts/review.py
```

Alternatively, specify the Vivado `bin` directory:

```sh
python hardware/fpga/scripts/review.py --vivado-bin /path/to/Vivado/bin
```

The script compiles design sources, runs the component testbench, and elaborates `sneaky_snake_tb`. Use `--components-only` to run only the component portion. Output files and logs are written under `build/fpga-review/`.

See the [board guide](board/README.md) for the ROM/clock wrapper and project creation, and the [testing guide](../../docs/testing.md) for testbench coverage and commands.
