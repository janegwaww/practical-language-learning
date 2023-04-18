#include <iostream>
#include <vector>

class Point3d
{
    int m_x{};
    int m_y{};
    int m_z{};
public:
    void setValues(int x, int y, int z)
    {
        m_x = x;
        m_y = y;
        m_z = z;
    }

    void print()
    {
        std::cout << '<' << m_x << ", " << m_y << ", " << m_z << ">\n";
    }

    bool isEqual(const Point3d& p)
    {
        return m_x == p.m_x && m_y == p.m_y && m_z == p.m_z;
    }
};

class Stack
{
    std::vector<int> arr{ };
public:
    void reset()
    {
        arr = {};
    }

    void push(int x)
    {
        arr.push_back(x);
    }

    void pop()
    {
        arr.pop_back();
    }

    void print()
    {
        std::cout << "{ ";
        for (int i : arr)
        {
            std::cout << i << ' ';
        }
        std::cout << " }\n";
    }
};

int main()
{
    Point3d point1;
    point1.setValues(1, 2, 3);

    Point3d point2;
    point2.setValues(1, 2, 3);

    if (point1.isEqual(point2))
    {
        std::cout << "point1 and point2 are equal\n";
    }
    else
    {
        std::cout << "point1 and point2 are not equal\n";
    }

    Point3d point3;
    point3.setValues(3, 4, 5);

    if (point1.isEqual(point3))
    {
        std::cout << "point1 and point3 are equal\n";
    }
    else
    {
        std::cout << "point1 and point3 are not equal\n";
    }

    Stack stack;
	stack.reset();

	stack.print();

	stack.push(5);
	stack.push(3);
	stack.push(8);
	stack.print();

	stack.pop();
	stack.print();

	stack.pop();
	stack.pop();

	stack.print();

	return 0;

    return 0;
}
