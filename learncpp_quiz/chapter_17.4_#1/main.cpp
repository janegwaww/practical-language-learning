#include <iostream>

class Fruit
{
private:
    std::string m_name{};
    std::string m_color{};

public:
    Fruit(const std::string& n, const std::string& c)
    : m_name{ n }, m_color{ c }
    {

    }

    const std::string& getName() const { return m_name; }
    const std::string& getColor() const { return m_color; }
};

class Apple : public Fruit
{
private:
    double m_fiber{};

public:
    Apple(const std::string& n, const std::string& c, const double f)
    : Fruit{ n, c }, m_fiber{ f }
    {

    }

    friend std::ostream& operator<< (std::ostream& out, const Apple& a)
    {
        out << "Apple(" << a.getName() << ", " ;
        out << a.getColor() << ", " << a.m_fiber << ')';
        return out;
    }
};

class Banana : public Fruit
{
public:
    Banana(const std::string& n, const std::string& c)
    : Fruit{ n, c }
    {

    }

    friend std::ostream& operator<< (std::ostream& out, const Banana& a)
    {
        out << "Banana(" << a.getName() << ", " ;
        out << a.getColor() << ')';
        return out;
    }
};

int main()
{
	const Apple a{ "Red delicious", "red", 4.2 };
	std::cout << a << '\n';

	const Banana b{ "Cavendish", "yellow" };
	std::cout << b << '\n';

	return 0;
}
