#include "add.h"
#include <iostream>
#define MY_NAME "Alex"

using namespace std;

int main()
{
    #ifdef MY_NAME
    cout << MY_NAME << endl;
    #endif // MY_NAME

    cout << add(5, 8) << endl;

    return 0;
}
