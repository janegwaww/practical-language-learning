#include <vector>
#include <iostream>

class Point
{
private:
	int m_x{};
	int m_y{};
	int m_z{};

public:
	Point(int x, int y, int z)
		: m_x{ x }, m_y{ y }, m_z{ z }
	{

	}

	friend std::ostream& operator<<(std::ostream& out, const Point& p)
	{
		return out << "Point(" << p.m_x << ", " << p.m_y << ", " << p.m_z << ')';
	}
};

class Shape
{
public:
    virtual ~Shape() = default;

    virtual std::ostream& print(std::ostream& out) = 0;

    friend std::ostream& operator<< (std::ostream& out, Shape& s)
    {
        return s.print(out);
    }

    friend std::ostream& operator<< (std::ostream& out, Shape* s)
    {
        return s->print(out);
    }
};

class Circle : public Shape
{
private:
    Point m_point{ 0, 0, 0 };
    int m_radius{};

public:
    Circle(const Point& p, int r)
    : m_point{ p }, m_radius{ r }
    {

    }

    std::ostream& print(std::ostream& out) override
    {
        out << "Circle(" << m_point << ", " << m_radius << ")\n";
        return out;
    }

    int getRadius() { return m_radius; }
};

class Triangle : public Shape
{
private:
    Point m_point1{ 0, 0, 0 };
    Point m_point2{ 0, 0, 0 };
    Point m_point3{ 0, 0, 0 };

public:
    Triangle(const Point& p1, const Point& p2, const Point& p3)
    : m_point1{ p1 }, m_point2{ p2 }, m_point3{ p3 }
    {

    }

    std::ostream& print(std::ostream& out) override
    {
        out << "Triangle(" << m_point1 << ", " << m_point2 <<
        ", " << m_point3 << ")\n";
        return out;
    }
};

int getLargestRadius(const std::vector<Shape*>& v)
{
    int r{};
    for (auto* s : v)
    {
        auto* c{ dynamic_cast<Circle*>(s) };
        if (c != nullptr&&c -> getRadius() > r)
        {
            r = c -> getRadius();
        }
    }

    return r;
}

int main()
{
    Circle c{ Point{ 1, 2, 3 }, 7 };
    std::cout << c << '\n';

    Triangle t{Point{1, 2, 3}, Point{4, 5, 6}, Point{7, 8, 9}};
    std::cout << t << '\n';

    std::vector<Shape*> v{
	  new Circle{Point{1, 2, 3}, 7},
	  new Triangle{Point{1, 2, 3}, Point{4, 5, 6}, Point{7, 8, 9}},
	  new Circle{Point{4, 5, 6}, 3}
	};

	// print each shape in vector v on its own line here
	for (auto* s : v)
    {
        auto* c{ dynamic_cast<Circle*>(s) };
        if (c)
        {
            std::cout << c << '\n';
        }
        else
        {
            std::cout << dynamic_cast<Triangle*>(s) << '\n';
        }

    }
    std::cout << '\n';

	std::cout << "The largest radius is: " << getLargestRadius(v) << '\n'; // write this function

    // delete each element in the vector here
    for (auto* a : v)
        delete a;

    return 0;
}
