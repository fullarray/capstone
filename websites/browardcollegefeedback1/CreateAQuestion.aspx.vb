Imports System.Data
Imports System.Data.SqlClient

Partial Class CreateAQuestion
    Inherits System.Web.UI.Page

    ' Dim ddlQuestions As Object
    Dim lblError As Object



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim dsQuestions As DataSet
        Dim connetionString As String
        Dim connection As SqlConnection
        Dim command As SqlCommand
        Dim adapter As New SqlDataAdapter
        Dim ds As New DataSet
        Dim i As Integer
        Dim sql As String

        connetionString = "Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-BrowardCollegeFeedback1-20140629104817;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-BrowardCollegeFeedback1-20140629104817.mdf"
        'Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-BrowardCollegeFeedback1-20140629104817;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-BrowardCollegeFeedback1-20140629104817.mdf
        sql = "select * from question"


        connection = New SqlConnection(connetionString)

        Try
            connection.Open()
            command = New SqlCommand(sql, connection)
            adapter.SelectCommand = command
            adapter.Fill(ds)
            adapter.Dispose()
            command.Dispose()
            connection.Close()

            For i = 0 To ds.Tables(0).Rows.Count - 1
                '  ddlQuestions.Items.Add(New ListItem(ds.Tables(0).Rows(i).Item(1), ds.Tables(0).Rows(i).Item(0).ToString))
            Next

        Catch ex As Exception
            MsgBox("Can not open connection ! ")

        End Try



        'For Each Row As DataRow In dsData.Tables(0).Rows


    End Sub


    Protected Sub Label1_Load(sender As Object, e As EventArgs) Handles Label1.Load

    End Sub

    Protected Sub DropDownList1_DataBound(sender As Object, e As EventArgs) Handles DropDownList1.DataBound

    End Sub

    Protected Sub DropDownList2_DataBound(sender As Object, e As EventArgs) Handles DropDownList2.DataBound

    End Sub

    Protected Sub TextBox1_DataBinding(sender As Object, e As EventArgs) Handles TextBox1.DataBinding

    End Sub

    Protected Sub TextBox1_Load(sender As Object, e As EventArgs) Handles TextBox1.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'this is where save question code goes
        Dim dsQuestions As DataSet
        Dim connetionString As String
        Dim connection As SqlConnection
        Dim command As SqlCommand
        Dim adapter As New SqlDataAdapter
        Dim ds As New DataSet
        Dim i As Integer
        Dim sql As String

        Dim iCheckboxResult As Integer

        If CheckBoxISRequired.Checked = True Then
            iCheckboxResult = 1
        Else
            iCheckboxResult = 0
        End If



        connetionString = "Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-BrowardCollegeFeedback1-20140629104817;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-BrowardCollegeFeedback1-20140629104817.mdf"
        'Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-BrowardCollegeFeedback1-20140629104817;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-BrowardCollegeFeedback1-20140629104817.mdf
        sql = "insert into question (QuestionText, isRequired, CategoryID, QuestionTypeID, isActive) Values ('" + TextBox1.Text + "', " + iCheckboxResult.ToString + " , " + DropDownList2.SelectedValue.ToString + " , " + DropDownList5.SelectedValue.ToString + ",1)"


        ' and put checkbox into boolean variable number

        connection = New SqlConnection(connetionString)

        Try
            connection.Open()
            command = New SqlCommand(sql, connection)
            adapter.SelectCommand = command
            adapter.Fill(ds)
            adapter.Dispose()
            command.Dispose()
            connection.Close()


        Catch ex As Exception
            MsgBox("Can not open connection ! ")

        End Try


        LabelMessage.Text = "Your question has been created! "
        'For Each Row As DataRow In dsData.Tables(0).Rows

    End Sub


    Protected Sub DropDownList3_DataBound(sender As Object, e As EventArgs) Handles DropDownList3.DataBound
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click


        Dim dsQuestions As DataSet
        Dim connetionString As String
        Dim connection As SqlConnection
        Dim command As SqlCommand
        Dim adapter As New SqlDataAdapter
        Dim ds As New DataSet
        Dim i As Integer
        Dim sql As String



        connetionString = "Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-BrowardCollegeFeedback1-20140629104817;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-BrowardCollegeFeedback1-20140629104817.mdf"
        'Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-BrowardCollegeFeedback1-20140629104817;Integrated Security=SSPI;AttachDBFilename=|DataDirectory|\aspnet-BrowardCollegeFeedback1-20140629104817.mdf
        sql = "select * from question '( QuestionTypeID ) Values ('" + DropDownList5.SelectedValue.ToString + ",1)"



        connection = New SqlConnection(connetionString)

        Try


            connection.Open()
            command = New SqlCommand(sql, connection)
            adapter.SelectCommand = command
            adapter.Fill(ds)
            adapter.Dispose()
            command.Dispose()
            connection.Close()

            For i = 0 To ds.Tables(0).Rows.Count - 1

            Next
        Catch ex As Exception

        End Try



    End Sub







    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click

    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click

    End Sub

    Protected Sub RadioButtonList11_DataBound(sender As Object, e As EventArgs) Handles RadioButtonList11.DataBound

    End Sub

    Protected Sub RadioButtonList3_DataBound(sender As Object, e As EventArgs) Handles RadioButtonList3.DataBound

    End Sub

    Protected Sub PanelTextBox_DataBinding(sender As Object, e As EventArgs) Handles PanelTextBox.DataBinding

    End Sub

    Private Shared Function QuestionTypeID() As Integer
        Throw New NotImplementedException
    End Function

    Private Shared Function isActive() As Object
        Throw New NotImplementedException
    End Function

    Private Function clicked() As Button
        Throw New NotImplementedException
    End Function

End Class

