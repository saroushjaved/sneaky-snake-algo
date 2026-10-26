# Input data

`samples/smoke.txt` contains three synthetic query/reference pairs for checking the runner.

`local/` contains deduplicated original benchmark inputs retained during cleanup and is ignored by Git. See `../docs/import-manifest.json` for original locations and SHA-256 hashes. These inputs are not included in a fresh GitHub clone.

Input requires two equal-length uppercase sequences per line, separated by whitespace. See `../software/cpu/README.md` for details.
