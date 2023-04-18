#include <iostream>
#include <cmath>

class FixedPoint2
{
private:
    using nonf_t = int_least16_t;
    using f_t = int_least8_t;
    nonf_t m_nonf{};
    f_t m_f{};

public:
    FixedPoint2(nonf_t n=0, f_t f=0)
    : m_nonf{ n }, m_f{ f }
    {
        if (m_nonf < 0 || m_f < 0)
        {
            if (m_nonf > 0)
                m_nonf = -m_nonf;
            if (m_f > 0)
                m_f = -m_f;
        }
    }

    FixedPoint2(double n)
    : m_nonf{ static_cast<nonf_t>(std::round(n))},
                                         m_f{ static_cast<f_t>(std::round(n * 100) - m_nonf * 100)}
    {}

    operator double() const { return m_nonf + static_cast<double>(m_f)/100; }

    friend bool operator== (const FixedPoint2& f1, const FixedPoint2& f2)
    {
        return (f1.m_nonf==f2.m_nonf && f1.m_f==f2.m_f);
    }

    friend FixedPoint2 operator+ (const FixedPoint2& f1, const FixedPoint2& f2)
    {
        return { static_cast<double>(f1) + static_cast<double>(f2) };
    }

    FixedPoint2 operator- ()
    {
        return { static_cast<nonf_t>(-m_nonf), static_cast<f_t>(-m_f) };
    }

    friend std::ostream& operator<< (std::ostream& out, const FixedPoint2& f)
    {
        out << static_cast<double>(f);
        return out;
    }

    friend std::istream& operator>> (std::istream& in, FixedPoint2& f)
    {
        double fr{};
        in >> fr;
        f = FixedPoint2{ fr };
        return in;
    }
};

void testAddition()
{
	// h/t to reader Sharjeel Safdar for this function
	std::cout << std::boolalpha;
	std::cout << (FixedPoint2{ 0.75 } + FixedPoint2{ 1.23 } == FixedPoint2{ 1.98 }) << '\n'; // both positive, no decimal overflow
	std::cout << (FixedPoint2{ 0.75 } + FixedPoint2{ 1.50 } == FixedPoint2{ 2.25 }) << '\n'; // both positive, with decimal overflow
	std::cout << (FixedPoint2{ -0.75 } + FixedPoint2{ -1.23 } == FixedPoint2{ -1.98 }) << '\n'; // both negative, no decimal overflow
	std::cout << (FixedPoint2{ -0.75 } + FixedPoint2{ -1.50 } == FixedPoint2{ -2.25 }) << '\n'; // both negative, with decimal overflow
	std::cout << (FixedPoint2{ 0.75 } + FixedPoint2{ -1.23 } == FixedPoint2{ -0.48 }) << '\n'; // second negative, no decimal overflow
	std::cout << (FixedPoint2{ 0.75 } + FixedPoint2{ -1.50 } == FixedPoint2{ -0.75 }) << '\n'; // second negative, possible decimal overflow
	std::cout << (FixedPoint2{ -0.75 } + FixedPoint2{ 1.23 } == FixedPoint2{ 0.48 }) << '\n'; // first negative, no decimal overflow
	std::cout << (FixedPoint2{ -0.75 } + FixedPoint2{ 1.50 } == FixedPoint2{ 0.75 }) << '\n'; // first negative, possible decimal overflow
}

int main()
{
	testAddition();

	FixedPoint2 a1{ -0.48 };
	std::cout << a1 << '\n';

	std::cout << -a1 << '\n';

	std::cout << "Enter a number: "; // enter 5.678
	std::cin >> a1;

	std::cout << "You entered: " << a1 << '\n';

	return 0;
}
