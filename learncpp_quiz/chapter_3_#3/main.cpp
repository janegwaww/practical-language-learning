#include <iostream>

void d()
{ // here
}

void c()
{
}

void b()
{
	c();
	d();
}

void a()
{
	b();
}

int main()
{
	a();
	std::cout << sizeof(float) << '\n';
	unsigned short x {0};
	x = 65535;
	std::cout << x;

	return 0;
}
