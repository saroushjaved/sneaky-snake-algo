> Historical documentation supplied with the June 2023 CPU sources. This describes the original runner, not the maintained CLI. Sneaky Snake is a pre-alignment filter, not an exact aligner; the final three API parameters are unused. See ../../software/cpu/README.md for current usage.

# SneakySnake Code Documentation

## Authors
- Mahgul Adnan (mahguladnan212@gmail.com)
- Soroush Javed Sulehri (saroushjaved@gmail.com)

## Date
June 21, 2023

## Institution
Pakistan Institute of Engineering and Applied Sciences

## Project
Hands on Algorithm Acceleration using Heterogenous Computing Systems

## SneakySnake Algorithm

### Function Definitions

#### `int SneakySnake(int ReadLength, char* Ref, char* Que, int EditThreshold, int KmerSize, int DebugMode, int IterationNo)`
- Description: Implements the SneakySnake algorithm for read alignment.
- Parameters:
  - `ReadLength`: Length of the read
  - `Ref`: Pointer to the reference sequence
  - `Que`: Pointer to the query sequence (read)
  - `EditThreshold`: Edit threshold for alignment
  - `KmerSize`: K-mer size
  - `DebugMode`: Debug mode flag
  - `IterationNo`: Iteration number
- Returns:
  - `1` if a match is found (success)
  - `0` if the edit threshold is exceeded (failure)

#### `int upper_hrt(char* q, char* r, int E, int N, int checkpoint)`
- Description: Finds the longest exact match from the upper half of the edit range.
- Parameters:
  - `q`: Pointer to the query sequence (read)
  - `r`: Pointer to the reference sequence
  - `E`: Edit threshold
  - `N`: Length of the read
  - `checkpoint`: Current position in the alignment
- Returns: Length of the longest exact match from the upper half

#### `int lower_hrt(char* q, char* r, int E, int N, int checkpoint)`
- Description: Finds the longest exact match from the lower half of the edit range.
- Parameters:
  - `q`: Pointer to the query sequence (read)
  - `r`: Pointer to the reference sequence
  - `E`: Edit threshold
  - `N`: Length of the read
  - `checkpoint`: Current position in the alignment
- Returns: Length of the longest exact match from the lower half

#### `int main_hrt(char* q, char* r, int N, int checkpoint)`
- Description: Finds the longest exact match from the main diagonal.
- Parameters:
  - `q`: Pointer to the query sequence (read)
  - `r`: Pointer to the reference sequence
  - `N`: Length of the read
  - `checkpoint`: Current position in the alignment
- Returns: Length of the longest exact match from the main diagonal

## Main Code

### Description
The main code reads a dataset file, processes the reads in parallel using OpenMP, and performs alignment using the SneakySnake algorithm.

### Dependencies
- `iostream`: Header file for input/output operations.
- `"SneakySnake.h"`: Header file containing the SneakySnake algorithm function declaration.

### Function Definitions

#### `int main()`
- Description: Entry point of the program.
- Returns: Exit status of the program.

### Variables
- `lines`: Total number of reads in the dataset file
- `N`: Length of the read
- `no_threads`: Number of threads to be utilized for parallel processing
- `Accepted[no_threads]`: Array to store the accepted reads count for each thread
- `rejected[no_threads]`: Array to store the rejected reads count for each thread

### Execution Flow
1. Open the dataset file and check if it exists.
2. Display the file status, total number of reads, and the number of threads being utilized.
3. Set the number of threads to be used using `omp_set_num_threads`.
4. Initialize local variables `accepted_sum` and `rejected_sum` for each thread.
5. Process the reads in parallel using OpenMP:
   - Read a line from the dataset file.
   - Extract the query and reference sequences.
   - Perform alignment using the SneakySnake algorithm and store the result.
   - Update the `accepted_sum` or `rejected_sum` based on the result using atomic operations.
6. Measure the execution time using `high_resolution_clock`.
7. Print the total accepted and rejected reads count and the execution time.

## Example Usage
```cpp
// Compile and run the code using a C++ compiler

```
