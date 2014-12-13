    <%@ Page Title="Broward College Survey" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="Survey" ContentPlaceHolderID="MainContent" >
     <%--*********************************************************************
         Bug fixed by Beaudelaire Dussuau (in default.aspx only)
         -------------------------------
         -Enabled Corap Spring radio button
         -Combined questions
         
         ================================================================================================

         Bug fixed by Jonathan H. (in default.aspx only; see other files for more comments and bug fixes)
         -------------------------------
         -create a paging panel mini functionality. Hide pageTwo panel.
         -Create a unordered list and place questions in each li element.
         -Isolate panel questions in li elements
         -Create "exit" button
         -Create "take me home" button
         -Clean or complete code inconsistencies and unclosed tags
         -Remove unnecessary calls to server
         -Remove unnecessary styling
         -Remove unseceraary HTML tags
         -Create styling classes for better readability and faster loading 
         -Create Coral Springs option and route calls to database as well (11/20/2014)
         -Genarate custom responses based on user action in panelContinue
         -Remove unnecessary panel asp:content
         -Remove unused panel at the bottom of default.aspx
         -Comment all other files as changes took place
         -Verify style is coherent between panel one and panel two
         -Verify styling from master page is inherited properly
         -Verify responsive functionality on smaller devices and phones
         -Adjusted the width of dropdownlists because they were too wide and didn't display properly on mobile
         -Adjusted the validator to reflect the elements that changed from radiobuttonlist to dropdownlists
    *********************************************************************--%>
<asp:panel runat="server" ID="PageOne">
    <asp:Label ID="lblError" runat="server" Text="" CssClass="auto-style5"></asp:Label>
             <p class="custom-md-title"><strong>BROWARD COLLEGE SURVEY</strong></p>  
      <p >Rate Your Satisfaction.</p>
    <hr /> 
    <ul class="media-list">
         <li class="media">
         <div class="media-body">
             <h4 class="media-heading">Step 1 of 3: Select a campus.</h4>
             <%-- ----------------------Select Campus Panel BEGINS------------------------ --%> 
              <asp:Panel ID="PanelCampus" runat="server" Visible="true">
 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="campusSelect" ErrorMessage="Please select a campus" Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <%-- This version will reuse 3 individual panels for displaying questions and responses
            there is a Yes/No panel, a Ratings panel and a Comments panel. THis allows for any amount and variation of question to be generated 
            and the code will handle it --%>
        <%-- DT 10.6 Added the Coral Springs option back but it will display the same options as the NOrth Campus--%>
        <%-- DT 10.6 added some formatting for a more uniform look --%>

        <P>Which campus location would you like to rate today?</P>
        <!--Changed RadioButtonList to DropDownList *Octavio* -->
        <asp:DropDownList ID="campusSelect" runat="server" RepeatDirection="Horizontal" TextAlign="Left">
            <asp:ListItem Value="North" Text="North Campus"></asp:ListItem>
            <asp:ListItem Value="Coral" Text="Coral Springs Campus"></asp:ListItem>
        </asp:DropDownList>
        <div class="custom-margin-top-10"></div>
        <asp:Button ID="CampusBtn" runat="server" Text="Next" ToolTip="Press to continue" />

    </asp:Panel>
             <%-- ----------------------Select Campus Panel ENDS-------------------------- --%> 
      </div>
        </li>
          <li class="media">
         <div class="media-body">
           <h4 class="media-heading">Step 2 of 3: Select a service</h4>
               <%-- ----------------------North Campus Panel BEGINS------------------------ --%>   
                <asp:Panel ID="PanelServiceNorth" runat="server" Visible="false">
                  
                    <%--  
                         Fix by Jonathan H.
                         Changed ID to a meaningful name
          
                         --%>
        
                    <P>Which student service would you like to rate today?</P> 
                    <%--  <asp:ListItem>--Select--</asp:ListItem> : These two lines not needed when using teh database : --%>
                    <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Dropdownlist1" ErrorMessage="Please choose a service" Font-Bold="True" Font-Underline="True" ForeColor="#CC0000" InitialValue="--Select--"> </asp:RequiredFieldValidator> --%>
                    <%--  Note- in order for selected list value to be saved AutoPostBack must be TRUE (checked in setup) --%>
        
                     <%--  
                         Fix by Jonathan H.
                         Changed ID to a meaningful name
          
                         --%>
                    <asp:DropDownList ID="NorthServicesDDL" runat="server" DataSourceID="GetCat1" DataTextField="CategoryName" DataValueField="CategoryId" AutoPostBack="True">
                         </asp:DropDownList>
        
                    <asp:SqlDataSource ID="GetCat1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    <br />
                     <asp:Button ID="NorthServicesBtn" runat="server" Text="Next " />

                   <%-- <asp:ListItem>--Select--</asp:ListItem> --%>

                </asp:Panel>
               <%-- ----------------------North Campus Panel ENDS-------------------------- --%>

               <%-- --------------------------Coral Campus Panel BEGINS----------------------- --%>     
                 <asp:Panel ID="PanelServiceCoral" runat="server" Visible="false">
                   <%-- Fix by Jonathan H. - Changed ID to a meaningful name--%>
                    <P>Which student service would you like to rate today?</P> 
                    <%--  <asp:ListItem>--Select--</asp:ListItem> : These two lines not needed when using teh database : --%>
                    <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Dropdownlist1" ErrorMessage="Please choose a service" Font-Bold="True" Font-Underline="True" ForeColor="#CC0000" InitialValue="--Select--"> </asp:RequiredFieldValidator> --%>
                    <%--  Note- in order for selected list value to be saved AutoPostBack must be TRUE (checked in setup) --%>
                     <%-- Fix by Jonathan H. - Changed ID to a meaningful name--%>
                     <asp:DropDownList ID="CoralServicesDDL" runat="server" DataSourceID="GetCat1" DataTextField="CategoryName" DataValueField="CategoryId" AutoPostBack="True">
                         </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    <br />
                     <%-- Fix by Jonathan H. - Changed ID to a meaningful name--%>
                     <asp:Button ID="CoralServicesBtn" runat="server" Text="Next" />
                </asp:Panel>
               <%-- --------------------------Coral Campus Panel ENDS------------------------- --%>
         </div>
        </li>
          <li class="media">
         <div class="media-body">
           <h4 class="media-heading ">Step 3 of 3: Select an action.</h4>
             <%-- --------------------------Before Survey Menu Panel BEGINS--------------------- --%>   
               <asp:Panel ID="PanelContinue" runat="server" Visible="false">
                    
        <%--NE 10/07/14; Thi panel was added to give the user some options before starting the survey, continue, start over or exit --%>
        <%--Fixed by Jonathan H. - Rearraged option for better user experience--%>
             <p><span style="text-decoration:underline;"><asp:Label ID="LabelDept" runat="server" Text="Department"></asp:Label></span> will be evaluated.</p>
             <p>What do you want to do now?</p>    
        <%--Fixed by Jonathan H. - resized button for better user interface--%>
        <ol>
            <li>  <h4>CONTINUE to start the survey</h4><asp:Button ID="ButtonCont" runat="server" Text="Continue" /><br /> </li>
            <li>    <h4>START OVER to restart the survey</h4><asp:Button ID="ButtonGoBack" runat="server" Text="Start Over" /><br /></li>
            <li> <%--Fixed by Jonathan H. - Rearraged option for better user experience--%>
              <h4>EXIT to quit the survey</h4><asp:Button ID="ButtonExit" runat="server" Text="Exit" PostBackUrl="~/"  /></li> 
        </ol>
              <br /> 
        </asp:Panel>
             <%-- --------------------------Before Survey Menu Panel ENDS----------------------- --%>   
         </div>
        </li>
    </ul>
    </asp:panel>
    <asp:Panel runat="server" ID="PageTwo" Visible="false" >
      <asp:Label ID="Label1" runat="server" Text="" CssClass="auto-style5"></asp:Label>
       <p class="custom-md-title"><strong>BROWARD COLLEGE SURVEY</strong></p>  
      <p >Your Opinion Counts</p>
      <hr /> 
    <ul class="media-list">
          <li class="media">
            <div class="media-body">
                <%-- ----------------------Yes/No Panel BEGINS------------------------ --%> 
                <asp:Panel ID="PanelYesNo" runat="server" Visible="False" >
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
        
                <p>
                    <asp:Label ID="LabelYN" runat="server" Text="YES / NO"></asp:Label>
                 </p>   
        
               <%-- NE_140924; <h1>* Did the Admissions staff clearly explain the steps and documentation needed for admission to Broward College?</h1> -- Remove label work with gridview --%>
       
        
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorYN" runat="server"
                    ControlToValidate="DropDownListYN" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <!--Changed RadioButtonList to DropDownList *Octavio* -->
                    <asp:DropDownList ID="DropDownListYN" runat="server" TextAlign="Left">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                <br />
                <asp:Button ID="ButtonSubmitYN" runat="server" Text="Next" />
                </asp:Panel>
             <%-- ----------------------Yes/No Panel ENDS-------------------------- --%> 
         </div>
        </li>
         <li class="media">
         <div class="media-body">
              <%-- ----------------------Ratings Panel BEGINS------------------------ --%> 
                <asp:Panel ID="PanelRatings" runat="server" Visible="False" >
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
        
                <p>
                    <asp:Label ID="LabelRat" runat="server" Text="Ratings"></asp:Label>
                 </p>   
        
                    <%-- NE_140924; <h1>* How satisfied were you with the service you received?</h1> --%>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRat" runat="server" ControlToValidate="DropDownListRat" ErrorMessage="Please choose one." Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                     
                    <!--Changed RadioButtonList to DropDownList *Octavio* -->
                    <asp:DropDownList ID="DropDownListRat" runat="server" TextAlign="Left">
                        <asp:ListItem>Very satisfied</asp:ListItem>
                        <asp:ListItem>Satisfied</asp:ListItem>
                        <asp:ListItem>Neutral</asp:ListItem>
                        <asp:ListItem>Dissatisfied</asp:ListItem>
                        <asp:ListItem>Very dissatisfied</asp:ListItem>
                    </asp:DropDownList>
                   
                    <%--The following code was removed and replaced by the above code which now displays the rating buttons horizontally
                        <asp:RadioButtonList ID="RadioButtonListRat" runat="server" TextAlign="Left" Width="603px">
                        <asp:ListItem>Very dissatisfied</asp:ListItem>
                        <asp:ListItem>Dissatisfied</asp:ListItem>
                        <asp:ListItem>Neutral</asp:ListItem>
                        <asp:ListItem>Satisfied</asp:ListItem>
                        <asp:ListItem>Very satisfied</asp:ListItem>
                    </asp:RadioButtonList> --%>
                    <br />
                    <asp:Button ID="ButtonSubmitRat" runat="server" Text="Next" />
         
            </asp:Panel>
             <%-- ----------------------Ratings Panel ENDS-------------------------- --%> 
         </div>
        </li>
         <li class="media">
         <div class="media-body">
                <%-- --------------------------Comments Panel BEGINS--------------------- --%> 
                <asp:Panel ID="PanelComments" runat="server" Visible="False">
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
        
                <p>
                    <asp:Label ID="LabelCmt" runat="server" Text="Any Additional Comment"></asp:Label>
                
                 </p>   
                    &nbsp;<%-- NE_140924; <h1>Additional Comments</h1><br /> --%>
                    <asp:TextBox ID="TextBoxCmt" runat="server" Height="51px" Width="240px"></asp:TextBox>
                     <br />
                    <asp:Button ID="ButtonSubmitCmt" runat="server" Text="Next" />
        


            </asp:Panel>
             <%-- --------------------------Comments Panel ENDS----------------------- --%>   
         </div>
        </li>
         <li class="media">
         <div class="media-body">
                 <%-- --------------------------Admissions Panel BEGINS--------------------- --%> 
                 <asp:Panel ID="PanelAdmissions" runat="server" Visible="False">
                   <%-- DT 09.21 The following code creates the grid with just the header and questions. 
                    It sets autogeneratecolumns to false to avoid populating the other columns like question IDs etc.  --%>
                <asp:GridView ID="ddlQuestions" autogeneratecolumns="True" runat="server">
                    <Columns>
                        <asp:BoundField DataField="QuestionText" HeaderText="Questions:" />
                    </Columns>
                </asp:GridView>

        

                <%-- DT 09.21 I've commented the following code out to hide the drop down.
                    I've also deleted another smaller orphaned drop down  --%>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource>
                    
        
                    <p>
                        <asp:Label ID="QuLabel1" runat="server" Text="Did the Admissions staff clearly explain the steps and documentation needed for admission to Broward College?"></asp:Label>
                     <br />
                     </p>   
        
                   <%-- NE_140924; <h1>* Did the Admissions staff clearly explain the steps and documentation needed for admission to Broward College?</h1> -- Remove label work with gridview --%>
       
        
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                        ControlToValidate="DropDownListAdmin" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
          
       
                       
                        <!--Changed RadioButtonList to DropDownList *Octavio* -->
                        <asp:DropDownList ID="DropDownListAdmin" runat="server" RepeatDirection="Horizontal" TextAlign="Left">
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:DropDownList>
         
                    <%-- NE_0923; Removed the following code…
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="QuestionText" DataValueField="QuestionId" Visible="False"></asp:DropDownList> 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:aspnet-BrowardCollegeFeedback1-20140629104817ConnectionString %>' SelectCommand="SELECT * FROM [Question]"></asp:SqlDataSource> --%>
         
                    <%-- NE_140924; Puting question text into text box - no text box neede
                    <asp:TextBox ID="TextBox10_Q2" runat="server" Width="717px"></asp:TextBox>
                    <br /> --%> 
        
                        <%-- NE_140924; <h1>* How satisfied were you with the service you received?</h1> --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownListSatis" ErrorMessage="Please choose one." Font-Bold="True" Font-Underline="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="DropDownListSatis" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="RBL" TextAlign="Left">
                            <asp:ListItem>Very dissatisfied</asp:ListItem>
                            <asp:ListItem>Dissatisfied</asp:ListItem>
                            <asp:ListItem>Neutral</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Very satisfied</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                       <%-- NE_140924; <h1>Additional Comments</h1><br /> --%>
                    <p>Please detail your answer</p>
                       <asp:TextBox ID="TextBox4" runat="server" Height="51px" Width="240px"></asp:TextBox>
                    <br />
                        <asp:Button ID="ButtonSubmit1" runat="server" Text="Next" />
        


                </asp:Panel>
              <%-- --------------------------Admissions Panel ENDS----------------------- --%>  
         </div>
        </li>
           <li class="media">
         <div class="media-body">
              <%-- --------------------------Question Five Panel BEGINS--------------------- --%> 
                <asp:Panel ID="PanelDone" runat="server" Visible="False">
                    <hr />
                <p>You have completed all the questions. Click <strong>submit</strong> to post your answers</p><br />
                <asp:Button ID="ButtonDone" runat="server" Text="Next" />
            </asp:Panel>
             <%-- --------------------------Question Five Panel ENDS----------------------- --%>  
            
         </div>
        </li>
    </ul>
   
</asp:panel>
<asp:Panel ID="ExitWithoutComplete" runat="server" Visible="false" >
      <%-- --------------------------Exit Panel BEGINS--------------------- --%> 
                 <asp:Panel ID="PanelExit" runat="server" Visible="false" >
        <p class="text-center">You have chosen to <strong ><span style="color:red;">exit</span></strong> without taking the survey. <br />We hope you will return soon and give us your feedback.</p>
                     <br />
        <p class="text-center"><a class="terminating-buttons" href="default.aspx">Take me to the homepage</a></p>
                     <%--<asp:Button ID="Button2" runat="server" Text="Take me to the homepage" postbackurl="default.aspx"/>--%>
                 </asp:Panel>
             <%-- --------------------------Exit Panel ENDS----------------------- --%> 
</asp:Panel>
<asp:Panel ID="thankYou" runat="server" Visible="False" >
    <%-- --------------------------Submit Panel BEGINS--------------------- --%> 
            <asp:Panel ID="PanelSubmit" runat="server" Visible="False">
              
               <p class="text-center custom-substract-5">Thank you for participating in our brief Student Affairs survey. <br />Your survey has been <strong><span style="color:green;">successfully</span></strong> submitted.</p>
               <br />
                <%--<asp:Button ID="Button1" runat="server" Text="Take me to the homepage" postbackurl="~/default.aspx"/>--%>
                
                <p class="text-center"><a class="terminating-buttons" href="default.aspx" >Take me to the homepage</a></p>
            </asp:Panel>
             <%-- --------------------------Submit Panel ENDS----------------------- --%>
</asp:Panel>
</asp:Content>