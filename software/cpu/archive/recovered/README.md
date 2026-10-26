# CPU and cloud implementation variants

This directory groups additional CPU and cloud experiment sources.

- `cloud_trials/`: runner variations using different thread arrangements, datasets, sequence lengths, and edit thresholds.
- `final_backup/`: CPU, cloud, parallel, and versioned runner sources from the project.

The shared filtering interface is declared in `software/cpu/include/SneakySnake.h`. The repository's CMake target uses `software/cpu/src/main.cpp` and `software/cpu/src/SneakySnake.cpp`; files in this directory provide the experiment variants separately.

See the [CPU guide](../../README.md) for the command-line program and [cloud guide](../../../../docs/history/README.md) for VM execution.
