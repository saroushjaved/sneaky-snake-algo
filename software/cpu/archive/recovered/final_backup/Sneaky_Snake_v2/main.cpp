#include <iostream>
#include "SneakySnake.h"
#include "string.h"
#include<string>
#include <fstream>
using namespace std;


string line;
int Accepted = 0;
int rejected = 0;
int lines = 100;

int main() {

	fstream readfile;
	readfile.open("./dataset/30000.txt", ios::in);
	if (!readfile) {
		cout << "Please select a correct file dont be stupid" << endl;
	}
	else {
		cout << "File has opened successfully. Be Proud" << endl;
	}

	const int N = 100;
	string read;

	
	

	
	char ReadSeq[N+1];
	char RefSeq[N+1];


	for (int i = 0; i < 30000; i++) {
		getline(readfile, line);
		strncpy_s(ReadSeq, line.c_str(), N);
		strncpy_s(RefSeq, line.c_str() + N + 1, N);
	
	

		int r = SneakySnake(N, RefSeq, ReadSeq,10, 0, 0, 0);
		if (r == 1) {
			Accepted++;
			//cout << i << " :";
			//cout << line << endl;
			
		}
		else if (r == 0) {
			rejected++;
			
		}
		
	}
	cout << "Accepted: " << Accepted << " Rejected: " << rejected;
}