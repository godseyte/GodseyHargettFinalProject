using System;
using System.Collections.Generic;
using System.Data;
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
        //lblStore.Text = order.store.storeName;

        //Request.QueryString["SelectedStore"] = order.store.storeName;
    }

    //This method is triggerd whenever an item is clicked in the listview we will use
    //this trigger to add an item to the shopping cart
    protected void lvProductsFromSelectedStore_SelectedIndexChanged(object sender, EventArgs e)
    {
        string pricePerSellableUnit = ConvertToCurrency(lvProductsFromSelectedStore.DataKeys[lvProductsFromSelectedStore.SelectedIndex].Values["PricePerSellableUnit"].ToString());
        ListItem shopingList = new ListItem(lvProductsFromSelectedStore.SelectedValue.ToString() + " " + pricePerSellableUnit);
        //shopingList.Attributes.Add("class", "list-group-item d-flex justify-content-between align-items-center");
        blShoppingCart.Items.Add(shopingList);
    }

    //This method allows you to alter the data gathered by the datasource before it is presented
    protected void lvProductsFromSelectedStore_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblPricePerSellableUnit = (Label)e.Item.FindControl("PricePerSellableUnitLabel");
        lblPricePerSellableUnit.Text = ConvertToCurrency(lblPricePerSellableUnit.Text);

        DataRowView rowView = e.Item.DataItem as DataRowView;
        string pricePerSellableUnit = rowView["PricePerSellableUnit"].ToString();
    }

    //This method is to convert the string of price to a US curency format
    public string ConvertToCurrency(string pricePerSellableUnit)
    {
        double pricePerSellableUnitDouble;
        pricePerSellableUnitDouble = Convert.ToDouble(pricePerSellableUnit);
        pricePerSellableUnit = pricePerSellableUnitDouble.ToString("C2");

        return pricePerSellableUnit;
    }
}