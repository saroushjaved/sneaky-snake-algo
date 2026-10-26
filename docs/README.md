# Documentation

Start with the [repository overview](../README.md), then choose the guide for the part of the project you want to build or inspect.

## Current guides

| Guide | Purpose |
| --- | --- |
| [CPU implementation](../software/cpu/README.md) | Build commands, CLI arguments, input format, timing, and API |
| [FPGA implementation](../hardware/fpga/README.md) | Module hierarchy, encoding, source organization, and simulator commands |
| [FPGA review](../hardware/fpga/REVIEW.md) | Current functional defects and remaining restoration work |
| [Board project](../hardware/fpga/board/README.md) | Reconstruct the ROM-based VC707 project and inspect locked IP |
| [Data](../data/README.md) | Public synthetic examples and local benchmark inputs |
| [Validation record](validation.md) | Completed checks, results, limitations, and reproduction commands |
| [Cloud history](history/README.md) | Historical Azure configuration and runner limitations |

## Original project material

- [Thesis](../Hetergenous_Thesis_FYP_Thesis.pdf).
- [Presentation archive](presentations/README.md).
- [Original CPU documentation](history/cpu-documentation.md), retained as historical documentation rather than current CLI instructions.

## Audit and provenance

The source cleanup retained useful project material and removed generated or unrelated files. Historical import paths in the records describe where files originally came from; they are not current filesystem locations.

| Record | Scope |
| --- | --- |
| [C++ import audit](cpp-import.md) | Initial CPU cleanup and runner changes |
| [Initial CPU manifest](import-manifest.json) | Original paths, retained files, and SHA-256 hashes |
| [Additional CPU/cloud manifest](additional-import-manifest.json) | Annotated sources and sanitized Azure snapshot |
| [Initial FPGA manifest](fpga-import-manifest.json) | The first 15 Verilog files, preserved unchanged |
| [Final-project recovery audit](recovered-project-audit.md) | Recovered LZC, board project, encoders, source variants, and cleanup |
| [Recovery manifest](recovered-project-manifest.json) | Selected files, transformations, deduplication, and hashes |
| [Import inventory](recovered-import-inventory.json) | Folder-level inventory of the removed 5.8 GB backup |

## Cleanup state

The raw `fpga_more_stuff/` backup, generated `build/` directory, and empty root `scripts/` folder were removed after recovery. The curated sources, local benchmark inputs, thesis, and versioned presentation were retained. Build tools regenerate their own output directories; recorded logs are not shipped as source files.

The manifests also describe retained local inputs under ignored `data/local/`. Those entries are intentionally unavailable in a fresh clone. The local paper PDF is excluded from Git.
