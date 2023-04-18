#include <iostream>
#include <iterator>

// ...
int* find(int* first, int* second, int ele)
{
    for (int* ptr{ first }; ptr != second; ++ptr)
        {
            if (*ptr == ele)
            {
                return ptr;
            }
        }
    return second;
}

int main()
{
    int arr[]{ 2, 5, 4, 10, 8, 20, 16, 40 };

    // Search for the first element with value 20.
    int* found{ find(std::begin(arr), std::end(arr), 20) };

    // If an element with value 20 was found, print it.
    if (found != std::end(arr))
    {
        std::cout << *found << '\n';
    }

    return 0;
}
