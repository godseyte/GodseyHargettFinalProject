/*
 * Alex Hargett
 * Final Assignment
 * Due 5/1/2019
 * Web Server Application Development IT3047 001
 * 
 * Models a product
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



public class Product
{
    // Properties
    private string mProductName; //The name of the product
    private double mPricePerSellableUnit; //The price of the product
    private int mQuantity; //The amount of said item

    //Getters and Setters
    public string productName
    {
        get { return mProductName; }
        set { mProductName = value; }
    }

    public double pricePerSellableUnit
    {
        get { return mPricePerSellableUnit; }
        set { mPricePerSellableUnit = value; }
    }

    public int quantity
    {
        get { return mQuantity; }
        set { mQuantity = value; }
    }

    //Constructor
    public Product(string productName, double pricePerSellableUnit, int quantity)
    {
        this.productName = productName;
        this.pricePerSellableUnit = pricePerSellableUnit;
        this.quantity = quantity;
    }
    //Empty Contructor
    public Product()
    {
    }
}