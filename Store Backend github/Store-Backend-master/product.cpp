//
//  main.cpp
//  Product
//
//  Created by Polina Golikova on 10/27/16.
//  Copyright © 2016 Polina Golikova. All rights reserved.
//
#include "product.h"
using namespace std;

string Description;

Product::Product(int productID, string productName): pID(productID), pName(productName){
}
int Product::getID()const{
    return (pID);
}
string Product::getName()const{
    return (pName);
}
string Product::getDescription(){
    return Description;
}
void Product::setDescription(string description){
    this->Description = description;
}
string Product::getName(){
    return (pName);
}
int Product::getID(){
    return (pID);
}
int Product::getNumberSold(){
    return (numSold);
}
double Product::getTotalPaid(){
    return (totalPaid);
}
int Product::getInventoryCount(){
    return (inventory);
}
void Product::addShipment(int shipmentQuantity, double shipmentCost){
    if (shipmentQuantity < 0 || shipmentCost < 0){
        throw runtime_error("negative amount");
    }
    inventory += shipmentQuantity;
    totalPaid += shipmentCost;
}
void Product::reduceInventory(int purchaseQuantity){
    if (purchaseQuantity > inventory || purchaseQuantity < 0){
        throw runtime_error("negative amount");
    }
    inventory -= purchaseQuantity;
    numSold += purchaseQuantity;
}
double Product::getPrice(){
    double price = 0;
    if ((inventory + numSold) == 0){
        price = 0;
    }
    else {
        price = (totalPaid / (inventory + numSold)) * 1.25;
    }
    return (price);
}


