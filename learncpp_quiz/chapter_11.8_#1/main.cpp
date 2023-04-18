#include <array>
#include <algorithm>
#include <iostream>

struct Student
{
    std::string name{};
    int point{};
};

const std::array<Student, 8> arr
{
    { { "Albert", 3 },
    { "Ben", 5 },
    { "Christine", 2 },
    { "Dan", 8 }, // Dan has the most points (8).
    { "Enchilada", 4 },
    { "Francis", 1 },
    { "Greg", 3 },
    { "Hagrid", 5 } }
};

int main()
{
    const auto st { std::max_element(arr.begin(), arr.end(),
                                    [](Student s1, Student s2) -> bool
                                    {
                                        return s1.point < s2.point;
                                    })};
    std::cout << st -> name << " is the best student." << std::endl;
    return 0;
}
