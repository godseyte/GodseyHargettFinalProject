/*
 * Tucker Godsey
 * Final Assignment
 * Due 5/1/2019
 * Web Server Application Development IT3047 001
 * 
 * Models a Store
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Store
{
    // Properties
    private string mStoreName; // Name of Store
    private string mStoreStatus; // Status of Store

    // Accessors
    public string storeName
    {
        get { return mStoreName; }
        set { mStoreName = value; }
    }

    public string storeStatus
    {
        get { return mStoreStatus; }
        set { mStoreStatus = value; }
    }

    // Constructor
    public Store(string storeName, string storeStatus)
    {
        this.storeName = storeName;
        this.storeStatus = storeStatus;
    }
}