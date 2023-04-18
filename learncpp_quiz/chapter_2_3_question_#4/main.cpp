#include <iostream>

using namespace std;

int doubleNumber(int x);

int getInteger()
{
    int num{0};
    cin >> num;
    return num;
}

int main()
{
    cout << "Please Enter a Integer: ";
    cout << doubleNumber(getInteger()) << endl;
    return 0;
}
