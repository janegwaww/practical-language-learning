#include <iostream>

using namespace std;

int main()
{
    const char* str{ "Hello, world!" };

    while(*str != 0)
    {
        std::cout << *str; // H
        ++str;
    }

    return 0;
}
