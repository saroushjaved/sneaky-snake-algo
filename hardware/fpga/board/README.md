# VC707 board integration

The board design targets the Virtex-7 device `xc7vx485tffg1761-2` on the VC707 platform. It connects the Sneaky Snake filter to block ROM and differential-clock IP.

## Data path

```text
Address inputs ---> Block ROM ---> Query/reference pair ---> SneakySnake
                         ^                                      |
Differential clock ---> Clock generator                       Accepted
                                                                |
                                                          Output counter
```

Each ROM word contains 400 bits: a 200-bit query in bits 399:200 and a 200-bit reference in bits 199:0. The four-bit `addra` input selects one of 16 words.

The wrapper supplies the pair to `SneakySnake` with `LENGTH=200`. A three-bit counter increments when `Accepted` changes from low to high; reset clears the counter and its previous-decision register.

## Files

| Path | Purpose |
| --- | --- |
| `rtl/top.v` | ROM, clock, filter, and counter connections |
| `constraints/const_1.xdc` | Pin and I/O-standard assignments for address, reset, and count signals |
| `ip/blk_mem_gen_0.xci` | Single-port ROM configuration, 16 words of 400 bits |
| `ip/clk_wiz_0.xci` | Clocking Wizard configuration for the differential input |
| `create_project.tcl` | Creates a Vivado project and imports the RTL, constraints, and IP |
| `archive/` | Alternative board wrappers and LZC source variants |

## Create the project

From the repository root, run:

```sh
vivado -mode batch -source hardware/fpga/board/create_project.tcl -tclargs data/samples/fpga_demo.coe
```

The argument is the path to a binary COE file containing 16 words of 400 bits. The script creates `build/fpga-board/`, imports the project sources, sets `top` as the top-level module, and writes an IP status report. Supply a different COE path to use another sequence set. The output directory must be available for project creation.

The XCI configurations record Vivado 2021.2 customizations and the clock IP's VC707 board preset. Vivado manages these native IP configurations through its project and IP catalog tools.

## Sequence preparation

DNA encoding uses A=00, T=01, G=10, C=11. Combine the query's 200 encoded bits with the reference's 200 bits to form each ROM word. A binary COE file begins with a radix declaration and comma-separated initialization vector, with a semicolon terminating the final word.

The public example is [fpga_demo.coe](../../../data/samples/fpga_demo.coe). Sequence-conversion scripts are stored under `../tools/archive/`.
