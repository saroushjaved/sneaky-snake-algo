# Additional CPU and cloud sources

The `CPU Implementation` and `Cloud Implementation` folders supplied after the first import added author documentation, annotated runners, and an Azure VM snapshot. Their kernel and header were identical between folders and matched the existing implementation after removing comments and whitespace. Those duplicate copies were removed. The retained documentation records authors Mahgul Adnan and Soroush Javed Sulehri, PIEAS, dated June 21, 2023.

## Retained material

- `cpu-documentation.md`: original author documentation, with a historical-context note and its unfinished Markdown code fence closed.
- `azure-vm.json`: historical VM configuration, with the VM identifier removed and the disk resource identifier redacted. Other `[]` placeholders were already in the input. This is a configuration snapshot, not a deployable template.
- `../../software/cpu/archive/runners/annotated_cpu.cpp`: annotated CPU runner, preserved unchanged for provenance. It refers to undeclared `i`, `line`, and `size_read` and is not a supported build target.
- `../../software/cpu/archive/runners/azure.cpp`: cloud runner, preserved unchanged. It adds a critical section around file reading, uses `strncpy`, and sets threshold 5. The shared `line` is read outside the critical section and can be overwritten by another worker. Its `no_threads = 20` constant is never passed to OpenMP, so it does not enforce 20 threads. Diagnostic printing in the timed loop also affects measurements.

The snapshot records Azure `eastus`, VM size `Standard_B20ms`, Ubuntu 20.04 LTS Gen2 image version `20.04.202305150`, and Trusted Launch with Secure Boot and vTPM enabled. These describe the historical experiment, not a current cloud deployment recommendation. No provisioning scripts were supplied.

Use the maintained CLI for CPU or VM execution. For example, after building on a VM:

```sh
./build/sneaky_snake /path/to/pairs.txt 5 20
```

The maintained CLI avoids both historical input races. The additional imports did not require a kernel change or a separate cloud algorithm. `../additional-import-manifest.json` records original hashes, retained paths, and transformations.
