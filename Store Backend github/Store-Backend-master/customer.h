//
//  Customer.h
//  Product
//
//  Created by Polina Golikova on 10/27/16.
//  Copyright © 2016 Polina Golikova. All rights reserved.
//
#ifndef customer_h
#define customer_h
#include <iostream>
#include <string>
#include <stdbool.h>
#include "product.h"
#include <stdexcept>
#include <vector>


class Customer{
    std::string cname;
    int cID;
    double balance = 0;
    bool hasCredit;
    std::vector<Product> productsPurchased;

public:
    Customer(std::string name, int customerID, bool credit);
    std::string getName();
    std::string getName()const;
    bool getCredit()const;
    int getID();
    void setName(std::string name);
    int getID()const;
    bool getCredit();
    void setCredit(bool hasCredit);
    double getBalance();
    void processPayment(double amount);
    void processPurchase(double amount, Product product);
    void listProductsPurchased(std::ostream& os);
    friend std::ostream& operator<<(std::ostream& os, const Customer& c);
};
#endif /* Customer_h */
