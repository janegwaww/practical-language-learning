#include <iostream>
#include <numeric>
#include <limits>

class Fraction
{
private:
    int m_numerator{};
    int m_denominator{};

public:
    Fraction(int n=0, int d=1): m_numerator{ n }, m_denominator{ d }
    {

    }

    void print() const
    {
        std::cout << m_numerator << '/' << m_denominator << '\n';
    }

    static Fraction reduce(const Fraction f)
    {
        int gcd{ std::gcd(f.m_numerator, f.m_denominator) };
        if (gcd)
            return { f.m_numerator/gcd, f.m_denominator/gcd };

        return 0;
    }

    friend Fraction operator*(Fraction f1, Fraction f2);
    friend Fraction operator*(Fraction f, int v);
    friend Fraction operator*(int v, Fraction f);

    friend std::ostream& operator<<(std::ostream& out, const Fraction& f);
    friend std::istream& operator>>(std::istream& in, Fraction& f);
};

Fraction operator*(Fraction f1, Fraction f2)
{
    Fraction f{ f1.m_numerator * f2.m_numerator, f1.m_denominator * f2.m_denominator };
    return Fraction::reduce(f);
}

Fraction operator*(Fraction f, int v)
{
    Fraction fr{ f.m_numerator*v, f.m_denominator };
    return Fraction::reduce(f);
}

Fraction operator*(int v, Fraction f)
{
    return { f * v };
}

std::ostream& operator<<(std::ostream& out, const Fraction& f)
{
    out << f.m_numerator << '/' << f.m_denominator;
    return out;
}

std::istream& operator>>(std::istream& in, Fraction& f)
{
    in >> f.m_numerator;
    in.ignore(std::numeric_limits<std::streamsize>::max(), '/');
    in >> f.m_denominator;
    //Fraction::reduce(f);
    return in;
}

int main()
{
//    Fraction f1{2, 5};
//    f1.print();
//
//    Fraction f2{3, 8};
//    f2.print();
//
//    Fraction f3{ f1 * f2 };
//    f3.print();
//
//    Fraction f4{ f1 * 2 };
//    f4.print();
//
//    Fraction f5{ 2 * f2 };
//    f5.print();
//
//    Fraction f6{ Fraction{1, 2} * Fraction{2, 3} * Fraction{3, 4} };
//    f6.print();
//
//    Fraction f7{0, 6};
//    f7.print();

    Fraction f1;
	std::cout << "Enter fraction 1: ";
	std::cin >> f1;

	Fraction f2;
	std::cout << "Enter fraction 2: ";
	std::cin >> f2;

	std::cout << f1 << " * " << f2 << " is " << f1 * f2 << '\n';
	// note: The result of f1 * f2 is an r-value

    return 0;
}
