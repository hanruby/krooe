Partial Class AccountAdmin_Controls_ctlAccountProjectTaskList
    Inherits System.Web.UI.UserControl

    Public Event btnAddTaskClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event EditClick(ByVal sender As Object, ByVal CommandArgs As GridViewCommandEventArgs)
    Public Event GridViewRowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs)
    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PreRender
        AccountPagePermissionBLL.SetPagePermissionForGridView(32, Me.GridView1, 11, 12)
        Me.btnAddTask.Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(32, 2)
    End Sub
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Select" Then
            RaiseEvent EditClick(sender, e)
        End If
    End Sub
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        UIUtilities.ClearCellsForNoRecords(e.Row)
    End Sub
    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim bll As New AccountProjectBLL
        Dim dt As TimeLiveDataSet.vueAccountProjectsDataTable = bll.GetAssignedAccountProjects(Me.Request.QueryString("AccountProjectId"), DBUtilities.GetSessionAccountEmployeeId, IIf(Me.Request.QueryString("IsTemplate") Is Nothing, False, Me.Request.QueryString("IsTemplate")))
        If dt.Rows.Count = 0 Then
            Me.GridView1.Columns(11).Visible = False
        End If
        If AccountPagePermissionBLL.IsPageHasPermissionOf(32, 3) = False Then
            Me.GridView1.Columns(11).Visible = False
        End If
        If AccountPagePermissionBLL.IsPageHasPermissionOf(32, 4) = False Then
            Me.GridView1.Columns(12).Visible = False
        End If
        Dim ProjectEmployeebll As New AccountProjectEmployeeBLL
        Dim dtprojectemployee As TimeLiveDataSet.AccountProjectEmployeeDataTable = ProjectEmployeebll.GetAccountProjectEmployeesByAccountProjectIdandAccountEmployeeId(DBUtilities.GetSessionAccountId, DBUtilities.GetSessionAccountEmployeeId, Me.Request.QueryString("AccountProjectId"))
        If dtprojectemployee.Rows.Count = 0 Then
            Me.GridView1.Columns(12).Visible = False
        End If
        If LocaleUtilitiesBLL.ShowClientNameInTask = True Then
            Me.GridView1.Columns(3).Visible = True
        Else
            Me.GridView1.Columns(3).Visible = False
        End If
        If LocaleUtilitiesBLL.ShowProjectNameInTask = True Then
            Me.GridView1.Columns(4).Visible = True
        Else
            Me.GridView1.Columns(4).Visible = False
        End If
    End Sub
    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs)
        RaiseEvent GridViewRowDeleted(sender, e)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim BLL As New AccountStatusBLL
        BLL.ResetStatus()
    End Sub
    Protected Sub btnAddTask_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddTask.Click
        Me.GridView1.Visible = False
        Me.btnAddTask.Visible = False
        RaiseEvent btnAddTaskClick(sender, e)
    End Sub
End Class
