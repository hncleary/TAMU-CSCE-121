#include <iostream>
#include <sstream>
#include <string>

using namespace std;

string removeNonIntegers ( string input ){
    // string list of all punctuations
    const string integers = " 0123456789";
    string output;
    for (const auto& ch : input)
    {
        bool found = false;
        for (const auto& p : integers)
        {
            if (ch == p)
            {
                found = true;
                break;
            }
        }
        if (found)
            output += ch;
    }
    cout << output;
    return output;
}

int main(){
    removeNonIntegers( "1234 Hello World 1 2 3 4");
    cout << endl;
    removeNonIntegers( "Test1Test Testing this Hello 23 42 H9i9");
}
