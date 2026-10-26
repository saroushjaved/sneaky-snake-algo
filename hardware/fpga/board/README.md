# Recovered ROM-based board project

This is the historical board integration recovered from the final-project backup. `rtl/top.v` reads two packed 100-base sequences from a 400-bit ROM word and connects them to `SneakySnake`. Address selection is external. A three-bit counter increments on rising edges of the filter's `Accepted` output.

The wrapper is preserved, not corrected: it has no pair-valid handshake, no automatic ROM scan, no pipeline reset, and cannot count consecutive accepted pairs reliably. The underlying filter defects also remain. See [the recovery audit](../../../docs/recovered-project-audit.md).

## Reconstruct a project

With Vivado's executable available:

```sh
vivado -mode batch -source hardware/fpga/board/create_project.tcl -tclargs data/samples/fpga_demo.coe
```

Run from the repository root. The script resolves the COE argument relative to the working directory and creates `build/fpga-board/`. It refuses to overwrite an existing project. Use your own 16-word, 400-bit binary COE file instead of the synthetic sample when restoring the original experiment.

The script uses device `xc7vx485tffg1761-2`, imports working copies of the original native XCI configurations, and updates the ROM path in that working copy before import. It prepares source order and writes `ip-status.txt`. It does not synthesize, implement, generate a bitstream, or program hardware.

Project preparation was tested with Vivado 2025.2 using the locally retained original-format ROM. Both recovered IP configurations report locked revisions from Vivado 2021.2, and the clock core reports a VC707 board-preset mismatch when only the part is selected. These must be resolved before a board build. The script intentionally does not silently upgrade historical IP or invent clock constraints.

## Files

- `rtl/top.v`: final wrapper, unchanged.
- `constraints/const_1.xdc`: original switch/reset/count-output pin constraints, unchanged. Differential-clock assignments and an explicit primary clock constraint are absent.
- `ip/blk_mem_gen_0.xci`: Single Port ROM, 16 x 400 bits, registered primitive output. Only the obsolete COE path is changed to `memory.coe` in the archive.
- `ip/clk_wiz_0.xci`: original differential-clock configuration. Clock-frequency metadata needs review before use.
- `archive/`: earlier wrappers and an incomplete LZC prototype; excluded from the reconstruction source list.

The original `.xpr` depended on external workstation paths and generated checkpoints. The source-based reconstruction replaces those path dependencies. The raw backup and generated build project were removed during the requested cleanup; rerun the script to recreate the project.
