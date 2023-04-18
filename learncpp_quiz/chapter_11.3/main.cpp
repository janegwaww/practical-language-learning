#include <iostream>

void countDown(int count)
{
    std::cout << "push " << count << '\n';

    if (count > 1) // termination condition
        countDown(count-1);

    std::cout << "pop " << count << '\n';
}

int factorial(int count)
{
    if (count <= 1)
    {
        return 1;
    }
    else
    {
        return count * factorial(count -1);
    }
}

int decimalSum(int n)
{
    if (n <= 0)
    {
        return 0;
    }
    else
    {
        return n % 10 + decimalSum(n / 10);
    }
}

void convertBinary(int n)
{
    if (n >= 1)
        convertBinary(n / 2);
    std::cout << n % 2;
}

int main()
{
    std::cout << decimalSum(93427) << '\n';
    convertBinary(15);
    //countDown(5);
    return 0;
}
