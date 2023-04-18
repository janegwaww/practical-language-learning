#include <iostream>
#include <string>
#include <array>
#include <random>

int getRandomNumber(int min, int max)
{
  static constexpr double fraction{ 1.0 / (RAND_MAX + 1.0) }; // static used for efficiency, so we only calculate this value once
  // evenly distribute the random number across our range
  return min + static_cast<int>((max - min + 1) * (std::rand() * fraction));
}

class Creature
{
protected:
    std::string m_name{};
    char m_symbol{};
    int m_health{};
    int m_damage{};
    int m_gold{};

public:
    Creature(std::string n, char s, int h, int d, int g)
    : m_name{ n }
    , m_symbol{ s }
    , m_health{ h }
    , m_damage{ d }
    , m_gold{ g }
    {}

    std::string getName() { return m_name; }

    char getSymbol() { return m_symbol; }

    int getHealth() { return m_health; }

    int getDamage() { return m_damage; }

    int getGold() { return m_gold; }

    void reduceHealth(int h) { m_health -= h; }

    bool isDead() { return m_health <= 0; }

    void addGold(int g) { m_gold += g; }
};

class Player : public Creature
{
private:
    int m_level{ 1 };

public:
    Player(const std::string n)
    : Creature{ n, '@', 10, 1, 0}
    {
        std::cout << "Welcome, " << getName() << ".\n";
        std::cout << "You hava " << getHealth() <<
        " health and are carrying " << getGold() << " gold.\n";
    }

    void levelUp()
    {
        m_level += 1;
        m_damage += 1;
    }

    int getLevel() { return m_level; }

    bool hasWon() { return m_level >= 20; }
};

class Monster : public Creature
{
public:
    enum Type
    {
        dragon,
        orc,
        slime,
        max_types,
    };

    Monster(const Type& type)
    : Creature{ getDefaultCreature(type) }
    {

    }

private:
    // As a private member of Monster
    static const Creature& getDefaultCreature(Type type)
    {
        static const std::array<Creature, static_cast<std::size_t>(Type::max_types)> monsterData{
        { { "dragon", 'D', 20, 4, 100 },
            { "orc", 'o', 4, 2, 25 },
            { "slime", 's', 1, 1, 10 } }
        };

        return monsterData.at(static_cast<std::size_t>(type));
    }

public:
    static const Monster getRandomMonster()
    {
        int die6{ getRandomNumber(0, static_cast<int>(Type::max_types) - 1) };
        return Monster{ static_cast<Type>(die6) };
    }
};

int main()
{
	Creature o{ "orc", 'o', 4, 2, 10 };
	o.addGold(5);
	o.reduceHealth(1);
	std::cout << "The " << o.getName() << " has " << o.getHealth() << " health and is carrying " << o.getGold() << " gold.\n";

//	std::cout << "Enter your name: ";
//	std::string name;
//	std::cin >> name;
//	Player p1{ name };

	Monster m{ Monster::orc };
	std::cout << "A " << m.getName() << " (" << m.getSymbol() << ") was created.\n";

	std::srand(static_cast<unsigned int>(time(nullptr))); // set initial seed value to system clock
	std::rand(); // get rid of first result
	for (int i{ 0 }; i < 10; ++i)
	{
		Monster m{ Monster::getRandomMonster() };
		std::cout << "A " << m.getName() << " (" << m.getSymbol() << ") was created.\n";
	}

	return 0;
}
