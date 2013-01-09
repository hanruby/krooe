Imports Microsoft.VisualBasic
Imports TimeLiveDataSetTableAdapters
Imports AccountProjectTableAdapters

<System.ComponentModel.DataObject()> _
Public Class AccountProjectBLL
    
    Private _AccountProjectTableAdapter As AccountProjectTableAdapter = Nothing
    Dim strCacheKey As String

    Public Const PROJECT_BILLING_RATE_TYPE_ID_FROM_EMPLOYEE = 1
    Public Const PROJECT_BILLING_RATE_TYPE_ID_FROM_PROJECT_ROLE = 2
    Protected ReadOnly Property Adapter() As AccountProjectTableAdapter
        Get
            If _AccountProjectTableAdapter Is Nothing Then
                _AccountProjectTableAdapter = New AccountProjectTableAdapter()
            End If

            Return _AccountProjectTableAdapter
        End Get
    End Property
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjects() As TimeLiveDataSet.AccountProjectDataTable
        Return Adapter.GetData
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByTeamLeadIdOrProjectManagerId(ByVal AccountEmployeeId As Integer) As TimeLiveDataSet.AccountProjectDataTable

        strCacheKey = CacheManager.GetCacheKeyForAccountsData("AccountProjectDataTable", "GetAccountProjectsByTeamLeadIdOrProjectManagerId", "AccountEmployeeId=" & AccountEmployeeId)

        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAccountProjectsByTeamLeadIdOrProjectManagerId = CacheManager.GetItemFromCache(strCacheKey)
        Else
            GetAccountProjectsByTeamLeadIdOrProjectManagerId = Adapter.GetDataByTeamLeadIdOrAccountProjectId(AccountEmployeeId)
            CacheManager.AddAccountDataInCache(GetAccountProjectsByTeamLeadIdOrProjectManagerId, strCacheKey)
        End If

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsForGridView(ByVal AccountId As Integer, ByVal IsTemplate As Boolean) As TimeLiveDataSet.vueAccountProjectsDataTable

        'strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueAccountProjectsDataTable", "GetAccountProjectsForGridView", AccountId)
        'If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
        '    GetAccountProjectsForGridView = CacheManager.GetItemFromCache(strCacheKey)
        'Else
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        If LocaleUtilitiesBLL.ShowCompletedProjectInProjectGrid = True Then
            GetAccountProjectsForGridView = _vueAccountProjectsTableAdapter.GetDataByAccountId(AccountId, IsTemplate)
        Else
            GetAccountProjectsForGridView = _vueAccountProjectsTableAdapter.GetDataByAccountIdandCompletedProject(AccountId, IsTemplate)
        End If
        'CacheManager.AddAccountDataInCache(GetAccountProjectsForGridView, strCacheKey)
        'End If
        UIUtilities.FixTableForNoRecords(GetAccountProjectsForGridView)
        Return GetAccountProjectsForGridView

    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByAccountId(ByVal AccountId As Integer) As TimeLiveDataSet.AccountProjectDataTable
        Return Adapter.GetDataByAccountId(AccountId)
    End Function
    ''' <summary>
    ''' return all accountproject records of specified AccountId
    ''' </summary>
    ''' <param name="AccountId"></param>
    ''' <returns>AccountProjectsDataTable</returns>
    ''' <remarks></remarks>
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByAccountIdWithoutDeleted(ByVal AccountId As Integer) As TimeLiveDataSet.AccountProjectDataTable
        Return Adapter.GetDataByAccountIdWithoutDeleted(AccountId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByAccountIdWithoutDeletedForIsDeleted(ByVal AccountId As Integer) As TimeLiveDataSet.AccountProjectDataTable
        Return Adapter.GetDataByAccountIdWithoutDeletedForIsDeleted(AccountId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectTemplatesByAccountId(ByVal AccountId As Integer) As TimeLiveDataSet.AccountProjectDataTable
        Return Adapter.GetAccountProjectTemplatesByAccountId(AccountId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByAccountEmployeeId(ByVal AccountEmployeeId As Integer) As TimeLiveDataSet.AccountProjectDataTable
        Return Adapter.GetDataByAccountEmployeeId(AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesForReport(ByVal AccountId As Integer, ByVal AccountClientId As Integer, ByVal IsActive As Integer, ByVal ProjectStatusId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        Return _vueAccountProjectsTableAdapter.GetDataForProjectReport(AccountId, AccountClientId, IsActive, ProjectStatusId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetProjectsForTimeEntryApproval(ByVal ApproverEmployeeId) As AccountProject.vueTimeEntryApprovalProjectsDataTable
        Dim _vueTimeEntryApprovalProjectsTableAdapter As New vueTimeEntryApprovalProjectsTableAdapter
        Return _vueTimeEntryApprovalProjectsTableAdapter.GetProjectsForTimeEntryApproval(ApproverEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetProjectsForExpenseEntryApproval(ByVal ApproverEmployeeId) As AccountProject.vueExpenseEntryApprovalProjectsDataTable
        Dim _vueExpenseEntryApprovalProjectsTableAdapter As New vueExpenseEntryApprovalProjectsTableAdapter
        Return _vueExpenseEntryApprovalProjectsTableAdapter.GetProjectForExpenseEntryApproval(ApproverEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetProjectByLeaderEmployeeId(ByVal AccountEmployeeId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        Return _vueAccountProjectsTableAdapter.GetDataByLeaderEmployeeId(AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetProjectByProjectManagerEmployeeId(ByVal AccountEmployeeId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        Return _vueAccountProjectsTableAdapter.GetDataByProjectManagerEmployeeId(AccountEmployeeId)
    End Function
    Public Function GetLastInsertedId() As Integer
        Dim a As TimeLiveDataSet.IdentityQueryRow
        Dim ad As New TimeLiveDataSetTableAdapters.IdentityQueryTableAdapter
        a = ad.GetAccountProjectLastId.Rows(0)
        Return a.LastId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeId(ByVal AccountEmployeeId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable


        'strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueAccountProjectsDataTable", "GetAssignedAccountProjectsByAccountEmployeeId", AccountEmployeeId)

        'If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
        'GetAssignedAccountProjectsByAccountEmployeeId = CacheManager.GetItemFromCache(strCacheKey)
        'Else
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetAssignedAccountProjectsByAccountEmployeeId = _vueAccountProjectsTableAdapter.GetAssignedDataByAccountEmployeeId(AccountEmployeeId)
        'CacheManager.AddAccountDataInCache(GetAssignedAccountProjectsByAccountEmployeeId, strCacheKey)
        'End If

        Uiutilities.FixTableForNoRecords(GetAssignedAccountProjectsByAccountEmployeeId)

        Return GetAssignedAccountProjectsByAccountEmployeeId

    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeIdForReport(ByVal AccountEmployeeId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        Return _vueAccountProjectsTableAdapter.GetAssignedDataByAccountEmployeeId(AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, Optional ByVal IsTemplate As Boolean = False) As TimeLiveDataSet.AccountProjectDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("AccountProjectDataTable", "GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId", "AccountProjectId=" & AccountProjectId & "_AccountEmployeeId=" & AccountEmployeeId & "_IsTemplate=" & IsTemplate)

        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId = CacheManager.GetItemFromCache(strCacheKey)
        Else
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId = Adapter.GetAssignedDataByAccountEmployeeIdAndAccountProjectId(IsTemplate, AccountProjectId, AccountEmployeeId)
            CacheManager.AddAccountDataInCache(GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId, strCacheKey)
        End If
        Return GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeleted(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, Optional ByVal IsTemplate As Boolean = False) As TimeLiveDataSet.vueAccountProjectsDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueAccountProjectsDataTable", "GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeleted", "AccountProjectId=" & AccountProjectId & "_AccountEmployeeId=" & AccountEmployeeId & "_IsTemplate=" & IsTemplate)
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeleted = CacheManager.GetItemFromCache(strCacheKey)
        Else
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeleted = _vueAccountProjectsTableAdapter.GetAssignedDataByAccountEmployeeIdAndAccountProjectIdForIsDeleted(IsTemplate, AccountProjectId, AccountEmployeeId)
            CacheManager.AddAccountDataInCache(GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeleted, strCacheKey)
        End If
        Return GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeleted
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjects(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal Completed As Boolean, Optional ByVal IsTemplate As Boolean = False, Optional ByVal AccountId As Integer = -1) As TimeLiveDataSet.AccountProjectDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("AccountProjectDataTable", "GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjects", "AccountProjectId=" & AccountProjectId & "_AccountEmployeeId=" & AccountEmployeeId & "_IsTemplate=" & IsTemplate & "_Completed=" & Completed, AccountId)
        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjects = CacheManager.GetItemFromCache(strCacheKey)
        Else
            Dim _AccountProjectTableAdapter As New AccountProjectTableAdapter
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjects = _AccountProjectTableAdapter.GetAssignedDataByEmployeeIdProjectIdAndCompleted(AccountProjectId, AccountEmployeeId, Completed, IsTemplate, AccountId)
            CacheManager.AddAccountDataInCache(GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjects, strCacheKey)
        End If
        Return GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjects
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal Completed As Boolean, Optional ByVal IsTemplate As Boolean = False, Optional ByVal AccountId As Integer = -1) As TimeLiveDataSet.vueAccountProjectsDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueAccountProjectsDataTable", "GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient", "AccountProjectId=" & AccountProjectId & "_AccountEmployeeId=" & AccountEmployeeId & "_IsTemplate=" & IsTemplate & "_Completed=" & Completed, AccountId)
        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient = CacheManager.GetItemFromCache(strCacheKey)
        Else
            Dim _vueAccountProjectTableAdapter As New vueAccountProjectsTableAdapter
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient = _vueAccountProjectTableAdapter.GetAssignedDataByEmployeeIdProjectIdAndCompleted(AccountProjectId, AccountEmployeeId, Completed, IsTemplate, AccountId)
            CacheManager.AddAccountDataInCache(GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient, strCacheKey)
        End If
        Return GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjectsForImportExport(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal Completed As Boolean, Optional ByVal IsTemplate As Boolean = False, Optional ByVal AccountId As Integer = -1, Optional ByVal ProjectName As String = "") As TimeLiveDataSet.AccountProjectDataTable
        Dim _AccountProjectTableAdapter As New AccountProjectTableAdapter
        GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjectsForImportExport = _AccountProjectTableAdapter.GetAssignedDataByEmployeeIdProjectIdAndCompleted(AccountProjectId, AccountEmployeeId, Completed, IsTemplate, AccountId, True, ProjectName)
        Return GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForProjectsForImportExport
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientId(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal AccountClientId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientId = _vueAccountProjectsTableAdapter.GetAssignedDataByAccountEmployeeIdAndAccountClientId(AccountClientId, AccountProjectId, AccountEmployeeId)
        Return GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal AccountClientId As Integer, ByVal Completed As Boolean, Optional ByVal AccountId As Integer = -1) As TimeLiveDataSet.vueAccountProjectsDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("AccountProjectDataTable", "GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects", "AccountProjectId=" & AccountProjectId & "_AccountEmployeeId=" & AccountEmployeeId & "_AccountClientId=" & AccountClientId & "_Completed=" & Completed, AccountId)
        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects = CacheManager.GetItemFromCache(strCacheKey)
        Else
            Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
            GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects = _vueAccountProjectsTableAdapter.GetAssignedDataByEmployeeIdClientIdAndCompleted(AccountProjectId, AccountEmployeeId, AccountClientId, Completed, AccountId)
            CacheManager.AddAccountDataInCache(GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects, strCacheKey)
        End If
        Return GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjects(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, Optional ByVal IsTemplate As Boolean = False) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetAssignedAccountProjects = _vueAccountProjectsTableAdapter.GetAssignedAccountProjects(IsTemplate, AccountProjectId, AccountEmployeeId)
        Return GetAssignedAccountProjects
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByAccountEmployeeIdAndTimeEntryDate(ByVal AccountEmployeeId As Integer, ByVal StartDate As DateTime, ByVal EndDate As DateTime) As TimeLiveDataSet.AccountProjectDataTable
        Return Adapter.GetDataByAccountEmployeeId(AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByAccountEmployeeAndTimeEntryDate(ByVal AccountEmployeeId As Integer, ByVal StartDate As DateTime, ByVal EndDate As DateTime) As TimeLiveDataSet.AccountProjectDataTable
        Return Adapter.GetDataByAccountEmployeeAndTimeEntryDate(AccountEmployeeId, StartDate, EndDate)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByAccountProjectId(ByVal AccountProjectId As Integer) As TimeLiveDataSet.AccountProjectDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("AccountProjectDataTable", "GetAccountProjectsByAccountProjectId", "AccountProjectId=" & AccountProjectId)
        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAccountProjectsByAccountProjectId = CacheManager.GetItemFromCache(strCacheKey)
        Else
            GetAccountProjectsByAccountProjectId = Adapter.GetDataByAccountProjectId(AccountProjectId)
            CacheManager.AddAccountDataInCache(GetAccountProjectsByAccountProjectId, strCacheKey)
        End If
        Return GetAccountProjectsByAccountProjectId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountClientByAccountProjectId(ByVal AccountClientId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        Return _vueAccountProjectsTableAdapter.GetAccountClientByAccountProjectId(AccountClientId)
    End Function
    'GetAccountClientByAccountProjectIdandIsDisabled
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountClientByAccountProjectIdandIsDisabled(ByVal AccountClientId As Integer, ByVal AccountProjectId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        Return _vueAccountProjectsTableAdapter.GetAccountClientByAccountProjectIdandIsDisabled(AccountClientId, AccountProjectId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectByLastProjectCode(ByVal AccountId As Integer) As TimeLiveDataSet.AccountProjectCodeDataTable
        Dim _AccountProjectCodeTableAdapter As New AccountProjectCodeTableAdapter
        GetAccountProjectByLastProjectCode = _AccountProjectCodeTableAdapter.GetDataByLastProjectCode(AccountId)
        Return GetAccountProjectByLastProjectCode
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectByCheckProjectCode(ByVal AccountId As Integer, ByVal ProjectCode As String) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        Return _vueAccountProjectsTableAdapter.GetDataByAccountIdandProjectCode(AccountId, ProjectCode)
    End Function

    Public Sub UpdateProjectManagerAndTeamLeadPreferences(ByVal AccountProjectId As Integer, ByVal TeamLeadId As Integer, ByVal ProjectManagerId As Integer, Optional ByVal OldTeamLeadId As Integer = 0, Optional ByVal OldProjectManagerId As Integer = 0)
        Dim PreferencesBLL As New AccountEmployeeProjectPreferencesBLL
        If OldTeamLeadId = 0 And OldProjectManagerId = 0 Then
            PreferencesBLL.AddAccountEmployeeProjectPreference(TeamLeadId, AccountProjectId, True, True)
            PreferencesBLL.AddAccountEmployeeProjectPreference(ProjectManagerId, AccountProjectId, True, True)
        Else
            If TeamLeadId <> OldTeamLeadId Then
                PreferencesBLL.AddAccountEmployeeProjectPreference(TeamLeadId, AccountProjectId, True, True)
            End If
            If ProjectManagerId <> OldProjectManagerId Then
                PreferencesBLL.AddAccountEmployeeProjectPreference(ProjectManagerId, AccountProjectId, True, True)
            End If
        End If
    End Sub
    Public Sub AfterUpdate(Optional ByVal AccountProjectId As Integer = 0)
        'CacheManager.ClearCache("AccountProject", , True)
        Dim str As String = "AccountProjectId=" & AccountProjectId
        CacheManager.ClearCache("vueAccountProjectsDataTable", str, True)
        CacheManager.ClearCache("AccountProjectDataTable", str, True)
        Call New AccountPartyBLL().AfterUpdate()
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function AddAccountProject( _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountProjectTypeId As System.Nullable(Of Integer), _
                    ByVal AccountClientId As System.Nullable(Of Integer), _
                    ByVal AccountPartyContactId As Integer, _
                    ByVal AccountPartyDepartmentId As Integer, _
                    ByVal ProjectBillingTypeId As System.Nullable(Of Integer), _
                    ByVal ProjectName As String, _
                    ByVal ProjectDescription As String, _
                    ByVal StartDate As Date, _
                    ByVal Deadline As Date, _
                    ByVal ProjectStatusId As System.Nullable(Of Integer), _
                    ByVal LeaderEmployeeId As System.Nullable(Of Integer), _
                    ByVal ProjectManagerEmployeeId As System.Nullable(Of Integer), _
                    ByVal TimeSheetApprovalTypeId As System.Nullable(Of Integer), _
                    ByVal ExpenseApprovalTypeId As System.Nullable(Of Integer), _
                    ByVal EstimatedDuration As Double, _
                    ByVal EstimatedDurationUnit As String, _
                    ByVal ProjectCode As String, _
                    ByVal DefaultBillingRate As Decimal, _
                    ByVal ProjectBillingRateTypeId As System.Nullable(Of Integer), _
                    ByVal IsTemplate As Boolean, _
                    ByVal IsProject As Boolean, _
                    ByVal AccountProjectTemplateId As Integer, _
                    ByVal CreatedOn As DateTime, _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedOn As DateTime, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal Completed As Boolean, _
                    Optional ByVal CustomField1 As String = "", _
                    Optional ByVal CustomField2 As String = "", _
                    Optional ByVal CustomField3 As String = "", _
                    Optional ByVal CustomField4 As String = "", _
                    Optional ByVal CustomField5 As String = "", _
                    Optional ByVal CustomField6 As String = "", _
                    Optional ByVal CustomField7 As String = "", _
                    Optional ByVal CustomField8 As String = "", _
                    Optional ByVal CustomField9 As String = "", _
                    Optional ByVal CustomField10 As String = "", _
                    Optional ByVal CustomField11 As String = "", _
                    Optional ByVal CustomField12 As String = "", _
                    Optional ByVal CustomField13 As String = "", _
                    Optional ByVal CustomField14 As String = "", _
                    Optional ByVal CustomField15 As String = "" _
                          ) As Boolean

        ' Create a new ProductRow instance


        _AccountProjectTableAdapter = New AccountProjectTableAdapter

        Dim AccountProjects As New TimeLiveDataSet.AccountProjectDataTable
        Dim AccountProject As TimeLiveDataSet.AccountProjectRow = AccountProjects.NewAccountProjectRow

        With AccountProject
            .AccountId = AccountId
            .AccountProjectTypeId = AccountProjectTypeId
            .AccountClientId = AccountClientId
            .AccountPartyContactId = AccountPartyContactId
            .AccountPartyDepartmentId = AccountPartyDepartmentId
            .ProjectBillingTypeId = ProjectBillingTypeId
            .ProjectName = ProjectName
            .ProjectDescription = ProjectDescription
            .StartDate = StartDate
            .Deadline = Deadline
            .ProjectStatusId = ProjectStatusId
            .LeaderEmployeeId = LeaderEmployeeId
            .ProjectManagerEmployeeId = ProjectManagerEmployeeId
            If TimeSheetApprovalTypeId.Value = 0 Then
                .Item("TimeSheetApprovalTypeId") = System.DBNull.Value
            Else
                .TimeSheetApprovalTypeId = TimeSheetApprovalTypeId
            End If

            If ExpenseApprovalTypeId.Value = 0 Then
                .Item("ExpenseApprovalTypeId") = System.DBNull.Value
            Else
                .ExpenseApprovalTypeId = ExpenseApprovalTypeId
            End If

            .EstimatedDuration = EstimatedDuration
            .EstimatedDurationUnit = EstimatedDurationUnit
            .ProjectCode = ProjectCode
            .DefaultBillingRate = DefaultBillingRate
            .ProjectBillingRateTypeId = ProjectBillingRateTypeId
            .IsTemplate = IsTemplate
            If IsTemplate <> True Then
                .IsProject = True
            Else
                .IsProject = False
            End If
            .CreatedOn = Now
            .CreatedByEmployeeId = CreatedByEmployeeId
            .ModifiedOn = Now
            .ModifiedByEmployeeId = ModifiedByEmployeeId
            .IsDisabled = False
            If AccountProjectTemplateId <> 0 Then
                .AccountProjectTemplateId = AccountProjectTemplateId
            End If
            .Completed = Completed
            If CustomField1 <> "" Then
                .CustomField1 = CustomField1
            Else
                .Item("CustomField1") = System.DBNull.Value
            End If
            If CustomField2 <> "" Then
                .CustomField2 = CustomField2
            Else
                .Item("CustomField2") = System.DBNull.Value
            End If
            If CustomField3 <> "" Then
                .CustomField3 = CustomField3
            Else
                .Item("CustomField3") = System.DBNull.Value
            End If
            If CustomField4 <> "" Then
                .CustomField4 = CustomField4
            Else
                .Item("CustomField4") = System.DBNull.Value
            End If
            If CustomField5 <> "" Then
                .CustomField5 = CustomField5
            Else
                .Item("CustomField5") = System.DBNull.Value
            End If
            If CustomField6 <> "" Then
                .CustomField6 = CustomField6
            Else
                .Item("CustomField6") = System.DBNull.Value
            End If
            If CustomField7 <> "" Then
                .CustomField7 = CustomField7
            Else
                .Item("CustomField7") = System.DBNull.Value
            End If
            If CustomField8 <> "" Then
                .CustomField8 = CustomField8
            Else
                .Item("CustomField8") = System.DBNull.Value
            End If
            If CustomField9 <> "" Then
                .CustomField9 = CustomField9
            Else
                .Item("CustomField9") = System.DBNull.Value
            End If
            If CustomField10 <> "" Then
                .CustomField10 = CustomField10
            Else
                .Item("CustomField10") = System.DBNull.Value
            End If
            If CustomField11 <> "" Then
                .CustomField11 = CustomField11
            Else
                .Item("CustomField11") = System.DBNull.Value
            End If
            If CustomField12 <> "" Then
                .CustomField12 = CustomField12
            Else
                .Item("CustomField12") = System.DBNull.Value
            End If
            If CustomField13 <> "" Then
                .CustomField13 = CustomField13
            Else
                .Item("CustomField13") = System.DBNull.Value
            End If
            If CustomField14 <> "" Then
                .CustomField14 = CustomField14
            Else
                .Item("CustomField14") = System.DBNull.Value
            End If
            If CustomField15 <> "" Then
                .CustomField15 = CustomField15
            Else
                .Item("CustomField15") = System.DBNull.Value
            End If
        End With

        AccountProjects.AddAccountProjectRow(AccountProject)


        ' Add the new product
        Dim rowsAffected As Integer = Adapter.Update(AccountProjects)

        AfterUpdate()

        Dim AccountProjectMilestones As New AccountProjectMilestoneBLL
        Dim objAccountEMailNotificationPreference As New AccountEMailNotificationPreferenceBLL

        Dim NewId As Integer = Me.GetLastInsertedId
        If AccountProjectTemplateId = 0 Then
            AccountProjectMilestones.AddAccountProjectMilestone(AccountId, NewId, System.Web.HttpContext.GetGlobalResourceObject("TimeLive.Web", "Default Milestone"), Deadline, Date.Now, CreatedByEmployeeId, Date.Now, ModifiedByEmployeeId, "", False)
        End If
        Me.UpdateProjectManagerAndTeamLeadPreferences(NewId, LeaderEmployeeId, ProjectManagerEmployeeId)
        If AccountProjectTemplateId = 0 Then
            objAccountEMailNotificationPreference.InsertDefaultAccountProjectEMailNotificationPreference(NewId)
        End If
        If AccountProjectTemplateId = 0 Then
            Me.AddDefaultAccountProjectEmplyee(AccountId, NewId, ProjectBillingRateTypeId, LeaderEmployeeId, ProjectManagerEmployeeId)
        End If
        ' Return true if precisely one row was inserted, otherwise false
        Return rowsAffected = 1
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateAccountProject( _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountProjectTypeId As System.Nullable(Of Integer), _
                    ByVal AccountClientId As System.Nullable(Of Integer), _
                    ByVal AccountPartyContactId As Integer, _
                    ByVal AccountPartyDepartmentId As Integer, _
                    ByVal ProjectBillingTypeId As System.Nullable(Of Integer), _
                    ByVal ProjectName As String, _
                    ByVal ProjectDescription As String, _
                    ByVal StartDate As Date, _
                    ByVal DeadLine As Date, _
                    ByVal ProjectStatusId As System.Nullable(Of Integer), _
                    ByVal LeaderEmployeeId As System.Nullable(Of Integer), _
                    ByVal ProjectManagerEmployeeId As System.Nullable(Of Integer), _
                    ByVal TimeSheetApprovalTypeId As System.Nullable(Of Integer), _
                    ByVal ExpenseApprovalTypeId As System.Nullable(Of Integer), _
                    ByVal EstimatedDuration As Double, _
                    ByVal EstimatedDurationUnit As String, _
                    ByVal ProjectCode As String, _
                    ByVal DefaultBillingRate As Decimal, _
                    ByVal ProjectBillingRateTypeId As System.Nullable(Of Integer), _
                    ByVal IsTemplate As Boolean, _
                    ByVal IsProject As Boolean, _
                    ByVal AccountProjectTemplateId As Integer, _
                    ByVal CreatedOn As DateTime, _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedOn As DateTime, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal Original_AccountProjectId As Integer, _
                    ByVal IsDisabled As Boolean, _
                    ByVal Completed As Boolean, _
                    Optional ByVal CustomField1 As String = "", _
                    Optional ByVal CustomField2 As String = "", _
                    Optional ByVal CustomField3 As String = "", _
                    Optional ByVal CustomField4 As String = "", _
                    Optional ByVal CustomField5 As String = "", _
                    Optional ByVal CustomField6 As String = "", _
                    Optional ByVal CustomField7 As String = "", _
                    Optional ByVal CustomField8 As String = "", _
                    Optional ByVal CustomField9 As String = "", _
                    Optional ByVal CustomField10 As String = "", _
                    Optional ByVal CustomField11 As String = "", _
                    Optional ByVal CustomField12 As String = "", _
                    Optional ByVal CustomField13 As String = "", _
                    Optional ByVal CustomField14 As String = "", _
                    Optional ByVal CustomField15 As String = "" _
                      ) As Boolean
        Try


            ' Update the product record

            Dim AccountProjects As TimeLiveDataSet.AccountProjectDataTable = Adapter.GetDataByAccountProjectId(Original_AccountProjectId)
            Dim AccountProject As TimeLiveDataSet.AccountProjectRow = AccountProjects.Rows(0)

            Me.UpdateProjectManagerAndTeamLeadPreferences(Original_AccountProjectId, LeaderEmployeeId, ProjectManagerEmployeeId, AccountProject.LeaderEmployeeId, AccountProject.ProjectManagerEmployeeId)


            With AccountProject
                '.AccountId = AccountId
                .AccountProjectTypeId = AccountProjectTypeId
                .AccountClientId = AccountClientId
                .AccountPartyContactId = AccountPartyContactId
                .AccountPartyDepartmentId = AccountPartyDepartmentId
                .ProjectBillingTypeId = ProjectBillingTypeId
                .ProjectName = ProjectName
                .ProjectDescription = ProjectDescription
                .StartDate = StartDate
                .Deadline = DeadLine
                .ProjectStatusId = ProjectStatusId
                .LeaderEmployeeId = LeaderEmployeeId
                .ProjectManagerEmployeeId = ProjectManagerEmployeeId

                If TimeSheetApprovalTypeId.Value = 0 Then
                    .Item("TimeSheetApprovalTypeId") = DBNull.Value
                Else
                    .TimeSheetApprovalTypeId = TimeSheetApprovalTypeId
                End If

                If ExpenseApprovalTypeId.Value = 0 Then
                    .Item("ExpenseApprovalTypeId") = DBNull.Value
                Else
                    .ExpenseApprovalTypeId = ExpenseApprovalTypeId
                End If

                .EstimatedDuration = EstimatedDuration
                .EstimatedDurationUnit = EstimatedDurationUnit
                .ProjectCode = ProjectCode
                .DefaultBillingRate = DefaultBillingRate
                If ProjectBillingRateTypeId.HasValue Then
                    .ProjectBillingRateTypeId = ProjectBillingRateTypeId
                End If
                .IsTemplate = IsTemplate
                .IsProject = IsProject
                If AccountProjectTemplateId <> 0 Then
                    .AccountProjectTemplateId = AccountProjectTemplateId
                End If
                .ModifiedOn = Now
                .ModifiedByEmployeeId = ModifiedByEmployeeId
                .IsDisabled = IsDisabled
                .Completed = Completed
                If CustomField1 <> "" Then
                    .CustomField1 = CustomField1
                Else
                    .Item("CustomField1") = System.DBNull.Value
                End If
                If CustomField2 <> "" Then
                    .CustomField2 = CustomField2
                Else
                    .Item("CustomField2") = System.DBNull.Value
                End If
                If CustomField3 <> "" Then
                    .CustomField3 = CustomField3
                Else
                    .Item("CustomField3") = System.DBNull.Value
                End If
                If CustomField4 <> "" Then
                    .CustomField4 = CustomField4
                Else
                    .Item("CustomField4") = System.DBNull.Value
                End If
                If CustomField5 <> "" Then
                    .CustomField5 = CustomField5
                Else
                    .Item("CustomField5") = System.DBNull.Value
                End If
                If CustomField6 <> "" Then
                    .CustomField6 = CustomField6
                Else
                    .Item("CustomField6") = System.DBNull.Value
                End If
                If CustomField7 <> "" Then
                    .CustomField7 = CustomField7
                Else
                    .Item("CustomField7") = System.DBNull.Value
                End If
                If CustomField8 <> "" Then
                    .CustomField8 = CustomField8
                Else
                    .Item("CustomField8") = System.DBNull.Value
                End If
                If CustomField9 <> "" Then
                    .CustomField9 = CustomField9
                Else
                    .Item("CustomField9") = System.DBNull.Value
                End If
                If CustomField10 <> "" Then
                    .CustomField10 = CustomField10
                Else
                    .Item("CustomField10") = System.DBNull.Value
                End If
                If CustomField11 <> "" Then
                    .CustomField11 = CustomField11
                Else
                    .Item("CustomField11") = System.DBNull.Value
                End If
                If CustomField12 <> "" Then
                    .CustomField12 = CustomField12
                Else
                    .Item("CustomField12") = System.DBNull.Value
                End If
                If CustomField13 <> "" Then
                    .CustomField13 = CustomField13
                Else
                    .Item("CustomField13") = System.DBNull.Value
                End If
                If CustomField14 <> "" Then
                    .CustomField14 = CustomField14
                Else
                    .Item("CustomField14") = System.DBNull.Value
                End If
                If CustomField15 <> "" Then
                    .CustomField15 = CustomField15
                Else
                    .Item("CustomField15") = System.DBNull.Value
                End If
            End With


            Dim rowsAffected As Integer = Adapter.Update(AccountProject)


            AfterUpdate(Original_AccountProjectId)

            ' Return true if precisely one row was updated, otherwise false
            Return rowsAffected = 1
        Catch ex As Exception
            Throw ex
        End Try
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteAccountProject(ByVal Original_AccountProjectId As Integer) As Boolean
        'Call New AccountProjectRoleBLL().DeleteAccountProjectRolesByAccountProjectId(Original_AccountProjectId)
        Dim AccountProjects As TimeLiveDataSet.AccountProjectDataTable = Adapter.GetDataByAccountProjectId(Original_AccountProjectId)
        Dim AccountProject As TimeLiveDataSet.AccountProjectRow = AccountProjects.Rows(0)
        With AccountProject
            .IsDeleted = True
        End With
        Dim rowsAffected As Integer = Adapter.Update(AccountProject)
        AfterUpdate()
        ' Return true if precisely one row was deleted, otherwise false
        Return rowsAffected = 1
    End Function

    Public Shared Function GetProjectBillingRateTypeId(ByVal AccountProjectId As Integer) As Object

        Dim dtAccountProject As TimeLiveDataSet.AccountProjectDataTable
        dtAccountProject = New AccountProjectBLL().GetAccountProjectsByAccountProjectId(AccountProjectId)

        If dtAccountProject.Rows.Count > 0 Then

            Dim nProjectBillingRateTypeId As Object = CType(dtAccountProject.Rows(0), TimeLiveDataSet.AccountProjectRow).Item("ProjectBillingRateTypeId")
            If IsDBNull(nProjectBillingRateTypeId) Then
                Return 1 ' Use employee own billing rate
            Else
                Return nProjectBillingRateTypeId
            End If
        Else
            Return 1 ' Use employee own billing rate
        End If
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateProjectDescription(ByVal ProjectDescription As String, ByVal Original_AccountProjectId As Integer) As Boolean
        Dim AccountProjects As TimeLiveDataSet.AccountProjectDataTable = Adapter.GetDataByAccountProjectId(Original_AccountProjectId)
        Dim AccountProject As TimeLiveDataSet.AccountProjectRow = AccountProjects.Rows(0)

        With AccountProject
            .ProjectDescription = ProjectDescription
        End With

        Dim rowsAffected As Integer = Adapter.Update(AccountProject)
        ' Return true if precisely one row was updated, otherwise false

        Return rowsAffected = 1

    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByProjectCode(ByVal ProjectCode As String) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetAccountProjectsByProjectCode = _vueAccountProjectsTableAdapter.GetDataByProjectCode(ProjectCode)
        Return GetAccountProjectsByProjectCode
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountProjectsByAccountProjectId(ByVal AccountProjectId As String) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetvueAccountProjectsByAccountProjectId = _vueAccountProjectsTableAdapter.GetDataByAccountProjectId(AccountProjectId)
        Return GetvueAccountProjectsByAccountProjectId
    End Function
    Public Shared Sub SetDataForProjectDropdown(ByVal SystemSecurtiyCategoryPageId As Integer, ByVal DropDownName As DropDownList)
        'Dim bllAccountPagePermission As New AccountPagePermissionBLL
        'Dim dtAccountPagePermission As TimeLiveDataSet.vueAccountPagePermissionDataTable
        ''dtAccountPagePermission = bllAccountPagePermission.GetAccountPagePermissionViewByAccountId(DBUtilities.GetSessionAccountId, 5)
        'Dim drAccountPagePermission As TimeLiveDataSet.vueAccountPagePermissionRow = dtAccountPagePermission.Rows(0)
        Dim objDataView As New DataView()
        Dim bllAccountProject As New AccountProjectBLL
        Dim dtvueAccountProject As TimeLiveDataSet.vueAccountProjectsDataTable
        If AccountPagePermissionBLL.IsPageHasPermissionOfShowAllData(SystemSecurtiyCategoryPageId) = True Then
            dtvueAccountProject = bllAccountProject.GetAccountProjectsForGridView(DBUtilities.GetSessionAccountId, False)

        ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyData(SystemSecurtiyCategoryPageId) = True Then
            dtvueAccountProject = bllAccountProject.GetAssignedAccountProjectsByAccountEmployeeId(DBUtilities.GetSessionAccountEmployeeId)
            'If DropDownName.Items.Count > 0 Then
            'DropDownName.Items.RemoveAt(0)
            'End If
        ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyTeamsData(SystemSecurtiyCategoryPageId) = True Then
            dtvueAccountProject = bllAccountProject.GetProjectByLeaderEmployeeId(DBUtilities.GetSessionAccountEmployeeId)
            'If DropDownName.Items.Count > 0 Then
            'DropDownName.Items.RemoveAt(0)
            'End If
        ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyProjectsData(SystemSecurtiyCategoryPageId) = True Then
            dtvueAccountProject = bllAccountProject.GetProjectByProjectManagerEmployeeId(DBUtilities.GetSessionAccountEmployeeId)
            'If DropDownName.Items.Count > 0 Then
            'DropDownName.Items.RemoveAt(0)
            'End If
        Else
            dtvueAccountProject = bllAccountProject.GetAssignedAccountProjectsByAccountEmployeeId(DBUtilities.GetSessionAccountEmployeeId)
            'If DropDownName.Items.Count > 0 Then
            'DropDownName.Items.RemoveAt(0)
            'End If
        End If


        objDataView = dtvueAccountProject.DefaultView
        objDataView.Sort = "ProjectName"
        DropDownName.DataSource = objDataView
        DropDownName.DataBind()

    End Sub
    Public Sub AddDefaultAccountProjectEmplyee(ByVal AccountId As Integer, ByVal AccountProjectId As Integer, ByVal ProjectBillingRateTypeId As System.Nullable(Of Integer), ByVal LeaderEmployeeId As System.Nullable(Of Integer), ByVal ProjectManagerEmployeeId As System.Nullable(Of Integer))
        Dim objAccountWorkType As New AccountWorkTypeBLL
        Dim dtWorkType As TimeLiveDataSet.AccountWorkTypeDataTable = objAccountWorkType.GetAccountWorkTypesByAccountId(AccountId)
        Dim drWorkType As TimeLiveDataSet.AccountWorkTypeRow
        If dtWorkType.Rows.Count > 0 Then
            drWorkType = dtWorkType.Rows(0)

            Dim objAccountProjectEmployeeBLL As New AccountProjectEmployeeBLL
            Dim objAccountBillingRate As New AccountBillingRateBLL

            If LeaderEmployeeId.Value <> 0 Then
                Dim dtProjectEmployee As TimeLiveDataSet.vueAccountProjectEmployeeDataTable = objAccountProjectEmployeeBLL.GetAccountProjectEmployeesForSelectionByAccountEmployeeId(AccountId, AccountProjectId, drWorkType.AccountWorkTypeId, LeaderEmployeeId)
                Dim drProjectEmployee As TimeLiveDataSet.vueAccountProjectEmployeeRow = dtProjectEmployee.Rows(0)
                If Not ProjectBillingRateTypeId.Value = 2 Then
                    objAccountProjectEmployeeBLL.AddAccountProjectEmployee(AccountId, AccountProjectId, LeaderEmployeeId, Nothing, Nothing)
                    If ProjectBillingRateTypeId.Value = 3 Then
                        For Each drWorkType In dtWorkType.Rows
                            objAccountBillingRate.AddAccountBillingRate(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, 0, 0, 0, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeBillingRate")), drProjectEmployee.Item("EmployeeBillingRate"), 0), Date.Now.Date, Date.Now.AddYears(1).Date, drWorkType.AccountWorkTypeId, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeEmployeeRate")), drProjectEmployee.Item("EmployeeEmployeeRate"), 0), IIf(Not IsDBNull(drProjectEmployee.Item("BillingRateCurrencyId")), drProjectEmployee.Item("BillingRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId), IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeRateCurrencyId")), drProjectEmployee.Item("EmployeeRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId))
                            objAccountProjectEmployeeBLL.UpdateAccountProjectEmployee(AccountId, AccountProjectId, LeaderEmployeeId, Nothing, objAccountBillingRate.GetLastInsertedId, objAccountProjectEmployeeBLL.GetLastInsertedId)
                            Me.UpdateWorkTypeBillingRateOfProjectEmployee(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, objAccountBillingRate.GetLastInsertedId, drWorkType.AccountWorkTypeId)
                        Next
                    End If
                End If
            End If

            If ProjectManagerEmployeeId.Value <> 0 And LeaderEmployeeId.Value <> ProjectManagerEmployeeId.Value Then
                Dim dtProjectEmployee As TimeLiveDataSet.vueAccountProjectEmployeeDataTable = objAccountProjectEmployeeBLL.GetAccountProjectEmployeesForSelectionByAccountEmployeeId(AccountId, AccountProjectId, drWorkType.AccountWorkTypeId, ProjectManagerEmployeeId)
                Dim drProjectEmployee As TimeLiveDataSet.vueAccountProjectEmployeeRow = dtProjectEmployee.Rows(0)
                If Not ProjectBillingRateTypeId.Value = 2 Then
                    objAccountProjectEmployeeBLL.AddAccountProjectEmployee(AccountId, AccountProjectId, ProjectManagerEmployeeId, Nothing, Nothing)
                    If ProjectBillingRateTypeId.Value = 3 Then
                        For Each drWorkType In dtWorkType.Rows
                            objAccountBillingRate.AddAccountBillingRate(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, 0, 0, 0, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeBillingRate")), drProjectEmployee.Item("EmployeeBillingRate"), 0), Date.Now.Date, Date.Now.AddYears(1).Date, drWorkType.AccountWorkTypeId, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeEmployeeRate")), drProjectEmployee.Item("EmployeeEmployeeRate"), 0), IIf(Not IsDBNull(drProjectEmployee.Item("BillingRateCurrencyId")), drProjectEmployee.Item("BillingRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId), IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeRateCurrencyId")), drProjectEmployee.Item("EmployeeRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId))
                            objAccountProjectEmployeeBLL.UpdateAccountProjectEmployee(AccountId, AccountProjectId, ProjectManagerEmployeeId, Nothing, objAccountBillingRate.GetLastInsertedId, objAccountProjectEmployeeBLL.GetLastInsertedId)
                            Me.UpdateWorkTypeBillingRateOfProjectEmployee(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, objAccountBillingRate.GetLastInsertedId, drWorkType.AccountWorkTypeId)
                        Next
                    End If
                End If
            End If
            Dim AccountEmployeeId As Integer = DBUtilities.GetSessionAccountEmployeeId
            If AccountEmployeeId <> LeaderEmployeeId.Value And AccountEmployeeId <> ProjectManagerEmployeeId.Value Then
                Dim dtProjectEmployee As TimeLiveDataSet.vueAccountProjectEmployeeDataTable = objAccountProjectEmployeeBLL.GetAccountProjectEmployeesForSelectionByAccountEmployeeId(AccountId, AccountProjectId, drWorkType.AccountWorkTypeId, AccountEmployeeId)
                Dim drProjectEmployee As TimeLiveDataSet.vueAccountProjectEmployeeRow = dtProjectEmployee.Rows(0)
                If Not ProjectBillingRateTypeId.Value = 2 Then
                    objAccountProjectEmployeeBLL.AddAccountProjectEmployee(AccountId, AccountProjectId, AccountEmployeeId, Nothing, Nothing)
                    If ProjectBillingRateTypeId.Value = 3 Then
                        For Each drWorkType In dtWorkType.Rows
                            objAccountBillingRate.AddAccountBillingRate(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, 0, 0, 0, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeBillingRate")), drProjectEmployee.Item("EmployeeBillingRate"), 0), Date.Now.Date, Date.Now.AddYears(1).Date, drWorkType.AccountWorkTypeId, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeEmployeeRate")), drProjectEmployee.Item("EmployeeEmployeeRate"), 0), IIf(Not IsDBNull(drProjectEmployee.Item("BillingRateCurrencyId")), drProjectEmployee.Item("BillingRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId), IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeRateCurrencyId")), drProjectEmployee.Item("EmployeeRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId))
                            objAccountProjectEmployeeBLL.UpdateAccountProjectEmployee(AccountId, AccountProjectId, AccountEmployeeId, Nothing, objAccountBillingRate.GetLastInsertedId, objAccountProjectEmployeeBLL.GetLastInsertedId)
                            Me.UpdateWorkTypeBillingRateOfProjectEmployee(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, objAccountBillingRate.GetLastInsertedId, drWorkType.AccountWorkTypeId)
                        Next
                    End If
                End If
            End If
        End If

    End Sub
    Public Sub UpdateWorkTypeBillingRateOfProjectEmployee(ByVal AccountId As Integer, ByVal SystemBillingRateTypeId As Integer, ByVal AccountProjectEmployeeId As Integer, ByVal AccountBillingRateId As Integer, ByVal AccountWorkTypeId As Integer)

        Dim objAccountWorkTypeBillingRate As New AccountWorkTypeBLL
        Dim objAccountProjectEmployee As New AccountProjectEmployeeBLL

        Dim dtAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateDataTable = objAccountWorkTypeBillingRate.GetEmployeeOwnWorkTypeBillingRate(AccountId, SystemBillingRateTypeId, AccountProjectEmployeeId, AccountWorkTypeId)
        Dim drAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateRow

        If objAccountProjectEmployee.IfWorkTypeBillingRateExistOfProjectEmployee(AccountId, SystemBillingRateTypeId, AccountProjectEmployeeId, AccountWorkTypeId) <> True Then
            objAccountWorkTypeBillingRate.AddAccountWorkTypeBillingRate(AccountId, SystemBillingRateTypeId, 0, AccountProjectEmployeeId, 0, 0, AccountBillingRateId, AccountWorkTypeId)
        Else
            If dtAccountWorkTypeBillingRate.Rows.Count > 0 Then
                drAccountWorkTypeBillingRate = dtAccountWorkTypeBillingRate.Rows(0)
                objAccountWorkTypeBillingRate.UpdateAccountWorkTypeBillingRate(AccountId, SystemBillingRateTypeId, 0, AccountProjectEmployeeId, 0, 0, AccountBillingRateId, AccountWorkTypeId, drAccountWorkTypeBillingRate.AccountWorkTypeBillingRateId)
            End If
        End If

    End Sub
    Public Shared Function IsAllowProjectNONE(ByVal AccountReportId As Guid)
        If LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "5ad7c2ee-4cbd-42a7-a4ff-394beaa47cf8" Then
            Return True
        ElseIf LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "3a080202-6842-4eca-8c79-a945978810b4" Then
            Return True
        ElseIf LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "07c1c8c9-c148-40c0-a700-af2fb1a0a149" Then
            Return True
        End If
        Return False
    End Function
    Public Shared Sub SetDataForProjectDropdownForCustomaizeReport(ByVal DropDownName As DropDownList, ByVal AccountReportId As Guid, ByVal AccountClientId As Integer)
        Dim ReportPermission As New ObjectPermissionBLL
        Dim objDataView As New DataView()
        Dim bllAccountProject As New AccountProjectBLL
        Dim dtvueAccountProject As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim WhereClause As String = ""
        Dim IsReportHasNoPermission As Boolean = False
        Dim chk As Boolean

        If DropDownName.Items(0).Value = 0 Then
            chk = True
        End If
        DropDownName.Items.Clear()
        If chk = True Then
            AddDropDownItem(ResourceHelper.GetFromResource("<All>"), 0, DropDownName)
        End If
        If IsAllowProjectNONE(AccountReportId) Then
            AddDropDownItem(ResourceHelper.GetFromResource("<None>"), -1, DropDownName)
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnApproval(AccountReportId, True) = True Then
            If LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "ad0ea79d-c1d7-40ed-a7c4-03cc4f565873" Or LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "e3803dc0-49fd-4fc8-b414-ea264ffe85aa" Then
                SetProjectOwnApprovalPermission(DropDownName, AccountReportId)
                Return
            End If
        End If

        If ReportPermission.IsReportHasPermissionOfAllowAllUser(AccountReportId, True) Then
            WhereClause = bllAccountProject.GetAdministratorWhereClause(AccountClientId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnReport(AccountReportId, True) Then
            WhereClause = WhereClause & bllAccountProject.GetMyOwnWhereClause(0, AccountClientId, DBUtilities.GetSessionAccountEmployeeId, WhereClause)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnTeam(AccountReportId, True) Then
            WhereClause = WhereClause & bllAccountProject.GetTeamLeadWhereClause(WhereClause, AccountClientId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnSubOrdinates(AccountReportId, True) Then
            WhereClause = WhereClause & bllAccountProject.GetEmployeeManagerWhereClause(WhereClause, AccountClientId, DBUtilities.GetSessionAccountEmployeeId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnProject(AccountReportId, True) Then
            WhereClause = WhereClause & bllAccountProject.GetProjectManagerWhereClause(WhereClause, AccountClientId)
            IsReportHasNoPermission = True
        End If

        If IsReportHasNoPermission = False Then
            dtvueAccountProject = bllAccountProject.GetAssignedAccountProjectsByAccountEmployeeIdForReport(DBUtilities.GetSessionAccountEmployeeId)
        Else
            Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
            dtvueAccountProject = _vueAccountProjectsTableAdapter.GetvueAccountProjectsForReport(WhereClause)
        End If


        objDataView = dtvueAccountProject.DefaultView
        objDataView.Sort = "ProjectName"
        DropDownName.DataTextField = "ProjectName"
        DropDownName.DataValueField = "AccountProjectId"
        DropDownName.DataSource = objDataView
        DropDownName.DataBind()

    End Sub
    Public Shared Sub SetProjectOwnApprovalPermission(ByVal DropdownName As DropDownList, ByVal AccountReportId As Guid)
        Dim ReportFiler As New ReportFilterBLL
        Dim objDataView As New DataView()
        Dim dt As New DataTable
        If LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "ad0ea79d-c1d7-40ed-a7c4-03cc4f565873" Then
            Dim dtvueApprovedBy As dsReportFilterSource.ApprovedByTimeEntryFilterDataTable
            dtvueApprovedBy = ReportFiler.GetApprovalProjectByAccountId(DBUtilities.GetSessionAccountId, DBUtilities.GetSessionAccountEmployeeId)
            dt = dtvueApprovedBy
        ElseIf LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "e3803dc0-49fd-4fc8-b414-ea264ffe85aa" Then
            Dim dtvueApprovedBy As dsReportFilterSource.ApprovedByExpenseFilterDataTable
            dtvueApprovedBy = ReportFiler.GetApprovalProjectByAccountIdForExpense(DBUtilities.GetSessionAccountId, DBUtilities.GetSessionAccountEmployeeId)
            dt = dtvueApprovedBy
        End If
        objDataView = dt.DefaultView
        objDataView.Sort = "ProjectName"
        DropdownName.DataTextField = "ProjectName"
        DropdownName.DataValueField = "AccountProjectId"
        DropdownName.DataSource = objDataView
        DropdownName.DataBind()
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountClientId(ByVal AccountClientId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetAssignedAccountProjectsByAccountClientId = _vueAccountProjectsTableAdapter.GetDataByAccountClientId(AccountClientId)
        Return GetAssignedAccountProjectsByAccountClientId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAssignedAccountProjectsByAccountClientIdAndAccountEmployeeId(ByVal AccountId As Integer, ByVal AccountClientId As Integer, ByVal AccountEmployeeId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetAssignedAccountProjectsByAccountClientIdAndAccountEmployeeId = _vueAccountProjectsTableAdapter.GetAssignedDataByAccountClientIdAndAccountEmployeeIdForReport(AccountId, AccountClientId, AccountEmployeeId)
        Return GetAssignedAccountProjectsByAccountClientIdAndAccountEmployeeId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByAccountIdForReport(ByVal AccountId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetAccountProjectsByAccountIdForReport = _vueAccountProjectsTableAdapter.GetDataByAccountIdForReport(AccountId)
        Return GetAccountProjectsByAccountIdForReport
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectByAccountIdandAccountClientId(ByVal AccountId As Integer, ByVal AccountClientId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        Dim _vueAccountProjectsTableAdapter As New vueAccountProjectsTableAdapter
        GetAccountProjectByAccountIdandAccountClientId = _vueAccountProjectsTableAdapter.GetDataByAccountIdandAccountClientId(AccountId, AccountClientId)
        Return GetAccountProjectByAccountIdandAccountClientId
    End Function
    Public Shared Sub AddDropDownItem(ByVal Text As String, ByVal value As String, ByVal ddl As DropDownList)
        Dim item As New System.Web.UI.WebControls.ListItem
        ddl.AppendDataBoundItems = True
        item.Text = Text
        item.Value = value
        ddl.Items.Add(item)
    End Sub
    Public Function GetMyOwnWhereClause(ByVal AccountId As Integer, ByVal AccountClientId As Integer, ByVal AccountEmployeeId As Integer, ByVal WhereClause As String) As String
        If WhereClause = "" Then
            If AccountClientId <> 0 Then
                Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsDisabled <> 1) And (IsTemplate <> 1) AND (AccountClientId = " & AccountClientId & ") AND (AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId = " & AccountEmployeeId & ")))) "
            Else
                Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsDisabled <> 1) And (IsTemplate <> 1) AND (AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId = " & AccountEmployeeId & ")))) "
            End If
        Else
            If AccountClientId <> 0 Then
                Return " OR ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsDisabled <> 1) And (IsTemplate <> 1) AND (AccountClientId = " & AccountClientId & ") AND (AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId = " & AccountEmployeeId & ")))) "
            Else
                Return " OR ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsDisabled <> 1) And (IsTemplate <> 1) AND (AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId = " & AccountEmployeeId & ")))) "
            End If
        End If
    End Function
    Public Function GetTeamLeadWhereClause(ByVal whereclause As String, ByVal AccountClientId As Integer) As String
        If whereclause = "" Then
            If AccountClientId <> 0 Then
                Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsTemplate <> 1) AND (AccountClientId = " & AccountClientId & ") AND (LeaderEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ") AND (IsDisabled <> 1)) "
            Else
                Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsTemplate <> 1) AND (LeaderEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ") AND (IsDisabled <> 1)) "
            End If
        Else
            If AccountClientId <> 0 Then
                Return " OR ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsTemplate <> 1) AND (AccountClientId = " & AccountClientId & ") AND (LeaderEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ") AND (IsDisabled <> 1)) "
            Else
                Return " OR ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsTemplate <> 1) AND (LeaderEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ") AND (IsDisabled <> 1)) "
            End If

        End If
    End Function
    Public Function GetProjectManagerWhereClause(ByVal whereclause As String, ByVal AccountClientId As Integer) As String
        If whereclause = "" Then
            If AccountClientId <> 0 Then
                Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsTemplate <> 1) AND (AccountClientId = " & AccountClientId & ") AND (ProjectManagerEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ") AND (IsDisabled <> 1)) "
            Else
                Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsTemplate <> 1) AND (ProjectManagerEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ") AND (IsDisabled <> 1)) "
            End If
        Else
            If AccountClientId <> 0 Then
                Return " OR ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsTemplate <> 1) AND (AccountClientId = " & AccountClientId & ") AND (ProjectManagerEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ") AND (IsDisabled <> 1)) "
            Else
                Return " OR ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsTemplate <> 1) AND (ProjectManagerEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ") AND (IsDisabled <> 1)) "
            End If
        End If
    End Function
    Public Function GetAdministratorWhereClause(ByVal AccountClientId As Integer) As String
        If AccountClientId = 0 Then
            Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (AccountId = " & DBUtilities.GetSessionAccountId & ") AND (IsTemplate <> 1) AND (IsDisabled <> 1)) "
        Else
            Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (AccountClientId = " & AccountClientId & ") AND (IsTemplate <> 1) AND (IsDisabled <> 1)) "
        End If
    End Function
    Public Function GetEmployeeManagerWhereClause(ByVal whereclause As String, ByVal AccountClientId As Integer, ByVal AccountEmployeeId As Integer) As String
        If whereclause = "" Then
            If AccountClientId <> 0 Then
                Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsDisabled <> 1) And (IsTemplate <> 1) AND (AccountClientId = " & AccountClientId & ") AND (AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId IN (Select AccountEmployeeId FROM AccountEmployee WHERE EmployeeManagerId = " & AccountEmployeeId & " )))))"
            Else
                Return " WHERE ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsDisabled <> 1) And (IsTemplate <> 1) AND (AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId IN (Select AccountEmployeeId FROM AccountEmployee WHERE EmployeeManagerId = " & AccountEmployeeId & " )))))"
            End If
        Else
            If AccountClientId <> 0 Then
                Return " OR ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsDisabled <> 1) And (IsTemplate <> 1) AND (AccountClientId = " & AccountClientId & ") AND (AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId IN (Select AccountEmployeeId FROM AccountEmployee WHERE EmployeeManagerId = " & AccountEmployeeId & " )))))"
            Else
                Return " OR ((IsDeleted <> 1 Or IsDeleted Is NULL) And (IsDeletedClient <> 1 Or IsDeletedClient Is NULL) And (IsDisabled <> 1) And (IsTemplate <> 1) AND (AccountProjectId IN (SELECT AccountProjectId FROM AccountProjectEmployee WHERE (AccountEmployeeId IN (Select AccountEmployeeId FROM AccountEmployee WHERE EmployeeManagerId = " & AccountEmployeeId & " )))))"
            End If
        End If
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsForMobile(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal AccountClientId As Integer, ByVal AccountId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        If DBUtilities.GetShowClientInTimesheet Then
            GetAccountProjectsForMobile = GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects(AccountProjectId, AccountEmployeeId, AccountClientId, LocaleUtilitiesBLL.IsShowCompletedProjectsInTimeSheet, AccountId)
        Else
            GetAccountProjectsForMobile = GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient(AccountProjectId, AccountEmployeeId, LocaleUtilitiesBLL.IsShowCompletedProjectsInTimeSheet, False, AccountId)
        End If
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsForTimer(ByVal AccountProjectId As Integer, ByVal AccountEmployeeId As Integer, ByVal AccountClientId As Integer, ByVal AccountId As Integer) As TimeLiveDataSet.vueAccountProjectsDataTable
        GetAccountProjectsForTimer = GetAssignedAccountProjectsByAccountEmployeeIdAndAccountClientIdForProjects(AccountProjectId, AccountEmployeeId, AccountClientId, LocaleUtilitiesBLL.IsShowCompletedProjectsInTimeSheet, AccountId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountProjectsByProjectName(ByVal AccountId As Integer, ByVal ProjectName As String) As TimeLiveDataSet.AccountProjectDataTable
        GetAccountProjectsByProjectName = Adapter.GetDataByAccountIdAndProjectName(ProjectName, AccountId)
        Return GetAccountProjectsByProjectName
    End Function
    Public Sub UpdateCustomFieldInProject(CustomFieldColumnName As String, AccountId As Integer)
        Adapter.UpdateProjectCustomFieldByCustomFieldId(CustomFieldColumnName, AccountId)
    End Sub
    Public Sub AddAccountProjectEmplyeeForTemplate(ByVal AccountId As Integer)
        Dim LeaderEmployeeId As Integer
        Dim ProjectManagerEmployeeId As Integer
        Dim AdministratorId As Integer
        Dim ProjectBillingRateTypeId As Integer
        Dim ExpenseApprovalTypeId As Integer
        Dim TimesheetApprovalTypeId As Integer
        Dim objAccountWorkType As New AccountWorkTypeBLL
        Dim dtWorkType As TimeLiveDataSet.AccountWorkTypeDataTable = objAccountWorkType.GetAccountWorkTypesByAccountId(AccountId)
        Dim drWorkType As TimeLiveDataSet.AccountWorkTypeRow
        If dtWorkType.Rows.Count > 0 Then
            drWorkType = dtWorkType.Rows(0)

            Dim objAccountProjectEmployeeBLL As New AccountProjectEmployeeBLL
            Dim ObjProjectBLL As New AccountProjectBLL
            Dim objAccountBillingRate As New AccountBillingRateBLL


            Dim dtProject As TimeLiveDataSet.AccountProjectDataTable = ObjProjectBLL.GetAccountProjectsByAccountProjectId(Me.GetLastInsertedId)
            Dim drProject As TimeLiveDataSet.AccountProjectRow = dtProject.Rows(0)

            If dtProject.Rows.Count > 0 Then
                drProject = dtProject.Rows(0)
                LeaderEmployeeId = drProject.LeaderEmployeeId
                ProjectManagerEmployeeId = drProject.ProjectManagerEmployeeId
                ProjectBillingRateTypeId = drProject.ProjectBillingRateTypeId
                If Not IsDBNull(drProject.Item("TimeSheetApprovalTypeId")) Then
                    TimesheetApprovalTypeId = drProject.TimeSheetApprovalTypeId
                End If
                If Not IsDBNull(drProject.Item("ExpenseApprovalTypeId")) Then
                    ExpenseApprovalTypeId = drProject.ExpenseApprovalTypeId
                End If

            End If

            Dim dtprojectEmployee As TimeLiveDataSet.vueAccountProjectEmployeeDataTable = objAccountProjectEmployeeBLL.GetAccountProjectEmployeesForSelectionByAccountEmployeeId(DBUtilities.GetSessionAccountId, Me.GetLastInsertedId, drWorkType.AccountWorkTypeId, LeaderEmployeeId)
            Dim drProjectEmployee As TimeLiveDataSet.vueAccountProjectEmployeeRow = dtprojectEmployee.Rows(0)

            If dtprojectEmployee.Rows.Count > 0 Then
                If IsDBNull(drProjectEmployee.Item("AccountProjectEmployeeId")) Then
                    If Not ProjectBillingRateTypeId = 2 Then
                        objAccountProjectEmployeeBLL.AddAccountProjectEmployee(AccountId, Me.GetLastInsertedId, LeaderEmployeeId, Nothing, Nothing)
                        If ProjectBillingRateTypeId = 3 Then
                            For Each drWorkType In dtWorkType.Rows
                                objAccountBillingRate.AddAccountBillingRate(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, 0, 0, 0, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeBillingRate")), drProjectEmployee.Item("EmployeeBillingRate"), 0), Date.Now.Date, Date.Now.AddYears(1).Date, drWorkType.AccountWorkTypeId, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeEmployeeRate")), drProjectEmployee.Item("EmployeeEmployeeRate"), 0), IIf(Not IsDBNull(drProjectEmployee.Item("BillingRateCurrencyId")), drProjectEmployee.Item("BillingRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId), IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeRateCurrencyId")), drProjectEmployee.Item("EmployeeRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId))
                                objAccountProjectEmployeeBLL.UpdateAccountProjectEmployee(AccountId, Me.GetLastInsertedId, LeaderEmployeeId, Nothing, objAccountBillingRate.GetLastInsertedId, objAccountProjectEmployeeBLL.GetLastInsertedId)
                                Me.UpdateWorkTypeBillingRateOfProjectEmployee(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, objAccountBillingRate.GetLastInsertedId, drWorkType.AccountWorkTypeId)
                            Next
                        End If
                    End If
                End If
            End If

            Dim dtprojectEmployeePM As TimeLiveDataSet.vueAccountProjectEmployeeDataTable = objAccountProjectEmployeeBLL.GetAccountProjectEmployeesForSelectionByAccountEmployeeId(DBUtilities.GetSessionAccountId, Me.GetLastInsertedId, drWorkType.AccountWorkTypeId, ProjectManagerEmployeeId)
            Dim drProjectEmployeePM As TimeLiveDataSet.vueAccountProjectEmployeeRow = dtprojectEmployeePM.Rows(0)

            If dtprojectEmployeePM.Rows.Count > 0 Then
                If IsDBNull(drProjectEmployeePM.Item("AccountProjectEmployeeId")) Then
                    If Not ProjectBillingRateTypeId = 2 Then
                        objAccountProjectEmployeeBLL.AddAccountProjectEmployee(AccountId, Me.GetLastInsertedId, ProjectManagerEmployeeId, Nothing, Nothing)
                        If ProjectBillingRateTypeId = 3 Then
                            For Each drWorkType In dtWorkType.Rows
                                objAccountBillingRate.AddAccountBillingRate(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, 0, 0, 0, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeBillingRate")), drProjectEmployee.Item("EmployeeBillingRate"), 0), Date.Now.Date, Date.Now.AddYears(1).Date, drWorkType.AccountWorkTypeId, IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeEmployeeRate")), drProjectEmployee.Item("EmployeeEmployeeRate"), 0), IIf(Not IsDBNull(drProjectEmployee.Item("BillingRateCurrencyId")), drProjectEmployee.Item("BillingRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId), IIf(Not IsDBNull(drProjectEmployee.Item("EmployeeRateCurrencyId")), drProjectEmployee.Item("EmployeeRateCurrencyId"), DBUtilities.GetAccountBaseCurrencyId))
                                objAccountProjectEmployeeBLL.UpdateAccountProjectEmployee(AccountId, Me.GetLastInsertedId, ProjectManagerEmployeeId, Nothing, objAccountBillingRate.GetLastInsertedId, objAccountProjectEmployeeBLL.GetLastInsertedId)
                                Me.UpdateWorkTypeBillingRateOfProjectEmployee(AccountId, 3, objAccountProjectEmployeeBLL.GetLastInsertedId, objAccountBillingRate.GetLastInsertedId, drWorkType.AccountWorkTypeId)
                            Next
                        End If
                    End If
                End If
            End If

        End If
    End Sub

End Class
