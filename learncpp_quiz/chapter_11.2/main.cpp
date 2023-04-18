#include <functional>
#include <iostream>

int foo()
{
    return 5;
}

int goo(int x)
{
    return x*2;
}

int main()
{
    int (*fnptr)(){ &foo };
    int (*const fcnptr)(){ &foo };
    int (*fnGoo)(int) { &goo };
    using valiFn = int(*)(int);
    valiFn fn2Goo { &goo };
    std::function<int()> fn3Ptr{ &foo };
    std::cout << fnptr() << fcnptr() << fnGoo(4) << fn2Goo(6) << fn3Ptr() << std::endl;
    return 0;
}
