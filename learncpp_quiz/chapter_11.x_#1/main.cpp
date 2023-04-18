#include <functional>
#include <iostream>

int getInteger()
{
    std::cout << "Enter a integer: ";
    int in;
    std::cin >> in;
    return in;
}

char getOperator()
{
    char c{ };
    while ( c != '+' && c != '-' && c != '*' && c != '/')
    {
        std::cout << "Enter a mathematical operation('+','-','*','/'): ";
        std::cin >> c;
    };
    return c;
}

int add(int x, int y)
{
    return x + y;
}

int subtract(int x, int y)
{
    return x - y;
}

int multiply(int x, int y)
{
    return x * y;
}

int division(int x, int y)
{
    if (y == 0) return 0;
    return x / y;
}

using ArithmeticFunction = std::function<int(int,int)>;

ArithmeticFunction getArithmeticFunction(char a)
{
    switch(a)
    {
        case '+': return &add;
        case '-': return &subtract;
        case '*': return &multiply;
        case '/': return &division;
        default: return nullptr;
    }
}

int main()
{
    int first { getInteger() };
    int second { getInteger() };
    char op { getOperator() };

    ArithmeticFunction fn { getArithmeticFunction(op) };

    std::cout << first << second << op << fn(2, 5) << std::endl;
    return 0;
}
