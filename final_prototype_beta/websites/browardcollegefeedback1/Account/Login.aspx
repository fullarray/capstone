<%@ Page Title="Log in" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.vb" Inherits="Account_Login" %>
<%--<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>--%>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
       <%--*********************************************************************
         Bug fixed by Jonathan H. (in default.aspx only; see other files for more comments and bug fixes)
         -Recreate registration button
         -Reorginzed style classes and calls to server.
         -create custom style classes to render elements strategically on the page. 
         -Remove unused social media account login
    *********************************************************************--%>
    <hgroup class="title">
        <h3><%: Title %>.</h3>
         <h4>Sign in with your BC Survey Account </h4>
    </hgroup>
    <hr />
    <section>
       
        <asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="false" >
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Log in Form</legend>
                    <ol>
                        <li >
                            <asp:Label runat="server" AssociatedControlID="UserName">Username</asp:Label>
                            <asp:TextBox runat="server" ID="UserName" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                 CssClass="field-validation-error" ErrorMessage="The user name field is required." />
                        </li>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                 CssClass="field-validation-error" ErrorMessage="The password field is required." />
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
                        </li>
                    </ol>
                    <asp:Button runat="server" CommandName="Login" Text="Log in"/>
                </fieldset>
            </LayoutTemplate>
        </asp:Login>
        <br />
        <p class="custom-small-title">
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" NavigateUrl="~/Account/Register.aspx" >Create an account</asp:HyperLink>
        </p>
    </section>
<%--    <section >
        <h4>Sign in with your personal account.</h4>
        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
    </section>--%>
</asp:Content>