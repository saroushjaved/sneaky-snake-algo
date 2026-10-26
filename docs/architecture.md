# Algorithm and architecture

## Genome pre-alignment filtering

A query sequence is a DNA read to be compared with a candidate reference sequence. Alignment considers substitutions, insertions, and deletions. An edit threshold defines the level of difference to consider when filtering candidate pairs.

Pre-alignment filtering precedes the alignment stage. Accepted pairs continue to alignment; rejected pairs are removed from that workload. The filter's decision is an estimate rather than an exact alignment or edit distance.

## Chip maze

Sneaky Snake maps sequence comparison to a routing problem. Each horizontal track compares the query and reference at a particular offset. The main track compares corresponding positions, while shifted tracks represent alternative offsets.

Each track contains matching positions and obstacles. In the FPGA representation, a zero denotes matching encoded bases and a one denotes a mismatch or an out-of-range shifted position.

An escape segment is a contiguous run of matching positions beginning at the current checkpoint. The algorithm selects the longest segment among the available tracks, advances the checkpoint, and accounts for an obstacle when further progress is needed. Processing continues until the sequence ends or the accumulated edit estimate exceeds the threshold.

## CPU architecture

The C++ implementation calculates track segments from the input sequences at each checkpoint. Three helper functions cover the main, upper, and lower routing tracks. The main `SneakySnake` function chooses the longest segment and updates the checkpoint and edit estimate.

The command-line runner loads sequence pairs and distributes them across OpenMP workers. Each worker processes separate pairs; reduction combines accepted and rejected counts. A steady clock measures the parallel filtering interval.

## Cloud execution

The cloud implementation uses the CPU algorithm on a Linux virtual machine. The sequence file, threshold, and thread count define an execution. VM resources provide the computing environment for parallel processing and performance experiments.

## FPGA architecture

The hardware implementation exposes the filtering computation as a collection of Verilog modules:

```text
Encoded query and reference
            |
         ChipMaze
            |
  Main and shifted mismatch tracks
            |
  Eight-base processing blocks
            |
  Leading-zero counters and maximum selection
            |
  Local edit estimates and threshold comparison
            |
         Accepted
```

The board wrapper obtains packed sequences from block ROM. Its clocking IP supplies the processing clock, and its output counter responds to rising transitions of the filter decision.

## Data representation

The CPU operates on uppercase sequence strings. The FPGA encoders use two bits per nucleotide:

| Base | Encoding |
| --- | --- |
| A | 00 |
| T | 01 |
| G | 10 |
| C | 11 |

A 100-base sequence occupies 200 bits. A ROM word combines a query and reference into 400 bits. See the [data guide](../data/README.md) for example files.
