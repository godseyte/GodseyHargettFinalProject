﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceholder" Runat="Server">
    Products - <asp:Label ID="lblStore" runat="server" Text=""></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder" Runat="Server">
    <!--Table to hold all the products for a store-->
    <div class="table-bordered" style="position: relative; width: 75%; float: left; display: inline-block; right: -3%;">
        <asp:ListView ID="lvProductsFromSelectedStore" runat="server" DataSourceID="dsProductsFromSelectedStore" GroupItemCount="5" 
            DataKeyNames="Name, PricePerSellableUnit" OnSelectedIndexChanged="lvProductsFromSelectedStore_SelectedIndexChanged" 
            OnItemDataBound="lvProductsFromSelectedStore_ItemDataBound">
            <AlternatingItemTemplate>
                <td runat="server" style="text-align: center;"><!--Name-->
                    <asp:Button ID="btnSelect" runat="server" Text='<%# Eval("Name") %>' Style="border: none;background: none;" CommandName ="Select"/>
                    <br />
                    <!--
                    Manufacturer:
                    <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Manufacturer") %>' />
                    <br />
                    -->
                    <!--Brand:-->
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' />
                    <br />
                    <!--
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    -->
                    <!--PricePerSellableUnit:-->
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' />
                    <br />
                    <asp:TextBox ID="tbQuantity" runat="server" style="width:22px; height: 22px"></asp:TextBox>
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="text-align: center;"><!--Name:-->
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    <!--
                    Manufacturer:
                    <asp:TextBox ID="ManufacturerTextBox" runat="server" Text='<%# Bind("Manufacturer") %>' />
                    <br />
                    -->
                    <!--Brand:-->
                    <asp:TextBox ID="BrandTextBox" runat="server" Text='<%# Bind("Brand") %>' />
                    <br />
                    <!--
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    -->
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
                    <!--
                    Manufacturer:
                    <asp:TextBox ID="ManufacturerTextBox" runat="server" Text='<%# Bind("Manufacturer") %>' />
                    <br />
                    -->
                    <!--Brand:-->
                    <asp:TextBox ID="BrandTextBox" runat="server" Text='<%# Bind("Brand") %>' />
                    <br />
                    <!--
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    -->
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
                    <!--
                    Manufacturer:
                    <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Manufacturer") %>' />
                    <br />
                    -->
                    <!--Brand:-->
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' />
                    <br />
                    <!--
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    -->
                    <!--PricePerSellableUnit:-->
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" style="">
                    <tr runat="server">
                        <td runat="server" style="">
                            <table id="groupPlaceholderContainer" runat="server" border="0" style="width: 100%; height: 500px;table-layout: fixed">
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
                    <asp:Button ID="btnSelect" runat="server" Text='<%# Eval("Name") %>' Style="border: none;background: none;" CommandName ="Select"/>
                    <br />
                    <!--
                    Manufacturer:
                    <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Manufacturer") %>' />
                    <br />
                    -->
                    <!--Brand:-->
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' />
                    <br />
                    <!--
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    -->
                    <!--PricePerSellableUnit:-->
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    
    <!--List that will act as the shopping cart for the webpage-->
    <div class="card" style="display: table; text-align: center; float:right; height: 500px; width: 18%;">
        <asp:BulletedList ID="blShoppingCart" runat="server" CssClass="list-group" Style="display:table-cell; text-align: left; float:left; list-style: none;">
        </asp:BulletedList>
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn-primary" Style="display:table-cell; position:absolute; bottom: 10px; left: 25%; width: 50%; height: 30px;" OnClick="btnCheckout_Click"/>
    </div>
    <!--DataSource that uses a select statement to grab all products from the selected store-->
    <asp:SqlDataSource ID="dsProductsFromSelectedStore" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT DISTINCT [Name], [Manufacturer], [Brand], [Description], [PricePerSellableUnit] FROM [vProductInfo] 
INNER JOIN [tProductPriceHist] ON [tProductPriceHist].[ProductID] = [vProductInfo].ProductID
INNER JOIN [tStore] ON [tStore].[StoreID] = [tProductPriceHist].[StoreID] WHERE Store = @StoreName;">
        <SelectParameters>
            <asp:Parameter DefaultValue="Batavia" Name="StoreName" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

