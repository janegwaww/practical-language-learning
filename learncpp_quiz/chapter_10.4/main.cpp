#include <algorithm>
#include <iostream>

void bubbleSort()
{
    int array[]{ 6, 3, 2, 9, 7, 1, 5, 4, 8 };
    int length { static_cast<int>(std::size(array)) };

    for (int i{0}; i < length - 1; ++i)
    {
        bool swapped{ false };
        for (int j{0}; j < length - i; ++j)
            {
                if (array[j] > array[j+1])
                {
                    std::swap(array[j], array[j+1]);
                    swapped = true;
                }
            }
        if (!swapped)
        {
            std::cout << "Early termination on iteration " << i + 1 << '\n';
            break;
        }
    }


    for (int ii{0}; ii < static_cast<int>(std::size(array)); ++ii)
        {
            std::cout << array[ii] << ' ';
        }
    std::cout << '\n';
}

int main()
{
    int arr[] { 30, 60, 20, 50, 40, 10 };
    std::sort(std::begin(arr), std::end(arr), std::greater<int>());
    for (int i{0}; i < static_cast<int>(std::size(arr)); ++i)
        {
            std::cout << arr[i] << ' ';
        }
    std::cout << std::endl;
    bubbleSort();

    return 0;
}
