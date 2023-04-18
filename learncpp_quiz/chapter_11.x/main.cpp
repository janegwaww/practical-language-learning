#include <vector>
#include <iostream>

using namespace std;

double max(double a, double b);

void swap(int& x, int& y);

auto& getLargestElement(std::vector<int>* array, int length);

int main()
{
    int array[10]{};

    for (auto x: array)
        std::cout << x << ' ';

    std::cout << '\n';
    cout << "Hello world!" << endl;
    return 0;
}
