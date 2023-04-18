#include <iostream>


namespace constants
{
    using pi_t = double;
    inline constexpr pi_t pi { 3.14159 };
}

using radians_t = double;
using degrees_t = double;

radians_t convertToRadians(degrees_t degrees)
{
    return degrees * constants::pi / 180;
}

int main()
{
    std::cout << "Enter a number of degrees: ";
    degrees_t degrees{};
    std::cin >> degrees;

    radians_t radians { convertToRadians(degrees) };
    std::cout << degrees << " degrees is " << radians << " radians.\n";

    return 0;
}
