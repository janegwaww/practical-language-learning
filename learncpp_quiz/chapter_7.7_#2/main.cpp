#include <iostream>

int main()
{
    char ch { 'a' };
    while(ch <= 'z')
    {
        std::cout << ch << ' ' << static_cast<int>(ch) << '\n';
        ++ch;
    }

    return 0;
}
