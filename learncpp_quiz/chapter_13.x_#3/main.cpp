#include <iostream>
#include <iterator>

class IntArray
{
private:
    int* m_arr{ new int[]{} };
    int m_length{0};

public:
    IntArray(int len)
    : m_arr{ new int[len]{} }, m_length{ len }
    {
    }

    IntArray(const IntArray& arr)
    : m_length{ arr.m_length }
    {
        m_arr = new int[m_length];
        for(int count{ 0 }; count < arr.m_length; ++count)
            m_arr[count] = arr.m_arr[count];
    }

    int& operator[] (int a)
    {
        return m_arr[a];
    }

    IntArray& operator= (const IntArray& arr)
    {
        if (this == &arr)
            return *this;
        delete[] m_arr;
        m_length = arr.m_length;
        m_arr = new int[m_length];
        for (int count{ 0 }; count < arr.m_length; ++count)
            m_arr[count] = arr.m_arr[count];
        return *this;
    }

    ~IntArray()
    {
        delete[] m_arr;
    }

    friend std::ostream& operator<< (std::ostream& out, IntArray& a);
};

std::ostream& operator<< (std::ostream& out, IntArray& a)
{
    for (int ii=0; ii < a.m_length; ++ii)
    {
        out << a.m_arr[ii] << ' ';
    }
    return out;
}

IntArray fillArray()
{
	IntArray a(5);

	a[0] = 5;
	a[1] = 8;
	a[2] = 2;
	a[3] = 3;
	a[4] = 6;

	return a;
}

int main()
{
	IntArray a{ fillArray() };
	std::cout << a << '\n';

	auto& ref{ a }; // we're using this reference to avoid compiler self-assignment errors
	a = ref;

	IntArray b(1);
	b = a;

	std::cout << b << '\n';

	return 0;
}
