# Recovered CPU/cloud experiments

These distinct historical sources were recovered from `fpga_more_stuff/cloud_imp` and `Final_Year_Project/Code/CPU`. Source-equivalent files map to existing copies in `docs/recovered-project-manifest.json`; only additional variants are stored here.

They are excluded from the maintained CMake build. Filenames and nested backup names identify their original context. Several use fixed input paths, lengths, thresholds, and loop counts. A displayed thread-count constant does not necessarily activate parallel processing.

The recovered kernel differs from the maintained original only by a final fallback `return 0` and formatting. Some runner variants open an input stream per thread without seeking to their assigned starting row; others have every thread process the entire dataset, missing declarations, shared input races, or excessive repeated file scans. They are historical experiments, not validated alternative implementations or reliable benchmark evidence.

Use `software/cpu/src/main.cpp` for maintained execution. This audit does not change its behavior.
