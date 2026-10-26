#include <iostream>
#include "SneakySnake.h"
#include "string.h"
#include<string>
#include <fstream>
#include <climits>
#include <sys/types.h>
#include <chrono>


using namespace std;
using namespace std::chrono;


string line;
int Accepted = 0;
int rejected = 0;
int lines = 100;

int main() {

	fstream readfile;
	readfile.open("./dataset/looonng.txt", ios::in);
	if (!readfile) {
		cout << "Please select a correct file dont be stupid" << endl;
	}
	else {
		cout << "File has opened successfully. Be Proud" << endl;
	}

	const int N = 10000;
	string read;

	
	

	char ReadSeq[N + 1];
	char RefSeq[N + 1];

	auto startTime = high_resolution_clock::now();
	for (int i = 0; i < 20; i++) {
		getline(readfile, line);
		strncpy_s(ReadSeq, line.c_str(), N);
		strncpy_s(RefSeq, line.c_str() + N + 1, N);

	
	
	
		int r = SneakySnake(N, RefSeq, ReadSeq, 2000, 0, 0, 0);
		if (r == 1) {
			Accepted++;
			//cout << i << " :";
			//cout << line << endl;
			
		}
		else if (r == 0) {
			rejected++;
			
		}
		
	}
	auto stopTime = high_resolution_clock::now();
	auto duration = duration_cast<microseconds>(stopTime - startTime);

	cout << "Accepted: " << Accepted << " Rejected: " << rejected << endl;
	cout <<"Sec(ms):  "<<duration.count()/1000<<endl;

}