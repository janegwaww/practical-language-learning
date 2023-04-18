#include <iostream>

template <typename T>
class Pair1
{
private:
    T m_first;
    T m_second;

public:
    Pair1(const T& p1, const T& p2)
    : m_first{ p1 }, m_second{ p2 }
    {

    }

    const T& first() const { return m_first; }
    const T& second() const { return m_second; }
};

template <typename T, typename U>
class Pair
{
private:
    T m_x{};
    U m_y{};

public:
    Pair(const T& x, const U& y)
    : m_x{ x }, m_y{ y }
    {

    }

    const T& first() const { return m_x; }
    const U& second() const { return m_y; }
};

template <typename T>
class StringValuePair : public Pair<std::string, T>
{
public:
    StringValuePair(const std::string& s, const T& t)
    : Pair<std::string, T>(s, t)
    {

    }
};

int main()
{
//	Pair1<int> p1 { 5, 8 };
//	std::cout << "Pair: " << p1.first() << ' ' << p1.second() << '\n';
//
//	const Pair1<double> p2 { 2.3, 4.5 };
//	std::cout << "Pair: " << p2.first() << ' ' << p2.second() << '\n';

	Pair<int, double> p1 { 5, 6.7 };
	std::cout << "Pair: " << p1.first() << ' ' << p1.second() << '\n';

	const Pair<double, int> p2 { 2.3, 4 };
	std::cout << "Pair: " << p2.first() << ' ' << p2.second() << '\n';

	StringValuePair<int> svp { "Hello", 6 };
	std::cout << "Pair: " << svp.first() << ' ' << svp.second() << '\n';

	return 0;
}
