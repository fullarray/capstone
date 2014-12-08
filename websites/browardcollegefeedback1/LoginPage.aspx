
<%@ Page Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="LoginPage.aspx.vb" Inherits="_Default" Title="Broward College Survey" %>

        <asp:Content ID="Content1" runat="server" ContentID="LoginPage" ContentPlaceHolderID="MainContent" ValidateRequestMode="Inherit">

            <asp:Login style="margin:auto" ID="Login1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="4" 
            BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/HomePage.aspx" Font-Names="Verdana" Font-Size="0.9em" ForeColor="#333333" Height="233px" Width="633px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>

</asp:Content>