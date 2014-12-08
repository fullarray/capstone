<%@ Page Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="NorthCampus.aspx.vb" Inherits="_Default" Title="Broward College Survey" %>

        <asp:Content ID="Content1" runat="server" ContentID="NorthCampus" ContentPlaceHolderID="MainContent" ValidateRequestMode="Inherit">    
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
            
                       <%--  'Bug fixed by Jonathan H.
     Exclude clutered code, unnecesary calls to server, unstructured styling
    '*********************************************************************--%>
             <%--<div style="margin-top: 3px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:Button style="margin:auto" ID="btnBack1" runat="server" Font-Bold="True" PostBackUrl="~/HomePage.aspx" Text="Home Page" Width="172px" /> &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button style="margin:auto" ID="Button4" runat="server" PostBackUrl="~/CreateAQuestion.aspx" Text="Create a Question" Width="172px" /> &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button style="margin:auto" ID="Button3" runat="server" PostBackUrl="~/LoginPage.aspx" Text="Return to Login" Width="172px" />
            </div>
           
            <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%> 
            <asp:GridView style="margin:auto" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" 
            DataKeyNames="FeedbackFormId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Caption="STUDENT RESOURCES DATABASE - NORTH CAMPUS" HorizontalAlign="Center" PageSize="20" Font-Size="Large">
            <AlternatingRowStyle BackColor="LightGoldenRodYellow" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="FeedbackFormId" HeaderText="SurveyID" InsertVisible="False" ReadOnly="True" SortExpression="FeedbackFormId" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="DateCompleted" HeaderText="DateCompleted" SortExpression="DateCompleted" />
                <asp:BoundField DataField="AnswerText" HeaderText="AnswerText" SortExpression="AnswerText" />
                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT FeedbackForm.FeedbackFormId, FeedbackForm.DateCompleted, FeedbackAnswer.AnswerText, FeedbackAnswer_1.AnswerText AS Location FROM FeedbackForm INNER JOIN FeedbackAnswer ON FeedbackForm.FeedbackFormId = FeedbackAnswer.FeedbackFormID INNER JOIN FeedbackAnswer AS FeedbackAnswer_1 ON FeedbackForm.FeedbackFormId = FeedbackAnswer_1.FeedbackFormID WHERE (FeedbackAnswer.QuestionID = 2) AND (FeedbackAnswer_1.QuestionID = 1) AND (FeedbackAnswer_1.AnswerText = 'North')"></asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT FeedbackAnswer.FeedbackFormID, Question.QuestionText, FeedbackAnswer.AnswerText FROM FeedbackAnswer INNER JOIN Question ON FeedbackAnswer.QuestionID = Question.QuestionId WHERE (FeedbackAnswer.FeedbackFormID = @FeedbackFormID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="FeedbackFormID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="10" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Caption="SINGLE SURVEY SELECTION" HorizontalAlign="Center" Font-Size="Large">
            <AlternatingRowStyle BackColor="LightGoldenRodYellow" />
            <Columns>
                <asp:BoundField DataField="FeedbackFormID" HeaderText="SurveyID" SortExpression="FeedbackFormID" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="QuestionText" HeaderText="QuestionText" SortExpression="QuestionText" />
                <asp:BoundField DataField="AnswerText" HeaderText="AnswerText" SortExpression="AnswerText" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <br />
        <br />
    
</asp:Content>