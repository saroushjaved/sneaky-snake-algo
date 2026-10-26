#include <iostream>
#include <fstream>
#include <cstring>
#include <string>
#include <chrono>

#include "SneakySnake.h"

using namespace std;
using namespace std::chrono;


int lines = 100;
int EditDist = 5000;
const int N = 10000;
const int no_threads = 8;

int Accepted[no_threads];
int rejected[no_threads];


int main() {
  
    fstream readfile;
    readfile.open("./dataset/long_1.txt", ios::in);
    if (!readfile) {
        cout << "Please select a correct file." << endl;
    } else {
        cout << "File has opened successfully." << endl;
        cout << "There are a total of " << lines << " reads in the file." << endl;
        cout << "Total number of threads being utilized: " << no_threads << endl;
    }

    string read;

    int total_sum_acc = 0;
    int total_sum_rej = 0;
    auto startTime = high_resolution_clock::now();

    int accepted_sum = 0; 
    int rejected_sum = 0;

    int size_read = N;
    string line;
    int global_acc = 0, global_rej = 0;
    int i;

    for (int i = 0; i < lines; i++) {
        char ReadSeq[N + 1];
        char RefSeq[N + 1];
        getline(readfile, line);
        strncpy_s(ReadSeq, line.c_str(), size_read);
        strncpy_s(RefSeq, line.c_str() + size_read + 1, size_read);
        int r = SneakySnake(size_read, RefSeq, ReadSeq, EditDist, 0, 0, 0);

        if (r == 1) {
            accepted_sum += 1;
        } else {
            rejected_sum += 1;
        }
    }

    auto stopTime = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stopTime - startTime);

    cout << "Total Accepted Reads: " << accepted_sum << endl;
    cout << "Total Rejected Reads: " << rejected_sum << endl;
    cout << "Total Execution time for Sneaky Snake Algorithm (ms): " << duration.count() / 1000 << endl;

    return 0;
}
