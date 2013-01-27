Partial Class ProjectAdmin_Controls_ctlAccountProjectForm
    Inherits System.Web.UI.UserControl
    Public ListControlValues As Hashtable
    Public Event btnCancelClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event btnUpdateClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event btnAddClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event btnTemplateClick(ByVal sender As Object)
    Public Event SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs)
    Public Event Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs)
    Public AccountProjectIdToOpen As Integer
    Dim MasterEntityTypeId As New Guid("13dbff37-a092-4ae2-a919-775cbed0edc0")
    Dim CustomFieldCaption As String
    Public Sub EditRecord(ByVal pAccountProjectIdToOpen As Integer)
        Me.AccountProjectIdToOpen = pAccountProjectIdToOpen
        Me.ViewState("AccountProjectIdToOpen") = AccountProjectIdToOpen
        Me.FormView1.ChangeMode(FormViewMode.Edit)
        Me.dsAccountProjectFormObject.SelectParameters("AccountProjectId").DefaultValue = Me.AccountProjectIdToOpen
    End Sub
    Protected Sub FormView1_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.ItemCreated
        AccountCustomFieldBLL.CreateCustomFieldOnFormView_ItemCreated(FormView1, MasterEntityTypeId, , , "26px")
    End Sub
    Protected Sub dsAccountProjectFormObject_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectFormObject.Inserted
        Dim ProjectBLL As New AccountProjectBLL
        Dim AccountProjectId As Integer
        AccountProjectId = CType(Me.FormView1.FindControl("ddlAccountProjectTemplateid"), DropDownList).SelectedValue
        RaiseEvent Inserted(sender, e)
        If Me.Request.QueryString("IsTemplate") = "True" Then
            If CType(Me.FormView1.FindControl("ddlProjectBillingRateTypeId"), DropDownList).SelectedItem.Text <> "Use Project Roles Billing Rate" Then
                Response.Redirect("~/ProjectAdmin/AccountProjectEmployees.aspx?AccountProjectId=" & New AccountProjectBLL().GetLastInsertedId & "&" & "IsTemplate=True&Source=ProjectTemplates", False)
            Else
                Response.Redirect("~/ProjectAdmin/AccountProjectRole.aspx?AccountProjectId=" & New AccountProjectBLL().GetLastInsertedId & "&" & "IsTemplate=True&Source=ProjectTemplates", False)
            End If
        Else
            If CType(Me.FormView1.FindControl("ddlProjectBillingRateTypeId"), DropDownList).SelectedItem.Text <> "Use Project Roles Billing Rate" Then
                If AccountProjectId <> 0 Then
                    Call New AccountProjectEmployeeBLL().InsertProjectEmployeesByProjectTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountProjectMilestoneBLL().InsertAccountProjectMilestonesByProjectTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountEMailNotificationPreferenceBLL().InsertDefaultAccountEmployeeEMailNotificationPreferenceByProjectTemplate(New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountProjectTaskBLL().InsertAccountProjectTasksByProjectTemplate(New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountProjectTaskEmployeeBLL().InsertAccountProjectTaskEmployeeByProjectTaskTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountProjectTaskBLL().UpdateParentAccountProjectTaskId(New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountBillingRateBLL().InserAccountProjectEmployeeBillingRate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountWorkTypeBLL().InsertWorkTypeBillingRateOfProjectEmployeeByTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountBillingRateBLL().InsertAccountBillingRatesByProjectTaskTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountWorkTypeBLL().InsertWorkTypeBillingRateOfProjectTaskByTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    ProjectBLL.AddAccountProjectEmplyeeForTemplate(DBUtilities.GetSessionAccountId)
                    Response.Redirect("~/ProjectAdmin/AccountProjectEmployees.aspx?AccountProjectId=" & New AccountProjectBLL().GetLastInsertedId, False)
                Else
                    Response.Redirect("~/ProjectAdmin/AccountProjectEmployees.aspx?AccountProjectId=" & New AccountProjectBLL().GetLastInsertedId, False)
                End If
            Else
                If AccountProjectId <> 0 Then
                    Call New AccountProjectRoleBLL().InserAccountProjectRolesByProjectTempalte(New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountProjectEmployeeBLL().InsertProjectEmployeesByProjectTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountProjectMilestoneBLL().InsertAccountProjectMilestonesByProjectTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountEMailNotificationPreferenceBLL().InsertDefaultAccountEmployeeEMailNotificationPreferenceByProjectTemplate(New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountProjectTaskBLL().InsertAccountProjectTasksByProjectTemplate(New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountProjectTaskEmployeeBLL().InsertAccountProjectTaskEmployeeByProjectTaskTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountProjectTaskBLL().UpdateParentAccountProjectTaskId(New AccountProjectBLL().GetLastInsertedId, AccountProjectId)
                    Call New AccountBillingRateBLL().InserAccountProjectEmployeeBillingRate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountWorkTypeBLL().InsertWorkTypeBillingRateOfProjectEmployeeByTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountBillingRateBLL().InserAccountProjectRoleBillingRate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountWorkTypeBLL().InsertWorkTypeBillingRateOfProjectRoleByTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountBillingRateBLL().InsertAccountBillingRatesByProjectTaskTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    Call New AccountWorkTypeBLL().InsertWorkTypeBillingRateOfProjectTaskByTemplate(DBUtilities.GetSessionAccountId, New AccountProjectBLL().GetLastInsertedId)
                    ProjectBLL.AddAccountProjectEmplyeeForTemplate(DBUtilities.GetSessionAccountId)
                    Response.Redirect("~/ProjectAdmin/AccountProjectRole.aspx?AccountProjectId=" & New AccountProjectBLL().GetLastInsertedId, False)
                Else
                    Response.Redirect("~/ProjectAdmin/AccountProjectRole.aspx?AccountProjectId=" & New AccountProjectBLL().GetLastInsertedId, False)
                End If
            End If
        End If
    End Sub
    Protected Sub FormView1_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles FormView1.ItemCommand
        If e.CommandName = "Cancel" Then
            Me.FormView1.ChangeMode(FormViewMode.Insert)
            Me.FormView1.DataBind()
        End If
    End Sub
    Protected Sub dsAccountProjectFormObject_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountProjectFormObject.Inserting
        LocaleUtilitiesBLL.FixDatePickerInternationalDate(Me.FormView1.FindControl("Deadline"), "Deadline", e)
        LocaleUtilitiesBLL.FixDatePickerInternationalDate(Me.FormView1.FindControl("StartDate"), "StartDate", e)
        DBUtilities.SetRowForInserting(e)
    End Sub
    Protected Sub dsAccountProjectFormObject_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountProjectFormObject.Updated
        RaiseEvent Updated(sender, e)
    End Sub
    Protected Sub dsAccountProjectFormObject_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)
    End Sub
    Protected Sub dsAccountProjectFormObject_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountProjectFormObject.Updating
        LocaleUtilitiesBLL.FixDatePickerInternationalDate(Me.FormView1.FindControl("Deadline"), "Deadline", e)
        LocaleUtilitiesBLL.FixDatePickerInternationalDate(Me.FormView1.FindControl("StartDate"), "StartDate", e)
        DBUtilities.SetRowForUpdating(e)
    End Sub
    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs)
        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            e.NewValues.Item("ProjectBillingRateTypeId") = CType(Me.FormView1.FindControl("ddlProjectBillingRateTypeId"), DropDownList).SelectedValue
            e.NewValues.Item("TimeSheetApprovalTypeId") = CType(Me.FormView1.FindControl("ddlTimeSheetApprovalTypeId"), DropDownList).SelectedValue
            e.NewValues.Item("ExpenseApprovalTypeId") = CType(Me.FormView1.FindControl("ddlExpenseApprovalTypeId"), DropDownList).SelectedValue
            e.NewValues.Item("AccountPartyContactId") = CType(Me.FormView1.FindControl("ddlAccountPartyContactId"), DropDownList).SelectedValue
            e.NewValues.Item("AccountPartyDepartmentId") = CType(Me.FormView1.FindControl("ddlAccountPartyDepartmentId"), DropDownList).SelectedValue
            e.NewValues.Item("AccountProjectTypeId") = CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue
            e.NewValues.Item("AccountClientId") = CType(Me.FormView1.FindControl("DropDownList2"), DropDownList).SelectedValue
            e.NewValues.Item("ProjectBillingTypeId") = CType(Me.FormView1.FindControl("DropDownList4"), DropDownList).SelectedValue
            e.NewValues.Item("ProjectStatusId") = CType(Me.FormView1.FindControl("DropDownList6"), DropDownList).SelectedValue
            e.NewValues.Item("LeaderEmployeeId") = CType(Me.FormView1.FindControl("DropDownList3"), DropDownList).SelectedValue
            e.NewValues.Item("ProjectManagerEmployeeId") = CType(Me.FormView1.FindControl("DropDownList5"), DropDownList).SelectedValue

            For n As Integer = 1 To 15
                AccountCustomFieldBLL.SetCustomValuesForFormView_Updating(FormView1, e, MasterEntityTypeId, "CustomField" & n)
                If e.Cancel = True Then
                    Dim CurrentPage As Page = System.Web.HttpContext.Current.CurrentHandler
                    CustomFieldCaption = AccountCustomFieldBLL.GetCustomFieldCaption("CustomField" & n, MasterEntityTypeId)
                    UIUtilities.ShowMessage(CustomFieldCaption & " Field is required.", CurrentPage)
                    RaiseEvent SelectedIndexChanged(sender, e)
                End If
            Next
        End If
    End Sub
    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        AccountPagePermissionBLL.SetPagePermissionForFormView(31, Me.FormView1, "Add")
        'AccountPagePermissionBLL.SetPagePermissionForFormView(28, Me.FormView1, "Add")
        If Me.FormView1.CurrentMode = FormViewMode.Edit And Me.FormView1.DataItem IsNot Nothing Then
            Me.FormView1.Visible = True
            If Not IsDBNull(Me.FormView1.DataItem("ProjectBillingRateTypeId")) Then
                CType(Me.FormView1.FindControl("ddlProjectBillingRateTypeId"), DropDownList).SelectedValue = Me.FormView1.DataItem("ProjectBillingRateTypeId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("TimeSheetApprovalTypeId")) Then
                CType(Me.FormView1.FindControl("ddlTimeSheetApprovalTypeId"), DropDownList).SelectedValue = Me.FormView1.DataItem("TimeSheetApprovalTypeId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("ExpenseApprovalTypeId")) Then
                CType(Me.FormView1.FindControl("ddlExpenseApprovalTypeId"), DropDownList).SelectedValue = Me.FormView1.DataItem("ExpenseApprovalTypeId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("AccountPartyContactId")) Then
                CType(Me.FormView1.FindControl("CascadingDropDown1"), AjaxControlToolkit.CascadingDropDown).SelectedValue = Me.FormView1.DataItem("AccountPartyContactId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("AccountPartyDepartmentId")) Then
                CType(Me.FormView1.FindControl("CascadingDropDown2"), AjaxControlToolkit.CascadingDropDown).SelectedValue = Me.FormView1.DataItem("AccountPartyDepartmentId")
            End If
            If CType(Me.FormView1.FindControl("ddlProjectBillingRateTypeId"), DropDownList).SelectedItem.Text <> Resources.TimeLive.Web.Use_Project_Roles_Billing_Rate Then
                CType(Me.FormView1.FindControl("btnRoleWiseBillingRate"), Button).Visible = False
            End If
            If Not IsDBNull(Me.FormView1.DataItem("AccountProjectTypeId")) Then
                Me.dsProjectTypeObject.SelectParameters("AccountProjectTypeId").DefaultValue = Me.FormView1.DataItem("AccountProjectTypeId")
                CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountProjectTypeId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("ProjectBillingTypeId")) Then
                Me.dsBillingTypeObject.SelectParameters("AccountBillingTypeId").DefaultValue = Me.FormView1.DataItem("ProjectBillingTypeId")
                CType(Me.FormView1.FindControl("DropDownList4"), DropDownList).SelectedValue = Me.FormView1.DataItem("ProjectBillingTypeId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("ProjectStatusId")) Then
                Me.dsProjectStatusObject.SelectParameters("AccountStatusId").DefaultValue = Me.FormView1.DataItem("ProjectStatusId")
                CType(Me.FormView1.FindControl("DropDownList6"), DropDownList).SelectedValue = Me.FormView1.DataItem("ProjectStatusId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("AccountClientId")) Then
                Me.dsClientObject.SelectParameters("AccountPartyId").DefaultValue = Me.FormView1.DataItem("AccountClientId")
                CType(Me.FormView1.FindControl("DropDownList2"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountClientId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("LeaderEmployeeId")) Then
                Me.dsEmployeeObject.SelectParameters("AccountEmployeeId").DefaultValue = Me.FormView1.DataItem("LeaderEmployeeId")
                CType(Me.FormView1.FindControl("DropDownList3"), DropDownList).SelectedValue = Me.FormView1.DataItem("LeaderEmployeeId")
            End If
            If Not IsDBNull(Me.FormView1.DataItem("ProjectManagerEmployeeId")) Then
                Me.dsProjectManagerObject.SelectParameters("AccountEmployeeId").DefaultValue = Me.FormView1.DataItem("ProjectManagerEmployeeId")
                CType(Me.FormView1.FindControl("DropDownList5"), DropDownList).SelectedValue = Me.FormView1.DataItem("ProjectManagerEmployeeId")
            End If
            If Me.Request.QueryString("IsTemplate") = "True" Then
                CType(Me.FormView1.FindControl("Literal1"), Literal).Text = Resources.TimeLive.Web.Project_Template_Information
                CType(Me.FormView1.FindControl("Literal21"), Literal).Text = Resources.TimeLive.Web.Project_Template
            Else
                CType(Me.FormView1.FindControl("Literal1"), Literal).Text = Resources.TimeLive.Web.Project_Information
                CType(Me.FormView1.FindControl("Literal21"), Literal).Text = Resources.TimeLive.Web.Project
            End If
            AccountCustomFieldBLL.SetCustomValuesForFormView_DataBound(FormView1)
        End If
        If Me.FormView1.CurrentMode = FormViewMode.Insert Then
            Me.FormView1.Visible = False
            If Me.Request.QueryString("IsTemplate") = "True" Then
                CType(Me.FormView1.FindControl("Literal20"), Literal).Text = Resources.TimeLive.Web.Project_Template_Information
                CType(Me.FormView1.FindControl("Literal21"), Literal).Text = Resources.TimeLive.Web.Project_Template
            Else
                CType(Me.FormView1.FindControl("Literal20"), Literal).Text = "Add Project"
                CType(Me.FormView1.FindControl("Literal21"), Literal).Text = Resources.TimeLive.Web.Project
            End If
        End If
        If Me.Request.QueryString("IsTemplate") <> "True" Then
            If Me.FormView1.CurrentMode = FormViewMode.Insert Then
                If LocaleUtilitiesBLL.AutoGenerateProjectCode = True Then
                    Me.AutoProjectCodeNo(DBUtilities.GetSessionAccountId)
                End If
            End If
            If LocaleUtilitiesBLL.AutoGenerateProjectCode = True Then
                CType(Me.FormView1.FindControl("ProjectCodeTextBox"), TextBox).ReadOnly = True
            End If
        End If
    End Sub
    Protected Sub btnRoleWiseBillingRate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request.QueryString("IsTemplate") = "True" Then
            Response.Redirect("~/ProjectAdmin/AccountProjectRole.aspx?AccountProjectId=" & Me.FormView1.DataKey("AccountProjectId") & "&" & "IsTemplate=True" & "&Source=ProjectTemplates", False)
        Else
            If Me.Request.QueryString("Source") = "MyProjects" Then
                Response.Redirect("~/ProjectAdmin/AccountProjectRole.aspx?AccountProjectId=" & Me.FormView1.DataKey("AccountProjectId") & "&Source=MyProjects", False)
            Else
                Response.Redirect("~/ProjectAdmin/AccountProjectRole.aspx?AccountProjectId=" & Me.FormView1.DataKey("AccountProjectId"), False)
            End If
        End If
    End Sub
    Protected Sub btnProjectEmployees_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request.QueryString("IsTemplate") = "True" Then
            Response.Redirect("~/ProjectAdmin/AccountProjectEmployees.aspx?AccountProjectId=" & Me.FormView1.DataKey("AccountProjectId") & "&" & "IsTemplate=True" & "&Source=ProjectTemplates", False)
        Else
            If Me.Request.QueryString("Source") = "MyProjects" Then
                Response.Redirect("~/ProjectAdmin/AccountProjectEmployees.aspx?AccountProjectId=" & Me.FormView1.DataKey("AccountProjectId") & "&Source=MyProjects", False)
            Else
                Response.Redirect("~/ProjectAdmin/AccountProjectEmployees.aspx?AccountProjectId=" & Me.FormView1.DataKey("AccountProjectId"), False)
            End If
        End If
    End Sub
    Protected Sub FormView1_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.ModeChanged
        'CType(Me.FormView1.FindControl("DropDownList2"), DropDownList).DataBind()
    End Sub
    Protected Sub ddlAccountProjectTemplateId_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim AccountProjectId As Integer
        AccountProjectId = CType(Me.FormView1.FindControl("ddlAccountProjectTemplateid"), DropDownList).SelectedValue
        Dim BLL As New AccountProjectBLL
        Dim dt As TimeLiveDataSet.AccountProjectDataTable = BLL.GetAccountProjectsByAccountProjectId(AccountProjectId)
        Dim dr As TimeLiveDataSet.AccountProjectRow
        Try
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue = dr.AccountProjectTypeId
                CType(Me.FormView1.FindControl("DropDownList2"), DropDownList).SelectedValue = dr.AccountClientId
                CType(Me.FormView1.FindControl("CascadingDropDown1"), AjaxControlToolkit.CascadingDropDown).SelectedValue = dr.AccountPartyContactId
                CType(Me.FormView1.FindControl("CascadingDropDown2"), AjaxControlToolkit.CascadingDropDown).SelectedValue = dr.AccountPartyDepartmentId
                CType(Me.FormView1.FindControl("DropDownList4"), DropDownList).SelectedValue = dr.ProjectBillingTypeId
                If LocaleUtilitiesBLL.AutoGenerateProjectCode = False Then
                    CType(Me.FormView1.FindControl("ProjectCodeTextBox"), TextBox).Text = dr.ProjectCode
                End If
                CType(Me.FormView1.FindControl("ProjectNameTextBox"), TextBox).Text = dr.ProjectName
                CType(Me.FormView1.FindControl("ProjectDescriptionTextBox"), TextBox).Text = dr.ProjectDescription
                CType(Me.FormView1.FindControl("StartDate"), eWorld.UI.CalendarPopup).SelectedDate = dr.StartDate
                CType(Me.FormView1.FindControl("Deadline"), eWorld.UI.CalendarPopup).SelectedDate = dr.Deadline
                CType(Me.FormView1.FindControl("DropDownList6"), DropDownList).SelectedValue = dr.ProjectStatusId
                CType(Me.FormView1.FindControl("DropDownList3"), DropDownList).SelectedValue = dr.LeaderEmployeeId
                CType(Me.FormView1.FindControl("DropDownList5"), DropDownList).SelectedValue = dr.ProjectManagerEmployeeId

                If Not IsDBNull(dr.Item("TimeSheetApprovalTypeId")) Then
                    Dim dtapprovaltype As TimeLiveDataSet.AccountApprovalTypeDataTable = New AccountApprovalBLL().GetAccountApprovalTypesByAccountApprovalTypeIdandIstimeoff(dr.TimeSheetApprovalTypeId)
                    Dim drapprovaltype As TimeLiveDataSet.AccountApprovalTypeRow
                    If dtapprovaltype.Rows.Count > 0 Then
                        drapprovaltype = dtapprovaltype.Rows(0)
                        CType(Me.FormView1.FindControl("ddlTimeSheetApprovalTypeId"), DropDownList).SelectedValue = dr.TimeSheetApprovalTypeId
                    Else
                        CType(Me.FormView1.FindControl("ddlTimeSheetApprovalTypeId"), DropDownList).SelectedValue = 0
                    End If
                End If
                If Not IsDBNull(dr.Item("ExpenseApprovalTypeId")) Then
                    Dim dtapprovaltype As TimeLiveDataSet.AccountApprovalTypeDataTable = New AccountApprovalBLL().GetAccountApprovalTypesByAccountApprovalTypeIdandIstimeoff(dr.ExpenseApprovalTypeId)
                    Dim drapprovaltype As TimeLiveDataSet.AccountApprovalTypeRow
                    If dtapprovaltype.Rows.Count > 0 Then
                        drapprovaltype = dtapprovaltype.Rows(0)
                        CType(Me.FormView1.FindControl("ddlExpenseApprovalTypeId"), DropDownList).SelectedValue = dr.ExpenseApprovalTypeId
                    Else
                        CType(Me.FormView1.FindControl("ddlExpenseApprovalTypeId"), DropDownList).SelectedValue = 0
                    End If
                End If
                CType(Me.FormView1.FindControl("EstimatedDurationTextBox"), TextBox).Text = dr.EstimatedDuration
                CType(Me.FormView1.FindControl("DropDownList7"), DropDownList).SelectedValue = dr.EstimatedDurationUnit
                If dr.DefaultBillingRate = 0 Then
                    CType(Me.FormView1.FindControl("DefaultBillingRateTextBox"), TextBox).Text = 0
                Else
                    CType(Me.FormView1.FindControl("DefaultBillingRateTextBox"), TextBox).Text = dr.DefaultBillingRate
                End If
                CType(Me.FormView1.FindControl("ddlProjectBillingRateTypeId"), DropDownList).SelectedValue = dr.ProjectBillingRateTypeId
                RaiseEvent btnTemplateClick(sender)
            Else
                RaiseEvent SelectedIndexChanged(sender, e)
            End If
        Catch ex As Exception
            'Response.Redirect("~/ProjectAdmin/AccountProjects.aspx", False)
            RaiseEvent SelectedIndexChanged(sender, e)
            Return
        End Try
    End Sub
    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        If CType(Me.FormView1.FindControl("ProjectDescriptionTextBox"), TextBox).Text.Length > 4000 Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Update_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.FormView1.Visible = False

    End Sub
    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.FormView1.Visible = False
        RaiseEvent btnCancelClick(sender, e)
        If Me.Request.QueryString("IsTemplate") = "True" Then
            Response.Redirect("~/ProjectAdmin/AccountProjectTemplates.aspx?IsTemplate=True", False)
        End If
    End Sub
    Protected Sub Add_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.FormView1.Visible = False
        RaiseEvent btnAddClick(sender, e)
    End Sub
    Private Sub AutoProjectCodeNo(ByVal AccountId As Integer)
        Me.IsValidProjectCodeTextBox()
    End Sub
    Public Function GetProjectCode() As Boolean
        Dim ProjectBll As New AccountProjectBLL
        Dim dtCheckProjectCode As TimeLiveDataSet.vueAccountProjectsDataTable = ProjectBll.GetAccountProjectByCheckProjectCode(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("ProjectCodeTextBox"), TextBox).Text)
        If dtCheckProjectCode.Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function IsValidProjectCodeTextBox() As Boolean
        Dim ProjectBll As New AccountProjectBLL
        'Dim ProjectCodePrefix As String
        'ProjectCodePrefix = DBUtilities.GetProjectCodePrefix
        Dim dtProjectCode As TimeLiveDataSet.AccountProjectCodeDataTable = ProjectBll.GetAccountProjectByLastProjectCode(DBUtilities.GetSessionAccountId)
        Dim drProjectCode As TimeLiveDataSet.AccountProjectCodeRow
        drProjectCode = dtProjectCode.Rows(0)
        If Not IsDBNull(drProjectCode.Item("ProjectCode")) Then
            Dim ProjectCode As Single
            If Not Single.TryParse(CType(Me.FormView1.FindControl("ProjectCodeTextBox"), TextBox).Text, ProjectCode) Then
                Dim AccountId = DBUtilities.GetSessionAccountId
                CType(FormView1.FindControl("ProjectCodeTextBox"), TextBox).Text = drProjectCode.Item("ProjectCode") + 1
                Return False
            End If
            Return True
        Else
            CType(FormView1.FindControl("ProjectCodeTextBox"), TextBox).Text = 1
        End If
    End Function
    Protected Sub CustomValidator2_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs)
        If Me.Request.QueryString("IsTemplate") <> "True" Then
            If LocaleUtilitiesBLL.AutoGenerateProjectCode = True Then
                If Me.GetProjectCode = True Then
                    args.IsValid = False
                End If
            End If
        End If
    End Sub
    Protected Sub FormView1_ItemInserting(sender As Object, e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting
        For n As Integer = 1 To 15
            AccountCustomFieldBLL.SetCustomValuesForFormView_Inserting(FormView1, e, MasterEntityTypeId, "CustomField" & n)
            If e.Cancel = True Then
                Dim CurrentPage As Page = System.Web.HttpContext.Current.CurrentHandler
                CustomFieldCaption = AccountCustomFieldBLL.GetCustomFieldCaption("CustomField" & n, MasterEntityTypeId)
                UIUtilities.ShowMessage(CustomFieldCaption & " Field is required.", CurrentPage)
            End If
        Next
        RaiseEvent SelectedIndexChanged(sender, e)
    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        RaiseEvent btnUpdateClick(sender, e)
        Dim BLL As New AccountProjectAttachmentBLL
        Dim AccountProjectId = Me.FormView1.DataKey("AccountProjectId")
        BLL.FileUpload(Me.FormView1.FindControl("AttachmentFileUpload"), AccountProjectId, DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("AttachmentNameTextBox"), TextBox).Text)
    End Sub

    Protected Sub FormView1_ItemInserted(sender As Object, e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Dim BLL As New AccountProjectAttachmentBLL
        Dim AccountProjectId = New AccountProjectBLL().GetLastInsertedId
        BLL.FileUpload(Me.FormView1.FindControl("AttachmentFileUpload"), AccountProjectId, DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("AttachmentNameTextBox"), TextBox).Text)
    End Sub
End Class
