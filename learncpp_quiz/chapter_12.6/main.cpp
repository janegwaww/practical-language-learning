#include <cstdint>
#include <iostream>

class RGBA
{
    using rgba_t = std::uint_fast8_t;
    rgba_t m_red {};
    rgba_t m_green {};
    rgba_t m_blue {};
    rgba_t m_alpha {};

public:
    RGBA(rgba_t r=0, rgba_t g=0, rgba_t b=0, rgba_t a=0)
    : m_red{ r }, m_green{ g }, m_blue{ b }, m_alpha{ a }
    {

    }

    void print()
    {
        std::cout << "r=" << static_cast<int>(m_red) << ' ' <<
        "g=" << static_cast<int>(m_green) << ' ' << "b="
        << static_cast<int>(m_blue) <<' ' << "a=" << static_cast<int>(m_alpha);
    }
};

int main()
{
	RGBA teal{ 0, 127, 127 };
	teal.print();

	return 0;
}
