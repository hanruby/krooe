Imports ReportFilterTableAdapters
Imports dsReportDesignTableAdapters
Imports System.Data.SqlClient

<System.ComponentModel.DataObject()> _
Public Class LiveReportData

    Dim DataSources As New DataTable
    Dim Reports As New DataTable
    Dim DataSourceFilterSet As New DataTable
    Private _vueAccountReportTableAdapter As New ReportFilterTableAdapters.vueAccountReportTableAdapter
    Private _vueAccountReportDataSourceMappingTableAdapter As New vueAccountReportDataSourceMappingTableAdapter

    Public Sub PrepareDataSources()

        Dim column As New DataColumn
        DataSources.Columns.Add("DatasourceName")
        DataSources.Columns.Add("ViewName")

        Dim objRow As DataRow
        objRow = DataSources.NewRow()
        objRow("DatasourceName") = "Detail Timesheet"
        objRow("ViewName") = "vueAccountEmployeeTimeEntry"
        DataSources.Rows.Add(objRow)

    End Sub

    Public Sub PrepareReports()
        Dim column As New DataColumn
        Reports.Columns.Add("ReportName")
        Reports.Columns.Add("DataSourceName")

        Dim objRow As DataRow
        objRow = Reports.NewRow()
        objRow("ReportName") = "Detail Timesheet Report"
        objRow("DataSourceName") = "Detail Timesheet Report"
        Reports.Rows.Add(objRow)

    End Sub
    Public Sub PrepareDatasourceFilters()
        DataSourceFilterSet.Columns.Add("DataSourceName")
        DataSourceFilterSet.Columns.Add("DataSourceName")

        Dim objRow As DataRow
        objRow = Reports.NewRow()
        objRow("ReportName") = "Detail Timesheet Report"
        objRow("DataSourceName") = "Detail Timesheet Report"
        Reports.Rows.Add(objRow)

    End Sub


    Public Function GetvueAccountReportFilterByAccountReportId(ByVal AccountReportId As Guid) As ReportFilter.vueAccountReportFilterDataTable
        Dim _vueAccountReportFilter As New ReportFilterTableAdapters.vueAccountReportFilterTableAdapter
        GetvueAccountReportFilterByAccountReportId = _vueAccountReportFilter.GetDataByAccountReportId(AccountReportId)
        Return GetvueAccountReportFilterByAccountReportId
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountReports() As ReportFilter.vueAccountReportDataTable
        Return _vueAccountReportTableAdapter.GetData
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountReportsByAccountReportId(ByVal AccountReportId As Guid) As ReportFilter.vueAccountReportDataTable
        Return _vueAccountReportTableAdapter.GetDataByAccountReportId(AccountReportId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountReportDataSourceMappingsByAccountReportId(ByVal AccountReportId As Guid) As dsReportDesign.vueAccountReportDataSourceMappingDataTable
        Return _vueAccountReportDataSourceMappingTableAdapter.GetDataByAccountReportId(AccountReportId)
    End Function

    Public Shared Function GetDataTable(ByVal ReportId As Guid, ByVal WhereClause As String) As DataTable
        Dim BLL As New LiveReportData

        Dim dtDataSourceMapping As dsReportDesign.vueAccountReportDataSourceMappingDataTable = BLL.GetvueAccountReportDataSourceMappingsByAccountReportId(ReportId)
        Dim drDataSourceMapping As dsReportDesign.vueAccountReportDataSourceMappingRow
        If dtDataSourceMapping.Rows.Count > 0 Then
            drDataSourceMapping = dtDataSourceMapping.Rows(0)
            Dim objConnection As SqlConnection
            Dim sqladap As New SqlDataAdapter
            Dim strsql As String = ""
            Dim strsql1 As String = ""

            If drDataSourceMapping.ReportDataSourceName = "Timesheet Audit Trail" Or drDataSourceMapping.ReportDataSourceName = "Expense Sheet Audit Trail" Then
                Dim AccountId As String = "AccountId = " & DBUtilities.GetSessionAccountId & " and"
                Dim ReplaceAccountId As String = Replace(WhereClause, AccountId, " ")
                strsql1 = Replace(ReplaceAccountId, "AccountEmployeeId", "dbo.Audit.UserName")
            End If
            If drDataSourceMapping.ReportDataSourceName = "Timesheet Audit Trail" Then
                strsql = "SELECT CASE WHEN FieldName = 'AccountProjectId' THEN (select ProjectName from AccountProject where AccountProjectId = audit.oldvalue) " & _
                "WHEN FieldName = 'AccountProjectTaskId' THEN (select TaskName from AccountProjectTask where AccountProjectTaskId = audit.oldvalue) " & _
                "WHEN FieldName = 'AccountWorkTypeId' THEN (select AccountWorkType from AccountWorkType where AccountWorkTypeId = audit.oldvalue) " & _
                "WHEN FieldName = 'AccountCostCenterId' THEN (select AccountCostCenter from AccountCostCenter where AccountCostCenterId = audit.oldvalue) " & _
                "WHEN FieldName = 'StartTime' THEN Replace(RIGHT(CONVERT(varchar, Audit.OldValue, 109), 7), ' ', 0) " & _
                "WHEN FieldName = 'EndTime' THEN Replace(RIGHT(CONVERT(varchar, Audit.OldValue, 109), 7), ' ', 0) " & _
                "WHEN FieldName = 'TotalTime' THEN LEFT(CONVERT(varchar, CONVERT(datetime, Audit.OldValue), 8), 5) " & _
                "WHEN FieldName = 'ApprovedOn' THEN CONVERT(nvarchar(100), DATEADD(mi, dbo.GET_TZVALUE(" & LocaleUtilitiesBLL.GetTimeZoneDifference(DBUtilities.GetEmployeeTimeZoneId) & "), Audit.OldValue)) " & _
                "ELSE Audit.OldValue END AS OldValue, " & _
                "CASE WHEN FieldName = 'AccountProjectId' THEN (select ProjectName from AccountProject where AccountProjectId = audit.newvalue) " & _
                "WHEN FieldName = 'AccountProjectTaskId' THEN (select TaskName from AccountProjectTask where AccountProjectTaskId = audit.newvalue) " & _
                "WHEN FieldName = 'AccountWorkTypeId' THEN (select AccountWorkType from AccountWorkType where AccountWorkTypeId = audit.newvalue) " & _
                "WHEN FieldName = 'AccountCostCenterId' THEN (select AccountCostCenter from AccountCostCenter where AccountCostCenterId = audit.newvalue) " & _
                "WHEN FieldName = 'StartTime' THEN Replace(RIGHT(CONVERT(varchar, Audit.NewValue, 109), 7), ' ', 0) " & _
                "WHEN FieldName = 'EndTime' THEN Replace(RIGHT(CONVERT(varchar, Audit.NewValue, 109), 7), ' ', 0) " & _
                "WHEN FieldName = 'TotalTime' THEN LEFT(CONVERT(varchar, CONVERT(datetime, Audit.NewValue), 8), 5) " & _
                "WHEN FieldName = 'ApprovedOn' THEN CONVERT(nvarchar(100), DATEADD(mi, dbo.GET_TZVALUE(" & LocaleUtilitiesBLL.GetTimeZoneDifference(DBUtilities.GetEmployeeTimeZoneId) & "), Audit.NewValue)) " & _
                "ELSE Audit.NewValue END AS NewValue, " & _
                "CASE WHEN FieldName = 'AccountProjectId' THEN 'Project Name' WHEN FieldName = 'AccountProjectTaskId' THEN 'Task Name' " & _
                "WHEN FieldName = 'AccountCostCenterId' THEN 'Cost Center' WHEN FieldName = 'AccountWorkTypeId' THEN 'Work Type' ELSE Audit.FieldName END AS FieldName, " & _
                "dbo.Audit.UserName, dbo.Audit.UpdateDate, dbo.Audit.TableName, dbo.AccountProject.ProjectName, " & _
                "dbo.AccountProjectTask.TaskName, CONVERT(varchar, dbo.AccountEmployeeTimeEntry.TimeEntryDate, 106) AS Date, " & _
                "dbo.AccountEmployeeTimeEntry.TotalTime, dbo.AccountEmployee.FirstName + ' ' + dbo.AccountEmployee.LastName as UpdatedBy " & _
                "FROM dbo.Audit " & _
                "LEFT OUTER JOIN dbo.AccountEmployeeTimeEntry ON Convert(Int, dbo.Audit.PK) = dbo.AccountEmployeeTimeEntry.AccountEmployeeTimeEntryId " & _
                "LEFT OUTER JOIN dbo.AccountProject ON dbo.AccountEmployeeTimeEntry.AccountProjectId = dbo.AccountProject.AccountProjectId " & _
                "LEFT OUTER JOIN dbo.AccountProjectTask ON dbo.AccountEmployeeTimeEntry.AccountProjectTaskId = dbo.AccountProjectTask.AccountProjectTaskId " & _
                "LEFT OUTER JOIN dbo.AccountEmployee ON dbo.Audit.UserName = dbo.AccountEmployee.AccountEmployeeId " & _
                "Where (dbo.Audit.TableName = N'AccountEmployeeTimeEntry') and " & strsql1 & " UNION ALL " & _
                "SELECT CASE WHEN FieldName = 'SubmittedBy' THEN (Select FirstName + ' ' + LastName From AccountEmployee where AccountEmployeeId = audit.oldvalue) " & _
                "WHEN FieldName = 'ApprovedByEmployeeId' THEN (Select FirstName + ' ' + LastName From AccountEmployee where AccountEmployeeId = audit.oldvalue) " & _
                "WHEN FieldName = 'RejectedByEmployeeId' THEN (Select FirstName + ' ' + LastName From AccountEmployee where AccountEmployeeId = audit.oldvalue) " & _
                "WHEN FieldName = 'Submitted' THEN CASE WHEN Audit.OldValue <> '1' THEN 'No' WHEN Audit.OldValue = '1' THEN 'Yes' END " & _
                "WHEN FieldName = 'Approved' THEN CASE WHEN Audit.OldValue <> '1' THEN 'No' WHEN Audit.OldValue = '1' THEN 'Yes' END " & _
                "WHEN FieldName = 'Rejected' THEN CASE WHEN Audit.OldValue <> '1' THEN 'No' WHEN Audit.OldValue = '1' THEN 'Yes' END ELSE Audit.OldValue END AS OldValue, " & _
                "CASE WHEN FieldName = 'SubmittedBy' THEN (Select FirstName + ' ' + LastName From AccountEmployee where AccountEmployeeId = audit.newvalue) " & _
                "WHEN FieldName = 'ApprovedByEmployeeId' THEN (Select FirstName + ' ' + LastName From AccountEmployee where AccountEmployeeId = audit.newvalue) " & _
                "WHEN FieldName = 'RejectedByEmployeeId' THEN (Select FirstName + ' ' + LastName From AccountEmployee where AccountEmployeeId = audit.newvalue) " & _
                "WHEN FieldName = 'Submitted' THEN CASE WHEN Audit.NewValue <> '1' THEN 'No' WHEN Audit.NewValue = '1' THEN 'Yes' END WHEN FieldName = 'Approved' THEN " & _
                "CASE WHEN Audit.NewValue <> '1' THEN 'No' WHEN Audit.NewValue = '1' THEN 'Yes' END WHEN FieldName = 'Rejected' THEN CASE WHEN Audit.NewValue <> '1' THEN 'No' " & _
                "WHEN Audit.NewValue = '1' THEN 'Yes' END ELSE Audit.NewValue END AS NewValue, " & _
                "CASE WHEN FieldName = 'SubmittedBy' THEN 'Submitted By' WHEN FieldName = 'ApprovedByEmployeeId' THEN 'Approved By' WHEN FieldName = 'RejectedByEmployeeId' " & _
                "THEN 'Rejected By' ELSE Audit.FieldName END AS FieldName, " & _
                "dbo.Audit.UserName, dbo.Audit.UpdateDate, dbo.Audit.TableName, NULL as ProjectName, NULL as TaskName,  CONVERT(varchar, dbo.AccountEmployeeTimeEntryPeriod.TimeEntryStartDate, 106) " & _
                "+ ' - ' + CONVERT(varchar, dbo.AccountEmployeeTimeEntryPeriod.TimeEntryEndDate, 106) AS Date, NULL as TotalTime, dbo.AccountEmployee.FirstName + ' ' + dbo.AccountEmployee.LastName as UpdatedBy " & _
                "FROM dbo.Audit " & _
                "LEFT OUTER JOIN dbo.AccountEmployeeTimeEntryPeriod ON Convert(nvarchar(100), dbo.Audit.PK) = dbo.AccountEmployeeTimeEntryPeriod.AccountEmployeeTimeEntryPeriodId " & _
                "LEFT OUTER JOIN dbo.AccountEmployee ON dbo.Audit.UserName = dbo.AccountEmployee.AccountEmployeeId Where (dbo.Audit.TableName = N'AccountEmployeeTimeEntryPeriod') and "

                strsql = strsql & strsql1
            ElseIf drDataSourceMapping.ReportDataSourceName = "Expense Sheet Audit Trail" Then
                strsql = "SELECT dbo.Audit.Type, dbo.Audit.TableName, dbo.Audit.PK, dbo.Audit.FieldName AS AuditFieldName, dbo.Audit.OldValue AS AuditOldVal, dbo.Audit.NewValue AS AuditNewVal, " & _
                "dbo.Audit.UpdateDate, dbo.Audit.UserName,  " & _
                "CASE WHEN FieldName = 'AccountExpenseId' THEN (Select AccountExpenseName From AccountExpense where AccountExpenseId = Audit.OldValue) " & _
                "WHEN FieldName = 'AccountProjectId' THEN (Select ProjectName From AccountProject where AccountProjectId = Audit.OldValue) " & _
                "WHEN FieldName = 'AccountCurrencyId' THEN (Select CurrencyCode From vueAccountCurrency where AccountCurrencyId = Audit.OldValue) " & _
                "WHEN FieldName = 'AccountPaymentMethodId' THEN (Select PaymentMethod From AccountPaymentMethod where AccountPaymentMethodId = Audit.OldValue) " & _
                "WHEN FieldName = 'AccountTaxZoneId' THEN  (Select AccountTaxZone From AccountTaxZone where AccountTaxZoneId = Audit.OldValue) " & _
                "WHEN FieldName = 'IsBillable' THEN CASE WHEN Audit.OldValue = '1' THEN 'Yes' " & _
                "WHEN Audit.OldValue <> '1' THEN 'No' END WHEN FieldName = 'Reimburse' THEN CASE WHEN Audit.OldValue = '1' THEN 'Yes' WHEN Audit.OldValue <> '1' THEN 'No' " & _
                "END WHEN FieldName = 'Amount' THEN Audit.OldValue WHEN FieldName = 'AmountBeforeTax' THEN Audit.OldValue " & _
                "WHEN FieldName = 'TaxAmount' THEN Audit.OldValue WHEN FieldName = 'Quantity' THEN Audit.OldValue WHEN FieldName = 'Rate' THEN Audit.OldValue " & _
                "ELSE Audit.OldValue END AS OldValue, CASE WHEN FieldName = 'AccountExpenseId ' THEN " & _
                "(Select AccountExpenseName From AccountExpense where AccountExpenseId = Audit.NewValue) " & _
                "WHEN FieldName = 'AccountProjectId' THEN (Select ProjectName From AccountProject where AccountProjectId = Audit.NewValue) " & _
                "WHEN FieldName = 'AccountCurrencyId' THEN (Select CurrencyCode From vueAccountCurrency where AccountCurrencyId = Audit.NewValue) " & _
                "WHEN FieldName = 'AccountPaymentMethodId' THEN (Select PaymentMethod From AccountPaymentMethod where AccountPaymentMethodId = Audit.NewValue) " & _
                "WHEN FieldName = 'AccountTaxZoneId' THEN (Select AccountTaxZone From AccountTaxZone where AccountTaxZoneId = Audit.NewValue) " & _
                "WHEN FieldName = 'IsBillable' THEN CASE WHEN Audit.NewValue = '1' THEN 'Yes' " & _
                "WHEN Audit.NewValue <> '1' THEN 'No' END WHEN FieldName = 'Reimburse' THEN CASE WHEN Audit.NewValue = '1' THEN 'Yes' WHEN Audit.NewValue <> '1' THEN " & _
                "'No' END WHEN FieldName = 'Amount' THEN CONVERT(char(100), CONVERT(decimal(10, 2), Audit.NewValue)) " & _
                "WHEN FieldName = 'AmountBeforeTax' THEN CONVERT(char(100), CONVERT(decimal(10, 2), Audit.NewValue)) " & _
                "WHEN FieldName = 'TaxAmount' THEN CONVERT(char(100), CONVERT(decimal(10, 2), Audit.NewValue)) WHEN FieldName = 'Quantity' THEN CONVERT(char(100), " & _
                "CONVERT(decimal(10, 2), Audit.NewValue)) WHEN FieldName = 'Rate' THEN CONVERT(char(100), CONVERT(decimal(10, 2), Audit.NewValue)) " & _
                "ELSE Audit.NewValue END AS NewValue, " & _
                "CASE WHEN FieldName = 'AccountProjectId' THEN 'ProjectName' WHEN FieldName = 'AccountExpenseId' THEN 'ExpenseName' WHEN FieldName = 'AccountPaymentMethodId' " & _
                "THEN 'PaymentMethod' WHEN FieldName = 'AccountCurrencyId' THEN 'Currency' WHEN FieldName = 'AccountTaxZoneId' THEN 'TaxZone' ELSE Audit.FieldName END " & _
                "AS FieldName, dbo.AccountEmployee.FirstName + ' ' + dbo.AccountEmployee.LastName AS UpdatedBy, " & _
                "dbo.AccountExpenseEntry.AccountExpenseEntryDate AS Date, dbo.AccountExpenseEntry.AccountProjectId, " & _
                "dbo.AccountExpenseEntry.AccountExpenseId, dbo.AccountExpenseEntry.Amount, dbo.AccountProject.ProjectName, dbo.AccountExpense.AccountExpenseName, " & _
                "dbo.AccountPaymentMethod.PaymentMethod, dbo.AccountTaxZone.AccountTaxZone, dbo.vueAccountCurrency.CurrencyCode " & _
                "FROM dbo.Audit LEFT OUTER JOIN " & _
                "dbo.AccountExpenseEntry ON Convert(Int, dbo.Audit.PK) = dbo.AccountExpenseEntry.AccountExpenseEntryId LEFT OUTER JOIN " & _
                "dbo.AccountEmployee ON dbo.Audit.UserName = dbo.AccountEmployee.AccountEmployeeId LEFT OUTER JOIN dbo.AccountProject ON " & _
                "dbo.AccountExpenseEntry.AccountProjectId = dbo.AccountProject.AccountProjectId LEFT OUTER JOIN dbo.AccountExpense ON " & _
                "dbo.AccountExpenseEntry.AccountExpenseId = dbo.AccountExpense.AccountExpenseId LEFT OUTER JOIN dbo.AccountPaymentMethod ON " & _
                "dbo.AccountExpenseEntry.AccountPaymentMethodId = dbo.AccountPaymentMethod.AccountPaymentMethodId LEFT OUTER JOIN dbo.AccountTaxZone ON " & _
                "dbo.AccountExpenseEntry.AccountTaxZoneId = dbo.AccountTaxZone.AccountTaxZoneId LEFT OUTER JOIN dbo.vueAccountCurrency ON " & _
                "dbo.AccountExpenseEntry.AccountCurrencyId = dbo.vueAccountCurrency.AccountCurrencyId " & _
                "WHERE (dbo.Audit.TableName = 'AccountExpenseEntry') AND (dbo.Audit.Type = 'U') AND (dbo.Audit.FieldName IN ('AccountExpenseEntryDate', 'AccountProjectId', " & _
                "'AccountExpenseId', 'Description', 'Amount', 'IsBillable', 'Quantity', 'Rate', 'AmountBeforeTax', 'TaxAmount', 'Reimburse', 'AccountCurrencyId', " & _
                "'AccountPaymentMethodId', 'AccountTaxZoneId')) and " & strsql1 & _
                "UNION ALL " & _
                "SELECT dbo.Audit.Type, dbo.Audit.TableName, dbo.Audit.PK, dbo.Audit.FieldName AS AuditFieldName, dbo.Audit.OldValue AS AuditOldVal, dbo.Audit.NewValue AS AuditNewVal, " & _
                "dbo.Audit.UpdateDate, dbo.Audit.UserName, " & _
                "CASE WHEN FieldName = 'ApprovedByEmployeeId' THEN AccountEmployeeOld.FirstName + ' ' + AccountEmployeeOld.LastName " & _
                "WHEN FieldName = 'RejectedByEmployeeId' THEN AccountEmployeeOld.FirstName + ' ' + AccountEmployeeOld.LastName WHEN FieldName = 'Approved' THEN " & _
                "CASE WHEN Audit.OldValue = '1' THEN 'Yes' WHEN " & _
                "Audit.OldValue <> '1' THEN 'No' END WHEN FieldName = 'Submitted' THEN CASE WHEN Audit.OldValue = '1' THEN 'Yes' WHEN Audit.OldValue <> '1' THEN 'No' END WHEN " & _
                "FieldName = 'Rejected' THEN CASE WHEN Audit.OldValue = '1' THEN 'Yes' WHEN Audit.OldValue <> '1' THEN 'No' END ELSE Audit.OldValue END AS OldValue, " & _
                "CASE WHEN FieldName = 'ApprovedByEmployeeId' THEN AccountEmployeeNew.FirstName + ' ' + AccountEmployeeNew.LastName WHEN FieldName = 'RejectedByEmployeeId' " & _
                "THEN AccountEmployeeNew.FirstName + ' ' + AccountEmployeeNew.LastName WHEN FieldName = 'SubmittedDate' THEN CONVERT(nvarchar(16), Audit.NewValue, 112) " & _
                "WHEN FieldName = 'Approved' THEN CASE WHEN Audit.NewValue = '1' THEN 'Yes' WHEN Audit.NewValue <> '1' THEN 'No' END WHEN FieldName = 'Submitted' THEN " & _
                "CASE WHEN Audit.NewValue = '1' THEN 'Yes' WHEN Audit.NewValue <> '1' THEN 'No' END WHEN FieldName = 'Rejected' THEN CASE WHEN Audit.NewValue = '1' THEN " & _
                "'Yes' WHEN Audit.NewValue <> '1' THEN 'No' END ELSE Audit.NewValue END AS NewValue, " & _
                "CASE WHEN FieldName = 'ApprovedByEmployeeId' THEN 'ApprovedBy' WHEN FieldName = 'RejectedByEmployeeId' THEN 'RejectedBy' ELSE Audit.FieldName END AS " & _
                "FieldName, dbo.AccountEmployee.FirstName + ' ' + dbo.AccountEmployee.LastName AS UpdatedBy, " & _
                "dbo.AccountEmployeeExpenseSheet.ExpenseSheetDate AS Date, NULL AS AccountProjectId, NULL " & _
                "AS AccountExpenseId, NULL AS Amount, NULL as ProjectName, NULL as AccountExpenseName, NULL as PaymentMethod, NULL as AccountTaxZone, NULL as CurrencyCode " & _
                "FROM dbo.Audit LEFT OUTER JOIN " & _
                "dbo.AccountEmployeeExpenseSheet ON Convert(nvarchar(100), dbo.Audit.PK) = dbo.AccountEmployeeExpenseSheet.AccountEmployeeExpenseSheetId LEFT OUTER JOIN " & _
                "dbo.AccountEmployee AS AccountEmployeeOld ON dbo.Audit.OldValue = CONVERT(varchar, AccountEmployeeOld.AccountEmployeeId) LEFT OUTER JOIN " & _
                "dbo.AccountEmployee AS AccountEmployeeNew ON dbo.Audit.NewValue = CONVERT(varchar, AccountEmployeeNew.AccountEmployeeId) LEFT OUTER JOIN " & _
                "dbo.AccountEmployee ON dbo.Audit.UserName = dbo.AccountEmployee.AccountEmployeeId " & _
                "WHERE (dbo.Audit.TableName = 'AccountEmployeeExpenseSheet') AND (dbo.Audit.Type = 'U') AND (dbo.Audit.FieldName IN (N'ExpenseSheetDate', N'Description', 'Submitted', " & _
                "'Approved', 'Rejected', 'SubmittedDate', 'ApprovedOn', 'ApprovedByEmployeeId', 'RejectedByEmployeeId', 'RejectedOn')) and "

                strsql = strsql & strsql1
            Else
                strsql = "Select * from " & drDataSourceMapping.ReportDatasource & IIf(WhereClause <> "", " Where ", "") & WhereClause
            End If
            If GetDefaultReportDataSourceSort(drDataSourceMapping.ReportDataSourceName) <> "" Then
                strsql = strsql & " Order By " & GetDefaultReportDataSourceSort(drDataSourceMapping.ReportDataSourceName)
            End If
            objConnection = New SqlClient.SqlConnection(DBUtilities.GetConnectionString)
            Dim cmd As New SqlClient.SqlCommand(strsql, objConnection)
            sqladap.SelectCommand = cmd
            sqladap.SelectCommand.CommandTimeout = 9000000
            Dim dt As New DataTable
            sqladap.Fill(dt)
            Return dt
        End If
    End Function
    Public Shared Function GetDefaultReportDataSourceSort(ByVal ReportDataSourceName As String) As String
        If ReportDataSourceName = "Time Entry" Or ReportDataSourceName = "Employee Time Off Detail" Then
            Return "TimeEntryDate"
        ElseIf ReportDataSourceName = "Expense Entry" Then
            Return "AccountExpenseEntryDate"
        ElseIf ReportDataSourceName = "Attendance" Then
            Return "AttendanceDate"
        ElseIf ReportDataSourceName = "Expense Sheet" Then
            Return "ExpenseSheetDate"
        ElseIf ReportDataSourceName = "Time Entry Period" Then
            Return "TimeEntryStartDate"
        ElseIf ReportDataSourceName = "Timesheet Audit Trail" Or ReportDataSourceName = "Expense Sheet Audit Trail" Then
            Return "UpdateDate desc"
        End If
        Return ""
    End Function
    Public Shared Function GetSystemReportDataSourceIdByAccountReportId(ByVal AccountReportId As Guid) As String
        Dim BLL As New LiveReportData
        Dim dtDataSourceMapping As dsReportDesign.vueAccountReportDataSourceMappingDataTable = BLL.GetvueAccountReportDataSourceMappingsByAccountReportId(AccountReportId)
        Dim drDataSourceMapping As dsReportDesign.vueAccountReportDataSourceMappingRow
        If dtDataSourceMapping.Rows.Count > 0 Then
            drDataSourceMapping = dtDataSourceMapping.Rows(0)
            Return drDataSourceMapping.SystemReportDataSourceId.ToString
        End If
    End Function
End Class
