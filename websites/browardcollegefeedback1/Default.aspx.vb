Imports System.Data
Imports System.Data.SqlClient

'NE_140923; This is a restart using DT's code as a base line as it seems like he was on the right track
' I will incorporate my change in here and debug his code.
' Stored Procedure was modified to include the line 
' ORDER BY QuestionId DESC 
' this reverses the question order but questions 3 (rating) and 4 (Comments) had to be swapped in thhe table also.
'NE_140928.1330
'NE_141008.0150 - Added CONTINUE, START OVER and EXIT buttons, implemented isActive in SP and removed last SUBMIT panel

Partial Class _Default
    Inherits Page

    Dim QuestionIds As String
    Dim AnswerIDs As String
    'NE_140924; add this string to save the dapartment ID being rated
    Dim DeptID As String
    Public Shared QuID As String
    Public Shared int1 As Integer = 0
    Public Shared int2 As Integer = 0
    Dim myQuLabel1 As New Label()
    Dim myLabelDept As New Label()


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        QuestionIds = Session("QuestionIDs")
        AnswerIDs = Session("AnswerIDs")
    End Sub


    Protected Sub Page_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        Session("QuestionIDs") = QuestionIds
        Session("AnswerIDs") = AnswerIDs
    End Sub


    Protected Sub ButtonNext1_Click(sender As Object, e As EventArgs) Handles ButtonNext1.Click
        'This code was modified to use only the NOrth campus selection for both North and Coral
        PanelCampus.Visible = False

        QuestionIds = QuestionIds + "1,"
        AnswerIDs = AnswerIDs + campusselect.SelectedValue + ","

        'Select Case campusselect.SelectedValue

        '    Case "North"
        PanelServiceNorth.Visible = True

        '    Case "Coral Springs"
        'PanelServiceCoral.Visible = True

        'End Select

    End Sub

    Protected Sub ButtonNext2_Click(sender As Object, e As EventArgs) Handles ButtonNext2.Click

        'NE_0927; adding code here

        'DT_1006; corrected the code to display the department name from the dropdown
        LabelDept.Text = DropDownList1.SelectedItem.Text
        PanelServiceNorth.Visible = False
        DropDownList1.Visible = False
        ddlQuestions.Visible = False
        QuestionIds = QuestionIds + "2,"
        AnswerIDs = AnswerIDs + DropDownList1.SelectedItem.Text + ","
        ' MsgBox(AnswerIDs + "<Aid -- Qid>" + QuestionIds) 'DEBUG code
        myQuLabel1.Text = "questions go here"


        'NE_140923; removing all the case statements and using only the admission panel
        GetQuestions()

        PanelContinue.Visible = True

    End Sub

    Protected Sub ButtonCont_Click(sender As Object, e As EventArgs) Handles ButtonCont.Click
        'Select Case DropDownList1.SelectedValue
        'NE_140928; Now that we have the questions we have to figure out which panel to display, 
        'This will be done using the QuestionTypeID in cell 5 of the GridView 
        'ID 1 = Comments, ID 2 = Yes/No and ID 3 = Ratings
        'int1 and int2 are used as counters in a improvised for next loop
        'This code builds the initial page
        int1 = ddlQuestions.Rows.Count
        int2 = 0
        'For i = 0 To ddlQuestions.Rows.Count - 1
        PanelContinue.Visible = False
        Dim rowx As GridViewRow = ddlQuestions.Rows(int2)
        QuID = rowx.Cells(1).Text
        Select Case rowx.Cells(5).Text
            Case "1"
                PanelComments.Visible = True
                LabelCmt.Text = rowx.Cells(2).Text
            Case "2"
                PanelYesNo.Visible = True
                LabelYN.Text = rowx.Cells(2).Text
            Case "3"
                PanelRatings.Visible = True
                LabelRat.Text = rowx.Cells(2).Text
        End Select
        int2 = int2 + 1


    End Sub

    Protected Sub BuildNextPage()
        'This code is used to build all pages after the first page and does NOT initialize int 1 and int2
        'but uses them to keep track of where we are in the question count
        PanelComments.Visible = False
        PanelYesNo.Visible = False
        PanelRatings.Visible = False
        RadioButtonListYN.SelectedIndex = -1
        RadioButtonListRat.SelectedIndex = -1
        If int2 < int1 Then
            Dim rowx As GridViewRow = ddlQuestions.Rows(int2)
            QuID = rowx.Cells(1).Text
            Select Case rowx.Cells(5).Text
                Case "1"
                    PanelComments.Visible = True
                    LabelCmt.Text = rowx.Cells(2).Text
                Case "2"
                    PanelYesNo.Visible = True
                    LabelYN.Text = rowx.Cells(2).Text
                Case "3"
                    PanelRatings.Visible = True
                    LabelRat.Text = rowx.Cells(2).Text
            End Select
            int2 = int2 + 1
        Else
            'NE_141008.0150 - change here to remove last submit panel, just submit the form and quit
            'PanelDone.Visible = True
            SubmitForm()
            PanelSubmit.Visible = True

        End If
    End Sub

    Protected Sub GetQuestions()
        Dim dsQuestions As DataSet
        Dim connetionString As String
        Dim connection As SqlConnection
        Dim command As SqlCommand
        Dim adapter As New SqlDataAdapter
        Dim ds As New DataSet
        Dim i As Integer
        Dim sql As String



        connetionString = "Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-BrowardCollegeFeedback1-20140629104817;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-BrowardCollegeFeedback1-20140629104817.mdf"
        sql = "sp_GetQuestionsbyCat " + DropDownList1.SelectedValue

        connection = New SqlConnection(connetionString)

        Try
            connection.Open()
            command = New SqlCommand(sql, connection)
            adapter.SelectCommand = command
            adapter.Fill(ds)
            adapter.Dispose()
            command.Dispose()
            connection.Close()

            'NE_092714; not needed - For i = 0 To ds.Tables(0).Rows.Count - 1
            'DT.09.21
            'The commented out code represents my unsuccessful attempts to sort the questions in the correct order

            'calls for the database, sets the data source to ds (DataSet)' 
            ddlQuestions.DataSource = ds

            'inserts the questions into the grid from the database'
            ddlQuestions.DataBind()
            'End If


            'JH.09.18 add code to display textbox rating or yesno using grid view

            'Next

            'DT.09.21 Another unsuccessful attempt to sort the questions
            'ddlQuestions.Sort("CategoryID", 1) 

        Catch ex As Exception
            MsgBox("Can not open connection ! ")

        End Try



        'For Each Row As DataRow In dsData.Tables(0).Rows


    End Sub


    

    'NE_140928 This rutine will no longer be used and can be removed. The YN, Rat and Cmt subs take it s place.
    'NE_0924; the following Sub was accedentally deleted and so the program kept reloading the Admissions page 
    ' because there was nowhere for the SUBMIT to go. The next task is to change the 5 to reflect the correct location to store the answers.
    Protected Sub ButtonSubmit1_Click(sender As Object, e As EventArgs) Handles ButtonSubmit1.Click
        PanelAdmissions.Visible = False
        PanelSubmit.Visible = True

        'NE_140924; Replace 5 with DeptID to save answers in the correct row in table.
        ' QuestionIds = QuestionIds + "5,"
        DeptID = DropDownList1.SelectedValue + 4
        QuestionIds = QuestionIds + DeptID + ","
        AnswerIDs = AnswerIDs + RadioButtonList11.SelectedValue + ","

        'NE_140924; swap 3 and 4 for the QuestionIds to reflect change in table
        QuestionIds = QuestionIds + "4,"
        AnswerIDs = AnswerIDs + RadioButtonList3.SelectedValue + ","

        QuestionIds = QuestionIds + "3,"
        AnswerIDs = AnswerIDs + TextBox4.Text + ","

        SubmitForm()
    End Sub

    'NE_140928; this should be the last panel after all the questions are answered and the user is ready to submit the form
    Protected Sub ButtonDone_Click(sender As Object, e As EventArgs) Handles ButtonDone.Click
        PanelDone.Visible = False
        PanelSubmit.Visible = True

        SubmitForm()
    End Sub

    'NE_140928; This sub adds Yes/No answers to the answer form.
    Protected Sub ButtonSubmitYN_Click(sender As Object, e As EventArgs) Handles ButtonSubmitYN.Click
        PanelYesNo.Visible = False

        'NE_140928; build question and answer string for the database
        QuestionIds = QuestionIds + QuID + ","
        AnswerIDs = AnswerIDs + RadioButtonListYN.SelectedValue + ","

        'NE_140929; Testing a trick. I will now call a sub to build a web page based on the next question
        BuildNextPage()

    End Sub

    'NE_140928; This sub adds Ratings answers to the answer form.
    Protected Sub ButtonSubmitRat_Click(sender As Object, e As EventArgs) Handles ButtonSubmitRat.Click
        PanelAdmissions.Visible = False
        PanelRatings.Visible = True

        'NE_140928; build question and answer string for the database
        QuestionIds = QuestionIds + QuID + ","
        AnswerIDs = AnswerIDs + RadioButtonListRat.SelectedValue + ","

        'NE_140929; Testing a trick. I will now call a sub to build a web page based on the next question
        BuildNextPage()

    End Sub

    'NE_140928; This sub adds Comments answers to the answer form.
    Protected Sub ButtonSubmitCmt_Click(sender As Object, e As EventArgs) Handles ButtonSubmitCmt.Click
        PanelAdmissions.Visible = False
        PanelComments.Visible = True

        'NE_140928; build question and answer string for the database
        QuestionIds = QuestionIds + QuID + ","
        AnswerIDs = AnswerIDs + TextBoxCmt.Text + ","

        'NE_140929; Testing a trick. I will now call a sub to build a web page based on the next question
        BuildNextPage()


    End Sub

    Public Sub SubmitForm()
        PanelSubmit.Visible = True

        Dim connectionString As String

        Dim sqlConnection1 As SqlConnection

        connectionString = "Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-BrowardCollegeFeedback1-20140629104817;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-BrowardCollegeFeedback1-20140629104817.mdf"


        sqlConnection1 = New SqlConnection(connectionString)

        Try
            Dim cmd As New SqlCommand



            Dim FeedbackFormID As Integer

            cmd.CommandText = "CreateFeedbackForm"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Connection = sqlConnection1

            sqlConnection1.Open()

            FeedbackFormID = cmd.ExecuteScalar()

            'loop thru each QuestionIDs and AnswerIDS
            Dim QuestionArray As Array
            QuestionArray = Split(QuestionIds, ",")

            Dim AnswerArray As Array
            AnswerArray = Split(AnswerIDs, ",")

            For i As Integer = 0 To QuestionArray.Length - 1

                If QuestionArray(i) <> "" Then
                    Dim cmd2 As New SqlCommand
                    cmd2.CommandText = "CreateFeedbackAnswer"
                    cmd2.Parameters.AddWithValue("@FeedbackFormID", FeedbackFormID)
                    cmd2.Parameters.AddWithValue("@QuestionID", QuestionArray(i))
                    cmd2.Parameters.AddWithValue("@Answer", AnswerArray(i))


                    cmd2.CommandType = CommandType.StoredProcedure
                    cmd2.Connection = sqlConnection1
                    cmd2.ExecuteNonQuery()
                End If

            Next

            sqlConnection1.Close()

        Catch ex As Exception
            lblError.Text = "The survey is currently not working please try again later"

        End Try
    End Sub

    Public Sub ButtonGoBack_Click(sender As Object, e As EventArgs) Handles ButtonGoBack.Click
        'NE_141008.0150 - added this SUB for the start over code.
        PanelContinue.Visible = False
        'NE_141008.0150 - ckear Question and answer strings
        QuestionIds = ""
        AnswerIDs = ""
        'NE_141008.0150 - turn on ddl and panel
        DropDownList1.Visible = True
        ddlQuestions.Visible = True
        PanelCampus.Visible = True
        'NE_141008.0150 - clear campus select button
        campusselect.SelectedIndex = -1

    End Sub


    Public Sub ButtonExit_Click(sender As Object, e As EventArgs) Handles ButtonExit.Click
        'NE_141008.0150 - This sub exits the survey
        PanelContinue.Visible = False
        PanelExit.Visible = True

    End Sub


End Class