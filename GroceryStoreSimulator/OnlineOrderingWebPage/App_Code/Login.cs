/*
 * Tucker Godsey
 * Final Assignment
 * Due 5/1/2019
 * Web Server Application Development IT3047 001
 * 
 * Models a Login
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Login
{
    // Properties
    private string mLogin; // Login Number/Name
    private Boolean mIsEmployee; // Is this Login an Employee Login?

    // Accessors
    public string login
    {
        get { return mLogin; }
        set { mLogin = value; }
    }

    public Boolean isEmployee
    {
        get { return mIsEmployee; }
        set { mIsEmployee = value; }
    }

    // Contstructor
    public Login(string login, Boolean isEmployee)
    {
        this.login = login;
        this.isEmployee = isEmployee;
    }

}