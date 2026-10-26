# Input data

## CPU sequence pairs

The CPU program reads a text file containing one query/reference pair per line. The two sequences are separated by whitespace and have equal lengths:

```text
ACGT ACGT
AAAA TTTT
ACGT ACGA
```

Uppercase `A`, `C`, `G`, `T`, and `N` are accepted. The program compares `N` literally. [smoke.txt](samples/smoke.txt) provides a three-pair example.

## FPGA ROM data

The FPGA encoders use A=00, T=01, G=10, C=11. A 100-base query occupies 200 bits, and its reference occupies another 200 bits. Each 400-bit ROM word stores the query followed by the reference.

[fpga_demo.coe](samples/fpga_demo.coe) contains 16 synthetic words for the board-project example. Its header selects binary radix and its initialization vector supplies the ROM contents.

## Local benchmark inputs

`local/` holds original benchmark inputs on the working machine and is excluded from Git. The original-format FPGA ROM is stored at `local/fpga/memory.coe`. Use an available dataset path when running the CPU program or creating a board project.

See the [CPU guide](../software/cpu/README.md) and [board guide](../hardware/fpga/board/README.md) for the corresponding commands.
