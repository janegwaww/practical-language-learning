#include <iostream>

double calculate(int x, int y, char c)
{
    switch(c)
    {
        case '+':
            return x + y;
        case '-':
            return x - y;
        case '*':
            return x * y;
        case '/':
            return x / y;
        default:
            return 0;
    }
}

int main()
{
    std::cout << "Enter an integer: ";
    int x {};
    std::cin >> x;

    std::cout << "Enter another integer: ";
    int y {};
    std::cin >> y;

    std::cout << "Enter a operator: ";
    char ch;
    std::cin >> ch;

    std::cout << x << ' ' << ch << ' ' << y << " = " << calculate(x, y, ch);
    return 0;
}
