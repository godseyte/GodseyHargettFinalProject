<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceholder" Runat="Server">
    Products
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder" Runat="Server">
    <!--Table to hold all the products for a store-->
    <div class="table-bordered">
        <asp:Table ID="tblProductList" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    <asp:SqlDataSource ID="dsProductsFromSelectedStore" runat="server"></asp:SqlDataSource>
</asp:Content>

