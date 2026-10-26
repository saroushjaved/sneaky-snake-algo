# FPGA completeness review

**Historical first-import review.** The later final-project backup recovered the missing LZC, a board wrapper, constraints, native IP settings, and encoder utilities. Full-filter elaboration now succeeds. The functional wiring/coverage findings below remain; missing-artifact and elaboration-failure statements describe the first 15-file import. See [the recovery audit](../../docs/recovered-project-audit.md) for current status and test results.

Reviewed October 26, 2026. Scope: all 15 files imported from `fpga_stuff/`, their module hierarchy, widths, connections, stimulus benches, and the independent component simulations described below. Original Verilog bytes were preserved; no missing algorithm or board artifacts were invented.

## Conclusion

These files capture a substantial part of the intended FPGA datapath, but **they do not perform the whole project as supplied**. They fail full elaboration, contain independent functional wiring defects, and lack the surrounding board system. Publishing them as an incomplete historical source archive is appropriate. Calling them a verified 100-base FPGA filter or a reproducible board demonstration is not supported by this import.

## Confirmed findings

Line references below refer to the unchanged imported files under `rtl/` or `tb/original/`.

| Severity | Location | Finding and effect |
| --- | --- | --- |
| Blocker | `rtl/LZC_8.v:20,23` | Instantiates `leading_zero_4bit`, which is absent from all supplied sources. Vivado cannot elaborate the full hierarchy. |
| High | `rtl/sneakysnake.v:2,351-373` | Default `LENGTH=100` provides only 50 mismatch bits, while slices extend to index 95. The final bench overrides it to 200 bits for 100 bases, but only blocks 0-95 are processed; bases 96-99 have no processing block. |
| High | `rtl/sneakysnake.v:53-373,378` | The twelve `EditOut*` nets are undeclared, so Verilog creates scalar implicit wires for two-bit module outputs. Counts such as 2 and 3 lose their most significant bit before the acceptance sum. `Sum37` is also implicit and scalar, although that final sum is not used by the acceptance expression. |
| High | `rtl/sneakysnake.v:192-198` | The third stage for bases 40-47 reads `Sum18` and `Live18`, neither of which has a driver, instead of the preceding stage's `Sum17`/`Live17`. This feeds unknown values into the stage. |
| High | `rtl/longestescape.v:83` | Comparator `comp_11` connects `A2` to `comp2_3B` instead of `comp2_3C`. It duplicates the middle count bit and discards the high count bit on that branch, corrupting escape selection. |
| High | Clocked datapath throughout | Multiple dependent `always @(posedge clk)` blocks use blocking assignments. Inter-module sampling order is not defined by a reliable registered pipeline. There is no reset or input/output valid protocol to identify when a decision belongs to a new pair. Latency and consecutive-pair behavior require explicit design and simulation. |
| Medium | `tb/original/longestescape_tb.v:11` | Connects seven positional arguments to `longestescape`, whose interface has sixteen ports (clock, eleven tracks, four outputs). This bench is incompatible with the supplied module. |
| Medium | `rtl/longestescapesegnment.v:38,83` | The experimental wrapper fixes its child ChipMaze width at 16 instead of forwarding `LENGTH`; comparator `com6` also uses `A0` where the K-track input requires `K0`. It is separate from the main hierarchy. |

Additional algorithm questions remain after the structural fixes. The eight-base stage has only three processing stages per block, special-case accumulation in the seven/eight-zero branch, and a local edit estimate. Its treatment of subproblem boundaries and equivalence to the intended filter need a reference model and assertions. These aspects were not certified by the component checks.

The generic counter is unused by the main filter and is not an accepted-read board counter as connected here. Its delay-based implementation and custom increment loop were not synthesized or validated during this review.

## What is missing for the complete system

- `leading_zero_4bit` source with an established output encoding and tests.
- Corrected top-level widths, four-base tail handling, edit-count nets, and stage/comparator wiring.
- Defined reset, input stability/handshake, pipeline latency, and output-valid behavior.
- Self-checking full-filter tests against a software/reference model, including threshold boundaries, shifted matches, mismatches in the final four bases, and consecutive input pairs.
- A board top level connecting clock/reset, sequence input or ROM, processing control, accepted-read counting, and LEDs or another observable result.
- ROM/IP configuration, initialization data (such as COE/MEM), and the DNA encoding/conversion utility needed to reproduce the original input path.
- Device/board selection, pin and clock constraints (`.xdc`), and project-generation/build scripts.
- Synthesis, implementation, resource/timing results, and hardware validation for a chosen device.

No `.xdc`, project file, block design, ROM IP, memory initialization file, encoder script, or board wrapper was present in the imported folder. Their absence from this folder does not establish that they never existed elsewhere.

## Validation performed

| Check | Result |
| --- | --- |
| SHA-256 verification after organization | All 15 original Verilog files preserved unchanged |
| Vivado 2025.2 `xvlog` analysis | All 15 imported Verilog files parsed successfully |
| Full `xelab work.sneaky_snake_tb` | Failed with `VRFC 10-2063: Module <leading_zero_4bit> not found`; `XSIM 43-3322` static elaboration failed |
| Standalone `comp_3bit` simulation | Passed all 256 combinations of both three-bit operands and validity inputs |
| Standalone `ChipMaze`, `LENGTH=200` | Passed 70,400 bit checks: 64 sequence pairs x 11 shifts x 100 bases, including boundary masks, identical inputs, all mismatches, and a tail-mismatch case |
| Full filter simulation / synthesis / board validation | Not completed; the supplied hierarchy is incomplete |

The new bench is `tb/review/component_checks.sv`. The comparator check verifies its implemented validity/sentinel convention; it does not validate the missing LZC implementation. The ChipMaze check compares each track with direct two-bit base comparisons and marks out-of-range shifted positions as blocked. These passing results support those two components only.

The original benches supply a few stimulus vectors and monitors, but have no self-checking assertions or comprehensive reference results. Clocked benches also run indefinitely without a simulation time bound or an external stop. Merely displaying their waveforms would not prove end-to-end correctness.

## Suggested restoration order

1. Recover the missing LZC source, board/project files, constraints, and initialization/conversion files from the original project backup if available.
2. Correct the confirmed structural defects in a separate implementation change, preserving this import as the historical baseline.
3. Establish a deterministic clock/reset/valid protocol and verify individual LZC, maximum selection, and eight-base processing behavior.
4. Check the complete filter against a reference model, including all 100 bases and subproblem boundaries.
5. Rebuild the board wrapper and ROM path, then synthesize, constrain, implement, and validate on hardware.
