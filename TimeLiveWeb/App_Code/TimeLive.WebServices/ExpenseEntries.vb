Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class ExpenseEntries
    Inherits System.Web.Services.WebService
    Public SoapHeader As SecuredWebServiceHeader
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function AddExpenseEntry(ByVal objExpenseEntry As ExpenseEntry) As String
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Return "Please call AuthenitcateUser() first."
        End If
        Return "Hello World"
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function GetAllExpenseEntriesByDateRange(ByVal StartDate As Date, ByVal EndDate As Date) As ArrayList
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim ExpenseEntryList As New ArrayList
        Dim objExpenseEntry As New ExpenseEntry
        Dim ExpenseEntryBLL As New AccountExpenseEntryBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountID
        Dim dtExpenseEntry As AccountExpenseEntry.vueAccountExpenseEntryForQBDataTable = ExpenseEntryBLL.GetExpenseEntriesByDateRange(AccountId, StartDate, EndDate)
        Dim drExpenseEntry As AccountExpenseEntry.vueAccountExpenseEntryForQBRow
        For Each drExpenseEntry In dtExpenseEntry.Rows
            objExpenseEntry = New ExpenseEntry
            With objExpenseEntry
                .ClientWithProject = drExpenseEntry.CustomerJob
                .EmployeeName = drExpenseEntry.EmployeeName
                .ExpenseEntryDate = drExpenseEntry.AccountExpenseEntryDate
                .Amount = drExpenseEntry.Amount
                .ExpenseName = drExpenseEntry.AccountExpenseName
                .ExpenseType = drExpenseEntry.ExpenseType
            End With
            ExpenseEntryList.Add(objExpenseEntry)
        Next
        Return ExpenseEntryList
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function GetExpenseEntriesByEmployeeIdAndDateRange(ByVal AccountEmployeeId As Integer, ByVal StartDate As Date, ByVal EndDate As Date) As ArrayList
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim ExpenseEntryList As New ArrayList
        Dim objExpenseEntry As New ExpenseEntry
        Dim ExpenseEntryBLL As New AccountExpenseEntryBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountID
        Dim dtExpenseEntry As AccountExpenseEntry.vueAccountExpenseEntryForQBDataTable = ExpenseEntryBLL.GetExpenseEntriesByEmployeeIdAndDateRange(AccountId, AccountEmployeeId, StartDate, EndDate)
        Dim drExpenseEntry As AccountExpenseEntry.vueAccountExpenseEntryForQBRow
        For Each drExpenseEntry In dtExpenseEntry.Rows
            objExpenseEntry = New ExpenseEntry
            With objExpenseEntry
                .ClientWithProject = drExpenseEntry.CustomerJob
                .EmployeeName = drExpenseEntry.EmployeeName
                .ExpenseEntryDate = drExpenseEntry.AccountExpenseEntryDate
                .Amount = drExpenseEntry.Amount
                .ExpenseName = drExpenseEntry.AccountExpenseName
                .ExpenseType = drExpenseEntry.ExpenseType
            End With
            ExpenseEntryList.Add(objExpenseEntry)
        Next
        Return ExpenseEntryList
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function AddExpenseName(ByVal objExpenseName As ExpenseName) As String
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Return "Please call AuthenitcateUser() first."
        End If
        Return "Hello World"
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function GetExpenseNames() As ArrayList
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim ExpenseNameList As New ArrayList
        Dim objExpenseName As New ExpenseName
        Dim ExpenseNameBLL As New AccountExpenseBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountID
        Dim dtExpenseName As TimeLiveDataSet.AccountExpenseDataTable = ExpenseNameBLL.GetAccountExpensesByAccountIdAndIsDisabled(AccountId, 0)
        Dim drExpenseName As TimeLiveDataSet.AccountExpenseRow
        For Each drExpenseName In dtExpenseName.Rows
            objExpenseName = New ExpenseName
            With objExpenseName
                .ExpenseName = drExpenseName.AccountExpenseName
            End With
            ExpenseNameList.Add(objExpenseName)
        Next
        Return ExpenseNameList
    End Function
    <WebMethod()> _
    <System.Web.Services.Protocols.SoapHeader("SoapHeader")> _
    Public Function GetExpenseApprovalTypeId() As Integer
        If Not TimeLiveServices.IsUserValid(SoapHeader) Then
            Throw New Exception("You are not authorized to access this.")
        End If
        Dim objExpenseApprovalType As New AccountApprovalBLL
        Dim AccountId As Integer = TimeLiveServices.GetSecurityToken(SoapHeader.AuthenticatedToken).AccountID
        Dim nExpenseApprovalTypeId As Integer = objExpenseApprovalType.GetAccountApprovalTypesByAccountIdForTimeSheetApproval(AccountId).Rows(0).Item(0)
        Return nExpenseApprovalTypeId
    End Function
End Class
