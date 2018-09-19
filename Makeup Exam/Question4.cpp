#include <iostream>
#include <sstream>
#include <string>

using namespace std;

//function to find greatest common denominator
int greatestArea(int n, int m, int k){
    int area = 0;

    // if cut functions, determine the max are of 
    // smallest cut
    if (m%(k+1) == 0){
        // cout << n/(k+1) << endl;
        if ( ( n * (m/(k+1)) ) > area){
            area =  n * (m/(k+1)) ;
        }
        // cout << area << endl;
    }
    if (n%k == 0){
        if ( ( m * (n/(k+1)) ) > area){
            area = ( m * (n/(k+1)) );
        }
        // cout << area << endl;
    }
    if ( area == 0){
        cout << "Proper cuts were unable to be made." << endl;
    }
    else{
        cout << "The maximum possible area of the smallest piece with " << k << " cuts is: " << area << endl;
    }
    return area;
}

int main(){
    //test function
    
    greatestArea(3,4,1);
    cout << endl;
    greatestArea(6,4,2);
    cout << endl;
    greatestArea(3,5,7);
}
    
            
