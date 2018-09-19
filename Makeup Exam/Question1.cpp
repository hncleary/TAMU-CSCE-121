#include <iostream>

using namespace std;

// functions for printings the values stored in an array
void printValues(int values[], int n){
    for(int i=0; i < n; ++i){
        if ( i != n-1){
            cout << values[i] << " + ";
        }
        else{
            cout << values[i];
        }
    }
    cout << endl;
}
// function that determines unique combinations of integers
// to create the desired input integer
void possibleIntSets(int n){
    //array to store the partition
    int values[n];
    //starting element
    int startPoint = 0;
    values[startPoint] = n;
    int iteration = 0;
    
    while (true){
        // print the original integer value
        iteration = iteration + 1;
        cout << "Combination " << iteration << " is: ";
        printValues(values, startPoint+1);
        
        // get the next value to print
        // find the next value that isnt the first integer
        
        int remaining = 0;
        while (startPoint >= 0 && values[startPoint] == 1){
            remaining = values[startPoint] + remaining;
            startPoint = startPoint - 1;
        }
        // start != 0
        if (startPoint < 0){
            return;
        }
        values[startPoint] = values[startPoint] - 1;
        remaining = remaining + 1;
        
        while ( remaining > values[startPoint]){
            values[startPoint+1] = values[startPoint];
            remaining = remaining - values[startPoint];
            startPoint = startPoint + 1;
        }
        
        values[startPoint+1] = remaining;
        startPoint = startPoint + 1;
    }
}

int main(){
    cout << "The possible integer combos for 5 are: " << endl;
    possibleIntSets(5);
}