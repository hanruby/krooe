
Partial Class Employee_Controls_ctlAccountProjectTaskCommentsList
    Inherits System.Web.UI.UserControl

    Public WithEvents oListBox As ListBox
    Public ListControlValues As Hashtable
    Dim AccountProjectTaskId As Integer

    Protected Sub dsAccountProjectTaskCommentsForm_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)

    End Sub

    Protected Sub dsAccountProjectTaskCommentsForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectTaskCommentsForm.Inserted
        DBUtilities.AfterInsert(Me.GridView1)
    End Sub

    Protected Sub dsAccountProjectTaskCommentsForm_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountProjectTaskCommentsForm.Inserting
        DBUtilities.SetRowForInserting(e)
        '  e.InputParameters("AccountProjectTaskId") = Me.dsAccountProjectTaskCommens.SelectParameters("AccountProjectTaskId").DefaultValue
    End Sub


    Protected Sub oListBox_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles oListBox.DataBound

        Dim BLL As New AccountProjectTaskEmployeeBLL
        Dim dt As TimeLiveDataSet.AccountProjectTaskEmployeeDataTable

        If Not Request.QueryString("AccountProjectTaskId") Is Nothing Then
            AccountProjectTaskId = Request.QueryString("AccountProjectTaskId")
        Else
            AccountProjectTaskId = dsAccountProjectTaskFormObject.SelectParameters("AccountProjectTaskId").DefaultValue
        End If

        dt = BLL.GetAccountProjectTaskEmployeesByAccountProjectTaskId(AccountProjectTaskId)

        Dim objRow As TimeLiveDataSet.AccountProjectTaskEmployeeRow

        Dim objFormRow As FormViewRow = Me.FormView1.Row

        ListControlValues = New Hashtable

        Dim objListBox As ListBox = objFormRow.FindControl("ListBoxEmployees")
        For Each objRow In dt.Rows

            For Each item As ListItem In oListBox.Items

                If item.Value = objRow.AccountEmployeeId Then
                    item.Selected = True
                    ListControlValues.Add(CStr(objRow.AccountEmployeeId), objRow.AccountProjectTaskEmployeeId)
                End If

            Next

        Next
        Me.ViewState.Add("ListViewControl", ListControlValues)
    End Sub

    Protected Sub dsAccountProjectTaskCommentsForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectTaskCommentsForm.Updated
        DBUtilities.AfterUpdate(Me.GridView1)
    End Sub
    Protected Sub dsAccountProjectTaskCommentsForm_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountProjectTaskCommentsForm.Updating
        DBUtilities.SetRowForUpdating(e)
    End Sub

    Protected Sub dsAccountProjectTaskFormObject_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectTaskFormObject.Inserted
        Me.RedirectToMyTask()
    End Sub
    Public Sub RedirectToMyTask()
        UIUtilities.RedirectToMyTask()
    End Sub

    Protected Sub dsAccountProjectTaskFormObject_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectTaskFormObject.Selected
        'e.
    End Sub

    Protected Sub dsAccountProjectTaskFormObject_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectTaskFormObject.Updated
        Dim ts As New AccountProjectTaskEmployeeBLL

        Dim l As ListBox = Me.FormView1.FindControl("ListBoxEmployeesUpdate")

        Me.ListControlValues = Me.ViewState("ListViewControl")

        For Each s As ListItem In l.Items
            If s.Selected And Not ListControlValues.ContainsKey(s.Value) Then
                ts.AddAccountProjectTaskEmployee(DBUtilities.GetSessionAccountId, 0, Me.ViewState("AccountProjectTaskId"), s.Value, 100)
            ElseIf s.Selected = False And ListControlValues.ContainsKey(s.Value) Then
                ts.DeleteAccountProjectTaskEmployeeId(ListControlValues.Item(s.Value))
            End If
        Next

        Dim TaskBLL As New AccountProjectTaskBLL
        TaskBLL.SendUpdatedTaskEMail(Me.ViewState("AccountProjectTaskId"))


        Me.RedirectToMyTask()
    End Sub

    Protected Sub dsAccountProjectTaskFormObject_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountProjectTaskFormObject.Updating
        DBUtilities.SetRowForUpdating(e)
        e.InputParameters("IsReOpen") = CType(Me.FormView1.FindControl("chkIsReOpen"), CheckBox).Checked
    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            If AccountPagePermissionBLL.GetPageIdByPage(Me.Page) = 21 Then
                CType(Me.FormView1.FindControl("ListBoxEmployeesUpdate"), ListBox).DataSourceID = ""
                AccountEmployeeBLL.SetDataForEmployeeListBox(21, CType(Me.FormView1.FindControl("ListBoxEmployeesUpdate"), ListBox), 3, CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue, Me.FormView1.DataItem("AccountProjectTaskId"))
            End If
            If Not IsDBNull(Me.FormView1.DataItem("EstimatedTimeSpentUnit")) Then
                'CType(Me.FormView1.FindControl("ddlEstimatedTimeSpentUnit"), DropDownList).SelectedValue = Me.FormView1.DataItem("EstimatedTimeSpentUnit")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("IsBillable")) Then
                CType(Me.FormView1.FindControl("chkIsBillable"), CheckBox).Checked = Me.FormView1.DataItem("IsBillable")
            End If
            'CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue = Me.FormView1.DataItem("ParentAccountProjectTaskId")
            Me.RefillParentTask()

            If Not IsDBNull(Me.FormView1.DataItem("AccountTaskTypeId")) Then
                Me.dsAccountProjectTaskTypeObject.SelectParameters("AccountTaskTypeId").DefaultValue = Me.FormView1.DataItem("AccountTaskTypeId")
                CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountTaskTypeId")
            End If

            If Not IsDBNull(Me.FormView1.DataItem("TaskStatusId")) Then
                Me.dsProjectTaskStatusObject.SelectParameters("AccountStatusId").DefaultValue = Me.FormView1.DataItem("TaskStatusId")
                CType(Me.FormView1.FindControl("DropDownList6"), DropDownList).SelectedValue = Me.FormView1.DataItem("TaskStatusId")
            End If

            If Not IsDBNull(Me.FormView1.DataItem("AccountPriorityId")) Then
                Me.dsAccountPriorityObject.SelectParameters("AccountPriorityId").DefaultValue = Me.FormView1.DataItem("AccountPriorityId")
                CType(Me.FormView1.FindControl("ddlAccountPriority"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountPriorityId")
            End If
        End If
    End Sub


    Protected Sub FormView1_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.ItemCreated
        Dim objFormRow As FormViewRow = Me.FormView1.Row
        Dim objListBox As ListBox = objFormRow.FindControl("ListBoxEmployeesUpdate")


        If Not objListBox Is Nothing Then

            Me.oListBox = objListBox


        End If

        If Not Me.FormView1.DataItem Is Nothing Then
            Me.ViewState("AccountProjectId") = Me.FormView1.DataItem("AccountProjectId")
            Me.ViewState("AccountProjectTaskId") = Me.FormView1.DataItem("AccountProjectTaskId")
            Me.dsAccountProjectTask.SelectParameters("AccountProjectId").DefaultValue = Me.ViewState("AccountProjectId")
            'Me.dsAccountProjectMilestone.SelectParameters("AccountProjectId").DefaultValue = Me.ViewState("AccountProjectId")

        End If

    End Sub


    Protected Sub ListBoxEmployeesUpdate_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub dsAccountProjectTaskFormObject_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)

    End Sub

    Protected Sub btnAuditTrail_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.Response.Redirect("~/Employee/Audit.aspx?AccountProjectTaskId=" & Request.QueryString("AccountProjectTaskId"))
        Me.Response.Redirect("~/Employee/AuditTrail.aspx?AccountProjectTaskId=" & Me.Request.QueryString("AccountProjectTaskId"), False)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        UIUtilities.RedirectToMyTask()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        UIUtilities.ClearCellsForNoRecords(e.Row)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.btnAuditTrail.Enabled = AccountPagePermissionBLL.IsPageHasPermissionOf(24, 1)
    End Sub

    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        'e.NewValues("EstimatedTimeSpentUnit") = CType(Me.FormView1.FindControl("ddlEstimatedTimeSpentUnit"), DropDownList).SelectedValue
        e.NewValues.Item("ParentAccountProjectTaskId") = CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue
        e.NewValues.Item("IsBillable") = CType(Me.FormView1.FindControl("chkIsBillable"), CheckBox).Checked
        e.NewValues.Item("AccountTaskTypeId") = CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue
        e.NewValues.Item("TaskStatusId") = CType(Me.FormView1.FindControl("DropDownList6"), DropDownList).SelectedValue
        e.NewValues.Item("AccountPriorityId") = CType(Me.FormView1.FindControl("ddlAccountPriority"), DropDownList).SelectedValue
        e.NewValues.Item("IsForAllProjectTask") = CType(Me.FormView1.FindControl("checkbox5"), CheckBox).Checked
    End Sub
    Public Sub RefillParentTask()
        CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).Items.Clear()
        Dim item As New System.Web.UI.WebControls.ListItem
        item.Text = "<RootLevel>"
        item.Value = "0"
        CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).Items.Add(item)

        CType(Me.UpdatePanel2.FindControl("dsParentAccountProjectTaskObject"), ObjectDataSource).SelectParameters("AccountProjectId").DefaultValue = CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue
        '  If Me.FormView1.CurrentMode = FormViewMode.Edit Then
        '            If Me.FormView1.DataItem("ParentAccountProjectTaskId") <> 0 Then
        CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).DataBind()

        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            If Not IsDBNull(Me.FormView1.DataItem("ParentAccountProjectTaskId")) Then
                CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue = Me.FormView1.DataItem("ParentAccountProjectTaskId")
            End If
        End If

        'End If


    End Sub
End Class
