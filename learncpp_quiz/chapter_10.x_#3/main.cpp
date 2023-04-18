#include <iostream>

void swap(int& a, int& b)
{
    int temp{ a };
    a = b;
    b = temp;
}

int main()
{
    int a { 2 };
    int b { 5 };

    std::cout << a << ' ' << b << '\n';
    swap(a, b);
    std::cout << a << ' ' << b << std::endl;
    return 0;
}
