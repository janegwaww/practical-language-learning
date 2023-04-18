#include <iostream>
#include <cmath>

class Point2d
{
    double m_x;
    double m_y;

public:
    Point2d(double x=0.0, double y=0.0)
    : m_x{ x }, m_y{ y }
    {

    }

    void print()
    {
        std::cout << "Point2d("<< m_x << ", " << m_y << ")\n";
    }

    double distanceTo(const Point2d& p) const
    {
        return std::sqrt((p.m_x - m_x) * (p.m_x - m_x) +
                         (p.m_y - m_y) * (p.m_y - m_y));
    }

    friend double distanceFrom(const Point2d& p1, const Point2d& p2);
};

double distanceFrom(const Point2d& p1, const Point2d& p2)
{
    return std::sqrt((p2.m_x - p1.m_x) * (p2.m_x - p1.m_x) +
                    (p2.m_y - p1.m_y) * (p2.m_y - p1.m_y));
}

class HelloWorld
{
private:
	char* m_data{};

public:
	HelloWorld()
	{
		m_data = new char[14];
		const char* init{ "Hello, World!" };
		for (int i = 0; i < 14; ++i)
			m_data[i] = init[i];
	}

	~HelloWorld()
	{
        // replace this comment with your destructor implementation
        delete[] m_data;
	}

	void print() const
	{
		std::cout << m_data << '\n';
	}

};

int main()
{
    Point2d first{};
    Point2d second{ 3.0, 4.0 };
    first.print();
    second.print();
    std::cout << "Distance between two points: " << first.distanceTo(second) << '\n';
    std::cout << "Distance between two points: " << distanceFrom(first, second) << '\n';
    HelloWorld hello{};
	hello.print();

    return 0;
}
