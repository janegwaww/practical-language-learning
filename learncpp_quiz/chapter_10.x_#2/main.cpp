#include <algorithm>
#include <array>
#include <cstddef>
#include <iostream>
#include <vector>

struct Student
{
    std::string first_name{};
    int grade{};
};

bool compare(Student& a, Student& b)
{
    return (a.grade > b.grade);
}

int main()
{
    std::cout << "How many students they want to enter: ";
    int count {};
    std::cin >> count;

    std::vector<Student> students(0);
    students.resize(static_cast<size_t>(count));
    for (auto& s : students)
        {
            std::cout << "Enter the name: ";
            std::cin >> s.first_name;

            std::cout << "Enter the grade: ";
            std::cin >> s.grade;
        }

    std::sort(students.begin(), students.end(), compare);

    std::cout << '\n';
    for (auto& t : students)
    {
        std::cout << t.first_name << " got a grade of " << t.grade << '\n';
    }

    return 0;
}
