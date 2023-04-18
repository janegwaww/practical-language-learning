#include <iostream>

int sumTo(int s)
{
    int total {0};
    for (int i{ 1 }; i <= s; ++i)
        {
            total += i;
        }
    return total;
}

int main()
{

    std::cout << sumTo(5);
    return 0;
}
