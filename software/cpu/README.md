# CPU implementation

`src/SneakySnake.cpp` and `include/SneakySnake.h` preserve the imported final kernel byte for byte. The same kernel occurred in v2, v3, and the final project; the maintained build uses one copy.

`src/main.cpp` is a new portable C++17/OpenMP runner. The original final runner and earlier experiments remain in `archive/`.

## Usage

```text
sneaky_snake <dataset> <edit-threshold> [threads]
```

The edit threshold must be a nonnegative integer. Threads must be a positive integer and default to `1`. OpenMP may use fewer threads depending on runtime configuration.

Each input row must contain exactly two whitespace-separated uppercase query/reference sequences of equal, nonzero length. Allowed characters are `A`, `C`, `G`, `T`, and `N`; `N` is compared literally, not as a wildcard. Different rows may have different lengths. Missing files, empty inputs, blank lines, and malformed rows produce a nonzero exit status.

```text
ACGT ACGT
AAAA TTTT
ACGT ACGA
```

The supplied synthetic smoke sample produces one acceptance and two rejections at threshold zero, or two acceptances and one rejection at threshold one. Filter acceptance indicates a candidate for subsequent alignment, not an exact edit distance.

All input is loaded and validated before filtering. Each OpenMP worker processes a separate pair; reductions combine counters. This removes the original final runner's concurrent reads from one file stream. Memory use grows with input size.

Output reports total reads, requested threads, acceptances, rejections, and filtering wall time in milliseconds. Timing includes parallel loop overhead and excludes parsing. It is not directly comparable with original timings that included file reading inside the loop.

## API and limitations

```cpp
int SneakySnake(int ReadLength, char* Ref, char* Que,
                int EditThreshold, int KmerSize,
                int DebugMode, int IterationNo);
```

Returns `1` for acceptance and `0` for rejection. The runner passes zero for the last three compatibility parameters; the kernel does not use them to alter its calculation. The kernel assumes valid pointers and lengths; the runner validates its input.

The kernel has been preserved, not independently proven against the published algorithm. Compiler warnings about unused variables/parameters and its final return structure remain in the imported code. Runner checks cover basic filtering and parallel consistency, not comprehensive biological accuracy or thesis performance claims.

## Historical sources

The archive groups historical runners under `archive/runners/` and exploratory programs under `archive/experiments/`. It retains the final, v2, and v3 runners, a distinct runner recovered from the ZIP, the initial single-pair implementation, chip-maze printing, an OpenMP demonstration, a threading experiment, and string-to-array conversion. See [the import manifest](../../docs/import-manifest.json) for exact original paths and duplicate mappings.

These are reference sources, excluded from the maintained build. Some require MSVC-specific `strncpy_s`, fixed working directories, or hardcoded datasets. The chip-maze experiment has out-of-bounds indexing, the threading experiment leaves joinable threads, and the original final runner shares an input stream between workers. Use the maintained target for execution.

Additional annotated CPU and Azure runners are archived as `runners/annotated_cpu.cpp` and `runners/azure.cpp`. Their limitations and the historical VM configuration are documented in [the additional import notes](../../docs/history/README.md).
