#include <iostream>
#include <thread>
using namespace std;

void function1() {
    for (int i = 0; i < 200; i++) {
        std::cout << "+"<<endl;
    }
}

void function2() {
    for (int i = 0; i < 200; i++) {

        std::cout << "-"<<endl;
    }
}

int main()
{

    std::thread worker1(function1);
    std::thread worker2(function2);

    getchar();
    getchar();
    return 0;
}