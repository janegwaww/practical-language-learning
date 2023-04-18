#include <iostream>

int main()
{
    for (int ii{0}; ii <= 20; ++ii)
    {
        if (ii % 2 == 0)
        {
            std::cout << ii << ' ';
        }
    }

    return 0;
}
