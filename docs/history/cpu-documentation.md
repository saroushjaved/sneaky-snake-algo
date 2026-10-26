# CPU filtering functions

**Authors:** Mahgul Adnan and Soroush Javed Sulehri

**Project:** Hands on Algorithm Acceleration using Heterogeneous Computing Systems

## SneakySnake

```cpp
int SneakySnake(int ReadLength, char* Ref, char* Que,
                int EditThreshold, int KmerSize,
                int DebugMode, int IterationNo);
```

The function receives a query/reference pair and edit threshold. It initializes a checkpoint and edit estimate, compares available escape segments, and advances through the sequence. It returns `1` when the pair is accepted by the filter and `0` when it is rejected.

## Horizontal routing tracks

| Function | Role |
| --- | --- |
| `main_hrt(q, r, N, checkpoint)` | Counts consecutive matching positions on the main track |
| `upper_hrt(q, r, E, N, checkpoint)` | Searches shifted comparisons in the upper track group |
| `lower_hrt(q, r, E, N, checkpoint)` | Searches shifted comparisons in the lower track group |

`q` and `r` identify the sequences, `N` is their length, `E` is the edit threshold, and `checkpoint` is the starting position for the current comparison.

## Processing flow

1. Obtain an escape-segment length from each track group.
2. Select the longest segment.
3. Advance the checkpoint by that length.
4. Account for an obstacle when the checkpoint remains inside the sequence.
5. Continue until the sequence ends or the threshold is exceeded.

The command-line program applies this function to input pairs using an OpenMP parallel loop. See the [CPU guide](../../software/cpu/README.md) for build commands, parameters, input format, and output fields.
