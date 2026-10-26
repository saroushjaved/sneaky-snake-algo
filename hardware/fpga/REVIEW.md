# FPGA completeness review

Current assessment after final-project recovery and cleanup, October 26, 2026.

**The filter hierarchy elaborates, but the FPGA implementation is not yet functionally validated or ready for a verified board demonstration.** The missing four-bit LZC was recovered and tested. The board wrapper, partial pin constraints, native ROM/clock IP configurations, and encoder experiments are also present. Their recovery resolves the initial missing-artifact findings; the defects below remain in the preserved design.

## Confirmed RTL findings

Line references refer to unchanged imported files.

| Priority | Location | Finding and effect |
| --- | --- | --- |
| High | `rtl/sneakysnake.v:2,351-373` | Default `LENGTH=100` creates only 50 mismatch bits, although slices extend to index 95. The final bench and board wrapper use 200 input bits for 100 bases, but processing blocks cover only bases 0-95; the final four bases have no processing block. |
| High | `rtl/sneakysnake.v:53-373,378` | Twelve undeclared `EditOut*` nets become implicit scalar wires for two-bit outputs, truncating counts before the acceptance sum. `Sum37` is also an implicit scalar, although its final sum is not used for acceptance. |
| High | `rtl/sneakysnake.v:192-198` | The third stage for bases 40-47 uses undriven `Sum18` and `Live18` instead of the preceding stage's `Sum17` and `Live17`. |
| High | `rtl/longestescape.v:83` | `comp_11.A2` connects to `comp2_3B` instead of `comp2_3C`, duplicating the middle count bit and losing the high bit on that branch. |
| High | Clocked datapath | Dependent positive-edge blocks use blocking assignments without a defined reset/valid protocol. Sampling order, pipeline latency, and consecutive-pair behavior need explicit design and simulation. |
| Medium | `tb/original/longestescape_tb.v:11` | Seven positional arguments are connected to a sixteen-port module; this original bench is incompatible with the supplied interface. It is not part of the passing self-checking test. |
| Medium | `rtl/longestescapesegnment.v:38,83` | The experimental wrapper hardcodes child width 16 instead of forwarding `LENGTH`, and uses `A0` instead of `K0` for comparator `com6`. It is separate from the main hierarchy. |

The eight-base processing chain's local edit estimate, seven/eight-zero accumulation branches, and treatment of subproblem boundaries still need comparison with a reference model. Passing the leaf-component tests does not establish those behaviors. The standalone `counter.v` is unused in the filter hierarchy and was not synthesized or validated by this review.

## Board integration findings

The recovered `board/rtl/top.v` connects a 16 x 400-bit ROM and clock IP to the filter. Each word packs two 100-base sequences. The user supplies `addra`; the wrapper does not scan the ROM automatically.

The wrapper increments a three-bit counter on a rising edge of `Accepted`. Consecutive accepted input pairs can therefore be missed, and the count wraps modulo eight. There is no per-pair valid handshake or filter pipeline reset.

The original constraints assign address inputs, reset, and count outputs. Differential-clock pin assignments and an explicit primary `create_clock` are absent from that XDC. The clock metadata contains conflicting frequency values and needs review.

The board project targets `xc7vx485tffg1761-2`. In Vivado 2025.2, its recovered 2021.2 ROM and clock IP customizations are locked because their revisions differ. The clock IP also reports a VC707 board-preset mismatch in the part-only reconstructed project. Project creation completed, but synthesis and implementation were not attempted. See the [board guide](board/README.md).

## Verified results

- LZC4: 16 input combinations passed.
- LZC8: 256 input combinations passed.
- Comparator: 256 operand/validity combinations passed.
- ChipMaze: 70,400 bit comparisons passed, including shifted boundary masks and tail mismatches in the map itself.
- Full filter: elaboration passed after restoring `leading_zero_4bit`.

The ChipMaze tail check verifies map generation; it does not compensate for the missing processing block in the full filter. The original stimulus benches do not provide full-filter assertions or a reference model; several clock indefinitely without an external time bound.

Run `python hardware/fpga/scripts/review.py` from the repository root with Vivado tools on `PATH`. The script executes the component checks and elaborates the full hierarchy. A successful exit is not a full-filter correctness result. Detailed scope is in the [validation record](../../docs/validation.md).

## Remaining restoration work

1. Correct the confirmed widths, stage connections, maximum-selector wiring, and four-base tail coverage.
2. Define reset, input stability or handshake, output validity, and pipeline latency; verify consecutive pairs.
3. Check escape selection, eight-base processing, and the full filter against a reference model, including threshold and subproblem boundaries.
4. Correct the board's per-pair counting, resolve IP revision/board settings, and complete the clock constraints.
5. Synthesize and implement for the selected device, inspect resource/timing reports, then validate on hardware.

The [recovery audit](../../docs/recovered-project-audit.md) and [source manifests](../../docs/README.md) preserve the import history. Raw backup folders and generated builds were removed after recovery; the curated sources remain.
