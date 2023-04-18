#include <array>
#include <iostream>
#include <ctime>
#include <cstdlib>

class Monster
{
public:
    enum Type
    {
        dragon,
        goblin,
        ogre,
        orc,
        skeleton,
        troll,
        vampire,
        zombie,
        max_monster_types,
    };

private:
    Type m_type{};
    std::string m_name{};
    std::string m_roar{};
    int m_hit_point{};

public:
    Monster(const Type& t, const std::string& n, const std::string& r, int h)
    : m_type{ t }, m_name{ n }, m_roar{ r }, m_hit_point{ h }
    {

    }

    std::string getTypeString()
    {
        switch(m_type)
        {
            case dragon: return "Dragon";
            case goblin: return "Goblin";
            case ogre: return "Ogre";
            case orc: return "Orc";
            case skeleton: return "Skeleton";
            case troll: return "Troll";
            case vampire: return "Vampire";
            case zombie: return "Zombie";
            default: return 0;
        }

        return 0;
    }

    void print()
    {
        std::cout << m_name << " the " << getTypeString() <<
        " has " << m_hit_point <<  " hit points and says " << m_roar;
        std::cout << '\n';
    }
};

class MonsterGenerator
{
public:
    // Generate a random number between min and max (inclusive)
    // Assumes srand() has already been called
    static int getRandomNumber(int min, int max)
    {
        static constexpr double fraction{ 1.0 / (static_cast<double>(RAND_MAX) + 1.0) };  // static used for efficiency, so we only calculate this value once
        // evenly distribute the random number across our range
        return static_cast<int>(std::rand() * fraction * (max - min + 1) + min);
    }

    static Monster generateMonster()
    {
        int hit{ getRandomNumber(1, 100) };
        auto mon{ getRandomNumber(0, Monster::max_monster_types-1)};

        static constexpr std::array s_names{ "Blarg", "Moog", "Pksh", "Tyrn", "Mort", "Hans" };
		static constexpr std::array s_roars{ "*ROAR*", "*peep*", "*squeal*", "*whine*", "*hum*", "*burp*"};

		auto name{ s_names[static_cast<size_t>(getRandomNumber(0, 5))] };
		auto roar{ s_roars[static_cast<size_t>(getRandomNumber(0, 5))] };

        return { static_cast<Monster::Type>(mon), name, roar, hit };
    }


};

int main()
{
    Monster skeleton{ Monster::Type::skeleton, "Bones", "*rattle*", 4 };
    skeleton.print();

    std::srand(static_cast<unsigned int>(std::time(nullptr))); // set initial seed value to system clock
	std::rand(); // If using Visual Studio, discard first random value
    Monster m{ MonsterGenerator::generateMonster() };
	m.print();

    return 0;
}
