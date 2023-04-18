#include <iostream>

enum class Animal
{
    pig,
    chicken,
    goat,
    cat,
    dog,
    duck,
};

std::string_view getAnimalName(Animal name)
{
    switch(name)
    {
    case Animal::pig:
        return "pig";
    case Animal::chicken:
        return "chicken";
    case Animal::dog:
        return "dog";
    case Animal::duck:
        return "duck";
    case Animal::goat:
        return "goat";
    case Animal::cat:
        return "cat";
    default:
        return "???";
    }
}

int printNumberOfLegs(Animal name)
{
    switch(name)
    {
    case Animal::pig:
        return 4;
    case Animal::dog:
        return 4;
    case Animal::goat:
        return 4;
    case Animal::cat:
        return 4;
    case Animal::chicken:
        return 2;
    case Animal::duck:
        return 2;
    default:
        return false;
    }
}

int main()
{
    Animal p { Animal::pig };
    std::string_view name { getAnimalName(p) };
    int legs { printNumberOfLegs(p) };

    std::cout << "A " << name << " has " << legs << " legs" << std::endl;
    return 0;
}
