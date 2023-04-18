#include <limits>
#include <iostream>

void printIndex()
{
    int index {};
    do
    {
        std::cout << "Enter a number between 1 and 9: ";
        std::cin >> index;
         // if the user entered something invalid
        if (std::cin.fail())
        {
            std::cin.clear(); // reset any error flags
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // ignore any characters in the input buffer
        }
    } while (index < 1 || index > 9);

    constexpr int arr[] { 4, 6, 7, 3, 8, 2, 1, 9, 5 };
    int arr_index {};

    for (int i{0}; i < static_cast<int>(std::size(arr)); ++i)
    {
        std::cout << i << ' ';
    }
    std::cout << '\n';

    for (int i{0}; i < static_cast<int>(std::size(arr)); ++i)
    {
        if(index == arr[i]) arr_index = i;
    }
    std::cout << "The number " << index << " has index " << arr_index << '\n';
}

void maxIndex()
{
    constexpr int scores[]{ 84, 92, 76, 81, 56 };

    int maxScoreIndex {0};

    // now look for a larger score in the full array
    for (int student{ 0 }; student < static_cast<int>(std::size(scores)); ++student)
    {
        if (scores[student] > scores[maxScoreIndex])
        {
            maxScoreIndex = student;
        }
    }

    std::cout << "The best score index was " << maxScoreIndex << '\n';
}

int main()
{
    constexpr int array[]{ 4, 6, 7, 3, 8, 2, 1, 9, 5 };
    int length { std::size(array) };
    for (int arr{0}; arr < length; ++arr)
        {
            std::cout << arr << ' ';
        }
    printIndex();
    maxIndex();

    return 0;
}
