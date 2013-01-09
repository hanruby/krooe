Imports Microsoft.VisualBasic
Public Class LiveReportFilterHandlerBLL
    Dim StartDate As New eWorld.UI.CalendarPopup
    Dim EndDate As New eWorld.UI.CalendarPopup
    Dim FilterStartDate As String
    Dim FilterEndDate As String
    Public Function HandlerFilter(ByVal FilterControl As Control, ByVal AccountReportId As Guid) As String
        Dim WhereClause As String = ""
        Dim ddl As New DropDownList
        Dim chk As New CheckBox
        Dim BLL As New LiveReportData
        Dim rd As New RadioButton

        Dim dtSystemReport As ReportFilter.vueAccountReportFilterDataTable = BLL.GetvueAccountReportFilterByAccountReportId(AccountReportId)
        Dim drSystemReport As ReportFilter.vueAccountReportFilterRow
        If dtSystemReport.Rows.Count > 0 Then
            drSystemReport = dtSystemReport.Rows(0)
            For Each drSystemReport In dtSystemReport.Rows

                If WhereClause = "" Then
                    WhereClause = "AccountId = " & DBUtilities.GetSessionAccountId & " and "
                End If
                If drSystemReport.FilterOperator = "=All" Then
                    ddl = CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource), DropDownList)
                    If Me.GetIdFromDropdown(ddl) <> "" Then
                        If drSystemReport.SystemReportFilterSource = "AssignedProject" And Me.GetIdFromDropdown(ddl) = "-1" Then
                            WhereClause = WhereClause + "(AccountProjectId is null) and "
                        Else
                            WhereClause = WhereClause + "(" & drSystemReport.FilterField & " in (" & Me.GetIdFromDropdown(ddl) & ")" & IIf(drSystemReport.SystemReportFilterSource = "AssignedProject" And ddl.SelectedValue = 0, " or AccountProjectId is null)", ")") & "and "
                        End If
                    End If

                ElseIf drSystemReport.FilterOperator = "=" Then
                    ddl = CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource), DropDownList)
                    If ddl.SelectedValue <> "0" And ddl.SelectedValue <> "" Then
                        WhereClause = WhereClause + "(" & drSystemReport.FilterField & " = " & ddl.SelectedValue & ") and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Between" Then
                    chk = CType(FilterControl.FindControl("IncludeDateRange"), CheckBox)
                    StartDate = CType(FilterControl.FindControl("StartDate"), eWorld.UI.CalendarPopup)
                    EndDate = CType(FilterControl.FindControl("EndDate"), eWorld.UI.CalendarPopup)
                    SetDateValue()
                    If Not chk Is Nothing Then
                        If chk.Checked Then
                            WhereClause = WhereClause + "(" & GetDateColumnName(drSystemReport.ReportDataSourceName, "StartDate") & " >= " & FilterStartDate & " and " & GetDateColumnName(drSystemReport.ReportDataSourceName, "EndDate") & " <= " & FilterEndDate & ") and "
                        End If
                    Else
                        WhereClause = WhereClause + "(" & GetDateColumnName(drSystemReport.ReportDataSourceName, "StartDate") & " >= " & FilterStartDate & " and " & GetDateColumnName(drSystemReport.ReportDataSourceName, "EndDate") & " <= " & FilterEndDate & ") and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Approved" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Approved"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Approved"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(Approved = 1) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Not Approved"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Not Approved"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "((Approved <> 1) or (Approved is null)) and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Submitted" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Submitted"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Submitted"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(Submitted = 1) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Not Submitted"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Not Submitted"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "((Submitted <> 1) or (Submitted is null)) and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Billable" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Billable"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Billable"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(IsBillable = 1) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Non-Billable"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Non-Billable"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "((IsBillable <> 1) or (IsBillable is null)) and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Paid" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Paid"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Paid"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(IsPaid = 1) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "UnPaid"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "UnPaid"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "((IsPaid <> 1) or (Ispaid is null)) and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Disabled" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Disabled"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Disabled"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(IsDisabled = 1) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Enabled"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Enabled"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "((IsDisabled <> 1) or (IsDisabled is null)) and "
                    End If

                ElseIf drSystemReport.FilterOperator = "ActiveStatus" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Active"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Active"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(IsActive = 1) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "InActive"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "InActive"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "((IsActive <> 1) or (IsActive is null)) and "
                    End If


                ElseIf drSystemReport.FilterOperator = "ApprovalType" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Rejected"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Rejected"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(" & GetByDataSource(drSystemReport.ReportDataSourceName) & " = 1) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Approved"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Approved"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(IsApproved = 1) and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Reimbursement" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Non Reimbursement"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Non Reimbursement"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(Reimburse = 0) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Reimbursement"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Reimbursement"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(Reimburse = 1) and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Billed" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Not Billed"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Not Billed"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(Billed = 0 or Billed is null) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Billed"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Billed"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(Billed = 1) and "
                    End If

                ElseIf drSystemReport.FilterOperator = "Guid" Then
                    ddl = CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource), DropDownList)
                    If ddl.SelectedValue <> "0" And ddl.SelectedValue <> "" Then
                        WhereClause = WhereClause + "(" & drSystemReport.FilterField & " = '" & ddl.SelectedValue & "') and "
                    End If

                ElseIf drSystemReport.FilterOperator = "TimesheetType" Then
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Timesheet Records"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Timesheet Records"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(IsTimeOff = 0 or IsTimeOff is null) and "
                    End If
                    If Not CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Time Off Records"), RadioButton) Is Nothing And CType(FilterControl.FindControl(drSystemReport.SystemReportFilterSource & "Time Off Records"), RadioButton).Checked = True Then
                        WhereClause = WhereClause + "(IsTimeOff = 1) and "
                    End If
                End If
            Next
            If Right(WhereClause, 4) = "and " Then
                WhereClause = Left(WhereClause, WhereClause.Length - 4)
            End If
            'WhereClause = WhereClause + " order by AccountEmployeeId, TimeEntryDate, AccountProjectId, AccountProjectTaskId"
        End If
        Return WhereClause
    End Function
    Public Function GetIdFromDropdown(ByVal objDropdown As DropDownList) As String
        Dim strObject As String = ""
        If objDropdown.SelectedValue = 0 Then
            For Each objListItem As ListItem In objDropdown.Items
                If objListItem.Value <> -1 Then
                    strObject = strObject & IIf(strObject = "", "", ",") & objListItem.Value
                End If
            Next
        Else
            strObject = objDropdown.SelectedValue
        End If
        Return strObject
    End Function
    Public Function GetDateColumnName(ByVal DataSourceName As String, ByVal DateType As String) As String
        If DataSourceName = "Time Entry" Or DataSourceName = "Employee Time Off Detail" Then
            Return "TimeEntryDate"
        ElseIf DataSourceName = "Expense Entry" Then
            Return "AccountExpenseEntryDate"
        ElseIf DataSourceName = "Attendance" Or DataSourceName = "Absence" Then
            Return "AttendanceDate"
        ElseIf DataSourceName = "Time Entry Approval Activity" Then
            Return "TimeEntryDate"
        ElseIf DataSourceName = "Expense Entry Approval Activity" Then
            Return "AccountExpenseEntryDate"
        ElseIf DataSourceName = "TimeLive Invoice" Then
            Return "InvoiceDate"
        ElseIf DataSourceName = "Expense Sheet" Then
            Return "ExpenseSheetDate"
        ElseIf DataSourceName = "Time Entry Period" And DateType = "StartDate" Then
            Return "TimeEntryStartDate"
        ElseIf DataSourceName = "Time Entry Period" And DateType = "EndDate" Then
            Return "TimeEntryEndDate"
        ElseIf DataSourceName = "Expense Sheet Audit Trail" Or DataSourceName = "Timesheet Audit Trail" Then
            Return "UpdateDate"
        ElseIf DataSourceName = "Time Off Request" Then
            Return "StartDate"
        End If
    End Function
    Public Sub SetDateValue()
        If StartDate.PostedDate Is Nothing Then
            FilterStartDate = LocaleUtilitiesBLL.ConvertDateBaseIntoSQLQurey(Now.Date.ToString)
            FilterEndDate = LocaleUtilitiesBLL.ConvertDateBaseIntoSQLQurey(Now.Date.ToString)
        Else
            FilterStartDate = LocaleUtilitiesBLL.ConvertDateBaseIntoSQLQurey(StartDate.PostedDate)
            FilterEndDate = LocaleUtilitiesBLL.ConvertDateBaseIntoSQLQurey(EndDate.PostedDate)
        End If
    End Sub
    Public Function GetByDataSource(ByVal DataSourceName As String) As String
        If DataSourceName = "Time Entry Approval Activity" Then
            Return "IsReject"
        ElseIf DataSourceName = "Expense Entry Approval Activity" Then
            Return "IsRejected"
        End If
    End Function
End Class
