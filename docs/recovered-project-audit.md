# Recovered final-project audit

Audited October 26, 2026. Input: `fpga_more_stuff/`, 14,988 files totaling 5,798,732,043 bytes. After the curated files were verified and published, the user requested removal of extra material. The raw import, generated `build/` directory, and empty `scripts/` directory were then deleted. Retained project files and local datasets remain available.

## Final-project identification

`Final_Year_Project/.git/config` identifies the backup's origin as `https://github.com/saroushjaved/Final_Year_Project.git`. Its `FPGA/AHAH` project and the separate `FPGA Implementation/Implementation/SneakySnake` project share the same board wrapper. Both target `xc7vx485tffg1761-2`; the clock IP records VC707 board preset `xilinx.com:vc707:part0:1.4`.

The projects reference the same seven filter design files from an old ModelSim examples directory plus a four-bit LZC from `fifointergration`. The 15 files in `FYP CODE` match the earlier `fpga_stuff` import byte for byte. The larger backup therefore recovers surrounding project artifacts and the missing LZC, but does not supply a corrected replacement filter kernel.

## Published additions

| Material | Location and decision |
| --- | --- |
| Four-bit LZC and original bench | `hardware/fpga/rtl/LZC_4.v`, `hardware/fpga/tb/original/LZC_4_tb.v`; completes the filter's module hierarchy |
| Final ROM/clock/count wrapper | `hardware/fpga/board/rtl/top.v`; preserved unchanged |
| Pin constraints and native IP configurations | `hardware/fpga/board/constraints/`, `board/ip/`; the obsolete ROM initialization path is replaced with `memory.coe` |
| Earlier board/LZC experiments | `hardware/fpga/board/archive/`; preserved separately and excluded from supported source lists |
| DNA encoder experiments | `hardware/fpga/tools/archive/`; identify A=00, T=01, G=10, C=11; preserved unchanged |
| Distinct CPU/cloud source variants | `software/cpu/archive/recovered/`; source-equivalent copies map to already retained files |
| Versioned project presentation | `docs/presentations/FYP_Presentation_Ver3.pptx`; original file preserved unchanged |
| New reconstruction and review support | `hardware/fpga/board/create_project.tcl`, expanded component checks, and synthetic `data/samples/fpga_demo.coe` |

`recovered-project-manifest.json` records each selected file, original hash, destination, retained hash, and any transformation or deduplication. Source-token deduplication ignores comments and whitespace, and is distinguished from exact byte retention. `recovered-import-inventory.json` records file counts, bytes, and decisions for every top-level import group.

## What changed in the FPGA assessment

- The missing `leading_zero_4bit` was recovered from the source path referenced by the final project. Its 16 input combinations and the existing eight-bit LZC's 256 combinations pass exhaustive encoding/validity checks.
- The full `sneaky_snake_tb` hierarchy now elaborates in Vivado 2025.2. This removes the previous missing-module blocker. Full-filter correctness remains unverified.
- The final board wrapper, some pin constraints, ROM/clock IP settings, and encoder scripts now exist in the archive. The original project was not self-contained: it referenced absolute source and ROM paths on an old workstation.
- The wrapper selects one of 16 ROM addresses through external `addra`; it does not automatically iterate over a dataset. It increments a three-bit counter only on a rising edge of `Accepted`. Consecutive accepted pairs without a falling decision edge are not counted individually, and the counter wraps modulo eight.
- The original constraints assign address switches, reset, and three count outputs. They do not include differential-clock pin assignments or a top-level `create_clock` command. The clock IP contains board metadata, but the published XDC alone is insufficient evidence of complete timing/pin constraints.
- Original IP customizations were made with Vivado 2021.2. The reconstruction script prepares a project in Vivado 2025.2, but both IP cores are locked because their revisions differ. The clock core also reports a board-preset mismatch in a part-only reconstructed project. The IP status report must be resolved before generating outputs or implementing the design.
- Clock metadata is inconsistent: the input is configured for 200 MHz, `CLKOUT1_REQUESTED_OUT_FREQ` is 10 MHz, while some recorded model/interface values report 100 MHz. Do not assume a validated processing-clock frequency from these files.

The original filter still has the edit-count width, stage wiring, maximum-selector connection, 96/100-base coverage, and clocking/protocol defects described in `hardware/fpga/REVIEW.md`. Recovering project files does not repair those defects.

## Data and ROM handling

`binfilegen/memory.coe` contains 16 words of 400 bits and has been copied to ignored `data/local/fpga/memory.coe`. Its dimensions fit the recovered ROM. It is not proven to be the exact missing `data.coe` referenced by the original project. Curated datasets under `data/local/` remain; other raw encoded outputs and initialization artifacts were removed with the import.

`data/samples/fpga_demo.coe` is newly authored synthetic data with the same dimensions. It supports project reconstruction in a public clone without redistributing the original benchmark inputs. It is not a benchmark or an expected-results file.

The original encoders silently ignore non-ATGC characters, assume fixed filenames, and do not validate sequence length. One repeatedly rewrites the output as it reads input; the other emits comma-separated rows without a complete COE header/terminator. They document the historical encoding path and are not maintained converters.

## Material excluded from publication and subsequently removed

- Downloaded Ethernet, UART, FIFO, RIFFA/PCIe, and upstream SneakySnake sources. They are reference collections rather than evidence of an integrated final filter. The downloaded upstream design has different module names and interfaces; it was not substituted for the student's implementation.
- Vivado generated IP output, cache/run/simulation trees, compiled simulator libraries, nested Git metadata, binaries, and checkpoints.
- Older presentation drafts, thesis drafts/screenshots, downloaded books, Unreal/Inventor material, and unrelated experiments. The retained thesis PDF is published separately.
- An unrelated `projectgpt` experiment containing hardcoded API credentials. None of its files or credentials were published. Removing the local file does not revoke the credential; it should be revoked through the issuing account if still active.
- An early LZC prototype has assignments to undeclared `out` and lowercase `valid` instead of its declared outputs. It is kept only in `board/archive/lzc4_early_broken.v`; the restored RTL uses the properly connected version.

## Verification and limits

All selected files were checked against their retained hashes. The 15 initial FPGA files remain unchanged. Vivado 2025.2 parses the recovered design sources, passes 16 LZC4 vectors, 256 LZC8 vectors, 256 comparator vectors, and 70,400 ChipMaze bit checks, and elaborates the full filter hierarchy. Native board-project reconstruction completes and records the locked-IP warnings in `build/fpga-board/ip-status.txt`.

No synthesis, implementation, bitstream generation, FPGA programming, full-filter accuracy claim, or renewed CPU performance claim is made by this audit. Historical CPU/cloud files are not added to the maintained CMake target. Relevant archive additions are published. The original 5.8 GB input and generated build products were removed during the requested cleanup; recorded build logs can be regenerated using the documented scripts.
