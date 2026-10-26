# Validation record

Recorded during the October 26, 2026 audit. These results describe the checked repository sources. Generated executables, simulation snapshots, logs, and reconstructed projects were subsequently removed during cleanup and can be recreated with the commands below.

## CPU

| Check | Result |
| --- | --- |
| Direct MinGW GCC 13.1 build, C++17 and OpenMP | Passed |
| Three-pair sample, threshold 0 | 1 accepted, 2 rejected |
| Three-pair sample, threshold 1 | 2 accepted, 1 rejected |
| Repeated 3,000-pair input, one versus four threads | Identical counts: 2,000 accepted, 1,000 rejected at threshold 1 |
| Empty, malformed, unequal-length, lowercase, and missing input; invalid numeric arguments | Rejected with a nonzero exit status |
| Local original 30,000-pair `100_bp_1.txt`, threshold 10 | Identical counts with one and four threads: 14,623 accepted, 15,377 rejected |
| CMake configure/build route | Provided but not exercised in the audit environment |

The maintained runner is checked by `tests/check_runner.py`. Example, after building:

```sh
python tests/check_runner.py build/sneaky_snake
```

On Windows, supply the actual `.exe` path, including `Release/` for a Visual Studio multi-configuration build. Python 3 is required for the integration checks, not for the C++ executable.

The kernel retains compiler warnings about unused compatibility parameters/variables and its final return structure. These checks do not establish comprehensive filtering accuracy, absence of false rejections on arbitrary input, or the thesis performance results. Filtering time in the maintained runner excludes parsing and is not directly comparable with the historical runners' timings.

## FPGA

Toolchain: Vivado Simulator 2025.2 on Windows.

| Check | Result and scope |
| --- | --- |
| Source analysis | Original and recovered RTL and stimulus benches parse |
| Four-bit LZC | All 16 input combinations passed encoding/validity checks |
| Eight-bit LZC | All 256 input combinations passed encoding/validity checks |
| Three-bit comparator | All 256 operand/validity combinations passed |
| ChipMaze at `LENGTH=200` | 70,400 bit checks passed across 64 pairs, 11 shifts, and 100 bases |
| Full filter hierarchy | `work.sneaky_snake_tb` elaborates after recovering `leading_zero_4bit`; warnings and functional defects remain |
| Full-filter reference comparison | Not performed |
| Board project preparation | Completed; both recovered IP cores report locked revisions, with an additional clock-IP board-preset mismatch |
| Synthesis, implementation, timing closure, bitstream, and hardware execution | Not validated |

With Vivado tools on `PATH`:

```sh
python hardware/fpga/scripts/review.py
```

Use `--components-only` to skip full-filter elaboration. Use `--vivado-bin /path/to/Vivado/bin` when the tools are not on `PATH`. The pass marker is:

```text
PASS: 16 LZC4 vectors, 256 LZC8 vectors, 256 comparator vectors and 70400 ChipMaze bit checks
```

The script writes numbered logs under `build/fpga-review/`. Its successful exit means the requested checks and elaboration completed; it does not mean the filter's acceptance decision is correct. See [the current FPGA review](../hardware/fpga/REVIEW.md).

Board preparation uses the [reconstruction script](../hardware/fpga/board/create_project.tcl) and writes an IP status report under `build/fpga-board/`. The original customizations were made with Vivado 2021.2. Project creation in 2025.2 succeeded with critical IP-lock/import warnings; an output project is not evidence of a successful board build.

## Data and preservation

- Imported source hashes were verified before deleting raw backup folders.
- The original 15-file FPGA import remains unchanged.
- Source-token deduplication is identified separately from exact copies in the recovery manifest.
- Public `data/samples/fpga_demo.coe` has 16 synthetic words, each 400 bits wide. Its shape is checked; it is not an accuracy or performance benchmark.
- Original benchmark datasets and the recovered original-format ROM are local and ignored by Git.
