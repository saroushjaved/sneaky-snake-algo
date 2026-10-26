# Cloud implementation

The cloud experiments run the C++ Sneaky Snake implementation on a Linux virtual machine. OpenMP provides parallel processing across sequence pairs, while the program reports acceptance counts and execution time.

## Experiment environment

The project's Azure VM configuration in [azure-vm.json](azure-vm.json) records:

| Property | Value |
| --- | --- |
| Region | eastus |
| VM size | Standard_B20ms |
| Operating system image | Ubuntu 20.04 LTS Gen2 |
| Image version | 20.04.202305150 |
| Security configuration | Trusted Launch with Secure Boot and vTPM |

## Execution

Build the CPU program in the VM using the [CPU build instructions](../../software/cpu/README.md). Provide a dataset, edit threshold, and thread count:

```sh
./build/sneaky_snake /path/to/pairs.txt 5 20
```

The same filtering function is used for local CPU and VM execution. Thread count controls the OpenMP worker request; the experiment varies the computing environment and processing configuration around that function.

## Source variants

CPU/cloud runners are stored under `software/cpu/archive/runners/`, with additional experiment variants under `software/cpu/archive/recovered/`. They cover different datasets, sequence lengths, thresholds, and parallel-loop arrangements.

The [CPU function documentation](cpu-documentation.md) describes the routing-track functions. The [architecture guide](../architecture.md) explains how those functions relate to pre-alignment filtering.
