#include <iostream>

int readNumber()
{
	std::cout << "Please enter a number: ";
	int x {0};
	std::cin >> x;
	return x;
}

void writeAnswer(int x)
{
	std::cout << "The sum is: " << x << '\n';
}

int main()
{
	int x {0};
	x = readNumber() + readNumber();
	writeAnswer(x);

	return 0;
}
