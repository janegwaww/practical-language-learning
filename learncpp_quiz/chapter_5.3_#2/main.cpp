#include <iostream>

using namespace std;

int main()
{
    cout << "Enter an integer: ";
    int i {};
    cin >> i;

    if (i % 2 == 0)
        cout << i << " is even\n";
    else
        cout << i << " is odd\n";

    return 0;
}
