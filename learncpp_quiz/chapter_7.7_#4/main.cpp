#include <iostream>

int main()
{
    int iii {1};
    while(iii <=5)
    {
        int jjj { 5 };
        while(jjj >= 1)
        {
            if (jjj <= iii)
            {
                std::cout << jjj << ' ';
            }
            else
            {
                std::cout << 'X' << ' ';
            }
            --jjj;
        }
        std::cout << '\n';
        ++iii;
    }

    return 0;
}
