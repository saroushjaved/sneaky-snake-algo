#include <cstring>
#include <iostream>
#include <string>

using namespace std;
string s = "CCAGAAGTCTATAGCACGTGCATCCCAACGTGGCGTGCGTACACCTTAATCACCGCTTCATGCTAAG"
           "GTCCTGGCTGCATGCTATGTTGATACGCCTGCA";
int N = s.length();

int main() {
  char son[N];

  for (int i = 0; i < N; i++) {
    son[i] = s[i];
  }
  for (int i = 0; i < N; i++) {
    cout << " " << son[i];
  }
}