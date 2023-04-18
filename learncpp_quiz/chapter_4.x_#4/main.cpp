#include <iostream>

double getHeight()
{
    std::cout << "Enter the height of the tower in meters: ";
    double h { 0.0 };
    std::cin >> h;
    return h;
}

double distanceFallen(int sec)
{
    const double gravity { 9.8 };
    return gravity * (sec * sec) / 2.0;
}

void printHeight(double h, int sec)
{
    if (h - distanceFallen(sec) > 0)
        std::cout << "At seconds, the ball is at height: "
                  << h - distanceFallen(sec)
                  << " meters.\n";
}

int main()
{
    double h { getHeight() };

    printHeight(h, 0);
    printHeight(h, 1);
    printHeight(h, 2);
    printHeight(h, 3);
    printHeight(h, 4);
    printHeight(h, 5);

    return 0;
}
