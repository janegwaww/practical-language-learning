#include <iostream>
#include <stdexcept>
#include <exception>

class Fraction
{
private:
    int m_num{};
    int m_den{};

public:
    Fraction(int n, int d)
    : m_num{ n }, m_den{ d }
    {
        if (d == 0)
            throw std::runtime_error("Invalid denominator!");
    }

    void print() const
    {
        std::cout<< m_num << '/' << m_den << '\n';
    }
};

int main()
{
    try
    {
        std::cout << "Enter the numerator: ";
        int n;
        std::cin >> n;

        std::cout << "Enter the denominator: ";
        int d;
        std::cin >> d;

        //if (d == 0)
            //throw std::runtime_error("Invalid denominator!");

        Fraction f{ n, d };
        f.print();
    }
    catch(const std::exception& except)
    {
        std::cout << except.what();
    }
    return 0;
}
