#include <iostream>

enum class MonsterType
{
    ogre,
    dragon,
    orc,
    giant_spider,
    slime,
};

struct Monster
{
    std::string name {};
    int health {0};
    MonsterType type {};
};


std::string printName(const MonsterType& mon_t)
{
    switch(mon_t)
    {
        case MonsterType::ogre: return "ogre";
        case MonsterType::dragon: return "dragon";
        case MonsterType::orc: return "orc";
        case MonsterType::giant_spider: return "giant spider";
        case MonsterType::slime: return "slime";
        default: return "???";

    }
}

void printMonster(const Monster& mon)
{
    std::cout << "This " << printName(mon.type) << " is named " <<
    mon.name << " and has " << mon.health << " health.\n";
}

int main()
{
    Monster og { "Torg", 145, MonsterType::ogre };
    Monster sl { "Blurp", 23, MonsterType::slime };
    printMonster(og);
    printMonster(sl);
    return 0;
}
