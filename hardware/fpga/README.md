# FPGA source archive

**Status: recovered historical implementation; full hierarchy elaborates, but functional defects remain.** The later backup supplied the missing LZC and a ROM-based board project. It does not yet establish a correct end-to-end filter or reproducible board demonstration. See [the recovery audit](../../docs/recovered-project-audit.md) for current results and [the initial review](REVIEW.md) for the original findings.

All 15 imported Verilog files are preserved unchanged. `../../docs/fpga-import-manifest.json` records their original names, retained paths, and SHA-256 hashes.

Recovered additions are recorded separately in `../../docs/recovered-project-manifest.json`.

## Layout

| Directory | Purpose |
| --- | --- |
| `rtl/` | Eight initial design files plus the recovered four-bit LZC |
| `tb/original/` | Seven initial stimulus benches plus the recovered LZC4 bench |
| `tb/review/` | New self-checking component tests |
| `scripts/` | Reproducible local Vivado review command |
| `board/` | Recovered board wrapper, constraints, native IP settings, and reconstruction script |
| `tools/archive/` | Original DNA encoding experiments |

The intended hierarchy is:

```text
SneakySnake                  top-level acceptance decision
├── ChipMaze                 11 mismatch tracks, offsets -5 through +5
└── eightbitSneakySnake      36 instances: 12 blocks x 3 processing stages
    └── longestescape        select longest leading-zero run across tracks
        ├── leading_zero_8
        │   └── leading_zero_4bit  recovered from the final-project source path
        └── comp_3bit
```

`longest_escape` in `longestescapesegnment.v` is a separate experimental wrapper. `counter.v` is not instantiated in the filter hierarchy.

## Data representation

`ChipMaze.LENGTH` is the input width in **bits**, with two bits per DNA base. A 100-base sequence therefore requires `LENGTH=200`, as used by `final_tb.v`. Track outputs then contain 100 mismatch bits: `0` means equal encoded bases, `1` means mismatch or an invalid shifted boundary. The top-level default of `100` describes only 50 encoded bases and does not fit its hardcoded block slices.

Recovered encoders use A=00, T=01, G=10, C=11. They remain historical utilities under `tools/archive/`. The RTL compares packed symbols; it does not parse DNA text. Shift range and edit threshold are fixed at five in the intended top-level design, rather than general runtime parameters.

## Reproduce the review

Requires Python 3 and Vivado Simulator (`xvlog`, `xelab`, and `xsim`). This was run with Vivado 2025.2 on Windows:

```sh
python hardware/fpga/scripts/review.py --vivado-bin D:/Xilinx_2025.2/2025.2/Vivado/bin
```

If Vivado's tools are on `PATH`, omit `--vivado-bin`. Build products and logs go under ignored `build/fpga-review/`.

The default command checks the LZCs, comparator, and ChipMaze, then elaborates the recovered full-filter hierarchy. Elaboration now succeeds, with warnings; this is not a functional full-filter test. For only the component checks:

```sh
python hardware/fpga/scripts/review.py --components-only
```

The LZC4 and LZC8 encoding/validity checks are exhaustive over 16 and 256 inputs. Component checks do not establish the correctness of the full filter, escape selector, stage chain, or acceptance decision. No verified bitstream or board implementation is supplied or claimed.
