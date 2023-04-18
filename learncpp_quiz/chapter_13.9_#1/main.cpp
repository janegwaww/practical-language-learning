#include <iostream>
#include <vector>
#include <algorithm>

class StudentGrade
{
private:
    std::string m_name{};
    char m_grade{};
};

class GradeMap
{
private:
    std::vector<StudentGrade> m_map{};
};

class Mystring
{
private:
    std::string str{};

public:
    Mystring(const std::string& s={})
    : str{ s }
    {

    }

    std::string operator()(int f, int e)
    {
        std::string s{};
        for (int i{ f }; i < f+e; ++i)
        {
            s += str[static_cast<size_t>(i)];
        }
        return s;
    }
};

int main()
{
    std::cout << "Hello world!" << std::endl;

    Mystring string{ "Hello, world!" };
    std::cout << string(7, 5) << '\n';

    return 0;
}
