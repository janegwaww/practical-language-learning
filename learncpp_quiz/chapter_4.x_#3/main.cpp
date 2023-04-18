#include "operate_func.h"
#include <iostream>

int main()
{
    double num1 { getDoubleNum() };
    double num2 { getDoubleNum() };
    char ch { getMathSymbol() };
    double res { getOperateResult(num1, num2, ch) };

    if (res)
        std::cout << num1 << ch << num2 << " is " << res;
    return 0;
}
