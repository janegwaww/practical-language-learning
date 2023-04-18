#include <iostream>

namespace animal
{
    enum Animal
    {
        chicken,
        dog,
        cat,
        elephant,
        duck,
        snake,
        all,
    };
}

int main()
{
    //double temperature[365] { };
    int anis[animal::all] { 2, 4, 4, 4, 2, 0 };
    std::cout << anis[animal::cat] << std::endl;
    return 0;
}
