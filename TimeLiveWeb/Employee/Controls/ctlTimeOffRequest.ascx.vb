
Partial Class Employee_Controls_ctlTimeOffRequest
    Inherits System.Web.UI.UserControl
    Dim AvailableTimeOffBalance As Double = 0
    Dim HoursOff As Double = 0
    Dim TimeOffType As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.Request.QueryString("AccountEmployeeTimeOffRequestId") Is Nothing Then
            FormView1.ChangeMode(FormViewMode.Insert)
        Else
            FormView1.ChangeMode(FormViewMode.Edit)
            Me.dsEmployeeTimeOffRequestFormViewObject.SelectParameters("AccountEmployeeTimeOffRequestId").DefaultValue = Me.Request.QueryString("AccountEmployeeTimeOffRequestId").ToString
        End If
        Me.dsAccountProjectObject.SelectParameters("Completed").DefaultValue = LocaleUtilitiesBLL.IsShowCompletedProjectsInTimeSheet
        Me.FormView1.Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(143, 3)
        Me.IsConsumptionAvailable()
        'If Me.FormView1.CurrentMode = FormViewMode.Insert Then
        CType(Me.FormView1.FindControl("lblAvailableTimeOff"), Label).Text = AvailableTimeOffBalance & " hours"
        If AvailableTimeOffBalance <= 0 Then
            CType(Me.FormView1.FindControl("lblAvailableTimeOff"), Label).ForeColor = Color.Red
        Else
            CType(Me.FormView1.FindControl("lblAvailableTimeOff"), Label).ForeColor = Color.Black
        End If
        'End If
    End Sub
    Public Sub Calculation(Optional ByVal IsFromDaysOff As Boolean = False, Optional ByVal IsFromHoursOff As Boolean = False)
        If Not IsValidAllTextBoxValue() Then
            Return
        End If
        If CType(Me.FormView1.FindControl("EndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate < CType(Me.FormView1.FindControl("StartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate Then
            CType(Me.FormView1.FindControl("EndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = CType(Me.FormView1.FindControl("StartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate
        End If
        Dim dt As TimeLiveDataSet.vueAccountEmployeeWorkingDaysDataTable = New AccountWorkingDayBLL().GetWorkingDaysByAccountEmployeeId(DBUtilities.GetSessionAccountEmployeeId)
        Dim dtHoliday As AccountHolidayType.vueAccountEmployeeHolidayTypesWithDetailDataTable = New AccountHolidayTypeBLL().GetvueAccountEmployeeHolidayTypesWithDetailByAccountEmployeeId(DBUtilities.GetSessionAccountEmployeeId)
        Dim startdate As Date = CType(Me.FormView1.FindControl("StartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate
        Dim daysoff As Double = DateDiff(DateInterval.Day, CType(Me.FormView1.FindControl("StartDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate, CType(Me.FormView1.FindControl("EndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate.AddDays(1))
        Dim FromDaysOff As Double
        Dim TotalHours As Double = DBUtilities.GetHoursPerDay
        Dim FDaysOff As Double
        Dim RoundDaysOff As Double
        If IsFromDaysOff Then
            FromDaysOff = CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text
            If FromDaysOff.ToString("N", LocaleUtilitiesBLL.GetBaseCultureInfo).Contains(".") Then
                Dim day As String() = FromDaysOff.ToString("N", LocaleUtilitiesBLL.GetBaseCultureInfo).Split(".")
                If day(1) > 0 Then
                    RoundDaysOff = day(0) + 1
                Else
                    RoundDaysOff = day(0)
                End If
            Else
                RoundDaysOff = CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text
            End If
            Dim EndDate As Date = startdate.AddDays(RoundDaysOff - 1)
            EndDate = GetEndDate(RoundDaysOff, startdate, dt, dtHoliday)
            CType(Me.FormView1.FindControl("EndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = EndDate
            FDaysOff = CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text
        End If
        If IsFromHoursOff Then
            daysoff = CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text / TotalHours
            If daysoff.ToString("N", LocaleUtilitiesBLL.GetBaseCultureInfo).Contains(".") Then
                Dim day As String() = daysoff.ToString("N", LocaleUtilitiesBLL.GetBaseCultureInfo).Split(".")
                If day(1) > 0 Then
                    RoundDaysOff = day(0) + 1
                Else
                    RoundDaysOff = day(0)
                End If
            Else
                RoundDaysOff = daysoff
            End If
            Dim EndDate As Date = GetEndDate(RoundDaysOff, startdate, dt, dtHoliday)
            CType(Me.FormView1.FindControl("EndDateTextBox"), eWorld.UI.CalendarPopup).SelectedDate = EndDate
            FDaysOff = daysoff
        End If
        If Not IsFromHoursOff And Not IsFromDaysOff Then
            Dim TotalDaysOff As Double
            For n As Integer = 0 To daysoff - 1
                If IsCurrentDayAvailableInWorkingDay(startdate, n, dt, dtHoliday) Then
                    TotalDaysOff += 1
                End If
            Next
            FDaysOff = TotalDaysOff
        End If
        CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text = FDaysOff
        If Not IsFromHoursOff Then
            CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text = (FDaysOff * TotalHours).ToString
        End If
    End Sub
    Public Function GetEndDate(ByVal Daysoff As Double, ByVal StartDate As Date, ByVal dt As TimeLiveDataSet.vueAccountEmployeeWorkingDaysDataTable, ByVal dtHoliday As AccountHolidayType.vueAccountEmployeeHolidayTypesWithDetailDataTable)
        Dim TotalDaysOff As Double = 0
        Dim TempDaysOff As Double = 0
        Do Until TotalDaysOff = Daysoff
            If IsCurrentDayAvailableInWorkingDay(StartDate, TempDaysOff, dt, dtHoliday) = True Then
                TotalDaysOff += 1
            End If
            If Not TotalDaysOff = Daysoff Then
                TempDaysOff += 1
            End If
        Loop
        Return StartDate.AddDays(TempDaysOff)
    End Function
    Public Function IsCurrentDayAvailableInWorkingDay(ByVal StartDate As Date, ByVal AddDaysNo As Integer, ByVal dt As TimeLiveDataSet.vueAccountEmployeeWorkingDaysDataTable, ByVal dtHoliday As AccountHolidayType.vueAccountEmployeeHolidayTypesWithDetailDataTable)
        Dim dr As TimeLiveDataSet.vueAccountEmployeeWorkingDaysRow
        Dim Holidaydr() As DataRow = dtHoliday.Select("HolidayDate = '" & StartDate.AddDays(AddDaysNo).Date & "'")
        Dim chkDay As Boolean
        If dt.Rows.Count > 0 Then
            For Each dr In dt.Rows
                If Left(dr.WorkingDay, 3) = LocaleUtilitiesBLL.GetDayInCurrentLocale(StartDate.AddDays(AddDaysNo)) Then
                    chkDay = True
                End If
            Next
        End If
        If Holidaydr.Length > 0 Then
            Return False
        End If
        If chkDay And Holidaydr.Length = 0 Then
            Return True
        End If
    End Function
    Protected Sub StartDateTextBox_DateChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Calculation()
    End Sub

    Protected Sub EndDateTextBox_DateChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Calculation()
    End Sub
    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        If FormView1.CurrentMode = FormViewMode.Insert Then
            CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text = 0
            CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text = 0
            Calculation()
        ElseIf FormView1.CurrentMode = FormViewMode.Edit Then
            ShowDataForddlProjectName()
            If Not IsDBNull(Me.FormView1.DataItem("AccountTimeOffTypeId")) Then
                Me.dsTimeOffTypesObject.SelectParameters("AccountTimeOffTypeId").DefaultValue = Me.FormView1.DataItem("AccountTimeOffTypeId").ToString
                CType(Me.FormView1.FindControl("ddlTimeOffTypeId"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountTimeOffTypeId").ToString
            End If
            If Not IsDBNull(Me.FormView1.DataItem("AccountProjectId")) Then
                Me.dsAccountProjectObject.SelectParameters("AccountProjectId").DefaultValue = Me.FormView1.DataItem("AccountProjectId")
                CType(Me.FormView1.FindControl("ddlProjectName"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountProjectId")
            End If
        End If
    End Sub
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    End Sub
    Protected Sub dsTimeOffTypesObject_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsTimeOffTypesObject.Inserted
    End Sub
    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Response.Redirect("~/Employee/MyTimeOff.aspx", False)
    End Sub
    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Response.Redirect("~/Employee/MyTimeOff.aspx", False)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Employee/MyTimeOff.aspx", False)
    End Sub

    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        e.NewValues("AccountTimeOffTypeId") = CType(Me.FormView1.FindControl("ddlTimeOffTypeId"), DropDownList).SelectedValue.ToString
        e.NewValues("AccountProjectId") = CType(Me.FormView1.FindControl("ddlProjectName"), DropDownList).SelectedValue
    End Sub

    Protected Sub DaysOffTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim AmountValue As Single
        If Not Single.TryParse(CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text, AmountValue) Then
            CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text = AmountValue
        End If
        Calculation(True)
    End Sub

    Protected Sub HoursOffTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim AmountValue As Single
        If Not Single.TryParse(CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text, AmountValue) Then
            CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text = AmountValue
        End If
        Calculation(False, True)
    End Sub

    Protected Sub DaysOffTextBox_TextChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim AmountValue As Single
        If Not Single.TryParse(CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text, AmountValue) Then
            CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text = AmountValue
        End If
        Calculation(True)
    End Sub

    Protected Sub HoursOffTextBox_TextChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim AmountValue As Single
        If Not Single.TryParse(CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text, AmountValue) Then
            CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text = AmountValue
        End If
        Calculation(False, True)
    End Sub
    Public Sub ShowDataForddlProjectName()
        If Not CType(Me.FormView1.FindControl("ddlProjectName"), DropDownList) Is Nothing Then
            CType(Me.FormView1.FindControl("ddlProjectName"), DropDownList).Items.Clear()
            Dim item As New System.Web.UI.WebControls.ListItem
            item.Text = "<" & Resources.TimeLive.Web.None & ">"
            item.Value = "0"
            CType(Me.FormView1.FindControl("ddlProjectName"), DropDownList).Items.Add(item)
            If IsDBNull(FormView1.DataItem("AccountProjectId")) Then
                CType(Me.FormView1.FindControl("ddlProjectName"), DropDownList).DataBind()
            End If
        End If
    End Sub
    Public Function IsValidAllTextBoxValue()
        Dim AmountValue As Single
        If Not Single.TryParse(CType(Me.FormView1.FindControl("DaysOffTextBox"), TextBox).Text, AmountValue) Then
            Return False
        End If
        If Not Single.TryParse(CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text, AmountValue) Then
            Return False
        End If
        Return True
    End Function
    Public Function IsConsumptionAvailable()
        Dim TimeOffRequestBLL As New AccountEmployeeTimeOffRequestBLL
        Dim TimeOffTypeId As New Guid(CType(Me.FormView1.FindControl("ddlTimeOffTypeId"), DropDownList).SelectedValue)
        Dim dt As AccountEmployeeTimeOffRequest.vueAccountEmployeeTimeOffRequestDataTable = TimeOffRequestBLL.GetAccountEmployeeTimeOffByEmployeeIdAndTimeOffTypeId(DBUtilities.GetSessionAccountEmployeeId, TimeOffTypeId)
        Dim dr As AccountEmployeeTimeOffRequest.vueAccountEmployeeTimeOffRequestRow
        Dim SubmittedHours As Double
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            If Not IsDBNull(dr.Item("Available")) Then
                For Each dr In dt.Rows
                    If dr.ApprovalStatus = "Submitted" Then
                        SubmittedHours = SubmittedHours + dr.HoursOff
                    End If
                Next
                AvailableTimeOffBalance = dr.Available - SubmittedHours
            End If
            HoursOff = CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text
            If AvailableTimeOffBalance >= HoursOff Then
                Return True
            Else
                Return False
            End If
        Else
            Dim TimeOffBLL As New AccountEmployeeTimeOffBLL
            Dim dtTOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = TimeOffBLL.GetAccountEmployeeTimeOffByEmployeeIdAndTimeOffTypeId(DBUtilities.GetSessionAccountEmployeeId, TimeOffTypeId)
            Dim drTOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow

            If dtTOff.Rows.Count > 0 Then
                drTOff = dtTOff.Rows(0)
                If drTOff.Available > 0 Then
                    If Not IsDBNull(drTOff.Item("Available")) Then
                        AvailableTimeOffBalance = drTOff.Available
                    Else
                        AvailableTimeOffBalance = 0
                    End If
                    If CType(Me.FormView1.FindControl("HoursOffTextBox"), TextBox).Text <= AvailableTimeOffBalance Then
                        Return True
                    Else
                        Return False
                    End If
                End If
            End If
        End If
        Return False
    End Function

    Protected Sub ddlTimeOffTypeId_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        'If Me.IsConsumptionAvailable = False Then
        '    CType(Me.FormView1.FindControl("lblErrorMessage"), Label).Visible = True
        'Else
        '    CType(Me.FormView1.FindControl("lblErrorMessage"), Label).Visible = False
        'End If
    End Sub

    Protected Sub FormView1_ItemInserting(sender As Object, e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting
        If DBUtilities.EnableTimeOffValidation Then
            If Me.IsConsumptionAvailable = False Then
                TimeOffType = CType(Me.FormView1.FindControl("ddlTimeOffTypeId"), DropDownList).SelectedItem.Text
                e.Cancel = True
                Me.ShowNotFoundMessage("Not enough hours available, please check " & """" & TimeOffType & """" & " balance before resubmitting.")
                e.Cancel = True
            End If
        End If
    End Sub
    Public Sub ShowNotFoundMessage(ByVal strMessage As String)
        Dim strScript As String = "alert('" & strMessage & "');"
        If (Not Me.Page.ClientScript.IsClientScriptBlockRegistered("clientScript")) Then
            ScriptManager.RegisterClientScriptBlock(Me.Page, Me.GetType, "clientScript", strScript, True)
        End If
    End Sub
End Class
