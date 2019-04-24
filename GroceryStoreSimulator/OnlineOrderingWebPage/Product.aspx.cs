using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //dsProductsFromSelectedStore.Select("");
        Order order = new Order();
        order = (Order)Session["order"];
        lblStore.Text = order.store.storeName;

        //Request.QueryString["SelectedStore"] = order.store.storeName;
    }
}