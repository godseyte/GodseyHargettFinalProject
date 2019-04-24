<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceholder" Runat="Server">
    Products
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder" Runat="Server">
    <!--Table to hold all the products for a store-->
    <div><!--class="table-bordered"-->
        <asp:ListView ID="lvProductsFromSelectedStore" runat="server" DataSourceID="dsProductsFromSelectedStore">
            <ItemTemplate>
                <table ID="tblProductList" runat="server">
                    <tr>
                        <th><%# Eval("Name") %></th>
                        <td><%# Eval("PricePerSellableUnit") %></td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <!--DataSource that uses a select statement to grab all products from the selected store-->
    <asp:SqlDataSource ID="dsProductsFromSelectedStore" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT DISTINCT [Name], [Manufacturer], [Brand], [Description], [PricePerSellableUnit] FROM [vProductInfo] 
INNER JOIN [tProductPriceHist] ON [tProductPriceHist].[ProductID] = [vProductInfo].ProductID
INNER JOIN [tStore] ON [tStore].[StoreID] = [tProductPriceHist].[StoreID] WHERE Store = @StoreName;">
        <SelectParameters>
            <asp:SessionParameter Name="StoreName" SessionField="SelectedStore" DefaultValue="Batavia"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <!--GridView just to test that the data is being called correctly-->
    <!--
    <div class="table-responsive-md">
    <asp:GridView ID="gvProductsFromSelectedStore" runat="server" DataSourceID="dsProductsFromSelectedStore" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
            <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="PricePerSellableUnit" HeaderText="PricePerSellableUnit" SortExpression="PricePerSellableUnit" />
        </Columns>
    </asp:GridView>
    </div>------------------------>
</asp:Content>

