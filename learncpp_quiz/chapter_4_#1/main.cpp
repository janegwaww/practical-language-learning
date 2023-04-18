#include <iostream>

bool isPrime(int x)
{
    if (x == 2)
        return true;
    else if (x == 3)
        return true;
    else if (x == 5)
        return true;
    else if (x == 7)
        return true;
    else
        return false;

    return false;
}

int main()
{
    std::cout << "Please Enter a number between 0 and 9: " << '\n';

    int x { 0 };
    std::cin >> x;

    if (isPrime(x))
        std::cout << "The digit is prime.";
    else
        std::cout << "The digit is not prime.";

    return 0;
}
