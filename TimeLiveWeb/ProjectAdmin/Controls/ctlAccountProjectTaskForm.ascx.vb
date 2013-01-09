Partial Class ProjectAdmin_Controls_ctlAccountProjectTaskForm
    Inherits System.Web.UI.UserControl

    Public WithEvents oListBox As ListBox
    Public ListControlValues As Hashtable
    Public Event UpdateIssueClick(ByVal sender As Object)
    Public Event btnCancelClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event btnUpdateClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event AddClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs)
    Public Event Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs)
    Protected Sub dsAccountProjectTaskFormObject_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectTaskFormObject.Inserted

        Dim ProjectTaskBLL As New AccountProjectTaskBLL
        ' Add Task Billing rate of task
        ProjectTaskBLL.AddBillingRateOfTask(IIf(CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text = "", 0, CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text), CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue, IIf(CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text = "", 0, CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text), CType(Me.FormView1.FindControl("ddlBillingRateCurrencyId"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("ddlEmployeeRateCurrencyId"), DropDownList).SelectedValue, e.ReturnValue)

        If CType(Me.FormView1.FindControl("CheckBox2"), CheckBox).Checked <> False Then

        Else
            Dim ts As New AccountProjectTaskEmployeeBLL
            Dim l As ListBox = Me.FormView1.FindControl("ListBoxEmployees")

            For Each s As ListItem In l.Items
                If s.Selected Then
                    ts.AddAccountProjectTaskEmployee(DBUtilities.GetSessionAccountId, 0, e.ReturnValue, s.Value, 100)
                End If
            Next
        End If

        Dim TaskBLL As New AccountProjectTaskBLL
        TaskBLL.SendNewTaskEMail(e.ReturnValue)
        RaiseEvent Inserted(sender, e)
        'Response.Redirect("~/ProjectAdmin/AccountProjectTasks.aspx?AccountProjectId=" & Me.Request.QueryString("AccountProjectId"))
    End Sub
    Protected Sub dsAccountProjectTaskFormObject_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountProjectTaskFormObject.Inserting
        LocaleUtilitiesBLL.FixDatePickerInternationalDate(Me.FormView1.FindControl("DeadlineDate"), "DeadlineDate", e)
        LocaleUtilitiesBLL.FixDatePickerInternationalDate(Me.FormView1.FindControl("StartDate"), "StartDate", e)
        DBUtilities.SetRowForInserting(e)
    End Sub
    Protected Sub dsAccountProjectTaskFormObject_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectTaskFormObject.Updated
        Dim ts As New AccountProjectTaskEmployeeBLL

        Dim l As ListBox = Me.FormView1.FindControl("ListBoxEmployeesUpdate")

        Me.ListControlValues = Me.ViewState("ListViewControl")

        For Each s As ListItem In l.Items
            If s.Selected And Not ListControlValues.ContainsKey(s.Value) Then
                ts.AddAccountProjectTaskEmployee(DBUtilities.GetSessionAccountId, 0, Me.dsAccountProjectTaskFormObject.SelectParameters("AccountProjectTaskId").DefaultValue, s.Value, 100)
            ElseIf s.Selected = False And ListControlValues.ContainsKey(s.Value) Then
                ts.DeleteAccountProjectTaskEmployeeId(ListControlValues.Item(s.Value))
            End If
        Next

        Dim TaskBLL As New AccountProjectTaskBLL
        TaskBLL.SendUpdatedTaskEMail(Me.dsAccountProjectTaskFormObject.SelectParameters("AccountProjectTaskId").DefaultValue)

        Dim objAccountBillingRate As New AccountBillingRateBLL
        Dim objAccountProjectTask As New AccountProjectTaskBLL

        Dim dtProjectTask As TimeLiveDataSet.vueAccountProjectTaskWithBillingRateDataTable = objAccountProjectTask.GetAccountProjectTaskWithBillingRateByAccountProjectTaskId(Me.FormView1.DataKey("AccountProjectTaskId"), CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue)
        Dim drProjectTask As TimeLiveDataSet.vueAccountProjectTaskWithBillingRateRow = dtProjectTask.Rows(0)

        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text = IIf(CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text = "", 0, CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text)
            CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text = IIf(CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text = "", 0, CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text)
            If IsDBNull(drProjectTask("StartDate")) Then
                'change in currency
                objAccountBillingRate.AddAccountBillingRate(DBUtilities.GetSessionAccountId, 4, 0, 0, 0, Me.FormView1.DataKey("AccountProjectTaskId"), CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text, CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text, CType(Me.FormView1.FindControl("ddlBillingRateCurrencyId"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("ddlEmployeeRateCurrencyid"), DropDownList).SelectedValue)
                objAccountProjectTask.UpdateAccountBillingRateId(objAccountBillingRate.GetLastInsertedId, Me.FormView1.DataKey("AccountProjectTaskId"))
                Me.UpdateWorkTypeBillingRateOfProjectTask(DBUtilities.GetSessionAccountId, 4, Me.FormView1.DataKey("AccountProjectTaskId"), objAccountBillingRate.GetLastInsertedId, CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue)
            ElseIf CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = drProjectTask.StartDate Then
                objAccountBillingRate.UpdateAccountBillingRate(DBUtilities.GetSessionAccountId, 4, 0, 0, 0, CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text, CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, Me.FormView1.DataKey("AccountProjectTaskId"), CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text, CType(Me.FormView1.FindControl("ddlBillingRateCurrencyId"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("ddlEmployeeRateCurrencyid"), DropDownList).SelectedValue, drProjectTask.AccountBillingRateId)
            ElseIf CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate <> drProjectTask.StartDate Then
                objAccountBillingRate.AddAccountBillingRate(DBUtilities.GetSessionAccountId, 4, 0, 0, 0, Me.FormView1.DataKey("AccountProjectTaskId"), CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text, CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text, CType(Me.FormView1.FindControl("ddlBillingRateCurrencyId"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("ddlEmployeeRateCurrencyid"), DropDownList).SelectedValue)
                objAccountProjectTask.UpdateAccountBillingRateId(objAccountBillingRate.GetLastInsertedId, Me.FormView1.DataKey("AccountProjectTaskId"))
                Me.UpdateWorkTypeBillingRateOfProjectTask(DBUtilities.GetSessionAccountId, 4, Me.FormView1.DataKey("AccountProjectTaskId"), objAccountBillingRate.GetLastInsertedId, CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue)
            End If
        End If

        RaiseEvent Updated(sender, e)

    End Sub
    Public Sub UpdateWorkTypeBillingRateOfProjectTask(ByVal AccountId As Integer, ByVal SystemBillingRateTypeId As Integer, ByVal AccountProjectTaskId As Integer, ByVal AccountBillingRateId As Integer, ByVal AccountWorkTypeId As Integer)

        Dim objAccountWorkTypeBillingRate As New AccountWorkTypeBLL
        Dim objAccountProjectTask As New AccountProjectTaskBLL

        Dim dtAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateDataTable = objAccountWorkTypeBillingRate.GetProjectTaskWorkTypeBillingRate(AccountId, SystemBillingRateTypeId, AccountProjectTaskId, AccountWorkTypeId)
        Dim drAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateRow

        If objAccountProjectTask.IfWorkTypeBillingRateExistOfProjectTask(AccountId, SystemBillingRateTypeId, AccountProjectTaskId, AccountWorkTypeId) <> True Then
            objAccountWorkTypeBillingRate.AddAccountWorkTypeBillingRate(AccountId, SystemBillingRateTypeId, 0, 0, 0, AccountProjectTaskId, AccountBillingRateId, AccountWorkTypeId)
        Else
            If dtAccountWorkTypeBillingRate.Rows.Count > 0 Then
                drAccountWorkTypeBillingRate = dtAccountWorkTypeBillingRate.Rows(0)
                objAccountWorkTypeBillingRate.UpdateAccountWorkTypeBillingRate(AccountId, SystemBillingRateTypeId, 0, 0, 0, AccountProjectTaskId, AccountBillingRateId, AccountWorkTypeId, drAccountWorkTypeBillingRate.AccountWorkTypeBillingRateId)
            End If
        End If

    End Sub
    Protected Sub dsAccountProjectTaskFormObject_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountProjectTaskFormObject.Updating
        LocaleUtilitiesBLL.FixDatePickerInternationalDate(Me.FormView1.FindControl("DeadlineDate"), "DeadlineDate", e)
        LocaleUtilitiesBLL.FixDatePickerInternationalDate(Me.FormView1.FindControl("StartDate"), "StartDate", e)
        DBUtilities.SetRowForUpdating(e)
    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Dim BLL As New AccountProjectTaskAttachmentBLL
        Dim AccountProjectTaskId = New AccountProjectTaskBLL().GetLastInsertedId
        BLL.FileUpload(Me.FormView1.FindControl("AttachmentFileUpload"), AccountProjectTaskId, DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("AttachmentNameTextBox"), TextBox).Text)
        Me.FormView1.Visible = False
        'Me.UpdatePanel2.UpdateMode = UpdatePanelUpdateMode.Conditional
        RaiseEvent AddClick(sender, e)
    End Sub
    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        Dim TaskBll As New AccountProjectTaskBLL
        Dim CompletedTaskStatusId As Integer
        CompletedTaskStatusId = TaskBll.GetCompletedTaskStatusId("Completed")
        e.NewValues.Item("AccountProjectMilestoneId") = CType(Me.FormView1.FindControl("ddlAccountProjectMilestoneId"), DropDownList).SelectedValue
        e.NewValues.Item("ParentAccountProjectTaskId") = CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue
        'e.NewValues.Item("AccountProjectId") = CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue
        e.NewValues.Item("IsBillable") = CType(Me.FormView1.FindControl("chkIsBillable"), CheckBox).Checked
        'e.NewValues("EstimatedTimeSpentUnit") = CType(Me.FormView1.FindControl("ddlEstimatedTimeSpentUnit"), DropDownList).SelectedValue
        e.NewValues.Item("AccountTaskTypeId") = CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue
        e.NewValues.Item("AccountProjectId") = CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue

        'If CType(Me.FormView1.FindControl("CompletedCheckBox"), CheckBox).Checked <> False Or CType(Me.FormView1.FindControl("CompletedPercentTextBox"), TextBox).Text = 100 Or CType(Me.FormView1.FindControl("DropDownList6"), DropDownList).SelectedValue = CompletedTaskStatusId Then
        '    e.NewValues.Item("TaskStatusId") = CompletedTaskStatusId
        '    e.NewValues.Item("Completed") = True
        '    e.NewValues.Item("CompletedPercent") = 100
        'Else
        e.NewValues.Item("TaskStatusId") = CType(Me.FormView1.FindControl("DropDownList6"), DropDownList).SelectedValue
        e.NewValues.Item("CompletedPercent") = CType(Me.FormView1.FindControl("CompletedPercentTextBox"), TextBox).Text
        e.NewValues.Item("Completed") = CType(Me.FormView1.FindControl("CompletedCheckBox"), CheckBox).Checked
        'End If
        e.NewValues.Item("AccountPriorityId") = CType(Me.FormView1.FindControl("DropDownList7"), DropDownList).SelectedValue
        'e.NewValues.Item("ParentAccountProjectTaskId") = CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue
        e.NewValues.Item("IsForAllProjectTask") = CType(Me.FormView1.FindControl("checkbox5"), CheckBox).Checked
        e.NewValues.Item("EstimatedCurrencyId") = CType(Me.FormView1.FindControl("ddlEstimatedCurrencyId"), DropDownList).SelectedValue
        e.NewValues.Item("original_Predecessors") = Me.FormView1.DataKey(1)
    End Sub
    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        AccountPagePermissionBLL.SetPagePermissionForFormView(AccountPagePermissionBLL.GetPageIdByPage(Me.Page), Me.FormView1, "Add")
        If Me.FormView1.CurrentMode = FormViewMode.Insert Then
            Me.FormView1.Visible = False
            If AccountPagePermissionBLL.GetPageIdByPage(Me.Page) = 28 Then
                CType(Me.FormView1.FindControl("ListBoxEmployees"), ListBox).DataSourceID = ""
                AccountEmployeeBLL.SetDataForEmployeeListBox(28, CType(Me.FormView1.FindControl("ListBoxEmployees"), ListBox), 2, IIf(CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue = "", Nothing, CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue))
            End If
            CType(Me.FormView1.FindControl("chkIsBillable"), CheckBox).Checked = True
            Dim AccountStatusId = New AccountStatusBLL().GetAccountStatusIdByMasterAccountStatusIdStarted(DBUtilities.GetSessionAccountId)
            CType(Me.FormView1.FindControl("DropDownList4"), DropDownList).SelectedValue = AccountStatusId
            If LocaleUtilitiesBLL.ShowPercentageInTimesheet() Then
                CType(Me.FormView1.FindControl("CompletedPercentTextBox"), TextBox).Enabled = False
            End If
            CType(Me.FormView1.FindControl("DurationTextBox"), TextBox).Text = 8
        End If
        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            If LocaleUtilitiesBLL.ShowPercentageInTimesheet() Then
                CType(Me.FormView1.FindControl("CompletedPercentTextBox"), TextBox).Enabled = False
            End If
            Me.FormView1.Visible = True
            If Not IsDBNull(Me.FormView1.DataItem("EstimatedTimeSpentUnit")) Then
                'CType(Me.FormView1.FindControl("ddlEstimatedTimeSpentUnit"), DropDownList).SelectedValue = Me.FormView1.DataItem("EstimatedTimeSpentUnit")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("IsBillable")) Then
                CType(Me.FormView1.FindControl("chkIsBillable"), CheckBox).Checked = Me.FormView1.DataItem("IsBillable")
            End If

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
                CType(Me.FormView1.FindControl("DropDownList7"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountPriorityId")
            End If

            If Not IsDBNull(Me.FormView1.DataItem("EstimatedCurrencyId")) Then
                Me.dsEstimatedCurrencyObject.SelectParameters("AccountCurrencyId").DefaultValue = Me.FormView1.DataItem("EstimatedCurrencyId")
                CType(Me.FormView1.FindControl("ddlEstimatedCurrencyId"), DropDownList).SelectedValue = Me.FormView1.DataItem("EstimatedCurrencyId")
            End If
            'If Not IsDBNull(Me.FormView1.DataItem("ParentAccountProjectTaskId")) Then
            '    Me.dsParentAccountProjectTaskObject.SelectParameters("AccountProjectTaskId").DefaultValue = Me.FormView1.DataItem("ParentAccountProjectTaskId")
            '    CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue = Me.FormView1.DataItem("ParentAccountProjectTaskId")
            'End If

            Dim objAccountProject As New AccountProjectBLL
            Dim dtAccountProject As TimeLiveDataSet.AccountProjectDataTable = objAccountProject.GetAccountProjectsByAccountProjectId(Me.Request.QueryString("AccountProjectId"))
            Dim drAccountProject As TimeLiveDataSet.AccountProjectRow = dtAccountProject.Rows(0)

            If CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountProjectId") Then
                CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountProjectId")
            Else
                Dim item As New System.Web.UI.WebControls.ListItem
                item.Text = drAccountProject.ProjectName
                item.Value = drAccountProject.AccountProjectId
                CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).Items.Add(item)
                CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue = item.Value
            End If
            If Not IsDBNull(Me.FormView1.DataItem("AccountProjectMilestoneId")) Then
                CType(Me.FormView1.FindControl("ddlAccountProjectMilestoneId"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountProjectMilestoneId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("ParentAccountProjectTaskId")) Then
                CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue = Me.FormView1.DataItem("ParentAccountProjectTaskId")
            End If

            Dim BLL As New AccountProjectTaskBLL
            Dim dt As TimeLiveDataSet.AccountProjectTaskDataTable = BLL.GetAccountProjectTasksByParentAccountProjectTaskId(Me.FormView1.DataItem("AccountProjectTaskId"))
            Dim dr As TimeLiveDataSet.AccountProjectTaskRow
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                CType(Me.FormView1.FindControl("CheckBox1"), CheckBox).Enabled = False
            End If
            Me.RefreshEmployeesListBox(Me.FormView1.DataItem("AccountProjectTaskId"))
        End If
        If Me.FormView1.CurrentMode = FormViewMode.Insert Then
            CType(Me.FormView1.FindControl("ddlBillingRateCurrencyId"), DropDownList).SelectedValue = DBUtilities.GetAccountBaseCurrencyId
            CType(Me.FormView1.FindControl("ddlEmployeeRateCurrencyId"), DropDownList).SelectedValue = DBUtilities.GetAccountBaseCurrencyId
            CType(Me.FormView1.FindControl("ddlEstimatedCurrencyId"), DropDownList).SelectedValue = DBUtilities.GetAccountBaseCurrencyId
            CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text = 0
            CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text = 0
            CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = Date.Today
            CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = Date.Today.AddYears(1)
            'CType(Me.FormView1.FindControl("BillingRateEndDateTextbox"), eWorld.UI.CalendarPopup).SelectedDate = CType(Me.FormView1.FindControl("BillingRateEndDateTextbox"), eWorld.UI.CalendarPopup).SelectedDate.AddYears(1)
        End If

        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            GetBillingAndEmployeeRateOfProjectTask(DBUtilities.GetSessionAccountId, 4, Me.FormView1.DataKey("AccountProjectTaskId"), CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue)
            If Not IsDBNull(Me.FormView1.DataItem("AccountProjectMilestoneId")) Then
                CType(Me.FormView1.FindControl("ddlAccountProjectMilestoneId"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountProjectMilestoneId")
            End If
        End If

        If Not Request.QueryString("AccountProjectId") Is Nothing Then
            CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue = Request.QueryString("AccountProjectId")
            '            Dim strmsg As String = ResourceHelper.GetFromResource("You should be ''Project Team'' member for adding task in this project.")
            If Me.FormView1.CurrentMode = FormViewMode.Insert Then
                If CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue <> Request.QueryString("AccountProjectId") Then
                    CType(Me.FormView1.FindControl("Add"), Button).Enabled = False
                    CType(Me.FormView1.FindControl("lblProjectTeamException"), Label).Visible = True
                    CType(Me.FormView1.FindControl("lblProjectTeamException"), Label).Text = ResourceHelper.GetFromResource("strmsg")
                End If
                Me.RefreshEmployeesListBox()
            ElseIf Me.FormView1.CurrentMode = FormViewMode.Edit Then
                Me.RefreshEmployeesListBox(Me.FormView1.DataItem("AccountProjectTaskId"))
            End If
        End If

        If Me.FormView1.CurrentMode = FormViewMode.Insert Then
            Me.RefreshEmployeesListBox()
        End If

    End Sub
    Protected Sub FormView1_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.ItemCreated
        Dim objFormRow As FormViewRow = Me.FormView1.Row
        Dim objListBox As ListBox = objFormRow.FindControl("ListBoxEmployeesUpdate")
        If Not objListBox Is Nothing Then
            Me.oListBox = objListBox
        End If
    End Sub
    Protected Sub oListBox_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles oListBox.DataBound
        Dim BLL As New AccountProjectTaskEmployeeBLL
        Dim dt As TimeLiveDataSet.AccountProjectTaskEmployeeDataTable

        dt = BLL.GetAccountProjectTaskEmployeesByAccountProjectTaskId(Me.dsAccountProjectTaskFormObject.SelectParameters("AccountProjectTaskId").DefaultValue)

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
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

            '   Me.SetDefaults()
        End If
    End Sub
    Public Sub SetDefaults()
        RefreshEmployeesListBox()
    End Sub
    Protected Sub FormView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting

        e.Values.Item("AccountProjectMilestoneId") = CType(Me.FormView1.FindControl("ddlAccountProjectMilestoneId"), DropDownList).SelectedValue
        e.Values.Item("ParentAccountProjectTaskId") = CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue
        e.Values.Item("IsBillable") = CType(Me.FormView1.FindControl("chkIsBillable"), CheckBox).Checked
        e.Values.Item("EstimatedCurrencyId") = CType(Me.FormView1.FindControl("ddlEstimatedCurrencyId"), DropDownList).SelectedValue

    End Sub
    Private Sub RefreshEmployeesListBox(Optional ByVal AccountProjectTaskId As Integer = 0)

        Me.RefillParentTask()
        Me.RefillMilestone()

        Me.dsAccountProjectTask.SelectParameters("AccountProjectId").DefaultValue = CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue
        Me.dsAccountProjectTaskInsert.SelectParameters("AccountProjectId").DefaultValue = CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue

        If Me.FormView1.CurrentMode = FormViewMode.Insert Then
            CType(Me.FormView1.FindControl("ListBoxEmployees"), ListBox).Items.Clear()
            If AccountPagePermissionBLL.GetPageIdByPage(Me.Page) = 28 Then
                CType(Me.FormView1.FindControl("ListBoxEmployees"), ListBox).DataSourceID = ""
                AccountEmployeeBLL.SetDataForEmployeeListBox(28, CType(Me.FormView1.FindControl("ListBoxEmployees"), ListBox), 2, IIf(CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue = "", Nothing, CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue))
                'Me.FormView1.Visible = False
                'Me.FormView1.Visible = True
            End If
            CType(Me.FormView1.FindControl("ListBoxEmployees"), ListBox).DataBind()
        ElseIf Me.FormView1.CurrentMode = FormViewMode.Edit Then
            Me.dsAccountProjectTask.SelectParameters("AccountProjectTaskId").DefaultValue = AccountProjectTaskId
            CType(Me.FormView1.FindControl("ListBoxEmployeesUpdate"), ListBox).Items.Clear()
            CType(Me.FormView1.FindControl("ListBoxEmployeesUpdate"), ListBox).DataBind()

        End If
        '        Me.UpdatePanel2.Update()
    End Sub
    Public Sub RefillParentTask()
        CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).Items.Clear()
        Dim item As New System.Web.UI.WebControls.ListItem
        item.Text = ResourceHelper.GetFromResource("<RootLevel>")
        item.Value = "0"
        CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).Items.Add(item)

        'CType(Me.UpdatePanel2.FindControl("dsParentAccountProjectTaskObject"), ObjectDataSource).SelectParameters("AccountProjectId").DefaultValue = CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue
        dsParentAccountProjectTaskObject.SelectParameters("AccountProjectId").DefaultValue = CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue
        'CType(Me.UpdatePanel2.FindControl("dsParentAccountProjectTaskObject"), ObjectDataSource).SelectParameters("AccountProjectId").DefaultValue = Me.FormView1.DataItem("ParentAccountProjectTaskId")
        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            If Not IsDBNull(Me.FormView1.DataItem("AccountProjectTaskId")) Then
                dsParentAccountProjectTaskObject.SelectParameters("ParentAccountProjectTaskId").DefaultValue = Me.FormView1.DataItem("AccountProjectTaskId")
            End If
        End If
        '  If Me.FormView1.CurrentMode = FormViewMode.Edit Then
        '            If Me.FormView1.DataItem("ParentAccountProjectTaskId") <> 0 Then
        CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).DataBind()

        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            If Not IsDBNull(Me.FormView1.DataItem("AccountProjectTaskId")) Then
                dsParentAccountProjectTaskObject.SelectParameters("AccountProjectId").DefaultValue = Me.FormView1.DataItem("AccountProjectTaskId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("ParentAccountProjectTaskId")) Then
                CType(Me.FormView1.FindControl("ddlParentAccountProjectTaskId"), DropDownList).SelectedValue = Me.FormView1.DataItem("ParentAccountProjectTaskId")
            End If
        End If

        'End If

    End Sub
    Public Sub RefillMilestone()
        CType(Me.FormView1.FindControl("ddlAccountProjectMilestoneId"), DropDownList).Items.Clear()
        dsAccountProjectMilestone.SelectParameters("AccountProjectId").DefaultValue = CType(Me.FormView1.FindControl("ddlAccountProjectId"), DropDownList).SelectedValue
        CType(Me.FormView1.FindControl("ddlAccountProjectMilestoneId"), DropDownList).DataBind()
    End Sub
    Protected Sub FormView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs)

    End Sub
    Protected Sub DropDownList8_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
    Protected Sub ddlAccountProjectId_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        RefreshEmployeesListBox()
    End Sub
    Protected Sub ddlAccountWorkTypeId_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        GetBillingAndEmployeeRateOfProjectTask(DBUtilities.GetSessionAccountId, 4, Me.FormView1.DataKey("AccountProjectTaskId"), CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue)
    End Sub
    Public Sub GetBillingAndEmployeeRateOfProjectTask(ByVal AccountId As Integer, ByVal SystemBillingRateTypeId As Integer, ByVal AccountProjectTaskId As Integer, ByVal AccountWorkTypeId As Integer)
        Dim WorkTypeBLL As New AccountWorkTypeBLL
        Dim BillingRateBLL As New AccountBillingRateBLL

        Dim dtAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateDataTable = WorkTypeBLL.GetProjectTaskWorkTypeBillingRate(AccountId, SystemBillingRateTypeId, AccountProjectTaskId, AccountWorkTypeId)
        Dim drAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateRow

        If dtAccountWorkTypeBillingRate.Rows.Count > 0 Then
            drAccountWorkTypeBillingRate = dtAccountWorkTypeBillingRate.Rows(0)

            Dim dtAccountBillingRate As AccountBillingRate.AccountBillingRateDataTable = BillingRateBLL.GetAccountBillingRatesByAccountBillingRateId(drAccountWorkTypeBillingRate.AccountBillingRateId)
            Dim drAccountBillingRate As AccountBillingRate.AccountBillingRateRow

            If dtAccountBillingRate.Rows.Count > 0 Then
                drAccountBillingRate = dtAccountBillingRate.Rows(0)
                If Not IsDBNull(drAccountBillingRate.BillingRateCurrencyId) Then
                    Me.dsBillingRateCurrencyObject.SelectParameters("AccountCurrencyId").DefaultValue = drAccountBillingRate.BillingRateCurrencyId
                    CType(Me.FormView1.FindControl("ddlBillingRateCurrencyId"), DropDownList).SelectedValue = drAccountBillingRate.BillingRateCurrencyId
                End If

                If Not IsDBNull(drAccountBillingRate.EmployeeRateCurrencyId) Then
                    Me.dsEmployeeRateCurrencyObject.SelectParameters("AccountCurrencyId").DefaultValue = drAccountBillingRate.EmployeeRateCurrencyId
                    CType(Me.FormView1.FindControl("ddlEmployeeRateCurrencyId"), DropDownList).SelectedValue = drAccountBillingRate.EmployeeRateCurrencyId
                End If

                CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text = drAccountBillingRate.BillingRate
                CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text = drAccountBillingRate.EmployeeRate
                CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = drAccountBillingRate.StartDate
                CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = drAccountBillingRate.EndDate
            Else
                CType(Me.FormView1.FindControl("ddlBillingRateCurrencyId"), DropDownList).SelectedValue = DBUtilities.GetAccountBaseCurrencyId
                CType(Me.FormView1.FindControl("ddlEmployeeRateCurrencyId"), DropDownList).SelectedValue = DBUtilities.GetAccountBaseCurrencyId
                CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text = 0
                CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text = 0
            End If
        Else
            CType(Me.FormView1.FindControl("ddlBillingRateCurrencyId"), DropDownList).SelectedValue = DBUtilities.GetAccountBaseCurrencyId
            CType(Me.FormView1.FindControl("ddlEmployeeRateCurrencyId"), DropDownList).SelectedValue = DBUtilities.GetAccountBaseCurrencyId
            CType(Me.FormView1.FindControl("BillingRateTextBox"), TextBox).Text = 0
            CType(Me.FormView1.FindControl("EmployeeRateTextBox"), TextBox).Text = 0
            CType(Me.FormView1.FindControl("BillingRateStartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = Date.Today
            CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = Date.Today
            CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = CType(Me.FormView1.FindControl("BillingRateEndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate.AddYears(1)
        End If

    End Sub
    Protected Sub CustomValidator3_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        If CType(Me.FormView1.FindControl("TaskDescriptionTextBox"), TextBox).Text.Length > 5000 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim AccountProjectTaskId As Integer = Me.FormView1.DataKey("AccountProjectTaskId")
        Dim AccountWorkTypeId As Integer = CType(Me.FormView1.FindControl("ddlAccountWorkTypeId"), DropDownList).SelectedValue
        If Me.Request.QueryString("Source") = "MyProjects" Then
            Response.Redirect("~/AccountAdmin/AccountBillingRate.aspx?AccountProjectTaskId=" & AccountProjectTaskId & "&SystemBillingRateTypeId=4&AccountWorkTypeId=" & AccountWorkTypeId & "&AccountProjectId=" & Me.Request.QueryString("AccountProjectId") & "&Source=MyProjects", False)
        ElseIf Me.Request.QueryString("Source") = "ProjectTemplates" Then
            Response.Redirect("~/AccountAdmin/AccountBillingRate.aspx?AccountProjectTaskId=" & AccountProjectTaskId & "&SystemBillingRateTypeId=4&AccountWorkTypeId=" & AccountWorkTypeId & "&AccountProjectId=" & Me.Request.QueryString("AccountProjectId") & "&Source=ProjectTemplates", False)
        Else
            Response.Redirect("~/AccountAdmin/AccountBillingRate.aspx?AccountProjectTaskId=" & AccountProjectTaskId & "&SystemBillingRateTypeId=4&AccountWorkTypeId=" & AccountWorkTypeId & "&AccountProjectId=" & Me.Request.QueryString("AccountProjectId"), False)
        End If
    End Sub
    Protected Sub TextBox2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
    Protected Sub FormView1_PageIndexChanging1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs)

    End Sub
    Protected Sub FormView1_PageIndexChanging2(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewPageEventArgs)

    End Sub
    Protected Sub CompletedPercentTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
    Protected Sub Add_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.FormView1.Visible = False
        'Me.UpdatePanel2.UpdateMode = UpdatePanelUpdateMode.Conditional
        RaiseEvent AddClick(sender, e)
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.FormView1.Visible = False
        RaiseEvent btnUpdateClick(sender, e)
    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.UpdatePanel2.UpdateMode = UpdatePanelUpdateMode.Always
        'Me.FormView1.Visible = False
        RaiseEvent btnCancelClick(sender, e)
        'Response.Redirect("~/ProjectAdmin/AccountProjectTasks.aspx?AccountProjectId=" & Me.Request.QueryString("AccountProjectId"))
    End Sub
    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        RaiseEvent btnUpdateClick(sender, e)
        Dim BLL As New AccountProjectTaskAttachmentBLL
        Dim AccountProjectTaskId = Me.FormView1.DataKey("AccountProjectTaskId")
        BLL.FileUpload(Me.FormView1.FindControl("AttachmentFileUpload"), AccountProjectTaskId, DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("AttachmentNameTextBox"), TextBox).Text)
    End Sub
End Class
