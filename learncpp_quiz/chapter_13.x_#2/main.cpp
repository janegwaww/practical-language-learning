#include <iostream>

class Average
{
private:
    using sum_t = std::int_least32_t;
    using num_t = std::int_least8_t;
    sum_t m_sum{};
    num_t m_num{};

public:
    Average(sum_t s=0, num_t n=0)
    {
        m_sum = s;
        m_num = n;
    }

    Average& operator+=(int x)
    {
        m_sum += x;
        m_num += 1;
        return *this;
    }

    friend std::ostream& operator<<(std::ostream& out, Average& av);
};

std::ostream& operator<<(std::ostream& out, Average& av)
    {
        out << static_cast<double>(av.m_sum) / av.m_num;
        return out;
    }

int main()
{
	Average avg{};

	avg += 4;
	std::cout << avg << '\n'; // 4 / 1 = 4

	avg += 8;
	std::cout << avg << '\n'; // (4 + 8) / 2 = 6

	avg += 24;
	std::cout << avg << '\n'; // (4 + 8 + 24) / 3 = 12

	avg += -10;
	std::cout << avg << '\n'; // (4 + 8 + 24 - 10) / 4 = 6.5

	(avg += 6) += 10; // 2 calls chained together
	std::cout << avg << '\n'; // (4 + 8 + 24 - 10 + 6 + 10) / 6 = 7

	Average copy{ avg };
	std::cout << copy << '\n';

	return 0;
}
