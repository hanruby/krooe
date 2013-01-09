Imports Microsoft.VisualBasic

Public Class TimeEntry
    Public EmployeeName As String = ""
    Public ClientName As String = ""
    Public ProjectName As String = ""
    Public TaskName As String = ""
    Public TotalTime As System.DateTime = DateTime.Now
    Public IsBillable As Boolean
    Public TimeEntryDate As Date
    Public Milestone As String = ""
    Public EmployeeDepartment As String = ""
    Public EmployeeType As String = ""
    Public WorkType As String = ""
    Public CostCenter As String = ""
    Public TaskWithParent As String = ""
End Class
