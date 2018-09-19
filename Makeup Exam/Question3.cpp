#include <iostream>
#include <sstream>
#include <string>

using namespace std;

//function to find greatest common denominator
int GreatestCommonDenominator(int a, int b){
    /*
    int gcd = 1;
    for(int i=1; i < a && i < b; ++i){
        if(a%i == 0 && b%i ==0){
            gcd = i;
        }
    }
    return gcd;
    */
    return b == 0 ? a : GreatestCommonDenominator(b, a%b);
}

// function takes in array and number of values in array
void LeastCommonMultiple(int values[], int n){
    int result = values[0];
    for(int i=1; i<n; ++i){
        result = ( ((values[i]*result)) / (GreatestCommonDenominator(values[i], result)));
    }
    cout << "The least common multiple is: " << result << endl;
}

int main(){
    // test GCD function
    // cout << GreatestCommonDenominator(3,9); *IT WORKS
    
    int values[] = {1, 2, 4, 24};
    LeastCommonMultiple(values, 4);
    
    int values2[] = {3, 6, 9};
    LeastCommonMultiple(values2, 3);
    
    int values3[] = {3, 7, 28, 84, 20, 10};
    LeastCommonMultiple(values3, 6);
}
