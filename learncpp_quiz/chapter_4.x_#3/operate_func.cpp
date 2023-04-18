#include "operate_func.h"
#include <iostream>

double getDoubleNum()
{
    std::cout << "Enter a double value: ";
    double x {};
    std::cin >> x;
    return x;
}

char getMathSymbol()
{
    std::cout << "Enter one of the following: +, -, *, or /: ";
    char x {};
    std::cin >> x;
    return x;
}

double getOperateResult(double x, double y, char c)
{
    if (c == '+')
        return x + y;
    else if (c == '-')
        return x - y;
    else if (c == '*')
        return x * y;
    else if (c == '/' && y != 0)
        return x / y;
    else
        return false;
}
