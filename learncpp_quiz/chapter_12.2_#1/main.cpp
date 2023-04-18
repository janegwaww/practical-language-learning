#include <iostream>
#include <array>

class IntPair
{
public:
    std::array<int, 2> arr { };

    void set(int a, int b)
    {
        arr[0] = a;
        arr[1] = b;
    }

    void print()
    {
        std::cout << "Pair(" << arr[0] << ", " << arr[1] << ")\n";
    }
};

int main()
{
	IntPair p1;
	p1.set(1, 1); // set p1 values to (1, 1)

	IntPair p2 { 2, 2 }; // initialize p2 values to (2, 2)

	p1.print();
	p2.print();

	return 0;
}
