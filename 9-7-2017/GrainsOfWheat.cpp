// must compile on build.tamu.edu
#include <string>
#include <limits>
#include <boost/lexical_cast.hpp>

using namespace std;

std::string inline full_precision(auto v) {
   return boost::lexical_cast<std::string>(v);
}

int main () {
    // change the **type** of grains_of_wheat variable when needed
    unsigned long int grains_of_wheat = 1;
    // 8X8 (change **total_squares** value to experiment with how many squares)
    int total_squares = 64; // 64 squares on chess board

    for ( int square_no = 1 ; square_no <= total_squares ; ++square_no )
    {
        cout << "[" << square_no << "] " << full_precision(grains_of_wheat) << endl;
        //grains_of_wheat ... set to what??? ... ;
    }
    return 0;
}