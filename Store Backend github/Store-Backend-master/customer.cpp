//
//  Customer.cpp
//  Product
//
//  Created by Polina Golikova on 10/27/16.
//  Copyright © 2016 Polina Golikova. All rights reserved.
//
#include "customer.h"
using namespace std;

Customer::Customer(string name, int customerID, bool credit): cname(name), cID(customerID), hasCredit(credit){
}
string Customer::getName()const{
    return (cname);
}
int Customer::getID()const{
    return (cID);
}
bool Customer::getCredit()const{
    return (hasCredit);
}
string Customer::getName(){
    return (cname);
}
void Customer::setName(string name){
    this -> cname = name;
}
int Customer::getID(){
    return (cID);
}
bool Customer::getCredit(){
    return (hasCredit);
}
void Customer::setCredit(bool hasCredit){
    this -> hasCredit = hasCredit;
}
double Customer::getBalance(){
    return (balance);
}
void Customer::processPayment(double amount){
    if (amount < 0){
        throw runtime_error("negative amount");
    }
    balance += amount;
}
void Customer::processPurchase(double amount, Product product){
    if (hasCredit){
        balance -= amount;
    }
    else {
        if (balance >= amount){
            balance -= amount;
        }
        else {
            throw runtime_error("negative amount");
        }
    }
    if (amount < 0){
        throw runtime_error("negative amount");
        
    }
    productsPurchased.push_back(product);
}
void Customer::listProductsPurchased(ostream& os){
    for (int i = 0; i < productsPurchased.size(); i++){
        os << productsPurchased.at(i) << " ";
    }
}
ostream& operator << (ostream& os, const Customer& c){
    os <<  "Customer name: " << c.getName() << "\t" << "Customer ID: " << c.getID() << "Customer credit: " << c.getCredit();
    return os;
    }
ostream& operator << (ostream& os, const Product& p){
    os <<  "Product name: " << p.getID() << "\t" << "Product ID: " << p.getName();
    return os;
}



