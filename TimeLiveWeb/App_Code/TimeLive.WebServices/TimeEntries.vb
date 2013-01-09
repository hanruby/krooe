Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class TimeEntries
    Inherits System.Web.Services.WebService
    Dim EmployeeTimesheetPeriodType As String
    Dim EmployeeWeekStartDay As Integer
    Dim EmployeeInitialDayOfFirstPeriod As Integer
    Dim EmployeeInitialDayOfLastPeriod As Integer
    Dim EmployeeInitialDayOfTheMonth As Integer
    Dim AccountEmployeeTimeEntryPeriodIdTS As Guid
    Dim TimesheetPeriodTypeTS As String
    Dim PeriodStartDateTS As Date
    Dim PeriodEndDateTS As Date
    Public SoapHeader As SecuredWebServiceHeader
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function AddTimeEntry(ByVal objTimeEntry As TimeEntry) As String
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Return "Please call AuthenitcateUser() first."
        End If
        Return "Hello World"
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function GetAllTimeEntriesByDateRange(ByVal StartDate As Date, ByVal EndDate As Date) As ArrayList
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim TimeEntryArrayList As New ArrayList
        Dim objTimeEntry As New TimeEntry
        Dim TimeEntryBLL As New AccountEmployeeTimeEntryBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountID
        Dim dtTimeEntry As AccountEmployeeTimeEntry.vueAccountEmployeeTimeEntryForQBDataTable = TimeEntryBLL.GetTimeEntriesByAccountIdAndDateRange(AccountId, StartDate, EndDate)
        Dim drTimeEntry As AccountEmployeeTimeEntry.vueAccountEmployeeTimeEntryForQBRow
        For Each drTimeEntry In dtTimeEntry.Rows
            objTimeEntry = New TimeEntry
            With objTimeEntry
                .EmployeeName = drTimeEntry.EmployeeName
                If IsDBNull(drTimeEntry.Item("IsBillable")) Then
                    .IsBillable = False
                Else
                    .IsBillable = drTimeEntry.IsBillable
                End If
                .ProjectName = drTimeEntry.ProjectName
                .TaskName = drTimeEntry.TaskName
                .TotalTime = drTimeEntry.TotalTime
                .TimeEntryDate = drTimeEntry.TimeEntryDate
                .ClientName = drTimeEntry.PartyName                
                .Milestone = drTimeEntry.MilestoneDescription
                .EmployeeDepartment = drTimeEntry.DepartmentName
                .EmployeeType = drTimeEntry.AccountEmployeeType
                .WorkType = drTimeEntry.AccountWorkType
                If IsDBNull(drTimeEntry.Item("AccountCostCenter")) Then
                    .CostCenter = "Default Cost Center"
                Else
                    .CostCenter = drTimeEntry.AccountCostCenter
                End If
                .TaskWithParent = New AccountProjectTaskBLL().GetTaskNameForWSByAccountProjectTaskId(drTimeEntry.AccountProjectId, drTimeEntry.AccountProjectTaskId)
            End With
            TimeEntryArrayList.Add(objTimeEntry)
        Next
        Return TimeEntryArrayList
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function GetTimeEntriesByEmployeeIdAndDateRange(ByVal AccountEmployeeId As Integer, ByVal StartDate As Date, ByVal EndDate As Date) As ArrayList
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim TimeEntryArrayList As New ArrayList
        Dim objTimeEntry As New TimeEntry
        Dim TimeEntryBLL As New AccountEmployeeTimeEntryBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountID
        Dim dtTimeEntry As AccountEmployeeTimeEntry.vueAccountEmployeeTimeEntryForQBDataTable = TimeEntryBLL.GetTimeEntriesByAccountEmployeeIdAndDateRange(AccountId, AccountEmployeeId, StartDate, EndDate)
        Dim drTimeEntry As AccountEmployeeTimeEntry.vueAccountEmployeeTimeEntryForQBRow
        For Each drTimeEntry In dtTimeEntry.Rows
            objTimeEntry = New TimeEntry
            With objTimeEntry
                .EmployeeName = drTimeEntry.EmployeeName
                If IsDBNull(drTimeEntry.Item("IsBillable")) Then
                    .IsBillable = False
                Else
                    .IsBillable = drTimeEntry.IsBillable
                End If
                .ProjectName = drTimeEntry.ProjectName
                .TaskName = drTimeEntry.TaskName
                .TotalTime = drTimeEntry.TotalTime
                .TimeEntryDate = drTimeEntry.TimeEntryDate
                .ClientName = drTimeEntry.PartyName
                .Milestone = drTimeEntry.MilestoneDescription
                .EmployeeDepartment = drTimeEntry.DepartmentName
                .EmployeeType = drTimeEntry.AccountEmployeeType
                .WorkType = drTimeEntry.AccountWorkType
                If IsDBNull(drTimeEntry.Item("AccountCostCenter")) Then
                    .CostCenter = "Default Cost Center"
                Else
                    .CostCenter = drTimeEntry.AccountCostCenter
                End If
                .TaskWithParent = New AccountProjectTaskBLL().GetTaskNameForWSByAccountProjectTaskId(drTimeEntry.AccountProjectId, drTimeEntry.AccountProjectTaskId)
            End With
            TimeEntryArrayList.Add(objTimeEntry)
        Next
        Return TimeEntryArrayList
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function GetTimesheetApprovalTypeId() As Integer
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim objTimesheetApprovalType As New AccountApprovalBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountID
        Dim nTimesheetApprovalTypeId As Integer = objTimesheetApprovalType.GetAccountApprovalTypesByAccountIdForTimeSheetApproval(AccountId).Rows(0).Item(0)
        Return nTimesheetApprovalTypeId
    End Function
    Public Function GetTimesheetPeriodId(ByVal AccountEmployeeId As Integer, ByVal TimeEntryDate As Date, ByVal TimeEntryBLL As AccountEmployeeTimeEntryBLL) As Guid
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim EmployeeBLL As New AccountEmployeeBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountID
        Dim dtEmployee As AccountEmployee.vueAccountEmployeeDataTable = EmployeeBLL.GetViewAccountEmployeesByAccountEmployeeId(AccountEmployeeId)
        Dim drEmployee As AccountEmployee.vueAccountEmployeeRow = dtEmployee.Rows(0)
        EmployeeTimesheetPeriodType = IIf(Not IsDBNull(drEmployee.Item("SystemTimesheetPeriodType")), drEmployee.Item("SystemTimesheetPeriodType"), "Weekly")
        EmployeeWeekStartDay = IIf(Not IsDBNull(drEmployee.Item("EmployeeWeekStartDay")), drEmployee.Item("EmployeeWeekStartDay"), 1)
        EmployeeInitialDayOfFirstPeriod = drEmployee.SystemInitialDayOfFirstPeriod
        EmployeeInitialDayOfLastPeriod = drEmployee.SystemInitialDayOfLastPeriod
        EmployeeInitialDayOfTheMonth = drEmployee.InitialDayOfTheMonth
        Dim dtPeriodStartDate As Date = GetPeriodStartDateByTimesheetPeriodType(TimeEntryDate, EmployeeTimesheetPeriodType, EmployeeWeekStartDay, EmployeeInitialDayOfFirstPeriod, EmployeeInitialDayOfLastPeriod, EmployeeInitialDayOfTheMonth)
        Dim dtPeriodEndDate As Date = GetPeriodEndDateByTimesheetPeriodType(TimeEntryDate, EmployeeTimesheetPeriodType, EmployeeWeekStartDay, EmployeeInitialDayOfFirstPeriod, EmployeeInitialDayOfLastPeriod, EmployeeInitialDayOfTheMonth)
        Dim TimesheetPeriodType As String = New AccountEmployeeTimeEntryBLL().CheckAndGetTimesheetPeriodType(AccountEmployeeId, dtPeriodStartDate, dtPeriodEndDate, EmployeeTimesheetPeriodType)
        If TimesheetPeriodType <> DBUtilities.GetEmployeeTimesheetPeriodType Then
            dtPeriodStartDate = GetPeriodStartDateByTimesheetPeriodType(TimeEntryDate, TimesheetPeriodType, EmployeeWeekStartDay, EmployeeInitialDayOfFirstPeriod, EmployeeInitialDayOfLastPeriod, EmployeeInitialDayOfTheMonth)
            dtPeriodEndDate = GetPeriodEndDateByTimesheetPeriodType(TimeEntryDate, TimesheetPeriodType, EmployeeWeekStartDay, EmployeeInitialDayOfFirstPeriod, EmployeeInitialDayOfLastPeriod, EmployeeInitialDayOfTheMonth)
        End If
        Return TimeEntryBLL.GetTimeEntryPeriodIdForTimeEntry(AccountId, AccountEmployeeId, dtPeriodStartDate, dtPeriodEndDate, TimesheetPeriodType, False, False, False, False)
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Sub InsertTimeEntry(ByVal AccountEmployeeId As System.Nullable(Of Integer), _
                    ByVal TimeEntryDate As DateTime, _
                    ByVal AccountProjectId As Integer, _
                    ByVal AccountProjectTaskId As Integer, _
                    ByVal TotalTime As Double, _
                    ByVal Description As String, _
                    ByVal Submitted As Boolean)
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim TimeEntryBLL As New AccountEmployeeTimeEntryBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountId
        TimeEntryBLL.AddAccountEmployeeTimeEntryFromAPI(AccountId, AccountEmployeeId, TimeEntryDate, AccountProjectId, AccountProjectTaskId, TotalTime, Description, Submitted)
    End Sub
End Class
