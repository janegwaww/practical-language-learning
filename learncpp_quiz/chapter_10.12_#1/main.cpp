#include <algorithm>
#include <iostream>

int main()
{
    std::cout << "How many names would you like to enter? ";
    int count_name {};
    std::cin >> count_name;

    std::string* array_name{ new std::string[count_name]{} };
    int length { count_name };

    for (int index {}; index < length; ++index)
    {
        std::cout << "Enter name #" << index + 1 << ": ";
        std::string str {};
        std::cin >> str;
        array_name[index] = str;
    };

    std::sort(array_name, array_name + length);
    std::cout << "\nHere is your sorted list:\n";
    for (int jj{ 0 }; jj < length; ++jj)
        {
            std::cout << "Name #" << jj + 1 << ": " << array_name[jj] << '\n';
        }
    delete[] array_name;

    return 0;
}
