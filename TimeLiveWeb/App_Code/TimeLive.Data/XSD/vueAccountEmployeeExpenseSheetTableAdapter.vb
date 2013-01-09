Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System
Namespace AccountExpenseEntryTableAdapters
    Public Class vueAccountEmployeeExpenseSheetTableAdapter

        Public Function GetDataByAccountIdAndEmployeesForExpenseEntryArchive(ByVal AccountId As Integer, ByVal AccountEmployeeId As String, ByVal IncludeDateRange As Boolean, ByVal AccountExpenseEntryStartDate As DateTime, ByVal AccountExpenseEntryEndDate As DateTime, ByVal Approval As String) As AccountExpenseEntry.vueAccountEmployeeExpenseSheetDataTable

            Dim sql As String

            Me.Adapter.SelectCommand = New SqlCommand("", Me.Connection)

            sql = "Select * from vueAccountEmployeeExpenseSheet where "

            sql = sql + " (AccountId = @AccountId) and "
            Me.Adapter.SelectCommand.Parameters.Add("@AccountId", SqlDbType.Int)
            Me.Adapter.SelectCommand.Parameters("@AccountId").Value = AccountId


            If AccountEmployeeId <> 0 Then
                sql = sql + "AccountEmployeeId = @AccountEmployeeId and "

                Me.Adapter.SelectCommand.Parameters.Add("@AccountEmployeeId", SqlDbType.Int)
                Me.Adapter.SelectCommand.Parameters("@AccountEmployeeId").Value = AccountEmployeeId
            End If

            sql = sql + "("

            If IncludeDateRange = True Then
                sql = sql + "(ExpenseSheetDate >= @AccountExpenseEntryStartDate and ExpenseSheetDate <= @AccountExpenseEntryEndDate) and "

                Me.Adapter.SelectCommand.Parameters.Add("@AccountExpenseEntryStartDate", SqlDbType.DateTime)
                Me.Adapter.SelectCommand.Parameters("@AccountExpenseEntryStartDate").Value = AccountExpenseEntryStartDate

                Me.Adapter.SelectCommand.Parameters.Add("@AccountExpenseEntryEndDate", SqlDbType.DateTime)
                Me.Adapter.SelectCommand.Parameters("@AccountExpenseEntryEndDate").Value = AccountExpenseEntryEndDate
            End If

            If Approval = -1 Then
                sql = sql + "(Approved = Approved) "
            ElseIf Approval = 0 Then
                sql = sql + "(Approved <> 1) "
            ElseIf Approval = 1 Then
                sql = sql + "(Approved = 1) "
            End If

            Me.Adapter.SelectCommand.Parameters.Add("@Approval", SqlDbType.VarChar)
            Me.Adapter.SelectCommand.Parameters("@Approval").Value = Approval

            sql = sql + ")"

            Me.Adapter.SelectCommand.CommandText = sql

            Dim dataTable As AccountExpenseEntry.vueAccountEmployeeExpenseSheetDataTable = New AccountExpenseEntry.vueAccountEmployeeExpenseSheetDataTable
            Me.Adapter.Fill(dataTable)
            Return dataTable

        End Function
        Public Function GetDataByAccountEmployeeIdAndApprovalStatus(ByVal AccountEmployeeId As Integer, ByVal ExpenseSheetStatudId As Integer, ByVal IncludeDateRange As Boolean, ByVal StartDate As Date, ByVal EndDate As Date) As AccountExpenseEntry.vueAccountEmployeeExpenseSheetDataTable
            Dim sql As String
            Me.Adapter.SelectCommand = New SqlCommand("", Me.Connection)
            ' Dim ExpenseStartDate As String = LocaleUtilitiesBLL.ConvertCurrentDateStringToDate(StartDate).ToString(LocaleUtilitiesBLL.GetBaseCultureInfo.DateTimeFormat.ShortDatePattern)
            'Dim ExpenseEntryDate As String = LocaleUtilitiesBLL.ConvertCurrentDateStringToDate(EndDate).ToString(LocaleUtilitiesBLL.GetBaseCultureInfo.DateTimeFormat.ShortDatePattern)
            sql = "Select * from vueAccountEmployeeExpenseSheet where (AccountEmployeeId = " & AccountEmployeeId & ") "
            If IncludeDateRange Then
                sql = sql + " and (ExpenseSheetDate >= " & LocaleUtilitiesBLL.ConvertDateBaseIntoSQLQurey(StartDate) & " and ExpenseSheetDate <= " & LocaleUtilitiesBLL.ConvertDateBaseIntoSQLQurey(EndDate) & ")"
            End If
            If ExpenseSheetStatudId = 1 Then
                sql = sql + "and ((approved = 0 and rejected = 0) or (AccountEmployeeId = " & AccountEmployeeId & " and rejected = 1))"
            ElseIf ExpenseSheetStatudId = 2 Then
                sql = sql + "and (submitted = 0 and approved = 0 and rejected = 0)"
            ElseIf ExpenseSheetStatudId = 3 Then
                sql = sql + "and (submitted = 1 and approved = 0 and rejected = 0)"
            ElseIf ExpenseSheetStatudId = 4 Then
                sql = sql + "and (approved = 1 and rejected = 0 and submitted = 1)"
            ElseIf ExpenseSheetStatudId = 5 Then
                sql = sql + "and (rejected = 1 and approved = 0 and submitted = 0)"
            End If
           
            sql = sql + " Order By ExpenseSheetDate"
            Me.Adapter.SelectCommand.CommandText = sql
            Dim dataTable As AccountExpenseEntry.vueAccountEmployeeExpenseSheetDataTable = New AccountExpenseEntry.vueAccountEmployeeExpenseSheetDataTable
            Me.Adapter.Fill(dataTable)
            Return dataTable
        End Function
    End Class
End Namespace
