#include <array>
#include <algorithm>
#include <iostream>

int main()
{
    constexpr std::array<std::string_view, 4> arr {"apple", "banana", "walnut", "lemon"};
    std::find_if(arr.begin(), arr.end(),
                 [](std::string_view str) -> bool
                 {
                     return (str.find("nul") != std::string_view::npos);
                     });

    for(std::string_view s : arr)
    {
        std::cout << s << std::endl;
    }

    return 0;
}
