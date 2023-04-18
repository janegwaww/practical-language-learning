#include <iostream>

void findName()
{

}

int main()
{
    std::cout << "Enter a name: ";
    std::string name {};
    std::getline(std::cin >> std::ws, name);

    std::string names[] { "Alex", "Betty", "Caroline", "Dave",
    "Emily", "Fred", "Greg", "Holly" };
    bool notFound { true };
    for (auto n : names)
    {
        if (name == n)
        {
            std::cout << n << " was found.\n";
            notFound = false;
        }
    }
    if (notFound)
    {
        std::cout << name << " was not found.\n";
    }

    return 0;
}
