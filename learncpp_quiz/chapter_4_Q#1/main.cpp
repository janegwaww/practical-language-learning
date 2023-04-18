#include <iostream>

int main()
{
    std::cout << "Enter a single character: ";

    char ch {};
    std::cin >> ch;

    int c {ch};
    std::cout << "U entered \'" << ch << "\',"
    << "which has ASCII code " << c << ".\n";

    return 0;
}
