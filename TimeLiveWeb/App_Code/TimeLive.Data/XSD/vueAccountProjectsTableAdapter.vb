Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Namespace TimeLiveDataSetTableAdapters
    Public Class vueAccountProjectsTableAdapter
        Public Function GetvueAccountProjectsForReport(ByVal WhereClause As String) As TimeLiveDataSet.vueAccountProjectsDataTable
            Dim sql As String

            Me.Adapter.SelectCommand = New SqlCommand("", Me.Connection)

            sql = "Select * from vueAccountProjects " & WhereClause

            Me.Adapter.SelectCommand.CommandText = sql

            Dim dataTable As TimeLiveDataSet.vueAccountProjectsDataTable = New TimeLiveDataSet.vueAccountProjectsDataTable
            Me.Adapter.Fill(dataTable)
            Return dataTable

        End Function
        Public Function GetAssignedDataByEmployeeIdProjectIdAndCompleted(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal Completed As Boolean, Optional ByVal IsTemplate As Boolean = False, Optional ByVal AccountId As Integer = -1, Optional ByVal IsFromCSV As Boolean = False, Optional ByVal ProjectName As String = "") As TimeLiveDataSet.vueAccountProjectsDataTable
            Dim sql As String
            Me.Adapter.SelectCommand = New SqlCommand("", Me.Connection)

            sql = "Select * from vueAccountProjects "
            sql = sql & "WHERE "
            If AccountId <> -1 Then
                sql = sql & "(AccountId = " & AccountId & ") And "
            End If
            sql = sql & "(IsTemplate = 0) AND "
            If Completed <> True Then
                sql = sql & "(Completed = 0) And "
            End If
            sql = sql & "(AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId = " & AccountEmployeeId & "))) AND "
            sql = sql & "(IsDeleted <> 1 OR IsDeleted Is NULL) AND (IsDeletedClient <> 1 OR IsDeletedClient IS NULL) AND (IsDisabled <> 1) "
            If IsFromCSV Then
                sql = sql & " And (ProjectName = '" & ProjectName & "') "
            End If
            sql = sql & " OR (AccountProjectId = " & AccountProjectId & ") "
            sql = sql & "ORDER BY ProjectName"

            Me.Adapter.SelectCommand.CommandText = sql

            Dim dataTable As TimeLiveDataSet.vueAccountProjectsDataTable = New TimeLiveDataSet.vueAccountProjectsDataTable
            Me.Adapter.Fill(dataTable)
            Return dataTable
        End Function
        Public Function GetAssignedDataByEmployeeIdClientIdAndCompleted(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal AccountClientId As Integer, ByVal Completed As Boolean, Optional ByVal AccountId As Integer = -1) As TimeLiveDataSet.vueAccountProjectsDataTable
            Dim sql As String
            Me.Adapter.SelectCommand = New SqlCommand("", Me.Connection)

            sql = "Select * from vueAccountProjects "
            sql = sql & "WHERE "
            If AccountId <> -1 Then
                sql = sql & "(AccountId = " & AccountId & ") And "
            End If
            sql = sql & "(AccountClientId = " & AccountClientId & ") AND (IsTemplate = 0) AND "
            If Completed <> True Then
                sql = sql & "(Completed = 0) And "
            End If
            sql = sql & "(AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId = " & AccountEmployeeId & "))) AND "
            sql = sql & "(IsDeleted <> 1 OR IsDeleted Is NULL) AND (IsDisabled <> 1) OR (AccountProjectId = " & AccountProjectId & ") "
            sql = sql & "ORDER BY ProjectName"

            Me.Adapter.SelectCommand.CommandText = sql

            Dim dataTable As TimeLiveDataSet.vueAccountProjectsDataTable = New TimeLiveDataSet.vueAccountProjectsDataTable
            Me.Adapter.Fill(dataTable)
            Return dataTable
        End Function
    End Class

End Namespace
