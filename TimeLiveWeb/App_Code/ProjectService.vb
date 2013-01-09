Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections
Imports System.Collections.Specialized

<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
<System.Web.Script.Services.ScriptService()> _
Public Class ProjectService
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hello World"
    End Function

    <WebMethod()> _
    Public Function GetAccountProjectTasks(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim CategoryValue() As String = Split(category, ",")


        Dim objRow As TimeLiveDataSet.AccountProjectTaskTimesheetRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.AccountProjectTaskTimesheetDataTable

        objTable = objAccountProjectTaskBLL.GetAssignedProjectTasksFromvueAccountProjectTask(Value, CategoryValue(0), IIf(CategoryValue(2) = "", Nothing, CategoryValue(2)), CategoryValue(3), CBool(CategoryValue(1)))

        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.TaskName, objRow.AccountProjectTaskId))
        Next

        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> _
    Public Function GetAccountProjectsByClient(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()
        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim CategoryValue() As String = Split(category, ",")

        Dim objRow As TimeLiveDataSet.vueAccountProjectsRow
        Dim objAccountProjectBLL As New AccountProjectBLL
        Dim objTable As TimeLiveDataSet.vueAccountProjectsDataTable

        'If CategoryValue(4) <> Value Then
        '    CategoryValue(1) = ""
        'End If

        Dim SessionAccountId As Integer = CategoryValue(3)

        If CBool(CategoryValue(2)) = True Then
            objTable = objAccountProjectBLL.GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects(IIf(CategoryValue(1) = "", Nothing, CategoryValue(1)), CategoryValue(0), Value, CategoryValue(5), SessionAccountId)
        Else
            objTable = objAccountProjectBLL.GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient(IIf(CategoryValue(1) = "", Nothing, CategoryValue(1)), CategoryValue(0), CategoryValue(5), False, SessionAccountId)
        End If

        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.ProjectName, objRow.AccountProjectId))
        Next

        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray
    End Function

    <WebMethod()> _
    Public Function GetAccountProjectTasksForReport(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)
        Dim CategoryValue() As String = Split(category, ",")



        Dim objRow As TimeLiveDataSet.vueAccountProjectTaskRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.vueAccountProjectTaskDataTable


        objTable = objAccountProjectTaskBLL.GetAssignedAccountProjectTasksByAccountProjectIdForReports(Value, CategoryValue(0), IIf(CategoryValue(1) = "", Nothing, CategoryValue(1)))


        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.TaskName, objRow.AccountProjectTaskId))
        Next


        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> _
    Public Function GetAccountProjectTasksByAccountProjectIdForReport(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)
        Dim CategoryValue() As String = Split(category, ",")



        Dim objRow As TimeLiveDataSet.vueAccountProjectTaskRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.vueAccountProjectTaskDataTable


        objTable = objAccountProjectTaskBLL.GetAssignedAccountProjectTasksByAccountProjectIdAndAccountIdForReports(Value, CategoryValue(0))


        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.TaskName, objRow.AccountProjectTaskId))
        Next


        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> Public Function GetAccountProjectMileStones(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)


        If Value <> "0" Then


            Dim objRow As TimeLiveDataSet.AccountProjectMilestoneRow
            Dim objAccountProjectMilestoneBLL As New AccountProjectMilestoneBLL

            Dim objTable As TimeLiveDataSet.AccountProjectMilestoneDataTable

            objTable = objAccountProjectMilestoneBLL.GetAccountProjectMilestonesByAccountProjectId(Value, True)


            For Each objRow In objTable.Rows
                values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.MilestoneDescription, objRow.AccountProjectMilestoneId))
            Next

        End If

        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray


    End Function

    <WebMethod()> _
Public Function GetParentAccountProjectTasks(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim CategoryValue() As String = Split(category, ",")

        Dim objRow As TimeLiveDataSet.AccountProjectTaskRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.AccountProjectTaskDataTable

        objTable = objAccountProjectTaskBLL.GetParentAccountProjectTasksByAccountProjectId(Value, CategoryValue(0))
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.TaskName, objRow.AccountProjectTaskId))
        Next

        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> _
    Public Function GetAccountProjectTasksInTimeSheet(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim Id() As String = Split(Value, ":")
        Dim AccountProjectId As Integer

        Dim CategoryValue() As String = Split(category, ",")
        AccountProjectId = Id(1)

        Dim objRow As TimeLiveDataSet.AccountProjectTaskTimesheetRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.AccountProjectTaskTimesheetDataTable
        If CategoryValue(4) <> AccountProjectId Then
            CategoryValue(2) = ""
        End If
        objTable = objAccountProjectTaskBLL.GetAssignedProjectTasksFromvueAccountProjectTask(AccountProjectId, CategoryValue(0), IIf(CategoryValue(2) = "", Nothing, CategoryValue(2)), CategoryValue(3), CBool(CategoryValue(1)))
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)
        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(GetFullTaskNameInTimeSheet(objRow, CategoryValue(5)), objRow.AccountProjectTaskId))
        Next
        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)
        Return values.ToArray
    End Function
    <WebMethod()> _
    Public Function GetAccountProjectTasksInExpensesheet(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")

        Dim CategoryValue() As String = Split(category, ",")

        Dim objRow As TimeLiveDataSet.AccountProjectTaskTimesheetRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.AccountProjectTaskTimesheetDataTable
      
        objTable = objAccountProjectTaskBLL.GetAssignedProjectTasksFromvueAccountProjectTask(Value, CategoryValue(0), IIf(CategoryValue(2) = "", Nothing, CategoryValue(2)), CategoryValue(3), CBool(CategoryValue(1)))
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)
        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(GetFullTaskNameInTimeSheet(objRow, CategoryValue(4)), objRow.AccountProjectTaskId))
        Next
        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)
        Return values.ToArray
    End Function
    Public Function GetFullTaskNameInTimeSheet(ByVal objrow As TimeLiveDataSet.AccountProjectTaskTimesheetRow, ByVal TaskTypeId As Integer)
        Dim TaskName As String = objrow.TaskName
        Dim AdditionalTask As String = New AccountProjectTaskBLL().GetShowAdditionalTaskInformationValue(TaskTypeId, IIf(IsDBNull(objrow.Item("ParentAccountProjectTaskId")), 0, objrow.Item("ParentAccountProjectTaskId")), IIf(IsDBNull(objrow.Item("TaskCode")), "", objrow.Item("TaskCode")))
        If Not AdditionalTask = "" Then
            Return TaskName & " (" & AdditionalTask & ")"
        Else
            Return TaskName
        End If
    End Function
    <WebMethod()> _
    Public Function GetAccountProjectTasksForReportByTimeSheet(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim CategoryValue() As String = Split(category, ",")

        Dim objRow As TimeLiveDataSet.AccountProjectTaskTimesheetRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.AccountProjectTaskTimesheetDataTable

        objTable = objAccountProjectTaskBLL.GetAssignedProjectTasksFromvueAccountProjectTask(Value, CategoryValue(0), IIf(CategoryValue(2) = "", Nothing, CategoryValue(2)), CategoryValue(3), CBool(CategoryValue(1)))

        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            If Value <> 0 Then
                values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.TaskName, objRow.AccountProjectTaskId))
            End If
        Next
        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)
        Return values.ToArray
    End Function
    <WebMethod()> _
    Public Function GetAccountProjectTasksInTimeSheetTimeCardView(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")

        Dim objRow As TimeLiveDataSet.AccountProjectTaskRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.AccountProjectTaskDataTable

        objTable = objAccountProjectTaskBLL.GetAssignedAccountProjectTasksByAccountProjectId(Value, category)
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.TaskName, objRow.AccountProjectTaskId))
        Next

        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> _
    Public Function GetAccountPartyContacts(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")


        Dim objRow As TimeLiveDataSet.AccountPartyContactRow
        Dim objAccountPartyContactBLL As New AccountPartyContactBLL

        Dim objTable As TimeLiveDataSet.AccountPartyContactDataTable

        objTable = objAccountPartyContactBLL.GetAccountPartyContactsByAccountPartyId(Value)
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.FirstName + " " + objRow.LastName, objRow.AccountPartyContactId))
        Next

        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> _
    Public Function GetAccountProject(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")


        Dim objRow As TimeLiveDataSet.vueAccountProjectsRow
        Dim objAccountProjectBLL As New AccountProjectBLL

        Dim objTable As TimeLiveDataSet.vueAccountProjectsDataTable

        objTable = objAccountProjectBLL.GetAccountClientByAccountProjectId(Value)
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.ProjectName, objRow.AccountProjectId))
        Next

        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> _
    Public Function GetAccountPartyDepartments(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")

        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        If Value <> "0" Then

            Dim objRow As TimeLiveDataSet.AccountPartyDepartmentRow
            Dim objAccountPartydepartmentBLL As New AccountPartyDepartmentBLL

            Dim objTable As TimeLiveDataSet.AccountPartyDepartmentDataTable

            objTable = objAccountPartydepartmentBLL.GetDataByAccountPartyId(Value)


            For Each objRow In objTable.Rows
                values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.PartyDepartmentCode, objRow.AccountPartyDepartmentId))
            Next
        End If
        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> _
    Public Function GetAccountProjectTasksForCustomizedReport(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim CategoryValue() As String = Split(category, ",")
        Dim AccountReportId As New Guid(CategoryValue(4))

        Dim objRow As TimeLiveDataSet.AccountProjectTaskTimesheetRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.AccountProjectTaskTimesheetDataTable

        objTable = objAccountProjectTaskBLL.GetAssignedProjectTasksFromvueAccountProjectTaskForCustomizedReport(CategoryValue(3), CategoryValue(0), Value, IIf(CategoryValue(2) = "", Nothing, CategoryValue(2)), CBool(CategoryValue(1)), AccountReportId, CategoryValue(5))

        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            If Value <> -1 Then
                values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.TaskName, objRow.AccountProjectTaskId))
            End If
        Next
        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)
        Return values.ToArray
    End Function
    <WebMethod()> _
    Public Function GetAccountProjectForInvoice(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")


        Dim objRow As TimeLiveDataSet.vueAccountProjectsRow
        Dim objAccountProjectBLL As New AccountProjectBLL

        Dim objTable As TimeLiveDataSet.vueAccountProjectsDataTable

        objTable = objAccountProjectBLL.GetAccountClientByAccountProjectIdandIsDisabled(Value, 0)
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)

        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.ProjectName, objRow.AccountProjectId))
        Next

        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
    <WebMethod()> _
    Public Function GetAccountProjectTasksForInvoice(ByVal knownCategoryValues As String, ByVal category As String) As AjaxControlToolkit.CascadingDropDownNameValue()

        Dim Value As String = Replace(Replace(knownCategoryValues, ";", ""), "undefined:", "")
        Dim values As New Generic.List(Of AjaxControlToolkit.CascadingDropDownNameValue)
        Dim CategoryValue() As String = Split(category, ",")



        Dim objRow As TimeLiveDataSet.vueAccountProjectTaskRow
        Dim objAccountProjectTaskBLL As New AccountProjectTaskBLL

        Dim objTable As TimeLiveDataSet.vueAccountProjectTaskDataTable


        objTable = objAccountProjectTaskBLL.GetAssignedAccountProjectTasksByAccountProjectIdAndAccountIdForInvoice(Value, CategoryValue(0))


        For Each objRow In objTable.Rows
            values.Add(New AjaxControlToolkit.CascadingDropDownNameValue(objRow.TaskName, objRow.AccountProjectTaskId))
        Next


        Me.Context.Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache)

        Return values.ToArray

    End Function
End Class

