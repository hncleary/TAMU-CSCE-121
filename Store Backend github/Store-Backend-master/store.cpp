//
//  main.cpp
//  Product
//
//  Created by Polina Golikova on 11/01/16.
//  Copyright © 2016 Polina Golikova. All rights reserved.
//
#include "store.h"
#include <vector>
using namespace std;

Store::Store(string name): sname(name){
}
string Store::getName(){
    return (sname);
}
void Store::setName(string name){
    this -> sname = name;
}
void Store::addProduct(int productID, string productName){
        for (int i = 0; i < products.size(); i++){
            if (products.at(i).getID() == productID){
                throw runtime_error("already exists");
            }
        }
Product temp = Product(productID, productName);
products.push_back(temp);
}

void Store::addCustomer(int customerID, string customerName){
    for (int i = 0; i < customer.size(); i++){
        if (customer.at(i).getID() == customerID){
            throw runtime_error("already exists");
        }
    }
Customer temp = Customer(customerName, customerID, false);
customer.push_back(temp);
}

// part 3

Product& Store::getProduct(int productID){
    for (int i = 0; i < products.size(); i++){
        if (products.at(i).getID() == productID){
            return products.at(i);
        }
    }
throw runtime_error("does not exist");
}
    
Customer& Store::getCustomer(int customerID){
    for (int i = 0; i < customer.size(); i++){
        if (customer.at(i).getID() == customerID){
            return customer.at(i);
        }
    }
throw runtime_error("does not exist");
}

void Store::takeShipment(int productID, int quantity, double cost){
    getProduct(productID).addShipment(quantity, cost);
}

void Store::makePurchase(int customerID, int productID, int quantity){
    getProduct(productID).reduceInventory(quantity);
    amount = getProduct(productID).getPrice() * quantity;
    getCustomer(customerID).processPurchase(amount, getProduct(productID));
    
}
void Store::takePayment(int customerID, double amount){
    getCustomer(customerID).processPayment(amount);
}

void Store::listProducts()const{
    for (int i = 0; i < products.size(); i++){
    cout << products.at(i) << endl;
    }
}

void Store::listCustomers()const{
    for (int i = 0; i < customer.size(); i++){
    cout << customer.at(i) << endl;
    }
}

