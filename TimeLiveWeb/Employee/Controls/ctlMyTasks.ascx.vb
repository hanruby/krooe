Partial Class Employee_Controls_ctlMyTasks
    Inherits System.Web.UI.UserControl
    Public ListControlValues As Hashtable
    Public Event btnAddTaskClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Sub FilterGridViewTask()
        Me.AccountProjectTaskHierarchyObject.SelectParameters("AccountProjectTaskId").DefaultValue = Me.txtAccountProjectTaskId.Text
        Me.AccountProjectTaskHierarchyObject.SelectParameters("AccountProjects").DefaultValue = Me.GetIdFromDropdown(Me.ddlAccountProjectId)
        Me.AccountProjectTaskHierarchyObject.SelectParameters("AccountProjectMilestoneId").DefaultValue = Me.ddlAccountProjectMilestoneId.SelectedValue
        Me.AccountProjectTaskHierarchyObject.SelectParameters("AccountTaskTypeId").DefaultValue = Me.ddlAccountTaskType.SelectedValue
        Me.AccountProjectTaskHierarchyObject.SelectParameters("ReportedBy").DefaultValue = Me.ddlReportBy.SelectedValue
        Dim i As Integer

        If Me.chkIncludeDateRange.Checked = True Then
            i = 1
        Else
            i = 0
        End If
        Me.AccountProjectTaskHierarchyObject.SelectParameters("IncludeDateRange").DefaultValue = i

        If Not Me.CreatedDateFrom.PostedDate Is Nothing Then
            Me.CreatedDateFrom.SelectedDate = Convert.ToDateTime(Me.CreatedDateFrom.PostedDate)
        End If
        If Not Me.CreatedDateFrom.PostedDate Is Nothing Then
            Me.CreatedDateUpto.SelectedDate = Convert.ToDateTime(Me.CreatedDateUpto.PostedDate)
        End If
        Me.AccountProjectTaskHierarchyObject.SelectParameters("CreatedDateFrom").DefaultValue = Me.CreatedDateFrom.SelectedDate
        Me.AccountProjectTaskHierarchyObject.SelectParameters("CreatedDateUpto").DefaultValue = Me.CreatedDateUpto.SelectedDate
        If Not Me.ViewState("AssignedToEmployeeId") Is Nothing Then
            Me.AccountProjectTaskHierarchyObject.SelectParameters("AssignedTo").DefaultValue = Me.ViewState("AssignedToEmployeeId")
            Me.ViewState.Remove("AssignedToEmployeeId")
        Else
            Me.AccountProjectTaskHierarchyObject.SelectParameters("AssignedTo").DefaultValue = Me.ddlAssignedToEmployeeId.SelectedValue

        End If
        Me.AccountProjectTaskHierarchyObject.SelectParameters("TaskStatusId").DefaultValue = Me.ddlAccountStatusId.SelectedValue
        Me.AccountProjectTaskHierarchyObject.SelectParameters("CompletedStatus").DefaultValue = Me.ddlCompletedStatus.SelectedValue
        Me.AccountProjectTaskHierarchyObject.SelectParameters("Description").DefaultValue = Me.txtTaskDescription.Text

        Me.GridView1.DataBind()
    End Sub
    Protected Sub btnShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShow.Click
        Me.FilterGridViewTask()

    End Sub
    Protected Sub AccountProjectTaskHierarchyObject_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles AccountProjectTaskHierarchyObject.Updating
        DBUtilities.SetRowForUpdating(e)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.ShowMyOpenTasks()
        End If
        Me.Literal3.Text = ResourceHelper.GetFromResource("Task Id:")
        Me.Literal4.Text = ResourceHelper.GetFromResource("Task Type:")
        Me.Literal5.Text = ResourceHelper.GetFromResource("Project:")
        Me.Literal6.Text = ResourceHelper.GetFromResource("Milestone:")
        Me.Literal7.Text = ResourceHelper.GetFromResource("Report By:")
        Me.Literal8.Text = ResourceHelper.GetFromResource("Assigned To:")
        Me.Literal9.Text = ResourceHelper.GetFromResource("Completed Status:")
        Me.Literal10.Text = ResourceHelper.GetFromResource("Status:")
        Me.Literal11.Text = ResourceHelper.GetFromResource("Include Date Range:")
        Me.Literal12.Text = ResourceHelper.GetFromResource("Created Date From:")
        Me.Literal13.Text = ResourceHelper.GetFromResource("Created Date Upto:")
        Me.Literal14.Text = ResourceHelper.GetFromResource("Description:")
    End Sub
    Public Sub ShowMyOpenTasks()
        Me.ViewState.Add("AssignedToEmployeeId", DBUtilities.GetSessionAccountEmployeeId)
        AccountEmployeeBLL.SetDataForEmployeeDropdown(28, Me.ddlAssignedToEmployeeId)
        AccountProjectBLL.SetDataForProjectDropdown(28, Me.ddlAccountProjectId)
        Me.ddlAssignedToEmployeeId.SelectedValue = DBUtilities.GetSessionAccountEmployeeId
        Me.ddlCompletedStatus.SelectedValue = 0
        Me.RefreshData()
    End Sub
    Public Function GetIdFromDropdown(ByVal objDropdown As DropDownList) As String
        Dim strObject As String = ""
        If objDropdown.SelectedValue = 0 Then
            For Each objListItem As ListItem In objDropdown.Items
                'If objListItem.Value > 0 Then
                strObject = strObject & IIf(strObject = "", "", ",") & objListItem.Value
                ' End If
            Next
        Else
            strObject = objDropdown.SelectedValue
        End If
        Return strObject
    End Function
    Public Sub RefreshData()
        FilterGridViewTask()
    End Sub
    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        AccountPagePermissionBLL.SetPagePermissionForGridView(28, Me.GridView1, Nothing, Nothing)
        Me.btnAddTask.Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(28, 2)
    End Sub
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        UIUtilities.ClearCellsForNoRecords(e.Row)
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "AssignedTo")) Then
                CType(e.Row.Cells(6).FindControl("lblAssignedTo"), Label).Text = Left(DataBinder.Eval(e.Row.DataItem, "AssignedTo"), 60)
            End If
        End If
    End Sub
    Protected Sub btnAddTask_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.GridView1.Visible = False
        Me.btnAddTask.Visible = False
        RaiseEvent btnAddTaskClick(sender, e)
    End Sub
End Class
