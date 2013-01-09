Imports java.io.PrintStream
Imports java.text.SimpleDateFormat
Imports net.sf.mpxj.mpx
Imports net.sf.mpxj.mpp
Imports net.sf.mpxj.ProjectFile
Imports net.sf.mpxj.mpx.MPXReader
Imports net.sf.mpxj.mpp.MPPReader
Imports net.sf.mpxj.mspdi.MSPDIReader
Imports net.sf.mpxj.planner.PlannerReader
Imports net.sf.mpxj.listener
Imports net.sf.mpxj.utility
Imports net.sf.mpxj.Relation
Imports net.sf.mpxj.writer
Imports net.sf.mpxj.mspdi.MSPDIWriter
Imports net.sf.mpxj.planner.PlannerWriter
Imports Microsoft.VisualBasic
Imports AccountProjectBLL
Imports net.sf.mpxj
''' <summary>
''' Control Microsoft Project Class
''' </summary>
''' <remarks></remarks>
Public Class MProjectClass
    Private m_iColumnCount As Integer
    Private m_dtMProject As DataTable
    Private m_MProject
    Public Sub ImportMProject()

    End Sub
    ''' <summary>
    ''' Upload Microsoft Project file
    ''' </summary>
    ''' <param name="FileName"></param>
    ''' <param name="Delimiter"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function PopulateDataTableFromUploadedFile(ByVal FileName As String, ByVal Delimiter As String) As DataTable
        m_MProject = Delimiter
        Dim reader As net.sf.mpxj.reader.ProjectReader = New MPPReader()
        Dim project As net.sf.mpxj.ProjectFile = reader.read(FileName)

        Dim strLine As [String] = [String].Empty
        Dim iLineCount As Int32 = 0
        Dim AccountProjectTypeId As Integer
        Dim AccountBillingTypeId As Integer
        Dim AccountStatusId As Integer
        Dim ProjectCode As String
        Dim taskName As String
        Dim ProjectName As String
        Dim IsMilestone As Boolean
        Dim ProjectStartDate As Date
        Dim ProjectEndDate As Date
        'strLine = reader

        'If strLine Is Nothing Then
        '    Return Nothing
        'End If

        'm_MProject = Me.CreateDataTableForMProjectData(strLine)

        Dim task As net.sf.mpxj.Task
        Dim projectbll As New AccountProjectBLL

        Dim AccountClientId As System.Nullable(Of Integer)
        For Each task In project.getAllTasks.toArray()

            taskName = task.getName
            If taskName <> Nothing Then
                Dim Id = task.getID
                Dim taskuniqueId = task.getUniqueID
                Dim method = task.getEarnedValueMethod
                Dim chi = task.getChildTasks


                If task.getID.toString = 0 Then

                    Dim dtClientName As TimeLiveDataSet.AccountPartyDataTable = New AccountPartyBLL().GetAccountPartiesByAccountId(DBUtilities.GetSessionAccountId)
                    Dim drClientName As TimeLiveDataSet.AccountPartyRow
                    drClientName = dtClientName.Rows(0)
                    If dtClientName.Rows.Count > 0 Then
                        Dim PartyName = drClientName.PartyName
                        AccountClientId = drClientName.AccountPartyId
                    End If

                    Dim dtStatus As TimeLiveDataSet.AccountStatusDataTable = New AccountStatusBLL().GetAccountsStatusByStatusTypeId(DBUtilities.GetSessionAccountId, 3)
                    Dim drStatus As TimeLiveDataSet.AccountStatusRow
                    drStatus = dtStatus.Rows(0)
                    If dtStatus.Rows.Count > 0 Then
                        AccountStatusId = drStatus.AccountStatusId
                    End If

                    Dim dtProjectType As TimeLiveDataSet.AccountProjectTypeDataTable = New AccountProjectTypeBLL().GetAccountProjectTypeByAccountId(DBUtilities.GetSessionAccountId)
                    Dim drProjectType As TimeLiveDataSet.AccountProjectTypeRow
                    drProjectType = dtProjectType.Rows(0)
                    If dtProjectType.Rows.Count > 0 Then
                        AccountProjectTypeId = drProjectType.AccountProjectTypeId
                    End If

                    Dim dtBillingType As TimeLiveDataSet.AccountBillingTypeDataTable = New AccountBillingTypeBLL().GetAccountBillingTypesForProjectByAccountId(DBUtilities.GetSessionAccountId)
                    Dim drBillingType As TimeLiveDataSet.AccountBillingTypeRow
                    drBillingType = dtBillingType.Rows(0)
                    If dtBillingType.Rows.Count > 0 Then
                        AccountBillingTypeId = drBillingType.AccountBillingTypeId
                    End If
                    ProjectName = taskName
                    ProjectCode = LTrim(RTrim(Left(taskName, 5)))
                    ProjectStartDate = task.getStart.toGMTString
                    ProjectEndDate = task.getFinish.toGMTString
                    If taskName = Nothing Then
                        taskName = "Microsoft Project-1"
                    End If
                    projectbll.AddAccountProject(DBUtilities.GetSessionAccountId, AccountProjectTypeId, AccountClientId, 0, 0, AccountBillingTypeId, ProjectName, ProjectName, ProjectStartDate, ProjectEndDate, AccountStatusId, DBUtilities.GetSessionAccountEmployeeId, DBUtilities.GetSessionAccountEmployeeId, 0, 0, 0, "Days", ProjectCode, 0, 0, False, False, 0, Now.Date, DBUtilities.GetSessionAccountEmployeeId, Now.Date, DBUtilities.GetSessionAccountEmployeeId, False)
                Else

                    'Last ProjectId
                    Dim AccountProjectId = projectbll.GetLastInsertedId()

                    Dim AccountPriorityId As Integer
                    Dim dtPriority As TimeLiveDataSet.AccountPriorityDataTable = New AccountPriorityBLL().GetAccountPrioritiesByAccountId(DBUtilities.GetSessionAccountId)
                    Dim drPriority As TimeLiveDataSet.AccountPriorityRow
                    drPriority = dtPriority.Rows(0)
                    If dtPriority.Rows.Count > 0 Then
                        AccountPriorityId = drPriority.AccountPriorityId
                    End If
                    Dim AccountProjectMilestoneId As Integer
                    Dim dtMilestone As TimeLiveDataSet.AccountProjectMilestoneDataTable = New AccountProjectMilestoneBLL().GetAccountProjectMilestonesByAccountProjectId(AccountProjectId)
                    Dim drMilestone As TimeLiveDataSet.AccountProjectMilestoneRow
                    drMilestone = dtMilestone.Rows(0)
                    If dtMilestone.Rows.Count > 0 Then
                        AccountProjectMilestoneId = drMilestone.AccountProjectMilestoneId
                    End If
                    Dim AccountTaskTypeId As Integer
                    Dim dtTaskType As TimeLiveDataSet.AccountTaskTypeDataTable = New AccountTaskTypeBLL().GetAccountTaskTypesByAccountId(DBUtilities.GetSessionAccountId)
                    Dim drTaskType As TimeLiveDataSet.AccountTaskTypeRow
                    drTaskType = dtTaskType.Rows(0)
                    If dtTaskType.Rows.Count > 0 Then
                        AccountTaskTypeId = drTaskType.AccountTaskTypeId
                    End If
                    Dim TaskStatusId As Integer
                    Dim dttaskStatus As TimeLiveDataSet.AccountStatusDataTable = New AccountStatusBLL().GetAccountsStatusByStatusTypeId(DBUtilities.GetSessionAccountId, 4)
                    Dim drtaskStatus As TimeLiveDataSet.AccountStatusRow
                    drtaskStatus = dttaskStatus.Rows(0)
                    If dttaskStatus.Rows.Count > 0 Then
                        TaskStatusId = drtaskStatus.AccountStatusId
                    End If

                    Dim AccountCurrencyId = DBUtilities.GetAccountBaseCurrencyId

                    Dim FinishDate As Date
                    Dim StartDate As Date
                    Dim TaskDuration As Double
                    Dim Completed As Double
                    Dim iscompleted As Boolean
                    Dim taskbll As New AccountProjectTaskBLL
                    Dim ParentTaskId As Integer
                    Dim ParentTaskName As String
                    Dim TaskDurationUnit As String
                    Dim Milestone As Boolean
                    Dim MilestoneBll As New AccountProjectMilestoneBLL
                    FinishDate = task.getFinish.toGMTString
                    StartDate = task.getStart.toGMTString
                    TaskDuration = CDbl(task.getDuration.getDuration)
                    TaskDurationUnit = task.getDuration.getUnits.toString
                    Completed = task.getPercentageComplete.doubleValue
                    Milestone = task.getMilestone

                    ''Search Assign Milestone task
                    'If Not task.getPredecessors Is Nothing Then
                    '    '    Dim MilestoneTaskName = Split(task.getPredecessors.ToString, "name=")
                    '    '    ParentTaskName = Replace(MilestoneTaskName(1), "]", "")
                    '    For Each MilestoneTask In task.getPredecessors.toArray()

                    '    Next
                    'End If
                    If Completed <> 100 Then
                        iscompleted = False
                    Else
                        iscompleted = True
                    End If
                    If task.getChildTasks.toArray.Length <> 0 Then
                        If TaskDurationUnit = Nothing Then
                            TaskDurationUnit = "Days"
                        ElseIf TaskDurationUnit = "h" Then
                            TaskDurationUnit = "Hours"
                        ElseIf TaskDurationUnit = "d" Then
                            TaskDurationUnit = "Days"
                        ElseIf TaskDurationUnit = "m" Then
                            TaskDurationUnit = "Minutes"
                        ElseIf TaskDurationUnit = "w" Then
                            TaskDurationUnit = "Weeks"
                        ElseIf TaskDurationUnit = "mo" Then
                            TaskDurationUnit = "Months"
                        End If
                        If Milestone = True Then
                            MilestoneBll.AddAccountProjectMilestone(DBUtilities.GetSessionAccountId, AccountProjectId, taskName, FinishDate, Now.Date, DBUtilities.GetSessionAccountEmployeeId, Now.Date, DBUtilities.GetSessionAccountEmployeeId, "", False)
                            IsMilestone = True
                        Else
                            If IsMilestone = False Then
                                taskbll.AddAccountProjectTask(AccountProjectId, 0, taskName, taskName, AccountTaskTypeId, TaskDuration, TaskDurationUnit, Completed, iscompleted, FinishDate, TaskStatusId, AccountPriorityId, AccountProjectMilestoneId, False, True, Now.Date, DBUtilities.GetSessionAccountEmployeeId, Now.Date, DBUtilities.GetSessionAccountEmployeeId, 0, 0, "", True, "", 0, False, AccountCurrencyId, StartDate)
                            Else
                                taskbll.AddAccountProjectTask(AccountProjectId, 0, taskName, taskName, AccountTaskTypeId, TaskDuration, TaskDurationUnit, Completed, iscompleted, FinishDate, TaskStatusId, AccountPriorityId, MilestoneBll.GetLastInsertedId, False, True, Now.Date, DBUtilities.GetSessionAccountEmployeeId, Now.Date, DBUtilities.GetSessionAccountEmployeeId, 0, 0, "", True, "", 0, False, AccountCurrencyId, StartDate)
                            End If
                        End If
                    Else
                        ''SearchParentTaskName
                        Dim ParentTask = Split(task.getParentTask.toString, "name=")
                        ParentTaskName = Replace(ParentTask(1), "]", "")

                        Dim dttaskName As TimeLiveDataSet.AccountProjectTaskDataTable = New AccountProjectTaskBLL().GetAccountProjectTasksByAccountProjectIdandTaskName(AccountProjectId, ParentTaskName)
                        Dim drtaskName As TimeLiveDataSet.AccountProjectTaskRow
                        If dttaskName.Rows.Count > 0 Then
                            drtaskName = dttaskName.Rows(0)
                            ParentTaskId = drtaskName.AccountProjectTaskId
                        End If
                        If TaskDurationUnit = Nothing Then
                            TaskDurationUnit = "Days"
                        ElseIf TaskDurationUnit = "h" Then
                            TaskDurationUnit = "Hours"
                        ElseIf TaskDurationUnit = "d" Then
                            TaskDurationUnit = "Days"
                        ElseIf TaskDurationUnit = "m" Then
                            TaskDurationUnit = "Minutes"
                        ElseIf TaskDurationUnit = "w" Then
                            TaskDurationUnit = "Weeks"
                        ElseIf TaskDurationUnit = "mo" Then
                            TaskDurationUnit = "Months"
                        End If
                        If Milestone = True Then
                            MilestoneBll.AddAccountProjectMilestone(DBUtilities.GetSessionAccountId, AccountProjectId, taskName, FinishDate, Now.Date, DBUtilities.GetSessionAccountEmployeeId, Now.Date, DBUtilities.GetSessionAccountEmployeeId, "", False)
                            IsMilestone = True
                        Else
                            If IsMilestone = False Then
                                taskbll.AddAccountProjectTask(AccountProjectId, ParentTaskId, taskName, taskName, AccountTaskTypeId, TaskDuration, TaskDurationUnit, Completed, iscompleted, FinishDate, TaskStatusId, AccountPriorityId, AccountProjectMilestoneId, False, False, Now.Date, DBUtilities.GetSessionAccountEmployeeId, Now.Date, DBUtilities.GetSessionAccountEmployeeId, 0, 0, "", True, "", 0, False, AccountCurrencyId, StartDate)
                            Else
                                taskbll.AddAccountProjectTask(AccountProjectId, ParentTaskId, taskName, taskName, AccountTaskTypeId, TaskDuration, TaskDurationUnit, Completed, iscompleted, FinishDate, TaskStatusId, AccountPriorityId, MilestoneBll.GetLastInsertedId, False, False, Now.Date, DBUtilities.GetSessionAccountEmployeeId, Now.Date, DBUtilities.GetSessionAccountEmployeeId, 0, 0, "", True, "", 0, False, AccountCurrencyId, StartDate)
                            End If
                        End If
                    End If
                    Dim AccountProjectTaskId = taskbll.GetLastInsertedId()
                    Dim bllemp As New AccountEmployeeBLL
                    Dim taskresource As net.sf.mpxj.ResourceAssignment
                    For Each taskresource In task.getResourceAssignments.toArray()
                        Dim employeeNam = taskresource.getResource
                        If taskresource.getResourceUniqueID.intValue <> -65535 Then
                            Dim ResName = employeeNam.toString
                            Dim Employ() As String = Split(ResName, "name=")
                            Dim EmployeeName = Replace(Employ(1), "]", "")

                            Dim AccountEmployeeId As Integer
                            If employeeNam.toString <> Nothing Then
                                Dim dtResourceName As AccountEmployee.AccountEmployeeDataTable = New AccountEmployeeBLL().GetAccountEmployeesByEmployeeName(DBUtilities.GetSessionAccountId, EmployeeName)
                                Dim drResourceName As AccountEmployee.AccountEmployeeRow
                                If dtResourceName.Rows.Count > 0 Then
                                    drResourceName = dtResourceName.Rows(0)
                                    AccountEmployeeId = drResourceName.AccountEmployeeId
                                    Dim TaskEmployeeBLL As New AccountProjectTaskEmployeeBLL
                                    TaskEmployeeBLL.AddAccountProjectTaskEmployee(DBUtilities.GetSessionAccountId, AccountProjectId, AccountProjectTaskId, AccountEmployeeId, 100)
                                    Dim projectemployeeBLL As New AccountProjectEmployeeBLL
                                    Dim dtProjectEmployeeName As TimeLiveDataSet.AccountProjectEmployeeDataTable = New AccountProjectEmployeeBLL().GetAccountProjectEmployeesByAccountProjectIdandAccountEmployeeId(DBUtilities.GetSessionAccountId, AccountEmployeeId, AccountProjectId)
                                    If dtProjectEmployeeName.Rows.Count = 0 Then
                                        projectemployeeBLL.AddAccountProjectEmployee(DBUtilities.GetSessionAccountId, AccountProjectId, AccountEmployeeId, 0, 0)
                                    End If
                                End If
                            End If
                        End If
                    Next
                End If
            End If
        Next
        projectbll.UpdateAccountProject(DBUtilities.GetSessionAccountId, AccountProjectTypeId, AccountClientId, 0, 0, AccountBillingTypeId, ProjectName, ProjectName, ProjectStartDate, ProjectEndDate, AccountStatusId, DBUtilities.GetSessionAccountEmployeeId, DBUtilities.GetSessionAccountEmployeeId, 0, 0, 0, "Days", ProjectCode, 0, 1, False, False, 0, Now.Date, DBUtilities.GetSessionAccountEmployeeId, Now.Date, DBUtilities.GetSessionAccountEmployeeId, projectbll.GetLastInsertedId, False, False)
        '    Return m_MProject

    End Function
    ''' <summary>
    ''' Export mixrosoft project file
    ''' </summary>
    ''' <param name="AccountProjectId"></param>
    ''' <param name="tempFile"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function ExportFileforMicrosoftProject(ByVal AccountProjectId As Integer, ByVal tempFile As String) As Integer

        Dim TaskName As String
        Dim Project As New net.sf.mpxj.ProjectFile
        Project.setAutoOutlineLevel(True)
        Project.setAutoOutlineNumber(True)
        Project.setAutoTaskID(True)
        Project.setAutoTaskUniqueID(True)
        Project.setAutoWBS(True)
        Project.setAutoCalendarUniqueID(True)

        Dim AccountProjectTaskId As Integer
        Dim dttaskName As TimeLiveDataSet.AccountProjectTaskDataTable = New AccountProjectTaskBLL().GetAccountProjectTasksByAccountProjectIdandIsParentTaskId(AccountProjectId)
        Dim drtaskName As TimeLiveDataSet.AccountProjectTaskRow
        If dttaskName.Rows.Count > 0 Then
            drtaskName = dttaskName.Rows(0)
            For Each drtaskName In dttaskName.Rows
                TaskName = drtaskName.TaskName
                AccountProjectTaskId = drtaskName.AccountProjectTaskId
                Dim TaskDuration As Integer
                TaskDuration = drtaskName.Duration
                Dim TimeUnit = drtaskName.DurationUnit
                Dim PComplete = CDbl(drtaskName.CompletedPercent)
                Dim FinishDate As Date = drtaskName.DeadlineDate
                Dim df = New java.text.SimpleDateFormat("MM/dd/yyyy")
                Dim task As net.sf.mpxj.Task = Project.addTask
                task.setName(TaskName)
                'task.setStart(df.parse(FinishDate))
                'task.setStart(New java.util.Date)
                'task.setFinish(New java.util.Date(FinishDate))
                task.setDuration(Duration.getInstance(TaskDuration, net.sf.mpxj.TimeUnit.DAYS))
                'task.setID(New java.lang.Integer(AccountProjectTaskId))
                'task.setUniqueID(New java.lang.Integer(AccountProjectTaskId))
                task.setPercentageComplete(NumberUtility.getDouble(PComplete))

                ''childtask
                Dim Taskchild As net.sf.mpxj.Task
                Dim ChildTaskId As Integer
                Dim ChildTaskName As String
                Dim dtcheckchildtaskName As TimeLiveDataSet.AccountProjectTaskDataTable = New AccountProjectTaskBLL().GetAccountProjectTasksByParentAccountProjectTaskId(AccountProjectTaskId)
                Dim drcheckchildtaskName As TimeLiveDataSet.AccountProjectTaskRow
                If dtcheckchildtaskName.Rows.Count > 0 Then
                    drcheckchildtaskName = dtcheckchildtaskName.Rows(0)
                    For Each drcheckchildtaskName In dtcheckchildtaskName.Rows
                        ChildTaskName = drcheckchildtaskName.TaskName
                        ChildTaskId = drcheckchildtaskName.AccountProjectTaskId
                        Dim ChildUnit = drcheckchildtaskName.DurationUnit
                        Taskchild = task.addTask
                        Taskchild.setName(ChildTaskName)
                        Dim ChildTaskDuration As Integer
                        ChildTaskDuration = drcheckchildtaskName.Duration
                        Dim ChildTimeUnit = drcheckchildtaskName.DurationUnit
                        Dim ChildPComplete = CDbl(drcheckchildtaskName.CompletedPercent)
                        Dim ChildFinishDate As Date = drcheckchildtaskName.DeadlineDate
                        Dim dtf = New java.text.SimpleDateFormat("MM/dd/yyyy")
                        'Taskchild.setFinish(dtf.parse(ChildFinishDate))
                        Taskchild.setDuration(Duration.getInstance(ChildTaskDuration, net.sf.mpxj.TimeUnit.DAYS))


                        ''ProjectEmployeeLoop
                        Dim ProjectEmployeeName As String
                        Dim ProjectEmployeeId As Integer
                        Dim Resource As net.sf.mpxj.Resource

                        Dim dtProjectEmployee As TimeLiveDataSet.AccountProjectEmployeeDataTable = New AccountProjectEmployeeBLL().GetAccountProjectEmployeesByAccountProjectId(AccountProjectId)
                        Dim drProjectEmployee As TimeLiveDataSet.AccountProjectEmployeeRow
                        If dtProjectEmployee.Rows.Count > 0 Then
                            drProjectEmployee = dtProjectEmployee.Rows(0)
                            For Each drProjectEmployee In dtProjectEmployee.Rows
                                ProjectEmployeeId = drProjectEmployee.AccountEmployeeId
                                Dim dtProjectResourceName As AccountEmployee.AccountEmployeeDataTable = New AccountEmployeeBLL().GetAccountEmployeesByAccountEmployeeId(ProjectEmployeeId)
                                Dim drProjectResourceName As AccountEmployee.AccountEmployeeRow
                                If dtProjectResourceName.Rows.Count > 0 Then
                                    drProjectResourceName = dtProjectResourceName.Rows(0)
                                    ProjectEmployeeName = drProjectResourceName.FirstName + " " + drProjectResourceName.LastName
                                    Resource = Project.addResource()
                                    Resource.setName(ProjectEmployeeName)
                                    Resource.setUniqueID(New java.lang.Integer(ProjectEmployeeId))
                                    Resource.setID(New java.lang.Integer(ProjectEmployeeId))


                                    Dim ChildAccountEmployeeId As Integer
                                    Dim ChildTaskEmployeeName As String
                                    Dim dtChildTaskEmployee As TimeLiveDataSet.AccountProjectTaskEmployeeDataTable = New AccountProjectTaskEmployeeBLL().GetAccountProjectTaskByAccountEmployeeIdandAccountProjectTaskId(ProjectEmployeeId, ChildTaskId)
                                    Dim drChildTaskEmployee As TimeLiveDataSet.AccountProjectTaskEmployeeRow
                                    If dtChildTaskEmployee.Rows.Count > 0 Then
                                        drChildTaskEmployee = dtChildTaskEmployee.Rows(0)
                                        For Each drChildTaskEmployee In dtChildTaskEmployee.Rows
                                            ChildAccountEmployeeId = drChildTaskEmployee.AccountEmployeeId
                                            Dim dtTaskResourceName As AccountEmployee.AccountEmployeeDataTable = New AccountEmployeeBLL().GetAccountEmployeesByAccountEmployeeId(ChildAccountEmployeeId)
                                            Dim drTaskResourceName As AccountEmployee.AccountEmployeeRow
                                            If dtTaskResourceName.Rows.Count > 0 Then
                                                drTaskResourceName = dtTaskResourceName.Rows(0)
                                                ChildTaskEmployeeName = drTaskResourceName.FirstName + " " + drTaskResourceName.LastName
                                                'Dim objResourceAssignment As ResourceAssignment
                                                'objResourceAssignment = task.addResourceAssignment(Resource)
                                                'objResourceAssignment.setResourceUniqueID(New java.lang.Integer(ProjectEmployeeId))
                                                Taskchild.addResourceAssignment(Resource)
                                            End If
                                        Next
                                    End If
                                End If
                            Next
                        End If
                    Next
                Else
                    ''Not child task available ProjectEmployeeLoop
                    Dim NotChildResource As net.sf.mpxj.Resource
                    Dim ProjectEmployeeName As String
                    Dim ProjectEmployeeId As Integer

                    Dim dtProjectEmployee As TimeLiveDataSet.AccountProjectEmployeeDataTable = New AccountProjectEmployeeBLL().GetAccountProjectEmployeesByAccountProjectId(AccountProjectId)
                    Dim drProjectEmployee As TimeLiveDataSet.AccountProjectEmployeeRow
                    If dtProjectEmployee.Rows.Count > 0 Then
                        drProjectEmployee = dtProjectEmployee.Rows(0)
                        For Each drProjectEmployee In dtProjectEmployee.Rows
                            ProjectEmployeeId = drProjectEmployee.AccountEmployeeId
                            Dim dtProjectResourceName As AccountEmployee.AccountEmployeeDataTable = New AccountEmployeeBLL().GetAccountEmployeesByAccountEmployeeId(ProjectEmployeeId)
                            Dim drProjectResourceName As AccountEmployee.AccountEmployeeRow
                            If dtProjectResourceName.Rows.Count > 0 Then
                                drProjectResourceName = dtProjectResourceName.Rows(0)
                                ProjectEmployeeName = drProjectResourceName.FirstName + " " + drProjectResourceName.LastName
                                NotChildResource = Project.addResource()
                                NotChildResource.setName(ProjectEmployeeName)
                                NotChildResource.setUniqueID(New java.lang.Integer(ProjectEmployeeId))
                                NotChildResource.setID(New java.lang.Integer(ProjectEmployeeId))


                                Dim NotChildAccountEmployeeId As Integer
                                Dim NotChildTaskEmployeeName As String
                                Dim dtChildTaskEmployee As TimeLiveDataSet.AccountProjectTaskEmployeeDataTable = New AccountProjectTaskEmployeeBLL().GetAccountProjectTaskByAccountEmployeeIdandAccountProjectTaskId(ProjectEmployeeId, AccountProjectTaskId)
                                Dim drChildTaskEmployee As TimeLiveDataSet.AccountProjectTaskEmployeeRow
                                If dtChildTaskEmployee.Rows.Count > 0 Then
                                    drChildTaskEmployee = dtChildTaskEmployee.Rows(0)
                                    For Each drChildTaskEmployee In dtChildTaskEmployee.Rows
                                        NotChildAccountEmployeeId = drChildTaskEmployee.AccountEmployeeId
                                        Dim dtTaskResourceName As AccountEmployee.AccountEmployeeDataTable = New AccountEmployeeBLL().GetAccountEmployeesByAccountEmployeeId(NotChildAccountEmployeeId)
                                        Dim drTaskResourceName As AccountEmployee.AccountEmployeeRow
                                        If dtTaskResourceName.Rows.Count > 0 Then
                                            drTaskResourceName = dtTaskResourceName.Rows(0)
                                            NotChildTaskEmployeeName = drTaskResourceName.FirstName + " " + drTaskResourceName.LastName
                                            'Dim objResourceAssignment As ResourceAssignment
                                            'objResourceAssignment = task.addResourceAssignment(Resource)
                                            'objResourceAssignment.setResourceUniqueID(New java.lang.Integer(ProjectEmployeeId))
                                            task.addResourceAssignment(NotChildResource)
                                        End If
                                    Next
                                End If
                            End If
                        Next
                    End If
                End If
            Next
            Dim objImportExportBLL As New ImportExportBLL
            Dim writer As ProjectWriter = New net.sf.mpxj.mpx.MPXWriter
            Dim ExportType As String = "MProject"
            writer.write(Project, tempFile)
        End If

        Return AccountProjectTaskId

    End Function
End Class
