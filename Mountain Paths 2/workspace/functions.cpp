
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include "functions.h"

using namespace std;


int colorPath(const vector<vector<int>>& heightMap, vector<vector<int>>& r, vector<vector<int>>& g, vector<vector<int>>& b, int color_r, int color_g, int color_b, int start_row){
       
       int rows = heightMap.size();
       cout << rows; 
       
       
       // height map = gridMatrix
       // r = red values        }
       // g = green values      } all vectors
       // b = blue values       }
       // color_r = single red value    }
       // color_g = single green value  } singular color values
       // color_b = single blue value   }
       // start_ro = first loop will be 1 , then switch to specific path when changing to green path
       
       for(int i = 0; i < rows; ++i ){
           
       }

}
    
// colorPath(gridMatrix, red, green, blue, 252, 25, 63, 1);
// colorPath(const vector<vector<int>>& gridMatrix, vector<vector<int>>& red, vector<vector<int>>& green, vector<vector<int>>& blue, 252, 25, 63, 1);