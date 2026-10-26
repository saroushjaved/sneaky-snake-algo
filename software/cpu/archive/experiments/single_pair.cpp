#include<iostream> 
using namespace std;

char Ref[100] = { 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'C', 'A', 'G', 'G', 'C', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'T', 'T', 'A', 'A', 'G', 'A', 'G', 'A', 'A', 'A', 'T', 'T', 'T', 'T', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'C', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'T', 'T', 'T', 'T', 'T', 'T', 'A', 'G', 'A', 'A', 'G', 'G', 'G', 'A', 'A', 'A', 'A', 'A', 'A', 'G', 'G', 'A', 'A' };
char Que[100] = {'C', 'T', 'A', 'A', 'C', 'A', 'A', 'C', 'G', 'T', 'G', 'C', 'T', 'T', 'C', 'T', 'G', 'A', 'A', 'C', 'A', 'G', 'C', 'C', 'A', 'A', 'T', 'G', 'G', 'G', 'T', 'A', 'A', 'A', 'G', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'T', 'T', 'A', 'A', 'G', 'A', 'A', 'G', 'G', 'A', 'A', 'A', 'T', 'T', 'T', 'T', 'A', 'A', 'A', 'A', 'T', 'T', 'C', 'C', 'A', 'T', 'G', 'A', 'A', 'A', 'C', 'G', 'A', 'A', 'T', 'A', 'A', 'A', 'A', 'A', 'T', 'A', 'G', 'A', 'A', 'A', 'C', 'A', 'C', 'A', 'G', 'C', 'A', 'T', 'A', 'T', 'C'};
int N = sizeof(Que);
int E = 20;
int checkpoint = 0;
int p_delay = 0;

int upper_hrt(char* q, char* r, int E);
int lower_hrt(char* q, char* r, int E);
int main_hrt(char* q, char* r);
int SneakySnake();

int main() {

	int res = SneakySnake();


	if (res == 1) {
		cout << "For Edit Distance Threshold " << E << ": Reads are Similar\n";
		cout << "Sequence Length : " << N;
	}
	else if (res == 2) {
		cout << "For Edit Distance Threshold " << E << ": Reads are Dissimlar\n";
		cout << "Sequence Length : " << N;
	}





}

int SneakySnake() {



	while ((checkpoint < N) && (p_delay <= E)) {
		int count = 0;
		int longest_es = upper_hrt(Que, Ref, E);
		count = main_hrt(Que, Ref);
		if (count == N) {
			return +1;
		}
		else if (count > longest_es) {
			longest_es = count;
		}
		count = lower_hrt(Que, Ref, E);
		if (count > longest_es) {
			longest_es = count;
		}
		checkpoint = checkpoint + longest_es;
		if (checkpoint < N) {
			p_delay++;
			checkpoint++;
		}
	}



	if (p_delay > E) return 2;
	else return 1;


}

int upper_hrt(char* q, char* r, int E) {
	int longest_es = 0;
	for (int i = 0; i < E + 1; i++) {
		int count = 0;
		for (int j = checkpoint; j < N - 1; j++) {
			if (j < i) {
				goto EXIT;
			}
			else if (q[j - i] != r[j]) {
				goto EXIT;
			}
			else if (q[j - i] == r[j]) {
				count++;
			}
		}
	EXIT:
		if (count > longest_es) {
			longest_es = count;
		}
	}

	return longest_es;

}


int lower_hrt(char* q, char* r, int E) {
	int longest_es = 0;
	for (int i = 0; i < E + 1; i++) {
		int count = 0;
		for (int j = checkpoint; j < N - 1; j++) {
			if (j > N - i - i) {
				goto EXIT;
			}
			else if (q[j + i] != r[j]) {
				goto EXIT;
			}
			else if (q[j + i] == r[j]) {
				count++;
			}
		}
	EXIT:
		if (count > longest_es) {
			longest_es = count;
		}
	}

	return longest_es;

}

int main_hrt(char* q, char* r) {
	int longest_es = 0;
	for (int i = checkpoint; i < N - 1; i++) {
		if (q[i] != r[i]) {
			return longest_es;
		}
		else if (q[i] == r[i]) {
			longest_es = longest_es + 1;
		}
	}
	return longest_es;
}