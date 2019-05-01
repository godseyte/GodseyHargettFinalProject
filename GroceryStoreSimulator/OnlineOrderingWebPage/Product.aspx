<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceholder" Runat="Server">
<!--
 * Alex Hargett
 * Final Assignment
 * Due 5/1/2019
 * Web Server Application Development IT3047 001
 * 
 * Shopping Cart
-->
    Products - <asp:Label ID="lblStoreName" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblLoyaltyLogin" runat="server" Text="" style="float: right;"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder" Runat="Server">
    <!--Table to hold all the products for a store-->
    <div class="table-borderless" style="position: relative; width: 75%; float: left; display: inline-block; right: -3%;">
        <asp:ListView ID="lvProductsFromSelectedStore" runat="server" DataSourceID="dsProductsFromSelectedStore" GroupItemCount="5" 
            DataKeyNames="Name, PricePerSellableUnit" OnItemDataBound="lvProductsFromSelectedStore_ItemDataBound" OnItemCommand="lvProductsFromSelectedStore_OnItemCommand">
            <AlternatingItemTemplate>
                <td runat="server" style="text-align: center;"><!--Name-->
                    <asp:Button ID="btnSelect" runat="server" Text='<%# Eval("Name") %>' Style="border: none; background: none;" CommandName ="Select"/>
                    <br />
                    <!--Brand:-->
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' style="" />
                    <br />
                    <!--PricePerSellableUnit:-->
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' style=""/>
                    <br />
                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="form-control-sm" style="width:45px; height:35px; margin: 0 auto;"></asp:TextBox>
                    <!--<asp:Button ID="Button1" runat="server" Text="" Style="display: inline-block; align-self: center; width:100%; height: 100%"/>-->
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="text-align: center;"><!--Name:-->
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    <!--Brand:-->
                    <asp:TextBox ID="BrandTextBox" runat="server" Text='<%# Bind("Brand") %>' />
                    <br />
                    <!--PricePerSellableUnit:-->
                    <asp:TextBox ID="PricePerSellableUnitTextBox" runat="server" Text='<%# Bind("PricePerSellableUnit") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="text-align: center;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="text-align: center;"><!--Name:-->
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    <!--Brand:-->
                    <asp:TextBox ID="BrandTextBox" runat="server" Text='<%# Bind("Brand") %>' />
                    <br />
                    <!--PricePerSellableUnit:-->
                    <asp:TextBox ID="PricePerSellableUnitTextBox" runat="server" Text='<%# Bind("PricePerSellableUnit") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="text-align: center;"><!--Name:-->
                    <asp:Button ID="btnSelect" runat="server" Text='<%# Eval("Name") %>' Style="border: none;background: none;" CommandName ="Select"/>
                    <br />
                    <!--Brand:-->
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' style=""/>
                    <br />
                    <!--PricePerSellableUnit:-->
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' style=""/>
                    <br />
                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="form-control-sm" style="width:45px; height:35px; margin: 0 auto;"></asp:TextBox>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="0" style="width: 100%; height: 500px;table-layout: fixed;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="25">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="text-align: center;"><!--Name:-->
                    <asp:Button ID="btnSelect" runat="server" Text='<%# Eval("Name") %>' Style="border: none; background: none; " CommandName ="Select"/>
                    <br />
                    <!--Brand:-->
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' style=""/>
                    <br />
                    <!--PricePerSellableUnit:-->
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' style=""/>
                    <br />
                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" CssClass="form-control-sm" style="width:45px; height:35px; margin: 0 auto;"></asp:TextBox>
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    
    <!--List that will act as the shopping cart for the webpage-->
    <div class="card" style="display: table; text-align: center; float:right; height: 500px; width: 18%;">
        <asp:BulletedList ID="blShoppingCart" runat="server" CssClass="list-group" Style="display:table-cell; text-align: left; float:left; list-style: none;"></asp:BulletedList>
        <asp:PlaceHolder ID="phQuantity" runat="server"></asp:PlaceHolder>
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn-primary" Style="display:table-cell; position:absolute; bottom: 10px; left: 25%; width: 50%; height: 30px;" OnClick="btnCheckout_Click"/>
    </div>
    <!--DataSource that uses a select statement to grab all products from the selected store-->
    <asp:SqlDataSource ID="dsProductsFromSelectedStore" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT DISTINCT [Name], [Brand],  [PricePerSellableUnit] FROM [vProductInfo] 
INNER JOIN [tProductPriceHist] ON [tProductPriceHist].[ProductID] = [vProductInfo].ProductID
INNER JOIN [tStore] ON [tStore].[StoreID] = [tProductPriceHist].[StoreID] WHERE Store = @StoreName;">
        <SelectParameters>
            <asp:ControlParameter ControlID="HeaderPlaceHolder$lblStoreName" DefaultValue="Batavia" Name="StoreName" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

