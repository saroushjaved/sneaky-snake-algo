#include <iostream>
using namespace std;

const int N = 10;
const int E = 2;



int main() {

	int C[2][2] = { {2,2} ,{2,2} };
	char Chip_Maze[(2 * E + 1)][N];
	char Ref[N] = { 'A', 'G', 'C', 'C', 'T', 'G', 'A', 'G', 'C', 'C' };
	char Que[N] = { 'A', 'C', 'C', 'T', 'G', 'A', 'G', 'C', 'C','A' };


	//midde row
	for (int i = 0; i < N; i++) {

		if (Ref[i] != Que[i]) {
			Chip_Maze[E + 1][i] = '1';
		}
		else {
			Chip_Maze[E + 1][i] = '0';
		}
	}

	//upper row (deletions)

	for (int i = 1; i <= E; i++) {
		for (int j = 0; j < N; j++) {


			if (Ref[j] != Que[(j - i)]) {
				
				Chip_Maze[i][j] = '1';
			}
			else if (Ref[j] == Que[(j - i)]) {
				Chip_Maze[i][j] = '0';
				
			}
			cout << "\n\n";

		}

	}

	//lower row (insertions) 

	for (int i = E + 1; i <= (2*E+1); i++) {
		for (int j = 0; j < N; j++) {


			if (Ref[j] != Que[(j + i - E - 1)]) {

				Chip_Maze[i][j] = '1';
			}
			else if (Ref[j] == Que[(j + i - E - 1)]) {
				Chip_Maze[i][j] = '0';

			}
			cout << "\n\n";

		}

	}

	//printing Chip Maze
	
	for (int i = 1; i <= (2*E+1); i++) {
		cout << "Row " << i <<"  ";
		for (int j = 0; j < N; j++) {
			cout <<Chip_Maze[i][j] << " ";

		}
		cout << '\n';


	}
	
	getchar();
	getchar();
	getchar();





}