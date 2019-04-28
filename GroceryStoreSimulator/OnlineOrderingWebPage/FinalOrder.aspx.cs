using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FinalOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Order order = new Order();
            order = (Order)Session["order"];
            lblLoyaltyNumberHeader.Text = order.login.login;
            lblLoyaltyNumberCardHead.Text = order.login.login;
        }
        catch (Exception ex)
        {
            lblLoyaltyNumberHeader.Text = "Ruh Roh Raggy";
        }
    }
}