    <%@ Page Title="Broward College Survey" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="MainContent">
    <div class="auto-style6"  style="margin-left: 0px">
    <asp:Label ID="lblError" runat="server" Text="" CssClass="auto-style5"></asp:Label>
    <div class="auto-style5"  style="margin-left: 0px">
    <asp:Panel ID="PanelCampus" runat="server" Visible="true" style="margin-left: 36px">

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="campusselect" ErrorMessage="Please select a campus" Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <%-- This version will reuse 3 individual panels for displaying questions and responses
            there is a Yes/No panel, a Ratings panel and a Comments panel. THis allows for any amount and variation of question to be generated 
            and the code will handle it --%>
        <%-- DT 10.6 Added the Coral Springs option back but it will display the same options as the NOrth Campus--%>
        <%-- DT 10.6 added some formatting for a more uniform look --%>

        <h1>* Which campus location would you like to rate today?</h1>

        <asp:RadioButtonList ID="campusselect" runat="server" RepeatDirection="Horizontal" TextAlign="Left" Width="955px">
            <asp:ListItem Value="North" Text="North Campus"></asp:ListItem>
            <asp:ListItem Value="Coral" Text="Coral Springs Campus"></asp:ListItem>
        </asp:RadioButtonList>

        
       
        <asp:Button ID="ButtonNext1" runat="server" Text="Next" />

    </asp:Panel> 

    <div class="auto-style4">

        <div class="auto-style5">

    <asp:Panel ID="PanelServiceNorth" runat="server" Visible="false">
    
        
        <h1>* Which student service would you like to rate today?</h1> 
        <%--  <asp:ListItem>--Select--</asp:ListItem> : These two lines not needed when using teh database : --%>
        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Dropdownlist1" ErrorMessage="Please choose a service" Font-Bold="True" Font-Underline="True" ForeColor="#CC0000" InitialValue="--Select--"> </asp:RequiredFieldValidator> --%>
        <%--  Note- in order for selected list value to be saved AutoPostBack must be TRUE (checked in setup) --%>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="GetCat1" DataTextField="CategoryName" DataValueField="CategoryId" AutoPostBack="True">
             </asp:DropDownList>
        
        <asp:SqlDataSource ID="GetCat1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        
         <asp:Button ID="ButtonNext2" runat="server" Text="Next" />

       <%-- <asp:ListItem>--Select--</asp:ListItem> --%>

    </asp:Panel>

    <%-- NE_140928; here I am adding new code for new panels this one for Yes/NO questions--%>
    </div>
        </div>
<div class="auto-style4">
    <div class="auto-style5">
    <asp:Panel ID="PanelYesNo" runat="server" Visible="False">
     
        <%-- the following code was used to display all teh questions from the database and is no necessary --%>
       <%-- DT 09.21 The following code creates the grid with just the header and questions. 
        It sets autogeneratecolumns to false to avoid populating the other columns like question IDs etc. 
           We no longer need to see the gridview>

    <asp:GridView ID="GridView1" autogeneratecolumns="True" runat="server">
        <Columns>
            <asp:BoundField DataField="QuestionText" HeaderText="Questions:" />
        </Columns>
    </asp:GridView> --%

        

    <%-- DT 09.21 I've commented the following code out to hide the drop down.
        I've also deleted another smaller orphaned drop down  

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspnet-BrowardCollegeFeedback1-20140629104817ConnectionString %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>
        <br />--%>
        
        <h2>
            <asp:Label ID="LabelYN" runat="server" Text="YES / NO"></asp:Label>
         <br />
         </h2>   
        
       <%-- NE_140924; <h1>* Did the Admissions staff clearly explain the steps and documentation needed for admission to Broward College?</h1> -- Remove label work with gridview --%>
       
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorYN" runat="server"
            ControlToValidate="RadioButtonListYN" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:RadioButtonList ID="RadioButtonListYN" runat="server" RepeatDirection="Horizontal" Width="834px" TextAlign="Left">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
         
        <asp:Button ID="ButtonSubmitYN" runat="server" Text="Submit" />
        </asp:Panel>

    <%-- NE_140928; This panel is for ratings --%>
    </div>
        </div>
<div class="auto-style4">
    <div class="auto-style5">
    <asp:Panel ID="PanelRatings" runat="server" Visible="false">
     
       <%-- DT 09.21 The following code creates the grid with just the header and questions. 
        It sets autogeneratecolumns to false to avoid populating the other columns like question IDs etc. 
           We no longer need to see the gridview

    <asp:GridView ID="GridView2" autogeneratecolumns="True" runat="server">
        <Columns>
            <asp:BoundField DataField="QuestionText" HeaderText="Questions:" />
        </Columns>
    </asp:GridView>  --%>

        

    <%-- DT 09.21 I've commented the following code out to hide the drop down.
        I've also deleted another smaller orphaned drop down  

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:aspnet-BrowardCollegeFeedback1-20140629104817ConnectionString %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>
        <br />--%>
        
        <h2>
            <asp:Label ID="LabelRat" runat="server" Text="Ratings"></asp:Label>
         <br />
         </h2>   
        
            <%-- NE_140924; <h1>* How satisfied were you with the service you received?</h1> --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRat" runat="server" ControlToValidate="RadioButtonListRat" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
             <asp:RadioButtonList ID="RadioButtonListRat" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="RBL" TextAlign="Left" Width="603px">
                <asp:ListItem>Very satisfied</asp:ListItem>
                <asp:ListItem>Satisfied</asp:ListItem>
                <asp:ListItem>Neutral</asp:ListItem>
                <asp:ListItem>Dissatisfied</asp:ListItem>
                <asp:ListItem>Very dissatisfied</asp:ListItem>
            </asp:RadioButtonList>

            <%--The following code was removed and replaced by the above code which now displays the rating buttons horizontally
                <asp:RadioButtonList ID="RadioButtonListRat" runat="server" TextAlign="Left" Width="603px">
                <asp:ListItem>Very dissatisfied</asp:ListItem>
                <asp:ListItem>Dissatisfied</asp:ListItem>
                <asp:ListItem>Neutral</asp:ListItem>
                <asp:ListItem>Satisfied</asp:ListItem>
                <asp:ListItem>Very satisfied</asp:ListItem>
            </asp:RadioButtonList> --%>
            <br />
            <asp:Button ID="ButtonSubmitRat" runat="server" Text="Submit" />
        
    </asp:Panel>

    <%-- NE_140928; THis panel is for comments --%>
        </div>
        </div>
<div class="auto-style4">
        <div class="auto-style5">
        <asp:Panel ID="PanelComments" runat="server" Visible="false">
     
       <%-- DT 09.21 The following code creates the grid with just the header and questions. 
        It sets autogeneratecolumns to false to avoid populating the other columns like question IDs etc. 
           We no longer need to see teh GridView

    <asp:GridView ID="GridView3" autogeneratecolumns="True" runat="server">
        <Columns>
            <asp:BoundField DataField="QuestionText" HeaderText="Questions:" />
        </Columns>
    </asp:GridView> --%>

        

    <%-- DT 09.21 I've commented the following code out to hide the drop down.
        I've also deleted another smaller orphaned drop down 

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:aspnet-BrowardCollegeFeedback1-20140629104817ConnectionString %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>
        <br /> --%>
        
        <h2>
            <asp:Label ID="LabelCmt" runat="server" Text="Any Additional Comment"></asp:Label>
         <br />
         </h2>   
         <br />
            &nbsp;<%-- NE_140924; <h1>Additional Comments</h1><br /> --%><asp:TextBox ID="TextBoxCmt" runat="server" Height="51px" Width="240px"></asp:TextBox>
            <asp:Button ID="ButtonSubmitCmt" runat="server" Text="Submit" />
        


    </asp:Panel>
    <%-- NE_0923; moved Panel line to here, it was below the GridView  --%>
    </div>
        </div>
<div class="auto-style4">
    <asp:Panel ID="PanelAdmissions" runat="server" Visible="false">
     
       <%-- DT 09.21 The following code creates the grid with just the header and questions. 
        It sets autogeneratecolumns to false to avoid populating the other columns like question IDs etc.  --%>
    <asp:GridView ID="ddlQuestions" autogeneratecolumns="True" runat="server">
        <Columns>
            <asp:BoundField DataField="QuestionText" HeaderText="Questions:" />
        </Columns>
    </asp:GridView>

        

    <%-- DT 09.21 I've commented the following code out to hide the drop down.
        I've also deleted another smaller orphaned drop down  --%>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>
        <br />
        
        <h1>
            <asp:Label ID="QuLabel1" runat="server" Text="Label"></asp:Label>
         <br />
         </h1>   
        
       <%-- NE_140924; <h1>* Did the Admissions staff clearly explain the steps and documentation needed for admission to Broward College?</h1> -- Remove label work with gridview --%>
       
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
            ControlToValidate="RadioButtonList11" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
          
       
        
            <asp:RadioButtonList ID="RadioButtonList11" runat="server" RepeatDirection="Horizontal" Width="834px" TextAlign="Left">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
         
        <%-- NE_0923; Removed the following code…
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="QuestionText" DataValueField="QuestionId" Visible="False"></asp:DropDownList> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:aspnet-BrowardCollegeFeedback1-20140629104817ConnectionString %>' SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource> --%>
         
        <%-- NE_140924; Puting question text into text box - no text box neede
        <asp:TextBox ID="TextBox10_Q2" runat="server" Width="717px"></asp:TextBox>
        <br /> --%> 
        
            <%-- NE_140924; <h1>* How satisfied were you with the service you received?</h1> --%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList3" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
            <asp:RadioButtonList ID="RadioButtonList3" runat="server" TextAlign="Left" Width="603px">
                <asp:ListItem>Very dissatisfied</asp:ListItem>
                <asp:ListItem>Dissatisfied</asp:ListItem>
                <asp:ListItem>Neutral</asp:ListItem>
                <asp:ListItem>Satisfied</asp:ListItem>
                <asp:ListItem>Very satisfied</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            &nbsp;<%-- NE_140924; <h1>Additional Comments</h1><br /> --%><asp:TextBox ID="TextBox4" runat="server" Height="51px" Width="240px"></asp:TextBox>
            <asp:Button ID="ButtonSubmit1" runat="server" Text="Submit" />
        


    </asp:Panel>

    <%-- code was removed here because it was used for the hard coded version which displayed 
        different panels for each question. The three panel version replaces this code.--%>

        </div>

        </div>

        </div>
        <%--NE 10/07/14; Thi panel was added to give the user some options before starting the survey, continue, start over or exit --%>
        <asp:Panel ID="PanelContinue" runat="server" Visible="false" CssClass="auto-style4">
              <h2>
              <asp:Label ID="LabelDept" runat="server" Text="Department"></asp:Label>
            </h2>
            <h3> Will be evaluated. Click </h3>
              <h3>CONTINUE to start the survey&nbsp </h3><asp:Button ID="ButtonCont" runat="server" Text="Continue" />
              <h3>START OVER to restart the survey&nbsp; </h3><asp:Button ID="ButtonGoBack" runat="server" Text="Start Over" Width="104px" />
              <h3>EXIT to quit the survey&nbsp </h3><asp:Button ID="ButtonExit" runat="server" Text="Exit" Width="78px" />
              <br />
            
        </asp:Panel> 
        <%-- NE 10/07/14; THis panel is no longer used. It can be recalled for diagnostic purposes to stop the program before submitting the answers to the database --%>
        <asp:Panel ID="PanelDone" runat="server" Visible="false" CssClass="auto-style4">
            <h1>* You have completed all the questions. Click SUBMIT to post your answers</h1><br />
            <asp:Button ID="ButtonDone" runat="server" Text="Submit" />
        </asp:Panel>

    <asp:Panel ID="PanelExit" runat="server" Visible="false" CssClass="auto-style4">
        <h2>You have chosen to EXIT without taking the survey. <br />We hope you will return soon and give us your feedback.</h2>
         
    </asp:Panel>

    <%-- This is the last panel --%>
    <asp:Panel ID="PanelSubmit" runat="server" Visible="false" style="margin-left: 36px">
        <h2>Thank you for participating in our brief Student Affairs survey. <br />Your survey has been successfully submitted.</h2>
         
    </asp:Panel>

</asp:Content>
    <asp:Content ID="Content4" runat="server" contentplaceholderid="HeadContent">
        <style type="text/css">
    .auto-style4 {
        padding-left: 30px;
    }
            .auto-style5 {
                padding-left: 0;
            }
            .auto-style6 {
                padding-left: -1px;
            }
        </style>
    </asp:Content>
