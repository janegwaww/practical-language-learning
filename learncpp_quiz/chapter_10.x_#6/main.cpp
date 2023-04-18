#include <array>
#include <algorithm>
#include <ctime>
#include <iostream>
#include <random>

enum class Ranks
{
    rank_2,
    rank_3,
    rank_4,
    rank_5,
    rank_6,
    rank_7,
    rank_8,
    rank_9,
    rank_10,
    rank_jack,
    rank_queen,
    rank_king,
    rank_ace,
    max_ranks,
};

enum class Suits
{
    clubs,
    diamonds,
    hearts,
    spades,
    max_suits,
};

struct Card
{
    Ranks rank;
    Suits suit;
};

void printCard(const Card& card)
{
    std::string r{};
    std::string s{};
    switch(card.rank)
    {
        case Ranks::rank_2: r = '2'; break;
        case Ranks::rank_3: r = '3'; break;
        case Ranks::rank_4: r = '4'; break;
        case Ranks::rank_5: r = '5'; break;
        case Ranks::rank_6: r = '6'; break;
        case Ranks::rank_7: r = '7'; break;
        case Ranks::rank_8: r = '8'; break;
        case Ranks::rank_9: r = '9'; break;
        case Ranks::rank_10: r = "10"; break;
        case Ranks::rank_jack: r = 'J'; break;
        case Ranks::rank_queen: r = 'Q'; break;
        case Ranks::rank_king: r = 'K'; break;
        case Ranks::rank_ace: r = 'A'; break;
        default: std::cout << '?'; break;
    }
    switch(card.suit)
    {
        case Suits::clubs: s = 'C'; break;
        case Suits::diamonds: s = 'D'; break;
        case Suits::hearts: s = 'H'; break;
        case Suits::spades: s = 'S'; break;
        default: std::cout << '?'; break;
    }
    std::cout << r << s << ' ';
}

auto createDeck()
{
    std::array<Card, 52> arr{ };
    int index{ 0 };
    for (int ii{ 0 }; ii != static_cast<int>(Ranks::max_ranks); ++ii)
        {

            for (int jj{ 0 }; jj != static_cast<int>(Suits::max_suits); ++jj)
                {
                    arr[static_cast<size_t>(index)].rank = static_cast<Ranks>(ii);
                    arr[static_cast<size_t>(index)].suit = static_cast<Suits>(jj);
                    ++index;
                }
        }
    return arr;
}

void printDeck(std::array<Card, 52>& arr)
{
    for (const Card& card : arr)
    {
        printCard(card);
    }
    std::cout << '\n';
}

auto shuffleDeck(std::array<Card, 52>& arr)
{
    std::mt19937 mt{ static_cast<std::mt19937::result_type>(std::time(nullptr))};
    std::shuffle(arr.begin(), arr.end(), mt);
}

int getCardValue(const Card& card)
{
    switch(card.rank)
    {
        case Ranks::rank_2: return 2;
        case Ranks::rank_3: return 3;
        case Ranks::rank_4: return 4;
        case Ranks::rank_5: return 5;
        case Ranks::rank_6: return 6;
        case Ranks::rank_7: return 7;
        case Ranks::rank_8: return 8;
        case Ranks::rank_9: return 9;
        case Ranks::rank_10: return 10;
        case Ranks::rank_jack: return 10;
        case Ranks::rank_queen: return 10;
        case Ranks::rank_king: return 10;
        case Ranks::rank_ace: return 11;
        default: return 0;
    }
}

int main()
{
    Card c1{ Ranks::rank_2, Suits::diamonds };
    std::array cards { createDeck() };
    printCard(c1);
    shuffleDeck(cards);
    printDeck(cards);
    return 0;
}
