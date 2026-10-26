/***********************************************************************************
 *  Author: Mahgul Adnan and Soroush Javed Sulehri
 *  Email: mahguladnan212@gmail.com , saroushjaved@gmail.com
 *  Date: June 21, 2023
 *  Institution: Pakistan Institute of Engineering and Applied Sciences 
 *  Project: Hands on Algorithm Acceleration using Heterogenous Computing Systems 
 ***********************************************************************************/


#include <iostream>
#include "SneakySnake.h"
#include "string.h"
#include <string>
#include <fstream>
#include <climits>
#include <sys/types.h>
#include <chrono>
#include<stdlib.h>
#include<cstdlib>
#include <omp.h>

using namespace std;
using namespace std::chrono;

int lines = 30000;
const int N = 100;
const int no_threads = 4;
int Accepted[no_threads];
int rejected[no_threads];


int main() {

	// Open the input file
	fstream readfile;
	readfile.open("./dataset/100_bp_1.txt", ios::in);
	if (!readfile) {
		std::cout << "Please select a correct file." << endl;

	}
	else {
		std::cout << "File has opened successfully." <<endl;
		std::cout << "There are a total of " << lines << " reads in the file." << endl;
		std::cout << "Total number of threads being utilized: " << no_threads << endl;

	}

	string read;

	int total_sum_acc = 0;
	int total_sum_rej = 0;
	auto startTime = high_resolution_clock::now();
	
	// Set the number of threads to be used
	omp_set_num_threads(no_threads);
	int accepted_sum = 0; // Local variable defined to avoid calling memory again and again
	int rejected_sum = 0;

	// Loop through the reads in parallel
#pragma omp parallel for private(i, line) shared(size_read) reduction(+:accepted_sum, rejected_sum)
	for (int i = 0; i < 30000; i++) {
		char ReadSeq[N + 1];
		char RefSeq[N + 1];
		getline(readfile, line);
		strncpy_s(ReadSeq, line.c_str(), size_read);
		strncpy_s(RefSeq, line.c_str() + size_read + 1, size_read);
		int r = SneakySnake(size_read, RefSeq, ReadSeq, 10, 0, 0, 0);
		
		// Atomic operations to safely update the shared counters
		if (r == 1) {
#pragma omp atomic
			accepted_sum += 1;
		}
		else {
#pragma omp atomic
			rejected_sum += 1;
		}
	}

	auto stopTime = high_resolution_clock::now();
	auto duration = duration_cast<microseconds>(stopTime - startTime);

	// Print the results
	std::cout << "Total Accepted Reads: " << accepted_sum << endl;
	std::cout << "Total Rejected Reads: " << rejected_sum << endl;
	std::cout << "Total Execution time for Sneaky Snake Algorithm (ms): " << duration.count() / 1000 << endl;
}
