<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CreateAQuestion.aspx.vb" Inherits="CreateAQuestion" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>--%>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
  <%--  'Bug fixed by Jonathan H.
    Create coherent Navigation menu
    '*********************************************************************--%>
       <div class="row text-center"> 
            <div class="span1"></div>
            <div class="span2"><p><a href="/survey/NorthCampus.aspx" ">North Campus</a></p> </div>
            <div class="span2"><p><a href="/survey/CoralSprings.aspx" ">Coral Campus</a></p></div>
            <div class="span2"><p><a href="/survey/CreateAQuestion.aspx" ">Make Question</a></p></div>
            <div class="span2"><p><a href="/">Take me Home</a></p></div>
            <div class="span1"></div>
        </div>
          <asp:Label ID="LabelMessage" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" ForeColor="#FF0066"></asp:Label>    
     
    <%--  'Bug fixed by Jonathan H.
     Exclude clutered code, unnecesary calls to server, unstructured styling
    '*********************************************************************--%>
    <%--<br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" Font-Bold="True" PostBackUrl="~/HomePage.aspx" Text="Return to Home Page" Width="205px" Height="40px" />
        <asp:Button ID="Button3" runat="server" Font-Bold="True" PostBackUrl="~/NorthCampus.aspx" Text="Return to North Campus" Width="205px" Height="40px" />
        <asp:Button ID="Button4" runat="server" Font-Bold="True" Height="40px" PostBackUrl="~/CoralSprings.aspx" Text="Return To Coral Springs " Width="205px" />
        <asp:Button ID="Button5" runat="server" Font-Bold="True" PostBackUrl="~/LoginPage.aspx" Text="Return to Login" Width="205px" Height="40px" />

        <br />
        <br />
        <br />
        <br />
      

        <br />
        <br />
    
    --%>
    
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="823px">
        <Columns>
            <asp:BoundField DataField="QuestionText" HeaderText="QuestionText" SortExpression="QuestionText" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="sp_GetQuestions" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <!-- <ddlQuestions.Items.Add -->
    <br />
    <br />
    <asp:Label style="margin:auto" ID="Label1" runat="server" Text="Enter the Question you would like to add:" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center"></asp:Label>
    <br />
    <br />
    <asp:DropDownList style="margin:auto" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="CampusName" DataValueField="CampusId" Height="26px" Width="181px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Campus]"></asp:SqlDataSource>
        <br />
    <br />
    <asp:DropDownList style="margin:auto" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="CategoryName" DataValueField="CategoryId" Height="26px" Width="181px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        <br />
<br />
        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource8" DataTextField="QuestionText" DataValueField="Id" Height="26px" Width="181px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [QuestionType]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:CheckBox ID="CheckBoxISRequired" runat="server" Text="Check here if this question should be required to complete the survey" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Question Text:"></asp:Label>
        <br />
<br />


    <asp:TextBox style="margin:auto" ID="TextBox1" runat="server" Height="109px" Width="339"></asp:TextBox>
        <br />
 <br />
    <asp:Button style="margin:auto" ID="Button1" runat="server" Text="Submit"/>
        
 

    <br />
    <br />


    <asp:Label style="margin:auto" ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Choose the Question you would like to DEACTIVATE:"></asp:Label>
    <br />
    &nbsp;&nbsp;&nbsp;
    <br />
    <asp:DropDownList style="margin:auto" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="QuestionText" DataValueField="QuestionId" Height="31px" Width="391px">
    </asp:DropDownList>

    <%--<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>--%>
    <%--Kerion modified this following line and fixed the bug--%>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Question] WHERE (isActive = 1)"></asp:SqlDataSource>   
     
    <br />
    <br />



    <asp:Button style="margin:auto" ID="Button2" runat="server" Text="Deactivate"  />



        <br />
        <br />



    <br />
    <br />
        <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Choose the Question you would like to ACTIVATE:" Font-Bold="True"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource6" DataTextField="QuestionText" DataValueField="QuestionId" Height="31px" Width="391px">
        </asp:DropDownList>
        <%--<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>--%>
        <%--Kerion modified this following line and fixed the bug--%>
       <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Question] WHERE (isActive = 0)"></asp:SqlDataSource>
    
    <br />
    <br />
<asp:Button style="margin:auto" ID="Button7" runat="server" Text="Activate" />
    <br />
    <br />
&nbsp;<br />
        <br />
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" Text="ANSWER CHOICES:"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" Font-Underline="True" Text="Example of YES/NO:"></asp:Label>
    <br />

    <asp:RadioButtonList ID="RadioButtonList11" runat="server" RepeatDirection="Horizontal" Width="173px" TextAlign="Left" active="false">
           <asp:ListItem>Yes</asp:ListItem>
           <asp:ListItem>No</asp:ListItem>
           </asp:RadioButtonList>
    <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" Font-Underline="True" Text="Example of Rate Answer:"></asp:Label>
        <br />
    <br />
    <asp:RadioButtonList ID="RadioButtonList3" runat="server" TextAlign="Left" Width="151px" active="false">
           <asp:ListItem>Very dissatisfied</asp:ListItem>
           <asp:ListItem>Dissatisfied</asp:ListItem>
           <asp:ListItem>Neutral</asp:ListItem>
           <asp:ListItem>Satisfied</asp:ListItem>
           <asp:ListItem>Very satisfied</asp:ListItem>
           </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Font-Underline="True" Text="Example of Text Box:"></asp:Label>
        <br />
    <asp:Panel ID="PanelTextBox" runat="server" Visible="true">
         &nbsp;<h4>Please add your comments here:</h4>
        <asp:TextBox ID="TextBox3" runat="server" Height="109px" Width="339" active="false"></asp:TextBox><br />
        <asp:Button ID="ButtonText" runat="server" Text="Submit" />
        </asp:Panel>
</asp:Content>

 