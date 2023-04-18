#include <iostream>

struct Fraction
{
    int numerator {0};
    int demoninator {1};
};

Fraction readInFraction()
{
    int num {};
    std::cin >> num;
    int dem {};
    std::cin >> dem;

    return { num, dem };

}

void multipleFraction(Fraction& fra1, Fraction& fra2)
{
    int num { fra1.numerator * fra2.numerator };
    int dem { fra1.demoninator * fra2.demoninator };
    std::cout << "Your fraction multiplied together: " << num << '/' << dem << '\n';
}

int main()
{
    Fraction fra1 { readInFraction() };
    Fraction fra2 { readInFraction() };
    multipleFraction(fra1, fra2);
    return 0;
}
