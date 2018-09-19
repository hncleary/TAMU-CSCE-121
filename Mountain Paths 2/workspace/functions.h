#ifndef functions_h
#define functions_h


#include <iostream>
#include <string>
#include <fstream>
#include <vector>




using namespace std;

  
// int colorPath();
  
int colorPath(const vector<vector<int>> heightMap, vector<vector<int>> r, vector<vector<int>> g, vector<vector<int>> b, int color_r, int color_g, int color_b, int start_row);


#endif
