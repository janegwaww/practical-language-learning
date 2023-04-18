#include <iostream>

class Fruit
{
private:
    std::string m_name{};
    std::string m_color{};

public:
    Fruit() {}

    Fruit(const std::string& n, const std::string& c)
    : m_name{ n }, m_color{ c }
    {
    }

    std::string getName() const
    {
        return m_name;
    }

    std::string getColor() const
    {
        return m_color;
    }
};

class Apple : public Fruit
{
public:
    Apple(const std::string& c)
    : Fruit("apple", c)
    {}

    Apple(const std::string& n, const std::string& c)
    : Fruit(n, c)
    {

    }
};

class Banana : public Fruit
{
public:
    Banana() : Fruit("banana", "yellow") {}
};

class GrannySmith : public Apple
{
public:
    GrannySmith()
    : Apple{ "granny smith apple", "green" }
     {}
};

int main()
{
	Apple a{ "red" };
	Banana b{};
	GrannySmith c;

	std::cout << "My " << a.getName() << " is " << a.getColor() << ".\n";
	std::cout << "My " << b.getName() << " is " << b.getColor() << ".\n";
	std::cout << "My " << c.getName() << " is " << c.getColor() << ".\n";

	return 0;
}
