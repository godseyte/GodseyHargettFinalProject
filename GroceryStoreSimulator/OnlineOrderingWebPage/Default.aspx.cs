﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    // User Login
    protected void btnLoginUser_Click(object sender, EventArgs e)
    {
        // Gather the input data and use it to create an Order server object.

        // Verify the Loyalty Number exists
        if(txtLoyaltyNumberInput.Text.Trim() != "")
        {
            //TODO: Check the database for the Loyalty Number
        } else
        {
            // Throw Empty Loyalty Number Error
            lblError.Visible = true;
            lblError.Text = "Please input a Loyalty Number";
        }


        // Create new Login object
        Login newLogin = new Login(txtLoyaltyNumberInput.Text, false);

    }
}