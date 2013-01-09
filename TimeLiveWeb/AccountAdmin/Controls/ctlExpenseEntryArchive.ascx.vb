
Partial Class AccountAdmin_Controls_ctlExpenseEntryArchive
    Inherits System.Web.UI.UserControl
    Dim Amount As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            ReportUtilities.SetDefaultValuesOfFilerItem(ddlEmployees, Me.StartDate, Me.EndDate, Me.chkIncludeDateRange)
            Me.ShowGridFromFilter()
            Me.Literal5.Text = ResourceHelper.GetFromResource("Expense Entry Archive")
            Me.Literal1.Text = ResourceHelper.GetFromResource("Search Parameters")
            Me.Literal2.Text = ResourceHelper.GetFromResource("Employees")
            Me.Literal6.Text = ResourceHelper.GetFromResource("Approved")
            Me.Literal8.Text = ResourceHelper.GetFromResource("Include Date Range")
            Me.Literal9.Text = ResourceHelper.GetFromResource("Start Date")
            Me.Literal10.Text = ResourceHelper.GetFromResource("End Date")
        End If
    End Sub

    Public Sub ShowGridFromFilter()
        Me.StartDate.SelectedDate = LocaleUtilitiesBLL.ConvertDateToBaseLocaleAsDate(Me.StartDate.PostedDate)
        Me.EndDate.SelectedDate = LocaleUtilitiesBLL.ConvertDateToBaseLocaleAsDate(Me.EndDate.PostedDate)

        Me.dsUpdateExpenseEntryArchive.SelectParameters("AccountEmployees").DefaultValue = Me.ddlEmployees.SelectedValue
        Me.dsUpdateExpenseEntryArchive.SelectParameters("IncludeDateRange").DefaultValue = Me.chkIncludeDateRange.Checked
        Me.dsUpdateExpenseEntryArchive.SelectParameters("AccountExpenseEntryStartDate").DefaultValue = Me.StartDate.SelectedDate
        Me.dsUpdateExpenseEntryArchive.SelectParameters("AccountExpenseEntryEndDate").DefaultValue = Me.EndDate.SelectedDate
        Me.dsUpdateExpenseEntryArchive.SelectParameters("Approval").DefaultValue = Me.ddlApproved.SelectedValue

        Me.GridView1.DataBind()
        AccountPagePermissionBLL.SetPagePermissionForGridView(114, Me.GridView1, 7, 8)
        Me.btnDeleteSelectedItem.Enabled = AccountPagePermissionBLL.IsPageHasPermissionOf(114, 4)
    End Sub

    Protected Sub Show_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.ViewState.Add("IsFromFilter", True)
        ShowGridFromFilter()
    End Sub

    Protected Sub btnDeleteSelectedItem_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim row As GridViewRow
        For Each row In Me.GridView1.Rows
            If CType(row.FindControl("chkDelete"), CheckBox).Checked = True Then
                Call New AccountEmployeeExpenseSheetBLL().DeleteAccountEmployeeExpenseSheet(Me.GridView1.DataKeys(row.RowIndex)("AccountEmployeeExpenseSheetId"))
            End If
        Next
        Me.GridView1.DataBind()
    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound

        If Me.GridView1.Rows.Count <> 0 Then
            Me.CheckAll.Visible = True
            Me.UnCheckAll.Visible = True
        Else
            Me.CheckAll.Visible = False
            Me.UnCheckAll.Visible = False
        End If
        If Me.GridView1.Rows.Count > 0 Then
            Me.btnDeleteSelectedItem.Visible = True
        Else
            Me.btnDeleteSelectedItem.Visible = False
        End If
    End Sub
    Protected Sub CheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim row As GridViewRow
        For Each row In Me.GridView1.Rows
            CType(row.Cells(0).FindControl("chkDelete"), CheckBox).Checked = True
        Next
    End Sub

    Protected Sub UnCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim row As GridViewRow
        For Each row In Me.GridView1.Rows
            CType(row.Cells(0).FindControl("chkDelete"), CheckBox).Checked = False
        Next
    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Call New AccountEmployeeExpenseSheetBLL().DeleteAccountEmployeeExpenseSheet(Me.GridView1.DataKeys(e.RowIndex)("AccountEmployeeExpenseSheetId"))
        e.Cancel = True
        Me.GridView1.DataBind()
    End Sub
End Class
