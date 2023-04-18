#include <iostream>

bool isAllowedRide()
{
  std::cout << "How tall are you? (cm)\n";

  double height{};
  std::cin >> height;

  return height > 140.0;
}

int main()
{
  if (isAllowedRide())
    std::cout << "Have fun!\n";
  else
    std::cout << "Sorry, you're too short.\n";

  std::int8_t myint{65};
  std::cout << myint << '\n';

  return 0;
}
