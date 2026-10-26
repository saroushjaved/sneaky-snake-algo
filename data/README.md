# Input data

`samples/smoke.txt` contains three synthetic query/reference pairs for checking the runner.

`samples/fpga_demo.coe` is a newly authored synthetic 16 x 400-bit ROM image for reconstructing the recovered board project. It packs each 100-base query followed by its 100-base reference using A=00, T=01, G=10, C=11. It is not a performance dataset or expected-results file.

`local/` contains deduplicated original benchmark inputs retained during cleanup and is ignored by Git. See `../docs/import-manifest.json` for original locations and SHA-256 hashes. These inputs are not included in a fresh GitHub clone.

Input requires two equal-length uppercase sequences per line, separated by whitespace. See `../software/cpu/README.md` for details.

The recovered original-format ROM image is retained locally as `local/fpga/memory.coe`; its original hash and provenance are in `../docs/recovered-project-manifest.json`. It is not published with the synthetic sample.
