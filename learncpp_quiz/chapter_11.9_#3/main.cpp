#include <array>
#include <vector>
#include <cmath>
#include <ctime>
#include <algorithm>
#include <iostream>
#include <random>
#include <cassert>

void iteratorVerify(std::vector<int>& arr)
{
    std::cout << '>';
    int input;
    std::cin >> input;

    auto exist { std::find_if(arr.begin(), arr.end(),
                           [=](const auto& num)
                           {
                               return (num == input);
                           })};


    if (exist != arr.end())
    {
        arr.erase(exist);
        if (arr.size() == 0)
        {
            std::cout << "Nice! You found all numbers, good job!\n";
            return;
        }
        std::cout << "Nice! "<< arr.size() << " number(s) left.\n";
        iteratorVerify(arr);
    }
    else
    {
        auto minEle{ std::min_element(arr.begin(), arr.end(),
                                     [=](int a, int b)
                                     {
                                         return (std::abs(a - input) < std::abs(b - input));
                                     })};
        std::cout << input << " is wrong! Try "<< *minEle <<" next time.\n";
        return;
    }
}

int getRandomInt(int min, int max)
{
    static std::mt19937 mt{ static_cast<std::mt19937::result_type>(std::time(nullptr)) };
    return std::uniform_int_distribution( min, max )(mt);
}

int main()
{
    std::cout << "Start where? ";
    int start{};
    std::cin >> start;

    std::cout << "How many? ";
    int end{};
    std::cin >> end;

    std::vector<int> arr{ };
    int rn{ getRandomInt(start, end) };
    for (int s{ start }; s <= end; ++s)
        {
            arr.push_back(s * s * rn);
        }
    std::cout << "I generated " << arr.size() <<
    " square numbers. Do you know what each number is after multiplying it by " << rn << "?\n";

    iteratorVerify(arr);
    for (int i : arr)
    {
        std::cout << i << ' ';
    }

    return 0;
}
