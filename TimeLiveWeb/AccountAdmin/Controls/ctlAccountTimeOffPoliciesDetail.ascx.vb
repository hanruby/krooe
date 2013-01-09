
Partial Class AccountAdmin_Controls_ctlAccountTimeOffPoliciesDetail
    Inherits System.Web.UI.UserControl
    Dim GridView1 As GridView
    Dim objTimeOff As New AccountTimeOffPolicyBLL
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Save()
        Response.Redirect("~/AccountAdmin/AccountTimeOffPolicies.aspx", False)
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Save()
        Response.Redirect("~/AccountAdmin/AccountTimeOffPolicies.aspx", False)
    End Sub
    Public Sub Save()
        GridView1 = Me.FormView1.FindControl("GridView1")
        Dim AccountTimeOffPolicyId As Guid

        If Me.Request.QueryString("AccountTimeOffPolicyId") Is Nothing Then
            AccountTimeOffPolicyId = InsertTimeOffPolicy()
        Else
            AccountTimeOffPolicyId = New Guid(Me.Request.QueryString("AccountTimeOffPolicyId"))
            UpdateTimeOffPolicy(AccountTimeOffPolicyId)
        End If

        Dim objRow As GridViewRow
        For Each objRow In GridView1.Rows
            If objRow.RowType = DataControlRowType.DataRow Then
                If Me.Request.QueryString("AccountTimeOffPolicyId") Is Nothing Then
                    InsertTimeOffPolicyDetail(AccountTimeOffPolicyId, objRow)
                Else
                    UpdateTimeOffPolicyDetail(AccountTimeOffPolicyId, objRow)
                End If
            End If
        Next
    End Sub
    Public Function InsertTimeOffPolicy() As Guid
        Return objTimeOff.AddAccountTimeOffPolicy(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("txtTimeOffPolicy"), TextBox).Text, DBUtilities.GetSessionAccountEmployeeId, DBUtilities.GetSessionAccountEmployeeId)
    End Function
    Public Sub InsertTimeOffPolicyDetail(ByVal AccountTimeOffPolicyId As Guid, ByVal row As GridViewRow)
        Dim EffectiveDate As System.Nullable(Of Date)
        If CType(row.FindControl("EffectiveDateCalendarPopup"), eWorld.UI.CalendarPopup).SelectedValue.HasValue Then
            EffectiveDate = CType(row.FindControl("EffectiveDateCalendarPopup"), eWorld.UI.CalendarPopup).SelectedDate
        End If
        objTimeOff.AddAccountTimeOffPolicyDetail(DBUtilities.GetSessionAccountId, AccountTimeOffPolicyId, Me.GridView1.DataKeys(row.RowIndex).Item("AccountTimeOffTypeId"), GetSystemEarnPeriodId(row), GetSystemResetToZeroId(row), IIf(CType(row.FindControl("InitialHoursTextBox"), TextBox).Text = "", 0, CType(row.FindControl("InitialHoursTextBox"), TextBox).Text), IIf(CType(row.FindControl("ResetToHoursTextBox"), TextBox).Text = "", 0, CType(row.FindControl("ResetToHoursTextBox"), TextBox).Text), IIf(CType(row.FindControl("EarnHourTextBox"), TextBox).Text = "", 0, CType(row.FindControl("EarnHourTextBox"), TextBox).Text), IIf(CType(row.FindControl("AvailableTextBox"), TextBox).Text = "", 0, CType(row.FindControl("AvailableTextBox"), TextBox).Text), EffectiveDate)
    End Sub
    Public Sub UpdateTimeOffPolicy(ByVal AccountTimeOffPolicyId As Guid)
        objTimeOff.UpdateAccountTimeOffPolicy(CType(Me.FormView1.FindControl("txtTimeOffPolicy"), TextBox).Text, AccountTimeOffPolicyId, DBUtilities.GetSessionAccountEmployeeId, CType(Me.FormView1.FindControl("chkIsDisabled"), CheckBox).Checked)
    End Sub
    Public Sub UpdateTimeOffPolicyDetail(ByVal AccountTimeOffPolicyId As Guid, ByVal row As GridViewRow)
        Dim EffectiveDate As System.Nullable(Of Date)
        If CType(row.FindControl("EffectiveDateCalendarPopup"), eWorld.UI.CalendarPopup).SelectedValue.HasValue Then
            EffectiveDate = CType(row.FindControl("EffectiveDateCalendarPopup"), eWorld.UI.CalendarPopup).SelectedDate
        End If
        objTimeOff.UpdateAccountTimeOffPolicyDetail(Me.GridView1.DataKeys(row.RowIndex).Item("AccountTimeOffPolicyDetailId"), AccountTimeOffPolicyId, Me.GridView1.DataKeys(row.RowIndex).Item("AccountTimeOffTypeId"), GetSystemEarnPeriodId(row), GetSystemResetToZeroId(row), IIf(CType(row.FindControl("InitialHoursTextBox"), TextBox).Text = "", 0, CType(row.FindControl("InitialHoursTextBox"), TextBox).Text), IIf(CType(row.FindControl("ResetToHoursTextBox"), TextBox).Text = "", 0, CType(row.FindControl("ResetToHoursTextBox"), TextBox).Text), IIf(CType(row.FindControl("EarnHourTextBox"), TextBox).Text = "", 0, CType(row.FindControl("EarnHourTextBox"), TextBox).Text), IIf(CType(row.FindControl("AvailableTextBox"), TextBox).Text = "", 0, CType(row.FindControl("AvailableTextBox"), TextBox).Text), EffectiveDate)
    End Sub
    Public Function GetSystemEarnPeriodId(ByVal row As GridViewRow) As Guid
        If CType(row.FindControl("ddlSystemEarnPeriodId"), DropDownList).SelectedItem.Text <> "Never" Then
            Dim SystemEarnPeriodId As New Guid(CType(row.FindControl("ddlSystemEarnPeriodId"), DropDownList).SelectedValue)
            Return SystemEarnPeriodId
        End If
        Return System.Guid.Empty
    End Function
    Public Function GetSystemResetToZeroId(ByVal row As GridViewRow) As Guid
        If CType(row.FindControl("ddlSystemResetToZeroTypeId"), DropDownList).SelectedItem.Text <> "Never" Then
            Dim SystemResetToZeroId As New Guid(CType(row.FindControl("ddlSystemResetToZeroTypeId"), DropDownList).SelectedValue)
            Return SystemResetToZeroId
        End If
        Return System.Guid.Empty
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.Request.QueryString("AccountTimeOffPolicyId") Is Nothing Then
            FormView1.ChangeMode(FormViewMode.Edit)
            Me.dsTimeOffPoliciesDetailFormViewObject.SelectParameters("AccountTimeOffPolicyId").DefaultValue = Me.Request.QueryString("AccountTimeOffPolicyId")
            Me.dsTimeOffPoliciesDetailGridViewObject.SelectParameters("AccountTimeOffPolicyId").DefaultValue = Me.Request.QueryString("AccountTimeOffPolicyId")
        Else
            FormView1.ChangeMode(FormViewMode.Insert)
        End If
    End Sub
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            CType(e.Row.Cells(5).FindControl("ResetToHoursTextBox"), TextBox).Text = 0
            CType(e.Row.Cells(2).FindControl("EarnHourTextBox"), TextBox).Text = 0
            CType(e.Row.Cells(6).FindControl("AvailableTextBox"), TextBox).Text = 0
            CType(e.Row.Cells(1).FindControl("InitialHoursTextBox"), TextBox).Text = 0
            CType(e.Row.Cells(7).FindControl("EffectiveDateCalendarPopup"), eWorld.UI.CalendarPopup).Nullable = True
        End If
    End Sub

    Protected Sub GridView1_RowDataBound1(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "SystemEarnPeriodId")) Then
                CType(e.Row.Cells(1).FindControl("ddlSystemEarnPeriodId"), DropDownList).SelectedValue = DataBinder.Eval(e.Row.DataItem, "SystemEarnPeriodId").ToString
            End If
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "SystemResetToZeroTypeId")) Then
                CType(e.Row.Cells(1).FindControl("ddlSystemResetToZeroTypeId"), DropDownList).SelectedValue = DataBinder.Eval(e.Row.DataItem, "SystemResetToZeroTypeId").ToString
            End If
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "EffectiveDate")) Then
                CType(e.Row.Cells(7).FindControl("EffectiveDateCalendarPopup"), eWorld.UI.CalendarPopup).SelectedDate = DataBinder.Eval(e.Row.DataItem, "EffectiveDate")
            Else
                CType(e.Row.Cells(7).FindControl("EffectiveDateCalendarPopup"), eWorld.UI.CalendarPopup).Nullable = True
            End If
        End If
    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        If FormView1.CurrentMode = FormViewMode.Insert Then
            CType(Me.FormView1.FindControl("GridView1"), GridView).Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(140, 1)
            CType(Me.FormView1.FindControl("btnAdd"), Button).Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(140, 2)
        End If
        If FormView1.CurrentMode = FormViewMode.Edit Then
            CType(Me.FormView1.FindControl("GridView1"), GridView).Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(140, 1)
            CType(Me.FormView1.FindControl("btnUpdate"), Button).Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(140, 3)
        End If
    End Sub
End Class
