<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceholder" Runat="Server">
    Products - <asp:Label ID="lblStore" runat="server" Text=""></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder" Runat="Server">
    <!--Table to hold all the products for a store-->
    <div class="table-bordered">
        <asp:ListView ID="lvProductsFromSelectedStore" runat="server" DataSourceID="dsProductsFromSelectedStore" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFF8DC;">Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    Manufacturer:
                    <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Manufacturer") %>' />
                    <br />
                    Brand:
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    PricePerSellableUnit:
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #008A8C; color: #FFFFFF;">Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Manufacturer:
                    <asp:TextBox ID="ManufacturerTextBox" runat="server" Text='<%# Bind("Manufacturer") %>' />
                    <br />
                    Brand:
                    <asp:TextBox ID="BrandTextBox" runat="server" Text='<%# Bind("Brand") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    PricePerSellableUnit:
                    <asp:TextBox ID="PricePerSellableUnitTextBox" runat="server" Text='<%# Bind("PricePerSellableUnit") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                <td runat="server" style="">Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Manufacturer:
                    <asp:TextBox ID="ManufacturerTextBox" runat="server" Text='<%# Bind("Manufacturer") %>' />
                    <br />
                    Brand:
                    <asp:TextBox ID="BrandTextBox" runat="server" Text='<%# Bind("Brand") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    PricePerSellableUnit:
                    <asp:TextBox ID="PricePerSellableUnitTextBox" runat="server" Text='<%# Bind("PricePerSellableUnit") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #DCDCDC; color: #000000;">Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    Manufacturer:
                    <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Manufacturer") %>' />
                    <br />
                    Brand:
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    PricePerSellableUnit:
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
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
                <td runat="server" style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    Manufacturer:
                    <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Manufacturer") %>' />
                    <br />
                    Brand:
                    <asp:Label ID="BrandLabel" runat="server" Text='<%# Eval("Brand") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
                    PricePerSellableUnit:
                    <asp:Label ID="PricePerSellableUnitLabel" runat="server" Text='<%# Eval("PricePerSellableUnit") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    <!--DataSource that uses a select statement to grab all products from the selected store-->
    <asp:SqlDataSource ID="dsProductsFromSelectedStore" runat="server" ConnectionString="<%$ ConnectionStrings:GroceryStoreSimulatorConnectionString %>" SelectCommand="SELECT DISTINCT [Name], [Manufacturer], [Brand], [Description], [PricePerSellableUnit] FROM [vProductInfo] 
INNER JOIN [tProductPriceHist] ON [tProductPriceHist].[ProductID] = [vProductInfo].ProductID
INNER JOIN [tStore] ON [tStore].[StoreID] = [tProductPriceHist].[StoreID] WHERE Store = @StoreName;">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="StoreName" QueryStringField="SelectedStore" />
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

