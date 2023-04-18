#include <iostream>

int main()
{
    int iii { 5 };
    while(iii >= 1)
    {
        int jjj { iii };
        while(jjj >= 1)
        {
            std::cout << jjj << ' ';
            --jjj;
        }
        std::cout << '\n';
        --iii;
    }

    return 0;
}
