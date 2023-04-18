#include <iostream>

class Ball
{
    std::string m_color{ "black" };
    double m_radius{ 10.0 };

public:
    Ball() {}

    Ball(std::string str, double n)
    {
        m_color = str;
        m_radius = n;
    }

    Ball(std::string str)
    {
        m_color = str;
    }

    Ball(double n)
    {
        m_radius = n;
    }

    void print()
    {
        std::cout << "color: " << m_color << ", " << "radius: " << m_radius;
        std::cout << '\n';
    }
};

class Ball2
{
    std::string m_color{ "black" };
    double m_radius{ 10.0 };

public:
    Ball2(double n)
    {
        m_radius = n;
    }

    Ball2(const std::string& str="black", double n=10.0)
    {
        m_color = str;
        m_radius = n;
    }

    void print()
    {
        std::cout << "color: " << m_color << ", " << "radius: " << m_radius;
        std::cout << '\n';
    }
};

int main()
{
	Ball2 def{};
	def.print();

	Ball2 blue{ "blue" };
	blue.print();

	Ball2 twenty{ 20.0 };
	twenty.print();

	Ball2 blueTwenty{ "blue", 20.0 };
	blueTwenty.print();

	return 0;
}
