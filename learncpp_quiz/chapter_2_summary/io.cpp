#include "io.h"
#include <iostream>

int readNumber()
{
    int x {0};
    std::cout << "Enter a Integer: ";
    std::cin >> x;

    return x;
}

void writeAnswer(int x)
{
    std::cout << "The sum is: " << x << '\n';
}
