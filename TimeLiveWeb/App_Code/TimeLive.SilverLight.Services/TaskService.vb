Imports System.ServiceModel
Imports System.ServiceModel.Activation
Imports System.Data.SqlClient
Imports System.Data

<ServiceContract(Namespace:="")>
<SilverLightFaultBehavior>
<AspNetCompatibilityRequirements(RequirementsMode:=AspNetCompatibilityRequirementsMode.Allowed)>
Public Class TaskService

    <OperationContract()>
    Public Sub DoWork()
        ' Add your operation implementation here
    End Sub

    <OperationContract()> _
    Public Function GetTasks(AccountProjectId As Integer) As List(Of ProjectTask)
        Dim TaskList As New List(Of ProjectTask)
        Dim objTask As New ProjectTask
        Dim TaskBLL As New AccountProjectTaskBLL
        Dim dtTask As DataTable = TaskBLL.GetAccountProjectTaskHierarchyCached(AccountProjectId)
        Dim drTask As DataRow
        Dim BLL As New AccountProjectTaskEmployeeBLL
        Dim Resource As String
        Dim count As Integer
        For Each drTask In dtTask.Rows
            If Not IsDBNull(drTask("AccountProjectTaskId")) Then
                Dim dtEmployee As TimeLiveDataSet.AccountProjectTaskEmployeeDataTable = BLL.GetAccountProjectTaskEmployeesByAccountProjectTaskId(drTask("AccountProjectTaskId"))
                Dim drEmployee As TimeLiveDataSet.AccountProjectTaskEmployeeRow
                objTask = New ProjectTask
                With objTask
                    .ID = drTask("AccountProjectTaskId")
                    .Name = drTask("TaskName")
                    .StartTime = drTask("StartDate")
                    .Effort = TimeSpan.FromHours(Math.Round(drTask("Duration"), 2))
                    .ProgressPercent = drTask("CompletedPercent")
                    .IndentLevel = drTask("Depth")
                    .Description = drTask("TaskDescription")
                    If Not IsDBNull(drTask("Predecessors")) Then
                        .Predecessor = drTask("Predecessors")
                    End If
                    For Each drEmployee In dtEmployee.Rows
                        count += 1
                        If IsDBNull(drEmployee.Item("AllocationUnits")) Then
                            Resource += IIf(dtEmployee.Rows.Count = count, drEmployee.AccountEmployeeId.ToString, drEmployee.AccountEmployeeId.ToString + ",")
                        Else
                            Resource += IIf(dtEmployee.Rows.Count = count, drEmployee.AccountEmployeeId.ToString & IIf(drEmployee.AllocationUnits <> 100, "[" & drEmployee.AllocationUnits & "%]", ""), drEmployee.AccountEmployeeId.ToString & IIf(drEmployee.AllocationUnits <> 100, "[" & drEmployee.AllocationUnits & "%]", "") + ",")
                        End If
                        .Resources = Resource
                    Next
                    Resource = ""
                    count = 0
                End With
                TaskList.Add(objTask)
            End If
        Next
        Return TaskList
    End Function
    <OperationContract()> _
    Public Function UpdateAccountProjectTask( _
                    ByVal AccountProjectId As System.Nullable(Of Integer), _
                    ByVal ParentAccountProjectTaskId As System.Nullable(Of Integer), _
                    ByVal TaskName As String, _
                    ByVal TaskDescription As String, _
                    ByVal CompletedPercent As Double, _
                    ByVal DeadlineDate As Date, _
                    ByVal Original_AccountProjectTaskId As Integer, _
                    ByVal StartDate As Date, _
                    ByVal IsParentTask As Boolean, _
                    ByVal Duration As Double, _
                    ByVal Predecessors As String _
                    ) As Boolean

        Dim TaskBLL As New AccountProjectTaskBLL
        Dim dtTask As TimeLiveDataSet.AccountProjectTaskDataTable = TaskBLL.GetAccountProjectTasksByAccountProjectTaskId(Original_AccountProjectTaskId)
        Dim drTask As TimeLiveDataSet.AccountProjectTaskRow = dtTask.Rows(0)
        TaskBLL.UpdateAccountProjectTask(AccountProjectId, ParentAccountProjectTaskId, TaskName, TaskDescription, _
                                         drTask.AccountTaskTypeId, Duration, drTask.DurationUnit, CompletedPercent, _
                                         drTask.Completed, DeadlineDate, IIf(IsDBNull(drTask.Item("TaskStatusId")), Nothing, drTask.Item("TaskStatusId")), drTask.AccountPriorityId, _
                                         IIf(IsDBNull(drTask.Item("IsForAllEmployees")), False, drTask.Item("IsForAllEmployees")), IsParentTask, drTask.AccountProjectMilestoneId, _
                                         IIf(IsDBNull(drTask.Item("CreatedOn")), Now, drTask.Item("CreatedOn")), _
                                         IIf(IsDBNull(drTask.Item("CreatedByEmployeeId")), DBUtilities.GetSessionAccountEmployeeId, drTask.Item("CreatedByEmployeeId")), Now, DBUtilities.GetSessionAccountEmployeeId, _
                                         IIf(IsDBNull(drTask.Item("EstimatedCost")), 0, drTask.Item("EstimatedCost")), _
                                         IIf(IsDBNull(drTask.Item("EstimatedTimeSpent")), 0, drTask.Item("EstimatedTimeSpent")), _
                                         IIf(IsDBNull(drTask.Item("EstimatedTimeSpentUnit")), Nothing, drTask.Item("EstimatedTimeSpentUnit")), _
                                         IIf(IsDBNull(drTask.Item("IsBillable")), True, drTask.Item("IsBillable")), _
                                         Original_AccountProjectTaskId, drTask.IsDisabled, IIf(IsDBNull(drTask.Item("TaskCode")), Nothing, drTask.Item("TaskCode")), IIf(IsDBNull(drTask.Item("IsForAllProjectTask")), False, drTask.Item("IsForAllProjectTask")), _
                                         IIf(IsDBNull(drTask.Item("EstimatedCurrencyId")), Nothing, drTask.Item("EstimatedCurrencyId")), StartDate, Predecessors)
        TaskBLL.AfterUpdate(Original_AccountProjectTaskId)
    End Function
    <OperationContract()> _
    Public Function AddAccountProjectTask( _
                    ByVal AccountProjectId As System.Nullable(Of Integer), _
                    ByVal ParentAccountProjectTaskId As System.Nullable(Of Integer), _
                    ByVal TaskName As String, _
                    ByVal TaskDescription As String, _
                    ByVal CompletedPercent As Double, _
                    ByVal DeadlineDate As Date, _
                    ByVal StartDate As Date, _
                    ByVal Duration As Double, _
                    ByVal Predecessors As String _
                    ) As List(Of ProjectTask)

        Dim TaskStatusId As Integer
        Dim TaskPriorityId As Integer
        Dim TaskTypeId As Integer
        Dim AccountCurrencyId As Integer
        Dim AccountProjectMilestoneId As Integer
        Dim TaskStatusBLL As New AccountStatusBLL
        Dim TaskTypeBLL As New AccountTaskTypeBLL
        Dim TaskPriorityBLL As New AccountPriorityBLL
        Dim CurrencyBLL As New AccountCurrencyBLL
        Dim MilestoneBLL As New AccountProjectMilestoneBLL
        Dim dtTaskStatus As TimeLiveDataSet.AccountStatusDataTable = TaskStatusBLL.GetAccountsStatusForTaskByAccountStatusId(DBUtilities.GetSessionAccountId, 0)
        If dtTaskStatus.Rows.Count > 0 Then
            TaskStatusId = dtTaskStatus.Rows(0)("AccountStatusId")
        End If
        Dim dtTaskType As TimeLiveDataSet.AccountTaskTypeDataTable = TaskTypeBLL.GetAccountTaskTypesByAccountIdAndAccountTaskTypeId(DBUtilities.GetSessionAccountId, 0)
        If dtTaskType.Rows.Count > 0 Then
            TaskTypeId = dtTaskType.Rows(0)("AccountTaskTypeId")
        End If
        Dim dtTaskPriority As TimeLiveDataSet.AccountPriorityDataTable = TaskPriorityBLL.GetAccountPrioritiesByAccountIdAndAccountPriorityId(DBUtilities.GetSessionAccountId, 0)
        If dtTaskPriority.Rows.Count > 0 Then
            TaskPriorityId = dtTaskPriority.Rows(0)("AccountPriorityId")
        End If
        Dim dtCurrency As AccountCurrency.vueAccountCurrencyDataTable = CurrencyBLL.GetvueAccountCurrencyByAccountIdAndDisabled(DBUtilities.GetSessionAccountId, 0)
        If dtCurrency.Rows.Count > 0 Then
            AccountCurrencyId = dtCurrency.Rows(0)("AccountCurrencyId")
        End If
        Dim dtMilestone As TimeLiveDataSet.AccountProjectMilestoneDataTable = MilestoneBLL.GetAccountProjectMilestonesByAccountProjectId(AccountProjectId)
        If dtMilestone.Rows.Count > 0 Then
            AccountProjectMilestoneId = dtMilestone.Rows(0)("AccountProjectMilestoneId")
        End If

        Dim TaskBLL As New ProjectTask
        Dim ProjectTaskBLL As New AccountProjectTaskBLL
        Dim AccountProjectTaskId As Integer = ProjectTaskBLL.AddAccountProjectTask(AccountProjectId, ParentAccountProjectTaskId, _
                                                                                   TaskName, TaskDescription, TaskTypeId, _
                                                                                   Duration, "Hours", CompletedPercent, False, _
                                                                                   DeadlineDate, TaskStatusId, TaskPriorityId, _
                                                                                   AccountProjectMilestoneId, False, False, Now, _
                                                                                   DBUtilities.GetSessionAccountEmployeeId, Now, _
                                                                                   DBUtilities.GetSessionAccountEmployeeId, 0, 0, _
                                                                                   Nothing, True, "", Nothing, False, _
                                                                                   AccountCurrencyId, StartDate, Predecessors)

        Dim TaskList As New List(Of ProjectTask)
        With TaskBLL
            .ID = AccountProjectTaskId
            .Name = TaskName
            .Description = TaskDescription
            .StartTime = StartDate
            Dim daysoff As Integer = DateDiff(DateInterval.Day, StartDate, DeadlineDate.AddDays(1))
            Dim HoursOff As Double = daysoff * 8
            .Effort = TimeSpan.FromHours(HoursOff)
            .ProgressPercent = CompletedPercent
            If ParentAccountProjectTaskId <> 0 Then
                .IndentLevel = 1
            End If
        End With
        TaskList.Add(TaskBLL)
        Return TaskList
    End Function
    <OperationContract()> _
    Public Function DeleteAccountProjectTask(AccountProjectTaskId As Integer) As Boolean
        Call New AccountProjectTaskBLL().DeleteAccountProjectType(AccountProjectTaskId)
    End Function
    <OperationContract()> _
    Public Function SetPermissionForTask() As List(Of ProjectTask)
        Dim TaskList As New List(Of ProjectTask)
        Dim objTask As New ProjectTask
 
        Dim Permission As New AccountPagePermissionBLL
        With objTask
            .IsViewPermission = Permission.IsPageHasPermissionOf(32, 1)
            .IsAddPermission = Permission.IsPageHasPermissionOf(32, 2)
            .IsUpdatePermission = Permission.IsPageHasPermissionOf(32, 3)
            .IsDeletePermission = Permission.IsPageHasPermissionOf(32, 4)
        End With
        TaskList.Add(objTask)
        Return TaskList
    End Function
End Class
