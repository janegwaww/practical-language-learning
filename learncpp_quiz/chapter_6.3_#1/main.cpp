#include <iostream>

int main()
{
    std::cout << "Enter an integer: ";
    int num1 {};
    std::cin >> num1;

    std::cout << "Enter a larger integer: ";
    int num2 {};
    std::cin >> num2;

    if (num2 < num1)
    {
        std::cout << "Swapping the values\n";
        int x {};
        x = num1;
        num1 = num2;
        num2 = x;
    }

    std::cout << "The smaller value is " << num1 << '\n';
    std::cout << "The larger value is " << num2 << '\n';

    return 0;
}
