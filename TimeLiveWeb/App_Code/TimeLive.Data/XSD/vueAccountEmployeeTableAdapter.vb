Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Namespace AccountEmployeeTableAdapters
    Partial Public Class vueAccountEmployeeTableAdapter
        Public Function GetvueAccountEmployeeForReport(ByVal WhereClause As String, Optional ByVal OrderColumnName As String = "") As AccountEmployee.vueAccountEmployeeDataTable
            Dim sql As String

            Me.Adapter.SelectCommand = New SqlCommand("", Me.Connection)

            sql = "Select *,CASE WHEN IsDisabled = 1 THEN EmployeeNameWithCode + ' (Disabled)' ELSE EmployeeNameWithCode END AS EmployeeNameWithCodeWithDisabled from vueAccountEmployee WITH (NOLOCK) " & WhereClause

            If OrderColumnName <> "" Then
                sql = sql & " Order By " & OrderColumnName
            End If

            Me.Adapter.SelectCommand.CommandText = sql

            Dim dataTable As AccountEmployee.vueAccountEmployeeDataTable = New AccountEmployee.vueAccountEmployeeDataTable
            Me.Adapter.Fill(dataTable)
            Return dataTable

        End Function

    End Class
End Namespace
