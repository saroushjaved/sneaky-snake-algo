# C++ import audit

The imported `C++/` folder occupied 1,479,821,730 bytes (about 1.38 GiB). Most space was consumed by Visual Studio caches, intermediate files, debug symbols, compiled programs, and copied datasets.

## Cleanup

- Preserved every distinct `.cpp` and `.h` file from the source tree and ZIP. The ZIP contained a distinct runner, which was extracted before removing the archive.
- Preserved all distinct dataset content from source and build-output folders, including `read_one.txt`, under `data/local/`.
- Verified retained bytes using SHA-256 before deleting the import. `import-manifest.json` records original paths, retained paths, and hashes.
- Removed generated `.vs/`, `x64/`, Debug/Release output, objects, binaries, symbols, IDE databases, logs, and redundant ZIP packaging.
- Replaced Visual Studio solution/project scaffolding and per-user settings with a root CMake target. Historical source remains; old IDE settings were not retained.

The manifest describes imported files; it does not include newly authored runner code, documentation, and synthetic samples. The original algorithm and historical source bytes are preserved.

## Dataset publication

Original inputs remain local and ignored by Git. Their authoritative download locations and redistribution permissions were not supplied. A fresh GitHub clone includes the synthetic CPU sample and FPGA ROM example described in [the data guide](../data/README.md). The manifest records original filenames and hashes for identifying local benchmark inputs.

## Runner changes

The new runner replaces fixed paths, sequence lengths, loop counts, edit thresholds, and thread counts with input-derived lengths and command-line arguments. Input is validated before parallel processing. Workers process separate pairs and counters use OpenMP reductions, removing the shared-stream race. Timing now excludes parsing and should not be presented as an original benchmark measurement.

## Verification scope

The direct GCC/MinGW build and runner checks passed during the audit. The CMake configure/build flow was not exercised in that environment. Generated files were subsequently removed during cleanup. See [the validation record](validation.md) for results and reproduction commands. The preserved kernel still requires independent correctness validation against exact edit distance before making broad accuracy claims.
