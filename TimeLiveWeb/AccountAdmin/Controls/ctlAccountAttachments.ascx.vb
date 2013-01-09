Partial Class AccountAdmin_Controls_ctlAccountAttachments
    Inherits System.Web.UI.UserControl

    Dim AccountExpenseEntryId As Integer
    Protected Sub dsAccountAttachmentsFormViewObject_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountAttachmentsFormViewObject.Inserted
        DBUtilities.AfterInsert(Me.GridView1)
    End Sub
    Protected Sub dsAccountAttachmentsFormViewObject_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountAttachmentsFormViewObject.Inserting
        DBUtilities.SetRowForInserting(e)
    End Sub
    Protected Sub dsAccountAttachmentsFormViewObject_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountAttachmentsFormViewObject.Updated
        DBUtilities.AfterUpdate(Me.GridView1)
    End Sub
    Protected Sub dsAccountAttachmentsFormViewObject_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountAttachmentsFormViewObject.Updating
        DBUtilities.SetRowForInserting(e)
    End Sub
    Private Function FindControlRecursive(ByVal root As Control, ByVal id As String) As Control
        If root.ID = id Then
            Return root
        End If
        Dim c As Control
        For Each c In root.Controls
            Dim t As Control = FindControlRecursive(c, id)
            If Not t Is Nothing Then
                Return t
            End If
        Next
        Return Nothing
    End Function
    Public Function GetAccountExpenseEntryIdAndExpenseName() As Boolean
        AccountExpenseEntryId = Me.Request.QueryString("AccountExpenseEntryId")
        Dim dtExpense As TimeLiveDataSet.vueAccountExpenseEntryDataTable = New AccountExpenseEntryBLL().GetvueAccountExpenseEntriesByAccountExpenseEntryId(AccountExpenseEntryId)
        Dim drExpense As TimeLiveDataSet.vueAccountExpenseEntryRow

        If dtExpense.Rows.Count > 0 Then
            drExpense = dtExpense.Rows(0)
            CType(Me.FormView2.FindControl("txtExpenseEntryId"), TextBox).Text = drExpense.AccountExpenseEntryId
            CType(Me.FormView2.FindControl("txtExpenseName"), TextBox).Text = drExpense.AccountExpenseName
            CType(Me.FormView2.FindControl("txtAmount"), TextBox).Text = drExpense.CurrencyCode & " " & drExpense.Amount
        End If
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If AuthenticateBLL.IsNewSession() Then
            AuthenticateBLL.DoLogout(Me.Page)
        End If

        Me.GetAccountExpenseEntryIdAndExpenseName()

        Dim ScriptManager As System.Web.UI.ScriptManager = Me.FindControlRecursive(Me.Page, "ScriptManager2")
        ScriptManager.RegisterPostBackControl(Me.FormView1.FindControl("btnUpload"))
    End Sub
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        AccountExpenseEntryId = IIf(Not Request.QueryString("AccountExpenseEntryId") Is Nothing, Request.QueryString("AccountExpenseEntryId"), 64)
        Dim strUploadPath As String = System.Configuration.ConfigurationManager.AppSettings("UploadFilesPath")
        Dim strRoot As String = System.Web.HttpContext.Current.Server.MapPath(strUploadPath)

        If e.CommandName = "Delete" Then
            Dim objRow As GridViewRow = Me.GridView1.Rows(e.CommandArgument)
            Dim strFileName As String = strRoot & DBUtilities.GetSessionAccountId & "\" & AccountExpenseEntryId & "\" & CType(objRow.FindControl("FileHyperlink"), HyperLink).Text
            If System.IO.File.Exists(strFileName) Then
                ' Try
                System.IO.File.Delete(strFileName)
                'Catch ex As Exception
                ' R 'esponse.Write(ex.Message)
                'End Try
            End If
        End If

    End Sub
    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Retrieve the LinkButton control from the first column.
            Dim Delete As LinkButton = CType(e.Row.Cells(3).Controls(1), LinkButton)
            ' Set the LinkButton's CommandArgument property with the
            ' row's index.
            Delete.CommandArgument = e.Row.RowIndex.ToString()
        End If
    End Sub
    Dim AttachmentBll As New AccountAttachmentsBLL
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        UIUtilities.ClearCellsForNoRecords(e.Row)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim AttachmentLocalPath As String
            If IsDBNull(DataBinder.Eval(e.Row.DataItem, "AttachmentLocalPath")) Then
                AttachmentLocalPath = ""
            Else
                AttachmentLocalPath = "/" & Server.UrlEncode(DataBinder.Eval(e.Row.DataItem, "AttachmentLocalPath"))
            End If
            Dim strUploadPath As String = System.Configuration.ConfigurationManager.AppSettings("UploadFilesPath")
            Dim strRoot As String = System.Web.HttpContext.Current.Server.MapPath(strUploadPath)
            Dim strRoot1 As String = strRoot & DBUtilities.GetSessionAccountId & "/" & DataBinder.Eval(e.Row.DataItem, "AccountExpenseEntryId") & AttachmentLocalPath
            Dim DecodeStrRoot As String = Server.UrlDecode(strRoot1)

            If System.IO.File.Exists(DecodeStrRoot) Then
                Dim i As String = LicensingBLL.GetEncryptedStringAsBase64ByUTF8("FileName=" & DBUtilities.GetSessionAccountId & "/" & DataBinder.Eval(e.Row.DataItem, "AccountExpenseEntryId") & AttachmentLocalPath)
                Dim FileName As String = "~/Shared/FileDownload.aspx?" & i
                If Not e.Row.Cells(2).FindControl("FileHyperlink") Is Nothing Then
                    CType(e.Row.Cells(2).FindControl("FileHyperlink"), HyperLink).NavigateUrl = FileName
                End If
                If Not e.Row.Cells(3).FindControl("LinkButton1") Is Nothing And IsAccountAttachmentsLock() Then
                    CType(e.Row.Cells(3).FindControl("LinkButton1"), LinkButton).Enabled = False
                    CType(e.Row.Cells(3).FindControl("LinkButton1"), LinkButton).Visible = False
                End If
            Else
                If Not DataBinder.Eval(e.Row.DataItem, "AccountAttachmentId") = 0 Then
                    AttachmentBll.DeleteAccountAttachments(DataBinder.Eval(e.Row.DataItem, "AccountAttachmentId"))
                    Me.GridView1.DataBind()
                End If
            End If
        End If
    End Sub
    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        AccountExpenseEntryId = IIf(Not Request.QueryString("AccountExpenseEntryId") Is Nothing, Request.QueryString("AccountExpenseEntryId"), 64)

        Dim BLL As New AccountAttachmentsBLL

        BLL.FileUpload(Me.FormView1.FindControl("AttachmentFileUpload"), Me.Request.QueryString("AccountAttachmentTypeId"), AccountExpenseEntryId, DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("txtAttachmentName"), TextBox).Text)

        Me.GridView1.DataBind()

        Dim URL As String = "~/AccountAdmin/AccountAttachmentsPopUp.aspx?AccountExpenseEntryId=" & Request.QueryString("AccountExpenseEntryId") & "&AccountAttachmentTypeId=" & Me.Request.QueryString("AccountAttachmentTypeId")
        Response.Redirect(URL, False)
    End Sub
    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        'AccountPagePermissionBLL.SetPagePermission(108, Me.GridView1, Me.FormView1, "btnUpload", 0, 3)
        If FormView1.CurrentMode = FormViewMode.Insert Then
            If IsAccountAttachmentsLock() Then
                CType(Me.FormView1.FindControl("btnUpload"), Button).Enabled = False
            End If

        End If
    End Sub
    Public Function IsAccountAttachmentsLock() As Boolean
        Dim AccountEmployeeExpenseSheetId As Guid
        If Not Me.Request.QueryString("AccountEmployeeExpenseSheetId") Is Nothing Then
            AccountEmployeeExpenseSheetId = New Guid(Me.Request.QueryString("AccountEmployeeExpenseSheetId"))
        End If
        Dim BLL As New AccountEmployeeExpenseSheetBLL
        Dim dt As AccountExpenseEntry.AccountEmployeeExpenseSheetDataTable = BLL.GetAccountEmployeeExpenseSheetByAccountEmployeeExpenseSheetId(AccountEmployeeExpenseSheetId)
        Dim dr As AccountExpenseEntry.AccountEmployeeExpenseSheetRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            If (LocaleUtilitiesBLL.IsShowLockSubmittedRecords And dr.Submitted = True) Or (LocaleUtilitiesBLL.IsShowLockApprovedRecords And dr.Approved = True) Then
                Return True
            End If
        End If
    End Function
End Class
