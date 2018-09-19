#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include "functions.h"

using namespace std;

int colorPath(const vector<vector<int>> heightMap, vector<vector<int>> r, vector<vector<int>> g, vector<vector<int>> b, int color_r, int color_g, int color_b, int start_row);


int main(){
    
    int rows;
    int columns;
    string fileName;
    
    
    // ask or file name and height and width
    cout << "What is the number of rows? " << endl;
    cin >> rows;
    cout << "What is the number of columns? " << endl;
    cin >> columns;
    cout << "What is the name of the file?" << endl;
    cin >> fileName;
    
    
    
    
    
    ifstream myFile;
	myFile.open(fileName);
	int filePosition = 0;

	vector<int> values;
	
	//loads data into 1D matrix
	if (myFile) {
		int value;
		while (myFile >> value) {
			values.push_back(value);
		}

	}
	
	/*
	//outputs data of 1D matrix
	for (int i=0;i<values.size();++i){
	    cout << values.at(i) << " ";
	}
	*/
	
	cout << endl << endl << endl;
	
	//set height width and initialize 2D matrix
	// int rows = 100;
	// int columns = 100;
	vector<vector<int>> gridMatrix;
	
    
    //resizes matrix to given m*n dimensions
    gridMatrix.resize(rows);
    for(int i = 0 ; i < rows ; ++i)
    {
        //Grow Columns by n
        gridMatrix[i].resize(columns);
    }
	
	// assigns values to resized matrix
	int valuesPosition = 0;
	for(int i=0;i<rows;++i){
	    for(int j=0;j<columns;++j){
	        gridMatrix[i][j] = values.at(valuesPosition);
	        ++valuesPosition;
	        // cout << gridMatrix[i][j] << " " ;
	        
	    }
	}
	
    //find min and max values in 2 vector
    double tempMax = gridMatrix[0][0];
    int maxRow;
    int maxColumn;

    double tempMin = gridMatrix[0][0];
    int minRow = 0;
    int minColumn = 0;
    
    
    for(int i=0;i<rows ;++i){
	    for(int j=0;j<columns ;++j){
	        if ( gridMatrix[i][j] > tempMax){
	            tempMax = gridMatrix[i][j];
	            maxRow = i;
	            maxColumn = j;
	        }
	    }
	}
	
	for(int i=0;i<rows ;++i){
	    for(int j=0;j<columns ;++j){
	        if ( gridMatrix[i][j] < tempMin){
	            tempMin = gridMatrix[i][j];
	            minRow = i;
	            minColumn = j;
	        }
	    }
	}
	
	cout << endl << endl << endl;
	cout << maxRow << " " << maxColumn << " " << tempMax << endl;
	cout << minRow << " " << minColumn << " " << tempMin << endl;
	
	//intitialize and resize 2D vectors for R G and B
	vector<vector<int>> red;
    red.resize(rows);
    for(int i = 0 ; i < rows ; ++i)
    {
        red[i].resize(columns);
    }
    vector<vector<int>> green;
    green.resize(rows);
    for(int i = 0 ; i < rows ; ++i)
    {
        green[i].resize(columns);
    }
    vector<vector<int>> blue;
	blue.resize(rows);
    for(int i = 0 ; i < rows ; ++i)
    {
        blue[i].resize(columns);
    }
	
	
	// store color values in 3 parallel vectors for R G and B
	int colorVal;
	
	for(int i=0;i<rows ;++i){
	    for(int j=0;j<columns ;++j){
	        colorVal = ( (gridMatrix[i][j] - tempMin) / (tempMax - tempMin) ) * 255;
	        red[i][j] = colorVal;
	        green[i][j] = colorVal;
	        blue[i][j] = colorVal;
	        // cout << green[i][j] << " ";
	        }
	    }
	    
	    
	    
	 // output RGB values to ppm file
	
	// create output file name for string 
	string outputFileName = fileName + ".ppm";
    cout << outputFileName;
	 
    ofstream outputFile;
    outputFile.open (outputFileName);
    outputFile << "P3" << endl;
    outputFile << columns << " " << rows << endl;
    outputFile << 255 << endl;
    for(int i = 0; i < rows; ++i){
        for(int j = 0; j < columns ; ++j){
            outputFile << red[i][j] << " " << green[i][j] << " " <<  blue[i][j] << " ";
        }
        outputFile << endl;
    }
    
    
    outputFile.close();
    
    // colorPath(gridMatrix, red, green, blue, 252, 25, 63, 1);
    colorPath( gridMatrix, red, green, blue, 252, 25, 63, 1);
    
	
	///
}
