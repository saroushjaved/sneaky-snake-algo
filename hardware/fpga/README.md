# FPGA source archive

**Status: incomplete historical implementation. The full filter cannot elaborate as supplied.** The supplied files contain the intended filtering stages, but do not yet reproduce a working end-to-end or board-level system. See [the review](REVIEW.md) for confirmed blockers, test results, and missing artifacts.

All 15 imported Verilog files are preserved unchanged. `../../docs/fpga-import-manifest.json` records their original names, retained paths, and SHA-256 hashes.

## Layout

| Directory | Purpose |
| --- | --- |
| `rtl/` | Eight original design files, including the top-level filter and a standalone counter |
| `tb/original/` | Seven original stimulus testbenches |
| `tb/review/` | New self-checking component tests |
| `scripts/` | Reproducible local Vivado review command |

The intended hierarchy is:

```text
SneakySnake                  top-level acceptance decision
├── ChipMaze                 11 mismatch tracks, offsets -5 through +5
└── eightbitSneakySnake      36 instances: 12 blocks x 3 processing stages
    └── longestescape        select longest leading-zero run across tracks
        ├── leading_zero_8
        │   └── leading_zero_4bit  MISSING
        └── comp_3bit
```

`longest_escape` in `longestescapesegnment.v` is a separate experimental wrapper. `counter.v` is not instantiated in the filter hierarchy.

## Data representation

`ChipMaze.LENGTH` is the input width in **bits**, with two bits per DNA base. A 100-base sequence therefore requires `LENGTH=200`, as used by `final_tb.v`. Track outputs then contain 100 mismatch bits: `0` means equal encoded bases, `1` means mismatch or an invalid shifted boundary. The top-level default of `100` describes only 50 encoded bases and does not fit its hardcoded block slices.

The exact letter-to-two-bit conversion utility was not included. The RTL compares packed symbols; it does not parse DNA text. Shift range and edit threshold are fixed at five in the intended top-level design, rather than general runtime parameters.

## Reproduce the review

Requires Python 3 and Vivado Simulator (`xvlog`, `xelab`, and `xsim`). This was run with Vivado 2025.2 on Windows:

```sh
python hardware/fpga/scripts/review.py --vivado-bin D:/Xilinx_2025.2/2025.2/Vivado/bin
```

If Vivado's tools are on `PATH`, omit `--vivado-bin`. Build products and logs go under ignored `build/fpga-review/`.

The default command checks the standalone components and then tries to elaborate the full imported design. **Its nonzero exit status is expected for this incomplete archive**, because `leading_zero_4bit` is absent. For just the independently passing component checks:

```sh
python hardware/fpga/scripts/review.py --components-only
```

Component checks do not establish the correctness of the full filter, leading-zero counter, escape selector, stage chain, or acceptance decision. No bitstream or board implementation is supplied or claimed.
