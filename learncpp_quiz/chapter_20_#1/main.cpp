#include <iostream>



struct Advertising
{
    int ads_amount { 0 };
    double percent { 0.0 };
    double average { 0.0 };
};

double advertisingEarnedTheDay(const Advertising& ads);

void printAdvertisingValues(const Advertising& ads)
{
    std::cout << "ads amount: " << ads.ads_amount << '\n';
    std::cout << "percent ads clicked: " << ads.percent << '\n';
    std::cout << "average from each ad: " << ads.average << '\n';
    std::cout << "total earning: " << advertisingEarnedTheDay(ads) << '\n';
}

double advertisingEarnedTheDay(const Advertising& ads)
{
    return ads.ads_amount * ads.percent * ads.average;
}

int main()
{
    Advertising ads1 {10, 0.5, 100.0};
    printAdvertisingValues(ads1);
    return 0;
}
