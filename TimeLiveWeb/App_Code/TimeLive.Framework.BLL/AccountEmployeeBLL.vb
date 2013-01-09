Imports Microsoft.VisualBasic
Imports TimeLiveDataSetTableAdapters
Imports AccountEmployeeTableAdapters
Imports System.web
<System.ComponentModel.DataObject()> _
Public Class AccountEmployeeBLL

    Private _AccountEmployeeTableAdapter As AccountEmployeeTableAdapters.AccountEmployeeTableAdapter = Nothing
    Private _vueAccountvueEmployeeTableAdapter As vueAccountEmployeeTableAdapter = Nothing
    Private _vueAccountEmployeeWithBillingRateTableAdapter As vueAccountEmployeeWithBillingRateTableAdapter = Nothing
    Dim strCacheKey As String
    Protected ReadOnly Property Adapter() As AccountEmployeeTableAdapters.AccountEmployeeTableAdapter
        Get
            If _AccountEmployeeTableAdapter Is Nothing Then
                _AccountEmployeeTableAdapter = New AccountEmployeeTableAdapters.AccountEmployeeTableAdapter()
            End If

            Return _AccountEmployeeTableAdapter
        End Get
    End Property
    Protected ReadOnly Property ViewAdapter() As vueAccountEmployeeTableAdapter
        Get
            If _vueAccountvueEmployeeTableAdapter Is Nothing Then
                _vueAccountvueEmployeeTableAdapter = New vueAccountEmployeeTableAdapter()
            End If

            Return _vueAccountvueEmployeeTableAdapter
        End Get
    End Property
    Protected ReadOnly Property ViewAdapterEmployeeWithBillingRate() As vueAccountEmployeeWithBillingRateTableAdapter
        Get
            If _vueAccountEmployeeWithBillingRateTableAdapter Is Nothing Then
                _vueAccountEmployeeWithBillingRateTableAdapter = New vueAccountEmployeeWithBillingRateTableAdapter()
            End If

            Return _vueAccountEmployeeWithBillingRateTableAdapter
        End Get
    End Property
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployees() As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetData
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByUsername(ByVal Username As String) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetDataByUsername(Username)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeeIdByEmailAddress(ByVal EmailAddress As String) As AccountEmployee.vueAccountEmployeeDataTable
        Return ViewAdapter.GetEmployeeIdByEmailAddress(EmailAddress)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesViewByUsername(ByVal Username As String) As AccountEmployee.vueAccountEmployeeDataTable
        Return ViewAdapter.GetDataByEmployeeLogin(Username)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesViewByAdminUsername(ByVal Username As String) As AccountEmployee.vueAccountEmployeeDataTable
        Return ViewAdapter.GetDataByAdminEmployeeLogin(Username)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByAccountEmployeeId(ByVal AccountEmployeeId As Integer) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetDataByAccountEmployeeID(AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByAccountId(ByVal AccountId As Integer) As AccountEmployee.AccountEmployeeDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("AccountEmployeeDataTable", "GetAccountEmployeesByAccountId", AccountId)
        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAccountEmployeesByAccountId = CacheManager.GetItemFromCache(strCacheKey)
        Else
            GetAccountEmployeesByAccountId = Adapter.GetDataByAccountID(AccountId)
            CacheManager.AddAccountDataInCache(GetAccountEmployeesByAccountId, strCacheKey)
        End If
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByAccountIdAndRole(ByVal AccountId As Integer, ByVal Role As String) As AccountEmployee.vueAccountEmployeeDataTable
        Return ViewAdapter.GetDataByAccountIdandRole(AccountId, Role)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByAccountIdAndIsDisabled(ByVal AccountId As Integer, ByVal AccountEmployeeId As Integer) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetDataByAccountIdAndIsDisabled(AccountId, AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeeForQB(ByVal AccountId As Integer) As AccountEmployee.vueAccountEmployeeForQBDataTable
        Dim _vueAccountEmployeeForQB As New vueAccountEmployeeForQBTableAdapter
        Return _vueAccountEmployeeForQB.GetEmployeesForQB(AccountId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetVendorForQB(ByVal AccountId As Integer) As AccountEmployee.vueAccountEmployeeForQBDataTable
        Dim _vueAccountEmployeeForQB As New vueAccountEmployeeForQBTableAdapter
        Return _vueAccountEmployeeForQB.GetVendorsForQB(AccountId)
    End Function
    Public Shared Function GetAccountEmployeesByAccountIdCount(ByVal AccountId As Integer) As Integer

        Return New TimeLiveDataSetTableAdapters.GenericCountTableAdapter().GetAccountEmployeesCount(AccountId)

    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByAccountIdAndAccountEmployeeIdInTop5(ByVal AccountId As Integer, ByVal AccountEmployeeId As Integer) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetDataByAccountEmployeeIdInTop5(AccountEmployeeId, AccountId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByNumberOfUsersAllowed(ByVal AccountId As Integer, ByVal AccountEmployeeId As Integer, ByVal NumberOfUsersAllowed As Integer) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetAccountEmployeesByNumberOfUserAllowed(AccountEmployeeId, NumberOfUsersAllowed, AccountId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function UpdateAccountBillingRateId(ByVal AccountBillingRateId As Integer, ByVal AccountEmployeeId As Integer) As Integer
        Return Adapter.UpdateAccountBillingRateId(AccountBillingRateId, AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByLocationAndDepartment(ByVal AccountId As Integer, ByVal AccountLocationId As Integer, ByVal AccountDepartmentId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetDataByLocationAndDepartment(AccountId, AccountLocationId, AccountDepartmentId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesWithBillingRateByAccountEmployeeId(ByVal AccountEmployeeId As Integer, ByVal AccountWorkTypeId As Integer) As TimeLiveDataSet.vueAccountEmployeeWithBillingRateDataTable
        Dim _vueAccountEmployeeWithBillingRateTableAdapter As New vueAccountEmployeeWithBillingRateTableAdapter
        Return _vueAccountEmployeeWithBillingRateTableAdapter.GetDataByAccountEmployeeId(AccountEmployeeId, AccountWorkTypeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByAccountProjectTaskId(ByVal CreatedByEmployeeId As Integer, ByVal AccountProjectId As Integer, ByVal AccountProjectTaskId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetDataByAccountProjectTaskId(CreatedByEmployeeId, AccountProjectTaskId, AccountProjectId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetViewAccountEmployeesByAccountEmployeeId(ByVal AccountEmployeeId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        'strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueAccountEmployeeDataTable", "GetViewAccountEmployeesByAccountEmployeeId", "AccountEmployeeId=" & AccountEmployeeId)
        'If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
        'GetViewAccountEmployeesByAccountEmployeeId = CacheManager.GetItemFromCache(strCacheKey)
        'Else
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        GetViewAccountEmployeesByAccountEmployeeId = _vueAccountEmployeeTableAdapter.GetDataByAccountEmployeeId(AccountEmployeeId)
        'CacheManager.AddAccountDataInCache(GetViewAccountEmployeesByAccountEmployeeId, strCacheKey)
        'End If
        Return GetViewAccountEmployeesByAccountEmployeeId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountEmployeesByLeaderEmployeeId(ByVal AccountEmployeeId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetAccountEmployeesByLeaderEmployeeId(AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountEmployeesByProjectManagerEmployeeId(ByVal AccountEmployeeId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetAccountEmployeeByProjectManagerEmployeeId(AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForTimeEntryApproval(ByVal ApproverEmployeeId As Integer) As AccountEmployee.vueTimeEntryApprovalEmployeesDataTable
        Dim _vueTimeEntryApprovalEmployeesTableAdapter As New vueTimeEntryApprovalEmployeesTableAdapter
        Return _vueTimeEntryApprovalEmployeesTableAdapter.GetEmployeesForTimeEntryApproval(ApproverEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForExpenseEntryApproval(ByVal ApproverEmployeeId As Integer) As AccountEmployee.vueExpenseEntryApprovalEmployeesDataTable
        Dim _vueExpenseEntryApprovalEmployeesTableAdapter As New vueExpenseEntryApprovalEmployeesTableAdapter
        Return _vueExpenseEntryApprovalEmployeesTableAdapter.GetEmployeesForExpenseEntryApproval(ApproverEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetViewAccountEmployeesByUsernameAndPassword(ByVal Username As String, ByVal Password As String) As AccountEmployee.vueAccountEmployeeDataTable
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetDataByUsernameAndPassword(Username, Password)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetViewAccountEmployeesByAdminUsernameAndPassword(ByVal Username As String, ByVal Password As String) As AccountEmployee.vueAccountEmployeeDataTable
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetDataByAdminUsernameAndPassword(Username, Password)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByEmployeeTypeId(ByVal EmployeeTypeId As Integer) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetDataByEmployeeTypeId(EmployeeTypeId)
    End Function
    Public Function GetLastInsertedId() As Integer
        Dim a As TimeLiveDataSet.IdentityQueryRow
        Dim ad As New TimeLiveDataSetTableAdapters.IdentityQueryTableAdapter
        a = ad.GetAccountEmployeeLastId.Rows(0)
        Return a.LastId
    End Function
    Public Function ValidateNewEmployee(ByVal EMailAddress As String) As Boolean
        If Adapter.GetByEMailAddress(EMailAddress).Rows.Count > 0 Then
            Return False
        Else
            Return True
        End If
    End Function
    Public Function ValidateExistingEmployee(ByVal EMailAddress As String, ByVal AccountEmployeeId As Integer) As Boolean
        If Adapter.GetByEMailAddressExcludingExistingEmployeeId(EMailAddress, AccountEmployeeId).Rows.Count > 0 Then
            Return False
        Else
            Return True
        End If
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByEmailAddress(ByVal EmailAddress As String) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetDataByEmailAddress(EmailAddress)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByEmployeeName(ByVal AccountId As Integer, ByVal EmployeeName As String) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetDataByEmployeeName(AccountId, EmployeeName)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function AddAccountEmployee( _
                    ByVal Username As String, _
                    ByVal Password As String, _
                    ByVal FirstName As String, _
                    ByVal LastName As String, _
                    ByVal EMailAddress As String, _
                    ByVal EmployeeCode As String, _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountDepartmentId As System.Nullable(Of Integer), _
                    ByVal AccountRoleId As System.Nullable(Of Integer), _
                    ByVal AccountLocationId As System.Nullable(Of Integer), _
                    ByVal CountryId As System.Nullable(Of Short), _
                    ByVal BillingTypeId As System.Nullable(Of Integer), _
                    ByVal StartDate As System.Nullable(Of Date), _
                    ByVal DefaultProjectId As System.Nullable(Of Integer), _
                    ByVal EmployeeManagerId As Integer, _
                    ByVal TimeZoneId As System.Nullable(Of Byte), _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal EmployeePayTypeId As Guid, _
                    ByVal StatusId As Integer, _
                    ByVal JobTitle As String, _
                    ByVal HiredDate As DateTime, _
                    ByVal TerminationDate As System.Nullable(Of Date), _
                    ByVal AccountWorkingDayTypeId As Guid, _
                    ByVal AccountTimeOffPolicyId As Guid, _
                    ByVal TimeOffApprovalTypeId As Integer, _
                    ByVal AccountHolidayTypeId As Guid, _
                    ByVal IsForcePasswordChange As Boolean, _
                    ByVal UserInterfaceLanguage As String, _
                    Optional ByVal AddressLine1 As String = "", _
                    Optional ByVal AddressLine2 As String = "", _
                    Optional ByVal State As String = "", _
                    Optional ByVal City As String = "", _
                    Optional ByVal Zip As String = "", _
                    Optional ByVal HomePhoneNo As String = "", _
                    Optional ByVal WorkPhoneNo As String = "", _
                    Optional ByVal MobilePhoneNo As String = "", _
                    Optional ByVal MiddleName As String = "", _
                    Optional ByVal Prefix As String = "", _
                    Optional ByVal DoNotSendEMail As Boolean = False, _
                    Optional ByRef CustomField1 As String = "", _
                    Optional ByRef CustomField2 As String = "", _
                    Optional ByRef CustomField3 As String = "", _
                    Optional ByRef CustomField4 As String = "", _
                    Optional ByRef CustomField5 As String = "", _
                    Optional ByRef CustomField6 As String = "", _
                    Optional ByRef CustomField7 As String = "", _
                    Optional ByRef CustomField8 As String = "", _
                    Optional ByRef CustomField9 As String = "", _
                    Optional ByRef CustomField10 As String = "", _
                    Optional ByRef CustomField11 As String = "", _
                    Optional ByRef CustomField12 As String = "", _
                    Optional ByRef CustomField13 As String = "", _
                    Optional ByRef CustomField14 As String = "", _
                    Optional ByRef CustomField15 As String = "" _
                    ) As Boolean

        Try
            LoggingBLL.WriteToLog("StartAddEmployee")

            ' Create a new ProductRow instance
            'Dim NewAccountEmployeeId As Integer
            'NewAccountEmployeeId = Adapter.InsertEmployee(Password, FirstName, LastName, MiddleName, EMailAddress, AccountId, AccountDepartmentId, AccountRoleId, AddressLine1, AddressLine2, City, Zip, CInt(CountryId), HomePhoneNo, WorkPhoneNo, MobilePhoneNo, CInt(BillingRateCurrencyId), BillingRate, StartDate, 1, False, False, Login, Prefix, BillingRateStartDate, Date.Now, CreatedByEmployeeId, Date.Now, ModifiedByEmployeeId, AccountLocationId, CInt(BillingTypeId), TimeZoneId)

            If Not Me.ValidateNewEmployee(EMailAddress) Then
                Throw New Exception("Specified email already exist: " & EMailAddress)
                Return False
            End If

            _AccountEmployeeTableAdapter = New AccountEmployeeTableAdapters.AccountEmployeeTableAdapter()

            Dim AccountEmployees As New AccountEmployee.AccountEmployeeDataTable
            Dim AccountEmployee As AccountEmployee.AccountEmployeeRow = AccountEmployees.NewAccountEmployeeRow

            With AccountEmployee
                .Username = Username
                .Password = New CustomProviders.LiveMembershipProvider().EncodePassword(Password)
                .Prefix = Prefix
                .FirstName = FirstName
                .LastName = LastName
                .MiddleName = MiddleName
                .EMailAddress = EMailAddress
                .AccountId = AccountId
                .AccountDepartmentId = AccountDepartmentId
                .AccountRoleId = AccountRoleId
                .AddressLine1 = AddressLine1
                .AddressLine2 = AddressLine2
                .State = State
                .City = City
                .Zip = Zip
                .CountryId = CountryId.GetValueOrDefault
                .HomePhoneNo = HomePhoneNo
                .WorkPhoneNo = WorkPhoneNo
                .MobilePhoneNo = MobilePhoneNo
                .AccountLocationId = AccountLocationId
                If UserInterfaceLanguage <> "" Then
                    .UserInterfaceLanguage = UserInterfaceLanguage
                Else
                    .UserInterfaceLanguage = "en-US"
                End If
                If BillingTypeId.HasValue Then
                    .BillingTypeId = BillingTypeId
                End If

                If DefaultProjectId.HasValue Then
                    .DefaultProjectId = DefaultProjectId
                End If

                .TimeZoneId = TimeZoneId
                .IsDisabled = False
                .IsDeleted = False
                .CreatedOn = Now
                .CreatedByEmployeeId = CreatedByEmployeeId
                .ModifiedOn = Now
                .ModifiedByEmployeeId = ModifiedByEmployeeId
                If EmployeeCode <> "" Then
                    .EmployeeCode = EmployeeCode
                End If

                If Not EmployeeManagerId <= 0 Then
                    .EmployeeManagerId = EmployeeManagerId
                End If
                If StatusId <> 0 Then
                    .StatusId = StatusId
                End If
                If EmployeePayTypeId <> System.Guid.Empty Then
                    .EmployeePayTypeId = EmployeePayTypeId
                End If
                If JobTitle <> "" Then
                    .JobTitle = JobTitle
                End If
                Dim resultDate As Date
                If Date.TryParse(HiredDate, resultDate) Then
                    .HiredDate = resultDate
                End If
                If TerminationDate.HasValue Then
                    .TerminationDate = TerminationDate
                End If
                If AccountWorkingDayTypeId <> System.Guid.Empty Then
                    .AccountWorkingDayTypeId = AccountWorkingDayTypeId
                End If
                If AccountHolidayTypeId <> System.Guid.Empty Then
                    .AccountHolidayTypeId = AccountHolidayTypeId
                End If
                If AccountTimeOffPolicyId <> System.Guid.Empty Then
                    .AccountTimeOffPolicyId = AccountTimeOffPolicyId
                End If
                If TimeOffApprovalTypeId <> 0 Then
                    .TimeOffApprovalTypeId = TimeOffApprovalTypeId
                End If
                .IsEmailSend = False
                .IsForcePasswordChange = IsForcePasswordChange

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

            ' Add the new product

            AccountEmployees.AddAccountEmployeeRow(AccountEmployee)
            Dim rowsAffected As Integer = Adapter.Update(AccountEmployees)

            AfterUpdate()

            Me.AfterAddNewEmployee(AccountId, GetLastInsertedId, EMailAddress, DoNotSendEMail, Password, False)

            Dim objAccountEMailNotificationPreference As New AccountEMailNotificationPreferenceBLL

            objAccountEMailNotificationPreference.InsertDefaultAccountEmployeeEMailNotificationPreference(GetLastInsertedId)
            ' Call New AccountWorkingDayTypeBLL().AddSessionValuesForWorkingDayType(1, True, AccountWorkingDayTypeId)
            Return rowsAffected = 1


        Catch ex As Exception
            LoggingBLL.WriteExceptionToLog("AddEmployee", ex)
            Return False
        End Try
        ' Return true if precisely one row was inserted, otherwise false



    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function AddAccountEmployeeActiveDirectory( _
                    ByVal Username As String, _
                    ByVal Password As String, _
                    ByVal FirstName As String, _
                    ByVal LastName As String, _
                    ByVal EMailAddress As String, _
                    ByVal EmployeeCode As String, _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountDepartmentId As System.Nullable(Of Integer), _
                    ByVal AccountRoleId As System.Nullable(Of Integer), _
                    ByVal AccountLocationId As System.Nullable(Of Integer), _
                    ByVal CountryId As System.Nullable(Of Short), _
                    ByVal BillingTypeId As System.Nullable(Of Integer), _
                    ByVal StartDate As System.Nullable(Of Date), _
                    ByVal DefaultProjectId As System.Nullable(Of Integer), _
                    ByVal EmployeeManagerId As Integer, _
                    ByVal TimeZoneId As System.Nullable(Of Byte), _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal EmployeePayTypeId As Guid, _
                    ByVal StatusId As Integer, _
                    ByVal JobTitle As String, _
                    ByVal HiredDate As DateTime, _
                    ByVal TerminationDate As System.Nullable(Of Date), _
                    ByVal AccountWorkingDayTypeId As Guid, _
                    ByVal AccountTimeOffPolicyId As Guid, _
                    ByVal TimeOffApprovalTypeId As Integer, _
                    ByVal AccountHolidayTypeId As Guid, _
                    ByVal IsForcePasswordChange As Boolean, _
                    ByVal UserInterfaceLanguage As String, _
                    Optional ByVal AddressLine1 As String = "", _
                    Optional ByVal AddressLine2 As String = "", _
                    Optional ByVal State As String = "", _
                    Optional ByVal City As String = "", _
                    Optional ByVal Zip As String = "", _
                    Optional ByVal HomePhoneNo As String = "", _
                    Optional ByVal WorkPhoneNo As String = "", _
                    Optional ByVal MobilePhoneNo As String = "", _
                    Optional ByVal MiddleName As String = "", _
                    Optional ByVal Prefix As String = "", _
                    Optional ByVal DoNotSendEMail As Boolean = False, _
                    Optional ByRef CustomField1 As String = "", _
                    Optional ByRef CustomField2 As String = "", _
                    Optional ByRef CustomField3 As String = "", _
                    Optional ByRef CustomField4 As String = "", _
                    Optional ByRef CustomField5 As String = "", _
                    Optional ByRef CustomField6 As String = "", _
                    Optional ByRef CustomField7 As String = "", _
                    Optional ByRef CustomField8 As String = "", _
                    Optional ByRef CustomField9 As String = "", _
                    Optional ByRef CustomField10 As String = "", _
                    Optional ByRef CustomField11 As String = "", _
                    Optional ByRef CustomField12 As String = "", _
                    Optional ByRef CustomField13 As String = "", _
                    Optional ByRef CustomField14 As String = "", _
                    Optional ByRef CustomField15 As String = "" _
                    ) As Boolean

        Try
            LoggingBLL.WriteToLog("StartAddEmployeeActiveDirectory")

            ' Create a new ProductRow instance
            'Dim NewAccountEmployeeId As Integer
            'NewAccountEmployeeId = Adapter.InsertEmployee(Password, FirstName, LastName, MiddleName, EMailAddress, AccountId, AccountDepartmentId, AccountRoleId, AddressLine1, AddressLine2, City, Zip, CInt(CountryId), HomePhoneNo, WorkPhoneNo, MobilePhoneNo, CInt(BillingRateCurrencyId), BillingRate, StartDate, 1, False, False, Login, Prefix, BillingRateStartDate, Date.Now, CreatedByEmployeeId, Date.Now, ModifiedByEmployeeId, AccountLocationId, CInt(BillingTypeId), TimeZoneId)

            If Not Me.ValidateNewEmployee(EMailAddress) Then
                Throw New Exception("Specified email already exist")
                Return False
            End If

            _AccountEmployeeTableAdapter = New AccountEmployeeTableAdapters.AccountEmployeeTableAdapter()

            Dim AccountEmployees As New AccountEmployee.AccountEmployeeDataTable
            Dim AccountEmployee As AccountEmployee.AccountEmployeeRow = AccountEmployees.NewAccountEmployeeRow

            With AccountEmployee
                .Username = Username
                .Password = New CustomProviders.LiveMembershipProvider().EncodePassword(Password)
                .Prefix = Prefix
                .FirstName = FirstName
                .LastName = LastName
                .MiddleName = MiddleName
                .EMailAddress = EMailAddress
                .AccountId = AccountId
                .AccountDepartmentId = AccountDepartmentId
                .AccountRoleId = AccountRoleId
                .AddressLine1 = AddressLine1
                .AddressLine2 = AddressLine2
                .State = State
                .City = City
                .Zip = Zip

                .CountryId = CountryId.GetValueOrDefault

                .HomePhoneNo = HomePhoneNo
                .WorkPhoneNo = WorkPhoneNo
                .MobilePhoneNo = MobilePhoneNo
                .AccountLocationId = AccountLocationId
                .UserInterfaceLanguage = UserInterfaceLanguage

                If BillingTypeId.HasValue Then
                    .BillingTypeId = BillingTypeId
                End If

                If DefaultProjectId.HasValue Then
                    .DefaultProjectId = DefaultProjectId
                End If

                If TimeZoneId.HasValue Then
                    .TimeZoneId = TimeZoneId
                End If

                .IsDisabled = False
                .IsDeleted = False
                .CreatedOn = Now
                .CreatedByEmployeeId = CreatedByEmployeeId
                .ModifiedOn = Now
                .ModifiedByEmployeeId = ModifiedByEmployeeId
                If Not EmployeeManagerId <= 0 Then
                    .EmployeeManagerId = EmployeeManagerId
                End If
                If StatusId <> 0 Then
                    .StatusId = StatusId
                End If
                If EmployeePayTypeId <> System.Guid.Empty Then
                    .EmployeePayTypeId = EmployeePayTypeId
                End If
                If JobTitle <> "" Then
                    .JobTitle = JobTitle
                End If
                Dim resultDate As Date
                If Date.TryParse(HiredDate, resultDate) Then
                    .HiredDate = resultDate
                End If
                If TerminationDate.HasValue Then
                    .TerminationDate = TerminationDate
                End If
                If AccountWorkingDayTypeId <> System.Guid.Empty Then
                    .AccountWorkingDayTypeId = AccountWorkingDayTypeId
                End If
                .EmployeeCode = EmployeeCode
                If AccountTimeOffPolicyId <> System.Guid.Empty Then
                    .AccountTimeOffPolicyId = AccountTimeOffPolicyId
                End If
                If TimeOffApprovalTypeId <> 0 Then
                    .TimeOffApprovalTypeId = TimeOffApprovalTypeId
                End If
                If AccountHolidayTypeId <> System.Guid.Empty Then
                    .AccountHolidayTypeId = AccountHolidayTypeId
                End If
                .IsEmailSend = False
                .IsForcePasswordChange = IsForcePasswordChange
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

            ' Add the new product

            AccountEmployees.AddAccountEmployeeRow(AccountEmployee)
            Dim rowsAffected As Integer = Adapter.Update(AccountEmployees)

            AfterUpdate()

            Me.AfterAddNewEmployee(AccountId, GetLastInsertedId, EMailAddress, DoNotSendEMail, Password, True)

            Dim objAccountEMailNotificationPreference As New AccountEMailNotificationPreferenceBLL

            objAccountEMailNotificationPreference.InsertDefaultAccountEmployeeEMailNotificationPreference(GetLastInsertedId)
            ' Call New AccountWorkingDayTypeBLL().AddSessionValuesForWorkingDayType(1, True, AccountWorkingDayTypeId)
            Return rowsAffected = 1


        Catch ex As Exception
            LoggingBLL.WriteExceptionToLog("AddEmployeeActiveDirectory", ex)
            Return False
        End Try
        ' Return true if precisely one row was inserted, otherwise false



    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function AddNewAccountEmployee( _
                    ByVal Username As String, _
                    ByVal Password As String, _
                    ByVal FirstName As String, _
                    ByVal LastName As String, _
                    ByVal EMailAddress As String, _
                    ByVal EmployeeCode As String, _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountDepartmentId As System.Nullable(Of Integer), _
                    ByVal AccountRoleId As System.Nullable(Of Integer), _
                    ByVal AccountLocationId As System.Nullable(Of Integer), _
                    ByVal CountryId As System.Nullable(Of Short), _
                    ByVal BillingTypeId As System.Nullable(Of Integer), _
                    ByVal StartDate As System.Nullable(Of Date), _
                    ByVal DefaultProjectId As System.Nullable(Of Integer), _
                    ByVal EmployeeManagerId As Integer, _
                    ByVal TimeZoneId As System.Nullable(Of Byte), _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal EmployeePayTypeId As Guid, _
                    ByVal StatusId As Integer, _
                    ByVal JobTitle As String, _
                    ByVal HiredDate As DateTime, _
                    ByVal TerminationDate As System.Nullable(Of Date), _
                    ByVal AccountWorkingDayTypeId As Guid, _
                    ByVal AccountTimeOffPolicyId As Guid, _
                    ByVal TimeOffApprovalTypeId As Integer, _
                    ByVal AccountHolidayTypeId As Guid, _
                    ByVal IsForcePasswordChange As Boolean, _
                    ByVal UserInterfaceLanguage As String, _
                    Optional ByVal AddressLine1 As String = "", _
                    Optional ByVal AddressLine2 As String = "", _
                    Optional ByVal State As String = "", _
                    Optional ByVal City As String = "", _
                    Optional ByVal Zip As String = "", _
                    Optional ByVal HomePhoneNo As String = "", _
                    Optional ByVal WorkPhoneNo As String = "", _
                    Optional ByVal MobilePhoneNo As String = "", _
                    Optional ByVal MiddleName As String = "", _
                    Optional ByVal Prefix As String = "", _
                    Optional ByVal DoNotSendEMail As Boolean = False, _
                    Optional ByRef CustomField1 As String = "", _
                    Optional ByRef CustomField2 As String = "", _
                    Optional ByRef CustomField3 As String = "", _
                    Optional ByRef CustomField4 As String = "", _
                    Optional ByRef CustomField5 As String = "", _
                    Optional ByRef CustomField6 As String = "", _
                    Optional ByRef CustomField7 As String = "", _
                    Optional ByRef CustomField8 As String = "", _
                    Optional ByRef CustomField9 As String = "", _
                    Optional ByRef CustomField10 As String = "", _
                    Optional ByRef CustomField11 As String = "", _
                    Optional ByRef CustomField12 As String = "", _
                    Optional ByRef CustomField13 As String = "", _
                    Optional ByRef CustomField14 As String = "", _
                    Optional ByRef CustomField15 As String = "" _
) As Boolean

        Dim LDAP As New LDAPUtilitiesBLL

        If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
            Me.AddAccountEmployeeActiveDirectory(Username, Password, FirstName, LastName, EMailAddress, EmployeeCode, AccountId, AccountDepartmentId, AccountRoleId, AccountLocationId, CountryId, BillingTypeId, StartDate, DefaultProjectId, EmployeeManagerId, TimeZoneId, CreatedByEmployeeId, ModifiedByEmployeeId, EmployeePayTypeId, StatusId, JobTitle, HiredDate, TerminationDate, AccountWorkingDayTypeId, AccountTimeOffPolicyId, TimeOffApprovalTypeId, AccountHolidayTypeId, IsForcePasswordChange, UserInterfaceLanguage, AddressLine1, AddressLine2, State, City, Zip, HomePhoneNo, WorkPhoneNo, MobilePhoneNo, MiddleName, Prefix, DoNotSendEMail, CustomField1, CustomField2, CustomField3, CustomField4, CustomField5, CustomField6, CustomField7, CustomField8, CustomField9, CustomField10, CustomField11, CustomField12, CustomField13, CustomField14, CustomField15)
            Return True
        Else
            Me.AddAccountEmployee(Username, Password, FirstName, LastName, EMailAddress, EmployeeCode, AccountId, AccountDepartmentId, AccountRoleId, AccountLocationId, CountryId, BillingTypeId, StartDate, DefaultProjectId, EmployeeManagerId, TimeZoneId, CreatedByEmployeeId, ModifiedByEmployeeId, EmployeePayTypeId, StatusId, JobTitle, HiredDate, TerminationDate, AccountWorkingDayTypeId, AccountTimeOffPolicyId, TimeOffApprovalTypeId, AccountHolidayTypeId, IsForcePasswordChange, UserInterfaceLanguage, AddressLine1, AddressLine2, State, City, Zip, HomePhoneNo, WorkPhoneNo, MobilePhoneNo, MiddleName, Prefix, DoNotSendEMail, CustomField1, CustomField2, CustomField3, CustomField4, CustomField5, CustomField6, CustomField7, CustomField8, CustomField9, CustomField10, CustomField11, CustomField12, CustomField13, CustomField14, CustomField15)
            Return True
        End If
        Return False

    End Function
    Public Function AddBillingRateOfEmployee(ByVal BillingRate As Decimal, ByVal BillingRateStartDate As Date, ByVal BillingRateEndDate As Date, ByVal AccountWorkTypeId As Integer, ByVal EmployeeRate As Decimal, ByVal BillingRateCurrencyId As Integer, ByVal EmployeeRateCurrencyId As Integer)
        Dim objAccountBillingRate As New AccountBillingRateBLL
        Dim objAccountWorkTypeBillingRate As New AccountWorkTypeBLL

        Dim dtAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateDataTable = objAccountWorkTypeBillingRate.GetEmployeeOwnWorkTypeBillingRate(DBUtilities.GetSessionAccountId, 1, Me.GetLastInsertedId, AccountWorkTypeId)
        Dim drAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateRow

        objAccountBillingRate.AddAccountBillingRate(DBUtilities.GetSessionAccountId, 1, 0, 0, Me.GetLastInsertedId, 0, BillingRate, BillingRateStartDate, BillingRateEndDate, AccountWorkTypeId, EmployeeRate, BillingRateCurrencyId, EmployeeRateCurrencyId)
        Me.UpdateAccountBillingRateId(objAccountBillingRate.GetLastInsertedId, Me.GetLastInsertedId)

        If dtAccountWorkTypeBillingRate.Rows.Count > 0 Then
            drAccountWorkTypeBillingRate = dtAccountWorkTypeBillingRate.Rows(0)
            objAccountWorkTypeBillingRate.UpdateAccountWorkTypeBillingRate(DBUtilities.GetSessionAccountId, 1, Me.GetLastInsertedId, 0, 0, 0, drAccountWorkTypeBillingRate.AccountBillingRateId, AccountWorkTypeId, drAccountWorkTypeBillingRate.AccountWorkTypeBillingRateId)
        Else
            objAccountWorkTypeBillingRate.AddAccountWorkTypeBillingRate(DBUtilities.GetSessionAccountId, 1, Me.GetLastInsertedId, 0, 0, 0, objAccountBillingRate.GetLastInsertedId, AccountWorkTypeId)
        End If

    End Function
    Public Function IfWorkTypeBillingRateExistOfEmployeeOwn(ByVal AccountId As Integer, ByVal SystemBillingRateTypeId As Integer, ByVal AccountEmployeeId As Integer, ByVal AccountWorkTypeId As Integer) As Boolean
        Dim objAccountWorkTypeBillingRate As New AccountWorkTypeBLL

        Dim dtAccountWorkTypeBillingRate As TimeLiveDataSet.AccountWorkTypeBillingRateDataTable = objAccountWorkTypeBillingRate.GetEmployeeOwnWorkTypeBillingRate(AccountId, SystemBillingRateTypeId, AccountEmployeeId, AccountWorkTypeId)

        If dtAccountWorkTypeBillingRate.Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Shared Function IsExternalUser(ByVal Username As String) As Boolean
        Dim dtEmployee As AccountEmployee.AccountEmployeeDataTable = New AccountEmployeeBLL().GetAccountEmployeesByUsername(Username)
        If dtEmployee.Rows.Count > 0 Then
            Dim drEmployee As AccountEmployee.AccountEmployeeRow = dtEmployee.Rows(0)
            If Not IsDBNull(drEmployee("EmployeeTypeId")) AndAlso drEmployee("EmployeeTypeId") = 2 Then
                Return True
            End If
        End If
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function AddExternalAccountEmployee( _
                    ByVal Password As String, _
                    ByVal FirstName As String, _
                    ByVal LastName As String, _
                    ByVal EMailAddress As String, _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountDepartmentId As Integer, _
                    ByVal AccountRoleId As System.Nullable(Of Integer), _
                    ByVal AccountLocationId As System.Nullable(Of Integer), _
                    ByVal CountryId As System.Nullable(Of Short), _
                    ByVal BillingRateCurrencyId As System.Nullable(Of Short), _
                    ByVal BillingTypeId As System.Nullable(Of Integer), _
                    ByVal BillingRate As System.Nullable(Of Decimal), _
                    ByVal BillingRateStartDate As System.Nullable(Of Date), _
                    ByVal StartDate As System.Nullable(Of Date), _
                    ByVal DefaultProjectId As System.Nullable(Of Integer), _
                    ByVal TimeZoneId As System.Nullable(Of Byte), _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal EmployeeTypeId As Byte, _
                    ByVal ExternalUserClientId As Integer, _
                    Optional ByVal AddressLine1 As String = "", _
                    Optional ByVal AddressLine2 As String = "", _
                    Optional ByVal State As String = "", _
                    Optional ByVal City As String = "", _
                    Optional ByVal Zip As String = "", _
                    Optional ByVal HomePhoneNo As String = "", _
                    Optional ByVal WorkPhoneNo As String = "", _
                    Optional ByVal MobilePhoneNo As String = "", _
                    Optional ByVal MiddleName As String = "", _
                    Optional ByVal Prefix As String = "", _
                    Optional ByVal DoNotSendEMail As Boolean = False) As Boolean

        Try
            LoggingBLL.WriteToLog("StartAddEmployee")

            ' Create a new ProductRow instance
            'Dim NewAccountEmployeeId As Integer
            'NewAccountEmployeeId = Adapter.InsertEmployee(Password, FirstName, LastName, MiddleName, EMailAddress, AccountId, AccountDepartmentId, AccountRoleId, AddressLine1, AddressLine2, City, Zip, CInt(CountryId), HomePhoneNo, WorkPhoneNo, MobilePhoneNo, CInt(BillingRateCurrencyId), BillingRate, StartDate, 1, False, False, Login, Prefix, BillingRateStartDate, Date.Now, CreatedByEmployeeId, Date.Now, ModifiedByEmployeeId, AccountLocationId, CInt(BillingTypeId), TimeZoneId)

            If Not Me.ValidateNewEmployee(EMailAddress) Then
                Throw New Exception("Specified email already exist")
                Return False
            End If

            _AccountEmployeeTableAdapter = New AccountEmployeeTableAdapters.AccountEmployeeTableAdapter()

            Dim AccountEmployees As New AccountEmployee.AccountEmployeeDataTable
            Dim AccountEmployee As AccountEmployee.AccountEmployeeRow = AccountEmployees.NewAccountEmployeeRow

            With AccountEmployee
                .Username = EMailAddress
                .Password = New CustomProviders.LiveMembershipProvider().EncodePassword(Password)
                .Prefix = Prefix
                .FirstName = FirstName
                .LastName = LastName
                .MiddleName = MiddleName
                .EMailAddress = EMailAddress
                .AccountId = AccountId
                .AccountRoleId = AccountRoleId
                .IsDisabled = False
                .IsDeleted = False
                .CreatedOn = Now
                .CreatedByEmployeeId = CreatedByEmployeeId
                .ModifiedOn = Now
                .ModifiedByEmployeeId = ModifiedByEmployeeId
                .ExternalUserClientId = ExternalUserClientId
                .EmployeeTypeId = 2
                .TimeZoneId = TimeZoneId
                Dim bll As New AccountWorkingDayTypeBLL
                .AccountWorkingDayTypeId = bll.GetDefaultAccountWorkingDayTypeId(AccountId)
                .IsEmailSend = False
                .IsForcePasswordChange = False
            End With

            ' Add the new product

            AccountEmployees.AddAccountEmployeeRow(AccountEmployee)
            Dim rowsAffected As Integer = Adapter.Update(AccountEmployees)

            AfterUpdate()

            Me.AfterAddNewEmployee(AccountId, GetLastInsertedId, EMailAddress, DoNotSendEMail, Password, False)

            Dim objAccountEMailNotificationPreference As New AccountEMailNotificationPreferenceBLL

            objAccountEMailNotificationPreference.InsertDefaultAccountEmployeeEMailNotificationPreferenceForExternalEmployee(GetLastInsertedId)

            Return rowsAffected = 1

        Catch ex As Exception
            LoggingBLL.WriteExceptionToLog("AddExternalAccountEmployee", ex)
            Return False
        End Try
        ' Return true if precisely one row was inserted, otherwise false

    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesViewByAccountId(ByVal AccountId As Integer) As AccountEmployee.vueAccountEmployeeDataTable


        strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueAccountEmployeeDataTable", "GetAccountEmployeesViewByAccountId", AccountId)

        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAccountEmployeesViewByAccountId = CacheManager.GetItemFromCache(strCacheKey)
        Else
            _vueAccountvueEmployeeTableAdapter = New vueAccountEmployeeTableAdapter()
            GetAccountEmployeesViewByAccountId = _vueAccountvueEmployeeTableAdapter.GetDataByAccountId(AccountId)
            CacheManager.AddAccountDataInCache(GetAccountEmployeesViewByAccountId, strCacheKey)
        End If

        UIUtilities.FixTableForNoRecords(GetAccountEmployeesViewByAccountId)

        Return GetAccountEmployeesViewByAccountId


    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesForExternalUser(ByVal AccountId As Integer) As TimeLiveDataSet.vueExternalAccountEmployeeDataTable


        strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueExternalAccountEmployeeDataTable", "GetAccountEmployeesForExternalUser", AccountId)

        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAccountEmployeesForExternalUser = CacheManager.GetItemFromCache(strCacheKey)
        Else
            Dim _vueExternalAccountEmployeeTableAdapter As New vueExternalAccountEmployeeTableAdapter
            _vueExternalAccountEmployeeTableAdapter = New vueExternalAccountEmployeeTableAdapter()
            GetAccountEmployeesForExternalUser = _vueExternalAccountEmployeeTableAdapter.GetAccountEmployeesForExternalUser(AccountId)
            CacheManager.AddAccountDataInCache(GetAccountEmployeesForExternalUser, strCacheKey)
        End If

        UIUtilities.FixTableForNoRecords(GetAccountEmployeesForExternalUser)

        Return GetAccountEmployeesForExternalUser


    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountEmployeesByAccountId(ByVal AccountId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        _vueAccountvueEmployeeTableAdapter = New vueAccountEmployeeTableAdapter()
        GetvueAccountEmployeesByAccountId = _vueAccountvueEmployeeTableAdapter.GetEmployeesByAccountId(AccountId)
        UIUtilities.FixTableForNoRecords(GetvueAccountEmployeesByAccountId)
        Return GetvueAccountEmployeesByAccountId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeeByAccountIdForLicense(ByVal AccountId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        _vueAccountvueEmployeeTableAdapter = New vueAccountEmployeeTableAdapter()

        GetEmployeeByAccountIdForLicense = _vueAccountvueEmployeeTableAdapter.GetEmployeesByAccountIdForLicense(AccountId)
        Return GetEmployeeByAccountIdForLicense
    End Function
    Public Shared Function GetTotalNumberOfUsersInAccount(ByVal AccountId As Integer) As Integer
        Return New AccountEmployeeBLL().GetEmployeeByAccountIdForLicense(AccountId).Rows.Count
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateAccountEmployee( _
                    ByVal Login As String, _
                    ByVal Password As String, _
                    ByVal Prefix As String, _
                    ByVal FirstName As String, _
                    ByVal LastName As String, _
                    ByVal MiddleName As String, _
                    ByVal EMailAddress As String, _
                    ByVal EmployeeCode As String, _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountDepartmentId As System.Nullable(Of Integer), _
                    ByVal AccountRoleId As System.Nullable(Of Integer), _
                    ByVal AccountLocationId As System.Nullable(Of Integer), _
                    ByVal AddressLine1 As String, _
                    ByVal AddressLine2 As String, _
                    ByVal State As String, _
                    ByVal City As String, _
                    ByVal Zip As String, _
                    ByVal CountryId As System.Nullable(Of Short), _
                    ByVal HomePhoneNo As String, _
                    ByVal WorkPhoneNo As String, _
                    ByVal MobilePhoneNo As String, _
                    ByVal BillingTypeId As System.Nullable(Of Integer), _
                    ByVal StartDate As System.Nullable(Of Date), _
                    ByVal TerminationDate As System.Nullable(Of Date), _
                    ByVal StatusId As Integer, _
                    ByVal IsDeleted As System.Nullable(Of Boolean), _
                    ByVal IsDisabled As System.Nullable(Of Boolean), _
                    ByVal DefaultProjectId As System.Nullable(Of Integer), _
                    ByVal EmployeeManagerId As Integer, _
                    ByVal TimeZoneId As System.Nullable(Of Byte), _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal AllowedAccessFromIP As String, _
                    ByVal Original_AccountEmployeeId As Integer, _
                    ByVal EmployeePayTypeId As Guid, _
                    ByVal JobTitle As String, _
                    ByVal HiredDate As System.Nullable(Of Date), _
                    ByVal AccountWorkingDayTypeId As Guid, _
                    ByVal AccountTimeOffPolicyId As Guid, _
                    ByVal TimeOffApprovalTypeId As Integer, _
                    ByVal AccountHolidayTypeId As Guid, _
                    ByVal IsForcePasswordChange As System.Nullable(Of Boolean), _
                    ByVal UserInterfaceLanguage As String, _
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

        ' Update the product record

        'NewAccountEmployeeId = Adapter.InsertEmployee(Password, FirstName, LastName, MiddleName, EMailAddress, AccountId, AccountDepartmentId, AccountRoleId, AddressLine1, AddressLine2, City, Zip, CInt(CountryId), HomePhoneNo, WorkPhoneNo, MobilePhoneNo, CInt(BillingRateCurrencyId), BillingRate, StartDate, 1, False, False, Login, Prefix, BillingRateStartDate, Date.Now, CreatedByEmployeeId, Date.Now, ModifiedByEmployeeId, AccountLocationId, CInt(BillingTypeId), TimeZoneId)

        Try


            Dim IsRoleUpdated As Boolean
            Dim AccountEmployees As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByAccountEmployeeID(Original_AccountEmployeeId)
            Dim AccountEmployee As AccountEmployee.AccountEmployeeRow = AccountEmployees.Rows(0)

            With AccountEmployee

                'If Login Is Nothing Then
                .Username = EMailAddress
                'End If

                If Password <> "" Then
                    .Password = New CustomProviders.LiveMembershipProvider().EncodePassword(Password)
                End If
                .Prefix = Prefix
                .FirstName = FirstName
                .LastName = LastName
                .MiddleName = MiddleName

                If .EMailAddress <> EMailAddress Then
                    If Not Me.ValidateExistingEmployee(EMailAddress, Original_AccountEmployeeId) Then
                        Throw New Exception("Specified email already exist")
                        Return False
                    Else
                        .EMailAddress = EMailAddress

                    End If
                End If

                If AccountDepartmentId.HasValue Then
                    .AccountDepartmentId = AccountDepartmentId
                End If

                If AccountRoleId.HasValue Then
                    .AccountRoleId = AccountRoleId
                    IsRoleUpdated = True
                Else
                    IsRoleUpdated = False
                End If


                If AccountLocationId.HasValue Then
                    .AccountLocationId = AccountLocationId
                End If

                .AddressLine1 = AddressLine1
                .AddressLine2 = AddressLine2
                .State = State
                .City = City
                .Zip = Zip
                .CountryId = CountryId
                .HomePhoneNo = HomePhoneNo
                .WorkPhoneNo = WorkPhoneNo
                .MobilePhoneNo = MobilePhoneNo
                .TimeZoneId = TimeZoneId
                .UserInterfaceLanguage = UserInterfaceLanguage
                If IsDisabled.HasValue Then
                    .IsDisabled = IsDisabled
                End If

                If BillingTypeId.HasValue Then
                    .BillingTypeId = BillingTypeId
                End If
                If TerminationDate.HasValue = False Then
                    .Item("TerminationDate") = System.DBNull.Value
                Else
                    .TerminationDate = TerminationDate
                End If

                If DefaultProjectId.HasValue Then
                    .DefaultProjectId = DefaultProjectId
                End If
                .ModifiedOn = Now
                .ModifiedByEmployeeId = ModifiedByEmployeeId
                .AllowedAccessFromIP = AllowedAccessFromIP
                If Not EmployeeCode Is Nothing Then
                    If EmployeeCode = "RedirectFromAccountEmployee" Then
                        .Item("EmployeeCode") = System.DBNull.Value
                    Else
                        .EmployeeCode = EmployeeCode
                    End If
                End If
                If Not EmployeeManagerId <= 0 Then
                    .EmployeeManagerId = EmployeeManagerId
                End If
                If .Item("EmployeeManagerId").ToString <> "" And EmployeeManagerId = 0 Then
                    .Item("EmployeeManagerId") = System.DBNull.Value
                End If
                If StatusId <> 0 Then
                    .StatusId = StatusId
                End If
                If EmployeePayTypeId <> System.Guid.Empty Then
                    .EmployeePayTypeId = EmployeePayTypeId
                End If
                If JobTitle <> "" Then
                    .JobTitle = JobTitle
                End If
                If HiredDate.HasValue = True Then
                    .HiredDate = HiredDate
                End If
                If AccountWorkingDayTypeId <> System.Guid.Empty Then
                    .AccountWorkingDayTypeId = AccountWorkingDayTypeId
                End If
                If AccountHolidayTypeId <> System.Guid.Empty Then
                    .AccountHolidayTypeId = AccountHolidayTypeId
                ElseIf .Item("AccountHolidayTypeId").ToString <> "" And AccountHolidayTypeId = System.Guid.Empty Then
                    .Item("AccountHolidayTypeId") = System.DBNull.Value
                End If
                If AccountTimeOffPolicyId <> System.Guid.Empty Then
                    .AccountTimeOffPolicyId = AccountTimeOffPolicyId
                ElseIf .Item("AccountTimeOffPolicyId").ToString <> "" And AccountTimeOffPolicyId = System.Guid.Empty Then
                    .Item("AccountTimeOffPolicyId") = System.DBNull.Value
                End If
                If TimeOffApprovalTypeId = 0 Then
                    .Item("TimeOffApprovalTypeId") = DBNull.Value
                Else
                    .TimeOffApprovalTypeId = TimeOffApprovalTypeId
                End If
                If IsForcePasswordChange.HasValue Then
                    .IsForcePasswordChange = IsForcePasswordChange
                End If
                If CustomField1 <> "" Then
                    .CustomField1 = CustomField1
                ElseIf .Item("CustomField1").ToString <> "" And CustomField1 = "" Then
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

            Dim rowsAffected As Integer = Adapter.Update(AccountEmployee)

            AfterUpdate()
            CacheManager.ClearCache("vueAccountWorkingDayDataTable", , True)
            Call New AccountWorkingDayTypeBLL().AddSessionValuesForWorkingDayType(True, AccountWorkingDayTypeId, Original_AccountEmployeeId)

            If IsRoleUpdated = True Then
                Call New AccountPagePermissionBLL().ResetPageSecurity()
            End If
            Dim objEmployeeBLL As New AccountEmployeeBLL
            'CacheManager.ClearCache("vueAccountEmployeeDataTable", , True)
            objEmployeeBLL.SetSessionValues(Nothing, DBUtilities.GetSessionAccountEmployeeId)

            ' Return true if precisely one row was updated, otherwise false
            Return rowsAffected = 1
        Catch ex As Exception
            Throw ex
        End Try
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateAccountEmployeeActiveDirectory( _
                    ByVal Username As String, _
                    ByVal Password As String, _
                    ByVal Prefix As String, _
                    ByVal FirstName As String, _
                    ByVal LastName As String, _
                    ByVal MiddleName As String, _
                    ByVal EMailAddress As String, _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountDepartmentId As System.Nullable(Of Integer), _
                    ByVal AccountRoleId As System.Nullable(Of Integer), _
                    ByVal AccountLocationId As System.Nullable(Of Integer), _
                    ByVal AddressLine1 As String, _
                    ByVal AddressLine2 As String, _
                    ByVal State As String, _
                    ByVal City As String, _
                    ByVal Zip As String, _
                    ByVal CountryId As System.Nullable(Of Short), _
                    ByVal HomePhoneNo As String, _
                    ByVal WorkPhoneNo As String, _
                    ByVal MobilePhoneNo As String, _
                    ByVal BillingTypeId As System.Nullable(Of Integer), _
                    ByVal StartDate As System.Nullable(Of Date), _
                    ByVal TerminationDate As System.Nullable(Of Date), _
                    ByVal StatusId As Integer, _
                    ByVal IsDeleted As System.Nullable(Of Boolean), _
                    ByVal IsDisabled As System.Nullable(Of Boolean), _
                    ByVal DefaultProjectId As System.Nullable(Of Integer), _
                    ByVal TimeZoneId As System.Nullable(Of Byte), _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal AllowedAccessFromIP As String, _
                    ByVal Original_AccountEmployeeId As Integer, _
                    ByVal EmployeeManagerId As Integer, _
                    ByVal EmployeePayTypeId As Guid, _
                    ByVal JobTitle As String, _
                    ByVal HiredDate As System.Nullable(Of Date), _
                    ByVal AccountWorkingDayTypeId As Guid, _
                    ByVal EmployeeCode As String, _
                    ByVal AccountTimeOffPolicyId As Guid, _
                    ByVal TimeOffApprovalTypeId As Integer, _
                    ByVal AccountHolidayTypeId As Guid, _
                    ByVal IsForcePasswordChange As System.Nullable(Of Boolean), _
                    ByVal UserInterfaceLanguage As String, _
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

        ' Update the product record

        'NewAccountEmployeeId = Adapter.InsertEmployee(Password, FirstName, LastName, MiddleName, EMailAddress, AccountId, AccountDepartmentId, AccountRoleId, AddressLine1, AddressLine2, City, Zip, CInt(CountryId), HomePhoneNo, WorkPhoneNo, MobilePhoneNo, CInt(BillingRateCurrencyId), BillingRate, StartDate, 1, False, False, Login, Prefix, BillingRateStartDate, Date.Now, CreatedByEmployeeId, Date.Now, ModifiedByEmployeeId, AccountLocationId, CInt(BillingTypeId), TimeZoneId)


        Dim IsRoleUpdated As Boolean
        Dim AccountEmployees As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByAccountEmployeeID(Original_AccountEmployeeId)
        Dim AccountEmployee As AccountEmployee.AccountEmployeeRow = AccountEmployees.Rows(0)

        With AccountEmployee

            .Username = Username

            If Password <> "" Then
                .Password = New CustomProviders.LiveMembershipProvider().EncodePassword(Password)
            End If
            .Prefix = Prefix
            .FirstName = FirstName
            .LastName = LastName
            .MiddleName = MiddleName

            If .EMailAddress <> EMailAddress Then
                If Not Me.ValidateExistingEmployee(EMailAddress, Original_AccountEmployeeId) Then
                    Throw New Exception("Specified email already exist")
                    Return False
                Else
                    .EMailAddress = EMailAddress

                End If
            End If

            If AccountDepartmentId.HasValue Then
                .AccountDepartmentId = AccountDepartmentId
            End If

            If AccountRoleId.HasValue Then
                .AccountRoleId = AccountRoleId
                IsRoleUpdated = True
            Else
                IsRoleUpdated = False
            End If

            If AccountLocationId.HasValue Then
                .AccountLocationId = AccountLocationId
            End If

            .AddressLine1 = AddressLine1
            .AddressLine2 = AddressLine2
            .State = State
            .City = City
            .Zip = Zip
            .CountryId = CountryId
            .HomePhoneNo = HomePhoneNo
            .WorkPhoneNo = WorkPhoneNo
            .MobilePhoneNo = MobilePhoneNo
            .TimeZoneId = TimeZoneId
            .UserInterfaceLanguage = UserInterfaceLanguage
            If IsDisabled.HasValue Then
                .IsDisabled = IsDisabled
            End If

            If BillingTypeId.HasValue Then
                .BillingTypeId = BillingTypeId
            End If


            If TerminationDate.HasValue = False Then
                .Item("TerminationDate") = System.DBNull.Value
            Else
                .TerminationDate = TerminationDate
            End If
            If DefaultProjectId.HasValue Then
                .DefaultProjectId = DefaultProjectId
            End If
            .ModifiedOn = Now
            .ModifiedByEmployeeId = ModifiedByEmployeeId
            .AllowedAccessFromIP = AllowedAccessFromIP
            If Not EmployeeManagerId <= 0 Then
                .EmployeeManagerId = EmployeeManagerId
            End If
            If .Item("EmployeeManagerId").ToString <> "" And EmployeeManagerId = 0 Then
                .Item("EmployeeManagerId") = System.DBNull.Value
            End If
            If StatusId <> 0 Then
                .StatusId = StatusId
            End If
            If EmployeePayTypeId <> System.Guid.Empty Then
                .EmployeePayTypeId = EmployeePayTypeId
            End If
            If JobTitle <> "" Then
                .JobTitle = JobTitle
            End If
            If HiredDate.HasValue = True Then
                .HiredDate = HiredDate
            End If
            If AccountWorkingDayTypeId <> System.Guid.Empty Then
                .AccountWorkingDayTypeId = AccountWorkingDayTypeId
            End If
            If Not EmployeeCode Is Nothing Then
                If EmployeeCode = "RedirectFromAccountEmployee" Then
                    .Item("EmployeeCode") = System.DBNull.Value
                Else
                    .EmployeeCode = EmployeeCode
                End If
            End If
            If AccountTimeOffPolicyId <> System.Guid.Empty Then
                .AccountTimeOffPolicyId = AccountTimeOffPolicyId
            ElseIf .Item("AccountTimeOffPolicyId").ToString <> "" And AccountTimeOffPolicyId = System.Guid.Empty Then
                .Item("AccountTimeOffPolicyId") = System.DBNull.Value
            End If
            If TimeOffApprovalTypeId = 0 Then
                .Item("TimeOffApprovalTypeId") = DBNull.Value
            Else
                .TimeOffApprovalTypeId = TimeOffApprovalTypeId
            End If
            If AccountHolidayTypeId <> System.Guid.Empty Then
                .AccountHolidayTypeId = AccountHolidayTypeId
            End If
            If IsForcePasswordChange.HasValue Then
                .IsForcePasswordChange = IsForcePasswordChange
            End If
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

        Dim rowsAffected As Integer = Adapter.Update(AccountEmployee)

        AfterUpdate()
        Call New AccountWorkingDayTypeBLL().AddSessionValuesForWorkingDayType(True, AccountWorkingDayTypeId, Original_AccountEmployeeId)
        If IsRoleUpdated = True Then
            Call New AccountPagePermissionBLL().ResetPageSecurity()
        End If
        Dim objEmployeeBLL As New AccountEmployeeBLL
        objEmployeeBLL.SetSessionValues(Nothing, DBUtilities.GetSessionAccountEmployeeId)
        ' Return true if precisely one row was updated, otherwise false
        Return rowsAffected = 1
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateSelectedAccountEmployee( _
                ByVal Login As String, _
                ByVal Username As String, _
                ByVal Password As String, _
                ByVal Prefix As String, _
                ByVal FirstName As String, _
                ByVal LastName As String, _
                ByVal MiddleName As String, _
                ByVal EMailAddress As String, _
                ByVal EmployeeCode As String, _
                ByVal AccountId As System.Nullable(Of Integer), _
                ByVal AccountDepartmentId As System.Nullable(Of Integer), _
                ByVal AccountRoleId As System.Nullable(Of Integer), _
                ByVal AccountLocationId As System.Nullable(Of Integer), _
                ByVal AddressLine1 As String, _
                ByVal AddressLine2 As String, _
                ByVal State As String, _
                ByVal City As String, _
                ByVal Zip As String, _
                ByVal CountryId As System.Nullable(Of Short), _
                ByVal HomePhoneNo As String, _
                ByVal WorkPhoneNo As String, _
                ByVal MobilePhoneNo As String, _
                ByVal BillingTypeId As System.Nullable(Of Integer), _
                ByVal StartDate As System.Nullable(Of Date), _
                ByVal TerminationDate As System.Nullable(Of Date), _
                ByVal StatusId As Integer, _
                ByVal IsDeleted As System.Nullable(Of Boolean), _
                ByVal IsDisabled As System.Nullable(Of Boolean), _
                ByVal DefaultProjectId As System.Nullable(Of Integer), _
                ByVal TimeZoneId As System.Nullable(Of Byte), _
                ByVal CreatedByEmployeeId As Integer, _
                ByVal ModifiedByEmployeeId As Integer, _
                ByVal AllowedAccessFromIP As String, _
                ByVal Original_AccountEmployeeId As Integer, _
                ByVal EmployeeManagerId As Integer, _
                ByVal EmployeePayTypeId As Guid, _
                ByVal JobTitle As String, _
                ByVal HiredDate As System.Nullable(Of Date), _
                ByVal AccountWorkingDayTypeId As Guid, _
                ByVal AccountTimeOffPolicyId As Guid, _
                ByVal TimeOffApprovalTypeId As Integer, _
                ByVal AccountHolidayTypeId As Guid, _
                ByVal IsForcePasswordChange As System.Nullable(Of Boolean), _
                ByVal UserInterfaceLanguage As String, _
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

        Dim LDAP As New LDAPUtilitiesBLL
        If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
            Me.UpdateAccountEmployeeActiveDirectory(Username, Password, Prefix, FirstName, LastName, MiddleName, EMailAddress, AccountId, AccountDepartmentId, AccountRoleId, AccountLocationId, AddressLine1, AddressLine2, State, City, Zip, CountryId, HomePhoneNo, WorkPhoneNo, MobilePhoneNo, BillingTypeId, StartDate, TerminationDate, StatusId, IsDeleted, IsDisabled, DefaultProjectId, TimeZoneId, CreatedByEmployeeId, ModifiedByEmployeeId, AllowedAccessFromIP, Original_AccountEmployeeId, EmployeeManagerId, EmployeePayTypeId, JobTitle, HiredDate, AccountWorkingDayTypeId, EmployeeCode, AccountTimeOffPolicyId, TimeOffApprovalTypeId, AccountHolidayTypeId, IsForcePasswordChange, UserInterfaceLanguage, CustomField1, CustomField2, CustomField3, CustomField4, CustomField5, CustomField6, CustomField7, CustomField8, CustomField9, CustomField10, CustomField11, CustomField12, CustomField13, CustomField14, CustomField15)
            Return True
        Else
            Me.UpdateAccountEmployee(Username, Password, Prefix, FirstName, LastName, MiddleName, EMailAddress, EmployeeCode, AccountId, AccountDepartmentId, AccountRoleId, AccountLocationId, AddressLine1, AddressLine2, State, City, Zip, CountryId, HomePhoneNo, WorkPhoneNo, MobilePhoneNo, BillingTypeId, StartDate, TerminationDate, StatusId, IsDeleted, IsDisabled, DefaultProjectId, EmployeeManagerId, TimeZoneId, CreatedByEmployeeId, ModifiedByEmployeeId, AllowedAccessFromIP, Original_AccountEmployeeId, EmployeePayTypeId, JobTitle, HiredDate, AccountWorkingDayTypeId, AccountTimeOffPolicyId, TimeOffApprovalTypeId, AccountHolidayTypeId, IsForcePasswordChange, UserInterfaceLanguage, CustomField1, CustomField2, CustomField3, CustomField4, CustomField5, CustomField6, CustomField7, CustomField8, CustomField9, CustomField10, CustomField11, CustomField12, CustomField13, CustomField14, CustomField15)
            Return True
        End If
        Return False
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateExternalAccountEmployee( _
                    ByVal Login As String, _
                    ByVal Password As String, _
                    ByVal Prefix As String, _
                    ByVal FirstName As String, _
                    ByVal LastName As String, _
                    ByVal MiddleName As String, _
                    ByVal EMailAddress As String, _
                    ByVal AccountId As System.Nullable(Of Integer), _
                    ByVal AccountDepartmentId As System.Nullable(Of Integer), _
                    ByVal AccountRoleId As System.Nullable(Of Integer), _
                    ByVal AccountLocationId As System.Nullable(Of Integer), _
                    ByVal AddressLine1 As String, _
                    ByVal AddressLine2 As String, _
                    ByVal State As String, _
                    ByVal City As String, _
                    ByVal Zip As String, _
                    ByVal CountryId As System.Nullable(Of Short), _
                    ByVal HomePhoneNo As String, _
                    ByVal WorkPhoneNo As String, _
                    ByVal MobilePhoneNo As String, _
                    ByVal BillingRateCurrencyId As System.Nullable(Of Short), _
                    ByVal BillingTypeId As System.Nullable(Of Integer), _
                    ByVal BillingRate As System.Nullable(Of Decimal), _
                    ByVal BillingRateStartDate As System.Nullable(Of Date), _
                    ByVal StartDate As System.Nullable(Of Date), _
                    ByVal TerminationDate As System.Nullable(Of Date), _
                    ByVal StatusId As System.Nullable(Of Byte), _
                    ByVal IsDeleted As System.Nullable(Of Boolean), _
                    ByVal IsDisabled As System.Nullable(Of Boolean), _
                    ByVal DefaultProjectId As System.Nullable(Of Integer), _
                    ByVal TimeZoneId As System.Nullable(Of Byte), _
                    ByVal CreatedByEmployeeId As Integer, _
                    ByVal ModifiedByEmployeeId As Integer, _
                    ByVal AllowedAccessFromIP As String, _
                    ByVal EmployeeTypeId As Byte, _
                    ByVal ExternalUserClientId As Integer, _
                    ByVal Original_AccountEmployeeId As Integer _
                    ) As Boolean

        ' Update the product record

        'NewAccountEmployeeId = Adapter.InsertEmployee(Password, FirstName, LastName, MiddleName, EMailAddress, AccountId, AccountDepartmentId, AccountRoleId, AddressLine1, AddressLine2, City, Zip, CInt(CountryId), HomePhoneNo, WorkPhoneNo, MobilePhoneNo, CInt(BillingRateCurrencyId), BillingRate, StartDate, 1, False, False, Login, Prefix, BillingRateStartDate, Date.Now, CreatedByEmployeeId, Date.Now, ModifiedByEmployeeId, AccountLocationId, CInt(BillingTypeId), TimeZoneId)



        Dim AccountEmployees As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByAccountEmployeeID(Original_AccountEmployeeId)
        Dim AccountEmployee As AccountEmployee.AccountEmployeeRow = AccountEmployees.Rows(0)

        With AccountEmployee

            .Username = EMailAddress
            If Password <> "" Then
                .Password = New CustomProviders.LiveMembershipProvider().EncodePassword(Password)
            End If
            .Prefix = Prefix
            .FirstName = FirstName
            .LastName = LastName
            .MiddleName = MiddleName
            .TimeZoneId = TimeZoneId
            If .EMailAddress <> EMailAddress Then
                If Not Me.ValidateExistingEmployee(EMailAddress, Original_AccountEmployeeId) Then
                    Throw New Exception("Specified email already exist")
                    Return False
                Else
                    .EMailAddress = EMailAddress

                End If
            End If



            If AccountRoleId.HasValue Then
                .AccountRoleId = AccountRoleId
            End If

            .ModifiedOn = Now
            .ModifiedByEmployeeId = ModifiedByEmployeeId
            .AllowedAccessFromIP = AllowedAccessFromIP
            .ExternalUserClientId = ExternalUserClientId
            .EmployeeTypeId = 2
            .IsDisabled = IsDisabled
        End With

        Dim rowsAffected As Integer = Adapter.Update(AccountEmployee)

        AfterUpdate()

        ' Return true if precisely one row was updated, otherwise false
        Return rowsAffected = 1
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteAccountEmployee(ByVal Original_AccountEmployeeId As Integer) As Boolean
        Dim AccountEmployees As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByAccountEmployeeID(Original_AccountEmployeeId)
        Dim AccountEmployee As AccountEmployee.AccountEmployeeRow = AccountEmployees.Rows(0)

        With AccountEmployee
            .EMailAddress = .EMailAddress & Original_AccountEmployeeId
            .IsDeleted = True
        End With

        Dim rowsAffected As Integer = Adapter.Update(AccountEmployee)

        AfterUpdate()

        ' Return true if precisely one row was updated, otherwise false
        Return rowsAffected = 1
    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function AddAccountEmployee2( _
                    ByVal Login As String, _
                    ByVal Password As String, _
                    ByVal Prefix As String, _
                    ByVal FirstName As String, _
                    ByVal LastName As String _
                    ) As Boolean
        ' Create a new ProductRow instance

    End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateUsernameOfExistingEmployee(ByVal Original_AccountEmployeeId As Integer, _
                ByVal Username As String _
                ) As Boolean

        ' Update the product record

        If Original_AccountEmployeeId = 0 Then
            Exit Function
        End If

        Dim AccountEmployees As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByAccountEmployeeID(Original_AccountEmployeeId)
        Dim AccountEmployee As AccountEmployee.AccountEmployeeRow

        If AccountEmployees.Rows.Count > 0 Then
            AccountEmployee = AccountEmployees.Rows(0)

            With AccountEmployee
                .ModifiedOn = Now
                .Username = Username
            End With

            AfterUpdate()
            Dim rowsAffected As Integer = Adapter.Update(AccountEmployee)
            ' Return true if precisely one row was updated, otherwise false
            Return rowsAffected = 1
        End If

    End Function
    Public Function CheckPasswordChangePolicy(ByVal AccountEmployeeRow As AccountEmployee.vueAccountEmployeeRow) As Boolean
        Dim LDAP As New LDAPUtilitiesBLL
        If LDAP.IsAspNetActiveDirectoryMembershipProvider <> True Then
            If Not IsDBNull(AccountEmployeeRow.Item("PasswordChangedDate")) And Not IsDBNull(AccountEmployeeRow.Item("PasswordExpiryPeriod")) Then
                If AccountEmployeeRow.PasswordExpiryPeriod > 0 Then
                    If Now.Date >= (AccountEmployeeRow.PasswordChangedDate.AddDays(AccountEmployeeRow.PasswordExpiryPeriod)).Date Then
                        System.Web.HttpContext.Current.Response.Redirect("~/Authenticate/PasswordChange.aspx?Username=" & AccountEmployeeRow.EMailAddress & "&IsPasswordExpired=True", False)
                        Return True
                    End If
                End If
            End If
            If AccountEmployeeRow.IsForcePasswordChange Then
                System.Web.HttpContext.Current.Response.Redirect("~/Authenticate/PasswordChange.aspx?Username=" & AccountEmployeeRow.EMailAddress, False)
                Return True
            End If
        End If
    End Function
    Public Function ValidateLogin(ByVal Username As String, ByVal Password As String) As Boolean

        Dim AccountEmployees As AccountEmployee.vueAccountEmployeeDataTable

        If New LDAPUtilitiesBLL().IsAspNetActiveDirectoryMembershipProvider = True Then
            AccountEmployees = ViewAdapter.GetDataByEmployeeLogin(Username)
        Else
            AccountEmployees = ViewAdapter.GetDataByUsernameAndPassword(Username, Password)
        End If

        If AccountEmployees.Rows.Count > 0 Then
            Call New AccountPagePermissionBLL().ResetPageSecurity()
            Dim AccountEmployeeRow As AccountEmployee.vueAccountEmployeeRow = AccountEmployees.Rows(0)

            If CheckPasswordChangePolicy(AccountEmployeeRow) Then
                Return False
            End If

            System.Web.HttpContext.Current.Session.Add("AccountId", AccountEmployeeRow.AccountId)

            If Not LicensingBLL.IsUserIsAllowedToLogin(AccountEmployeeRow.AccountEmployeeId, AccountEmployeeRow.AccountId, AccountEmployeeRow.Item("AccountExpiryActivation"), AccountEmployeeRow.Item("LicenseActivation")) Then
                Return False
            End If

            System.Web.HttpContext.Current.Response.Cookies("AccountEmployeeId").Value = AccountEmployeeRow.AccountEmployeeId
            System.Web.HttpContext.Current.Session.Add("AccountEmployeeId", AccountEmployeeRow.AccountEmployeeId)
            System.Web.HttpContext.Current.Session.Add("CountryId", AccountEmployeeRow.CountryId)
            System.Web.HttpContext.Current.Session.Add("DefaultCurrencyId", AccountEmployeeRow.DefaultCurrencyId)

            Me.SetSessionValues(AccountEmployeeRow, AccountEmployeeRow.AccountEmployeeId)
            AccountBLL.InsertNewDefaultDataWhichIsNotExist()
            Dim str As String
            str = System.Web.HttpContext.Current.Request.UserHostAddress()
            If AccountEmployeeRow.AllowedAccessFromIP = str Or AccountEmployeeRow.AllowedAccessFromIP = "" Then
                Return True
            End If

        ElseIf Username.ToLower = "systemadmin" Then
            If System.Configuration.ConfigurationManager.AppSettings("SystemSettingPassword") Is Nothing OrElse System.Configuration.ConfigurationManager.AppSettings("SystemSettingPassword") = "" Then
                Return True
            ElseIf DBUtilities.EncryptPasswordInHash(Password) = System.Configuration.ConfigurationManager.AppSettings("SystemSettingPassword") Then
                Return True
            Else
                Return False
            End If
        Else

            Return False
        End If
    End Function
    Public Function ValidateLoginWS(ByVal Username As String, ByVal Password As String) As Boolean
        Dim AccountEmployees As AccountEmployee.vueAccountEmployeeDataTable
        Password = DBUtilities.EncryptPasswordInHash(Password)
        If New LDAPUtilitiesBLL().IsAspNetActiveDirectoryMembershipProvider = True Then
            AccountEmployees = ViewAdapter.GetDataByAdminEmployeeLogin(Username)
        Else
            AccountEmployees = ViewAdapter.GetDataByAdminUsernameAndPassword(Username, Password)
        End If
        If AccountEmployees.Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function GetDataByAdminLogin(ByVal Username As String, ByVal Password As String) As AccountEmployee.vueAccountEmployeeDataTable
        Dim AccountEmployees As AccountEmployee.vueAccountEmployeeDataTable
        Password = DBUtilities.EncryptPasswordInHash(Password)
        If New LDAPUtilitiesBLL().IsAspNetActiveDirectoryMembershipProvider = True Then
            AccountEmployees = ViewAdapter.GetDataByAdminEmployeeLogin(Username)
        Else
            AccountEmployees = ViewAdapter.GetDataByAdminUsernameAndPassword(Username, Password)
        End If
        Return AccountEmployees
    End Function
    Public Sub SetSessionValues(ByVal AccountEmployeeRow As AccountEmployee.vueAccountEmployeeRow, ByVal AccountEmployeeId As Integer)

        If AccountEmployeeRow Is Nothing Then
            AccountEmployeeRow = Me.GetViewAccountEmployeesByAccountEmployeeId(AccountEmployeeId).Rows(0)
        End If

        System.Web.HttpContext.Current.Session.Add("CultureInfoName", AccountEmployeeRow.CultureInfoName)
        System.Web.HttpContext.Current.Session.Add("CurrencySymbol", AccountEmployeeRow.CurrencySymbol)
        System.Web.HttpContext.Current.Session.Add("TimeEntryFormat", AccountEmployeeRow.TimeEntryFormat)
        System.Web.HttpContext.Current.Session.Add("AccountEmployeeFullName", AccountEmployeeRow.FirstName & " " & AccountEmployeeRow.LastName)
        System.Web.HttpContext.Current.Session.Add("ShowClockStartEnd", AccountEmployeeRow.ShowClockStartEnd)
        System.Web.HttpContext.Current.Session.Add("TimeZoneId", AccountEmployeeRow.TimeZoneId)
        System.Web.HttpContext.Current.Session.Add("CountryId", AccountEmployeeRow.CountryId)
        System.Web.HttpContext.Current.Session.Add("AccountRoleId", AccountEmployeeRow.AccountRoleId)
        System.Web.HttpContext.Current.Session.Add("Role", AccountEmployeeRow.Role)
        System.Web.HttpContext.Current.Session.Add("EmailAddress", AccountEmployeeRow.EMailAddress)

        If Not IsDBNull(AccountEmployeeRow("ShowClientInTimesheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowClientInTimesheet", AccountEmployeeRow.ShowClientInTimesheet)
        End If

        If Not IsDBNull(AccountEmployeeRow("ShowDescriptionInWeekView")) Then
            System.Web.HttpContext.Current.Session.Add("ShowDescriptionInWeekView", AccountEmployeeRow.ShowDescriptionInWeekView)
        End If

        If Not IsDBNull(AccountEmployeeRow("EmployeeTimeZoneId")) Then
            System.Web.HttpContext.Current.Session.Add("EmployeeTimeZoneId", AccountEmployeeRow.EmployeeTimeZoneId)
        End If


        If Not IsDBNull(AccountEmployeeRow("ScheduledEmailSendTime")) Then
            System.Web.HttpContext.Current.Session.Add("ScheduledEmailSendTime", AccountEmployeeRow.ScheduledEmailSendTime)
        End If

        If Not IsDBNull(AccountEmployeeRow("LastScheduledEmailSentTime")) Then
            System.Web.HttpContext.Current.Session.Add("LastScheduledEmailSentTime", AccountEmployeeRow.LastScheduledEmailSentTime)
        End If

        '  LocaleUtilitiesBLL.GetCurrentThreadCultureCurrencySymbol()
        If Not IsDBNull(AccountEmployeeRow("ShowCompletedTasksInTimeSheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowCompletedTasksInTimeSheet", AccountEmployeeRow.ShowCompletedTasksInTimeSheet)
        End If

        If Not IsDBNull(AccountEmployeeRow("ShowWorkTypeInTimeSheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowWorkTypeInTimeSheet", AccountEmployeeRow.ShowWorkTypeInTimeSheet)
        End If

        If Not IsDBNull(AccountEmployeeRow("ShowCostCenterInTimeSheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowCostCenterInTimeSheet", AccountEmployeeRow.ShowCostCenterInTimeSheet)
        End If

        If Not IsDBNull(AccountEmployeeRow("IsCompanyOwnLogo")) Then
            System.Web.HttpContext.Current.Session.Add("IsCompanyOwnLogo", AccountEmployeeRow.IsCompanyOwnLogo)
        End If

        If Not IsDBNull(AccountEmployeeRow("AccountSessionTimeout")) Then
            System.Web.HttpContext.Current.Session.Timeout = AccountEmployeeRow.AccountSessionTimeout
        End If

        If Not IsDBNull(AccountEmployeeRow("NumberOfBlankRowsInTimeEntry")) Then
            System.Web.HttpContext.Current.Session.Add("NumberOfBlankRowsInTimeEntry", AccountEmployeeRow.NumberOfBlankRowsInTimeEntry)
        End If

        If Not IsDBNull(AccountEmployeeRow("FromEmailAddressDisplayName")) Then
            System.Web.HttpContext.Current.Session.Add("FromEmailAddressDisplayName", AccountEmployeeRow.FromEmailAddressDisplayName)
        End If

        If Not IsDBNull(AccountEmployeeRow("FromEmailAddress")) Then
            System.Web.HttpContext.Current.Session.Add("FromEmailAddress", AccountEmployeeRow.FromEmailAddress)
        End If

        If Not IsDBNull(AccountEmployeeRow("LockSubmittedRecords")) Then
            System.Web.HttpContext.Current.Session.Add("LockSubmittedRecords", AccountEmployeeRow.LockSubmittedRecords)
        End If

        If Not IsDBNull(AccountEmployeeRow("LockApprovedRecords")) Then
            System.Web.HttpContext.Current.Session.Add("LockApprovedRecords", AccountEmployeeRow.LockApprovedRecords)
        End If

        If Not IsDBNull(AccountEmployeeRow("WeekStartDay")) Then
            System.Web.HttpContext.Current.Session.Add("WeekStartDay", AccountEmployeeRow.WeekStartDay)
        End If

        If Not IsDBNull(AccountEmployeeRow("HoursPerDay")) Then
            System.Web.HttpContext.Current.Session.Add("HoursPerDay", AccountEmployeeRow.HoursPerDay)
        End If

        If Not IsDBNull(AccountEmployeeRow("MaximumHoursPerDay")) Then
            System.Web.HttpContext.Current.Session.Add("MaximumHoursPerDay", AccountEmployeeRow.MaximumHoursPerDay)
        End If

        If Not IsDBNull(AccountEmployeeRow("MinimumHoursPerDay")) Then
            System.Web.HttpContext.Current.Session.Add("MinimumHoursPerDay", AccountEmployeeRow.MinimumHoursPerDay)
        End If

        If Not IsDBNull(AccountEmployeeRow("MinimumHoursPerWeek")) Then
            System.Web.HttpContext.Current.Session.Add("MinimumHoursPerWeek", AccountEmployeeRow.MinimumHoursPerWeek)
        End If

        If Not IsDBNull(AccountEmployeeRow("MaximumHoursPerWeek")) Then
            System.Web.HttpContext.Current.Session.Add("MaximumHoursPerWeek", AccountEmployeeRow.MaximumHoursPerWeek)
        End If

        If Not IsDBNull(AccountEmployeeRow("MaximumPercentagePerDay")) Then
            System.Web.HttpContext.Current.Session.Add("MaximumPercentagePerDay", AccountEmployeeRow.MaximumPercentagePerDay)
        End If

        If Not IsDBNull(AccountEmployeeRow("MinimumPercentagePerDay")) Then
            System.Web.HttpContext.Current.Session.Add("MinimumPercentagePerDay", AccountEmployeeRow.MinimumPercentagePerDay)
        End If

        If Not IsDBNull(AccountEmployeeRow("MinimumPercentagePerWeek")) Then
            System.Web.HttpContext.Current.Session.Add("MinimumPercentagePerWeek", AccountEmployeeRow.MinimumPercentagePerWeek)
        End If

        If Not IsDBNull(AccountEmployeeRow("MaximumPercentagePerWeek")) Then
            System.Web.HttpContext.Current.Session.Add("MaximumPercentagePerWeek", AccountEmployeeRow.MaximumPercentagePerWeek)
        End If

        If Not IsDBNull(AccountEmployeeRow("AccountBaseCurrencyId")) Then
            System.Web.HttpContext.Current.Session.Add("AccountBaseCurrencyId", AccountEmployeeRow.AccountBaseCurrencyId)
        End If

        If Not IsDBNull(AccountEmployeeRow("UserInterfaceLanguage")) Then
            System.Web.HttpContext.Current.Session.Add("UserInterfaceLanguage", AccountEmployeeRow.UserInterfaceLanguage)
        End If
        If Not IsDBNull(AccountEmployeeRow("DefaultTimeEntryMode")) Then
            System.Web.HttpContext.Current.Session.Add("DefaultTimeEntryMode", AccountEmployeeRow.DefaultTimeEntryMode)
        End If
        If Not IsDBNull(AccountEmployeeRow("PageSize")) Then
            System.Web.HttpContext.Current.Session.Add("PageSize", AccountEmployeeRow.PageSize)
        End If
        If Not IsDBNull(AccountEmployeeRow("EmployeeWeekStartDay")) Then
            System.Web.HttpContext.Current.Session.Add("EmployeeWeekStartDay", AccountEmployeeRow.EmployeeWeekStartDay)
        End If
        If Not IsDBNull(AccountEmployeeRow("InvoiceNoPrefix")) Then
            System.Web.HttpContext.Current.Session.Add("InvoiceNoPrefix", AccountEmployeeRow.InvoiceNoPrefix)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowAdditionalTaskInformationType")) Then
            System.Web.HttpContext.Current.Session.Add("ShowAdditionalTaskInformationType", AccountEmployeeRow.ShowAdditionalTaskInformationType)
        End If
        If Not IsDBNull(AccountEmployeeRow("AccountWorkingDayTypeId")) Then
            System.Web.HttpContext.Current.Session.Add("AccountWorkingDayTypeId", AccountEmployeeRow.AccountWorkingDayTypeId)
        End If
        If Not IsDBNull(AccountEmployeeRow("SystemTimesheetPeriodType")) Then
            System.Web.HttpContext.Current.Session.Add("EmployeeTimesheetPeriodType", AccountEmployeeRow.SystemTimesheetPeriodType)
        End If
        If Not IsDBNull(AccountEmployeeRow("SystemInitialDayOfFirstPeriod")) Then
            System.Web.HttpContext.Current.Session.Add("SystemInitialDayOfFirstPeriod", AccountEmployeeRow.SystemInitialDayOfFirstPeriod)
        End If
        If Not IsDBNull(AccountEmployeeRow("SystemInitialDayOfLastPeriod")) Then
            System.Web.HttpContext.Current.Session.Add("SystemInitialDayOfLastPeriod", AccountEmployeeRow.SystemInitialDayOfLastPeriod)
        End If
        If Not IsDBNull(AccountEmployeeRow("InitialDayOfTheMonth")) Then
            System.Web.HttpContext.Current.Session.Add("InitialDayOfTheMonth", AccountEmployeeRow.InitialDayOfTheMonth)
        End If
        If Not IsDBNull(AccountEmployeeRow("TimesheetPrintFooter")) Then
            System.Web.HttpContext.Current.Session.Add("TimesheetPrintFooter", AccountEmployeeRow.TimesheetPrintFooter)
        End If
        If Not IsDBNull(AccountEmployeeRow("ExpenseSheetPrintFooter")) Then
            System.Web.HttpContext.Current.Session.Add("ExpenseSheetPrintFooter", AccountEmployeeRow.ExpenseSheetPrintFooter)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowCompletedProjectsInTimeSheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowCompletedProjectsInTimeSheet", AccountEmployeeRow.ShowCompletedProjectsInTimeSheet)
        End If
        If Not IsDBNull(AccountEmployeeRow("EmployeeNameWithCode")) Then
            System.Web.HttpContext.Current.Session.Add("EmployeeNameWithCode", AccountEmployeeRow.EmployeeNameWithCode)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowProjectForTimeOff")) Then
            System.Web.HttpContext.Current.Session.Add("ShowProjectForTimeOff", AccountEmployeeRow.ShowProjectForTimeOff)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowTimeOffInTimesheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowTimeOffInTimesheet", AccountEmployeeRow.ShowTimeOffInTimesheet)
        End If
        If Not IsDBNull(AccountEmployeeRow("PasswordExpiryPeriod")) Then
            System.Web.HttpContext.Current.Session.Add("PasswordExpiryPeriod", AccountEmployeeRow.PasswordExpiryPeriod)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowAllInTimesheetReadOnly")) Then
            System.Web.HttpContext.Current.Session.Add("ShowAllInTimesheetReadOnly", AccountEmployeeRow.ShowAllInTimesheetReadOnly)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowTaskInExpenseSheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowTaskInExpenseSheet", AccountEmployeeRow.ShowTaskInExpenseSheet)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowBillingRateInInvoiceReport")) Then
            System.Web.HttpContext.Current.Session.Add("ShowBillingRateInInvoiceReport", AccountEmployeeRow.ShowBillingRateInInvoiceReport)
        End If
        If Not IsDBNull(AccountEmployeeRow("InvoiceBillingTypeId")) Then
            System.Web.HttpContext.Current.Session.Add("InvoiceBillingTypeId", AccountEmployeeRow.InvoiceBillingTypeId)
        End If
        If Not IsDBNull(AccountEmployeeRow("InvoiceFooter")) Then
            System.Web.HttpContext.Current.Session.Add("InvoiceFooter", AccountEmployeeRow.InvoiceFooter)
        End If
        If Not IsDBNull(AccountEmployeeRow("TimesheetOverdueAfterDays")) Then
            System.Web.HttpContext.Current.Session.Add("TimesheetOverdueAfterDays", AccountEmployeeRow.TimesheetOverdueAfterDays)
        End If
        If Not IsDBNull(AccountEmployeeRow("TimesheetOverduePeriods")) Then
            System.Web.HttpContext.Current.Session.Add("TimesheetOverduePeriods", AccountEmployeeRow.TimesheetOverduePeriods)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowProjectNameInInvoiceReport")) Then
            System.Web.HttpContext.Current.Session.Add("ShowProjectNameInInvoiceReport", AccountEmployeeRow.ShowProjectNameInInvoiceReport)
        End If
        If Not IsDBNull(AccountEmployeeRow("AutoGenerateProjectCode")) Then
            System.Web.HttpContext.Current.Session.Add("AutoGenerateProjectCode", AccountEmployeeRow.AutoGenerateProjectCode)
        End If
        If Not IsDBNull(AccountEmployeeRow("ProjectCodePrefix")) Then
            System.Web.HttpContext.Current.Session.Add("ProjectCodePrefix", AccountEmployeeRow.ProjectCodePrefix)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowPercentageInTimesheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowPercentageInTimesheet", AccountEmployeeRow.ShowPercentageInTimesheet)
        End If
        If Not IsDBNull(AccountEmployeeRow("TimeEntryHoursFormatId")) Then
            System.Web.HttpContext.Current.Session.Add("TimeEntryHoursFormatId", AccountEmployeeRow.TimeEntryHoursFormatId)
        Else
            System.Web.HttpContext.Current.Session.Add("TimeEntryHoursFormatId", System.DBNull.Value)
        End If
        If Not IsDBNull(AccountEmployeeRow("EnablePasswordComplexity")) Then
            System.Web.HttpContext.Current.Session.Add("EnablePasswordComplexity", AccountEmployeeRow.EnablePasswordComplexity)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowClientDepartmentInProject")) Then
            System.Web.HttpContext.Current.Session.Add("ShowClientDepartmentInProject", AccountEmployeeRow.ShowClientDepartmentInProject)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowEntryDateInInvoiceReport")) Then
            System.Web.HttpContext.Current.Session.Add("ShowEntryDateInInvoiceReport", AccountEmployeeRow.ShowEntryDateInInvoiceReport)
        End If
        If Not IsDBNull(AccountEmployeeRow("TimesheetSort")) Then
            System.Web.HttpContext.Current.Session.Add("TimesheetSort", AccountEmployeeRow.TimesheetSort)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowCostCenterInTimesheetBy")) Then
            System.Web.HttpContext.Current.Session.Add("ShowCostCenterInTimesheetBy", AccountEmployeeRow.ShowCostCenterInTimesheetBy)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowCopyTimesheetButton")) Then
            System.Web.HttpContext.Current.Session.Add("ShowCopyTimesheetButton", AccountEmployeeRow.ShowCopyTimesheetButton)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowCopyActivitiesButtonInTimesheet")) Then
            System.Web.HttpContext.Current.Session.Add("ShowCopyActivitiesButtonInTimesheet", AccountEmployeeRow.ShowCopyActivitiesButtonInTimesheet)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowProjectNameInTask")) Then
            System.Web.HttpContext.Current.Session.Add("ShowProjectNameInTask", AccountEmployeeRow.ShowProjectNameInTask)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowClientNameInTask")) Then
            System.Web.HttpContext.Current.Session.Add("ShowClientNameInTask", AccountEmployeeRow.ShowClientNameInTask)
        End If
        If Not IsDBNull(AccountEmployeeRow("IsShowElectronicSign")) Then
            System.Web.HttpContext.Current.Session.Add("IsShowElectronicSign", AccountEmployeeRow.IsShowElectronicSign)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowCompletedProjectInProjectGrid")) Then
            System.Web.HttpContext.Current.Session.Add("ShowCompletedProjectInProjectGrid", AccountEmployeeRow.ShowCompletedProjectInProjectGrid)
        End If
        If Not IsDBNull(AccountEmployeeRow("ShowEmployeeNameInInvoiceReport")) Then
            System.Web.HttpContext.Current.Session.Add("ShowEmployeeNameInInvoiceReport", AccountEmployeeRow.ShowEmployeeNameInInvoiceReport)
        End If
        If Not IsDBNull(AccountEmployeeRow("CalculateTaskPercentageAutomatically")) Then
            System.Web.HttpContext.Current.Session.Add("CalculateTaskPercentageAutomatically", AccountEmployeeRow.CalculateTaskPercentageAutomatically)
        End If
        If Not IsDBNull(AccountEmployeeRow("LockAllPreviousTimesheets")) Then
            System.Web.HttpContext.Current.Session.Add("LockAllPreviousTimesheets", AccountEmployeeRow.LockAllPreviousTimesheets)
        End If
        If Not IsDBNull(AccountEmployeeRow("LockAllFutureTimesheets")) Then
            System.Web.HttpContext.Current.Session.Add("LockAllFutureTimesheets", AccountEmployeeRow.LockAllFutureTimesheets)
        End If
        If Not IsDBNull(AccountEmployeeRow("LockPreviousTimesheetPeriods")) Then
            System.Web.HttpContext.Current.Session.Add("LockPreviousTimesheetPeriods", AccountEmployeeRow.LockPreviousTimesheetPeriods)
        End If
        If Not IsDBNull(AccountEmployeeRow("LockFutureTimsheetPeriods")) Then
            System.Web.HttpContext.Current.Session.Add("LockFutureTimsheetPeriods", AccountEmployeeRow.LockFutureTimsheetPeriods)
        End If
        If Not IsDBNull(AccountEmployeeRow("LockPreviousNextMonthTimesheetOn")) Then
            System.Web.HttpContext.Current.Session.Add("LockPreviousNextMonthTimesheetOn", AccountEmployeeRow.LockPreviousNextMonthTimesheetOn)
        End If
        If Not IsDBNull(AccountEmployeeRow("EnableBalanceValidationForTimeOff")) Then
            System.Web.HttpContext.Current.Session.Add("EnableBalanceValidationForTimeOff", AccountEmployeeRow.EnableBalanceValidationForTimeOff)
        End If
        ' Update Features of hosted
        LicensingBLL.UpdateFeaturesOfAccounts()
    End Sub
    Public Sub SetSessionValuesUILanguage(ByVal AccountEmployeeRow As AccountEmployee.vueAccountEmployeeRow, ByVal AccountEmployeeId As Integer, ByVal UserInterfaceLanguage As String)
        If AccountEmployeeRow Is Nothing Then
            AccountEmployeeRow = Me.GetViewAccountEmployeesByAccountEmployeeId(AccountEmployeeId).Rows(0)
        End If
        If Not IsDBNull(AccountEmployeeRow("UserInterfaceLanguage")) Then
            System.Web.HttpContext.Current.Session.Add("UserInterfaceLanguage", UserInterfaceLanguage)
        End If
    End Sub
    Public Function GetRoleName(ByVal AccountEmployeeId As Integer) As String
        Dim objAccountEmployee As AccountEmployee.AccountEmployeeRow
        objAccountEmployee = CType(Me.GetAccountEmployeesByAccountEmployeeId(AccountEmployeeId).Rows(0), AccountEmployee.AccountEmployeeRow)

        Dim objAccountRole As TimeLiveDataSet.AccountRoleRow
        Dim objAccountRoleBLL As New AccountRoleBLL
        objAccountRole = objAccountRoleBLL.GetAccountRolesByAccountRoleId(objAccountEmployee.AccountRoleId).Rows(0)

        Return objAccountRole.Role

    End Function
    Public Function GetRoles(ByVal AccountEmployeeId) As String()

        Dim aRoles(0) As String
        aRoles(0) = System.Web.HttpContext.Current.Session("Role")

        Dim dtProjects As TimeLiveDataSet.AccountProjectDataTable = New AccountProjectBLL().GetAccountProjectsByTeamLeadIdOrProjectManagerId(AccountEmployeeId)
        Dim dtEmployees As AccountEmployee.AccountEmployeeDataTable = New AccountEmployeeBLL().GetAccountEmployeesByAccountId(DBUtilities.GetSessionAccountId)

        If dtProjects.Select("LeaderEmployeeId = " & AccountEmployeeId).Length > 0 Then
            ReDim Preserve aRoles(aRoles.Length)
            aRoles(aRoles.Length - 1) = "Team Lead"
        End If

        If dtProjects.Select("ProjectManagerEmployeeId = " & AccountEmployeeId).Length > 0 Then
            ReDim Preserve aRoles(aRoles.Length)
            aRoles(aRoles.Length - 1) = "Project Manager"
        End If

        If dtEmployees.Select("EmployeeManagerId = " & AccountEmployeeId).Length > 0 Then
            ReDim Preserve aRoles(aRoles.Length)
            aRoles(aRoles.Length - 1) = "Time Entry Approver"
        End If

        If dtEmployees.Select("EmployeeManagerId = " & AccountEmployeeId).Length > 0 Then
            ReDim Preserve aRoles(aRoles.Length)
            aRoles(aRoles.Length - 1) = "Expense Entry Approver"
        End If

        Return aRoles
    End Function
    Public Sub AfterAddNewEmployee(ByVal AccountId As Integer, ByVal AccountEmployeeId As Integer, ByVal ToEMailAddress As String, ByVal DoNotSendEMail As Boolean, ByVal Password As String, ByVal IsADEmployee As Boolean)
        Dim AdminEmailAddress As String
        If DBUtilities.IsApplicationContext = True Then
            AdminEmailAddress = GetEmailAddressByAccountEmployeeId(DBUtilities.GetSessionAccountEmployeeId)
        Else
            AdminEmailAddress = GetAdminEmailAddressIfSessionIsNothing(AccountId)
        End If
        If DoNotSendEMail = False And IsEmployeeNotificationAllowed(AccountId) Then
            SendNewEmployeeEMail(AccountId, AccountEmployeeId, ToEMailAddress, Password, IsADEmployee)
            SendNewEmployeeEMail(AccountId, AccountEmployeeId, ToEMailAddress, Password, IsADEmployee, AdminEmailAddress)
        End If
    End Sub
    Public Function GetEmailAddressByAccountEmployeeId(ByVal AccountEmployeeId As Integer) As String
        Dim objAccountEmployee As New AccountEmployeeBLL
        Dim dtAccountEmployee As AccountEmployee.AccountEmployeeDataTable = objAccountEmployee.GetAccountEmployeesByAccountEmployeeId(AccountEmployeeId)
        Dim drAccountEmployee As AccountEmployee.AccountEmployeeRow
        If dtAccountEmployee.Rows.Count > 0 Then
            drAccountEmployee = dtAccountEmployee.Rows(0)
            Return drAccountEmployee.EMailAddress
        End If
    End Function
    Public Function GetAdminEmailAddressIfSessionIsNothing(ByVal AccountId As Integer) As String
        Dim objAccountEmployee As New AccountEmployeeBLL
        Dim dtAccountEmployee As AccountEmployee.AccountEmployeeDataTable = Adapter.GetAdminEmployeesByAccountId(AccountId)
        Dim drAccountEmployee As AccountEmployee.AccountEmployeeRow
        If dtAccountEmployee.Rows.Count > 0 Then
            drAccountEmployee = dtAccountEmployee.Rows(0)
            Return drAccountEmployee.EMailAddress
        End If
    End Function
    Public Sub SendNewEmployeeEMail(ByVal AccountId As Integer, ByVal AccountEmployeeId As Integer, ByVal ToEMailAddress As String, ByVal Password As String, ByVal IsADEmployee As Boolean, Optional ByVal AdminEmailAddress As String = "")
        Dim EMailAddress As String = IIf(AdminEmailAddress <> "", AdminEmailAddress, ToEMailAddress)
        If Not IsADEmployee Then
            EMailUtilities.SendEMail(ResourceHelper.GetFromResource("Welcome To TimeLive"), "NewEmployeeTemplate", GetPreparedNameValueForNewEmployee(AccountEmployeeId, Password), EMailAddress, , , EMailUtilities.EMPLOYEE_LOGIN_INFORMATION_FROM)
        Else
            EMailUtilities.SendEMail(ResourceHelper.GetFromResource("Welcome To TimeLive"), "NewADEmployeeTemplate", GetPreparedNameValueForNewADEmployee(AccountEmployeeId, Password), EMailAddress, , , EMailUtilities.EMPLOYEE_LOGIN_INFORMATION_FROM)
        End If
        EMailUtilities.DequeueEmail()
    End Sub
    Public Sub SendPasswordResetEMail(ByVal ToEMailAddress As String, ByVal Password As String)
        EMailUtilities.SendEMail(ResourceHelper.GetFromResource("Your TimeLive Password"), "PasswordResetTemplate", GetPreparedNameValueForPasswordReset(ToEMailAddress, Password), ToEMailAddress, , , EMailUtilities.TIMELIVE_PASSWORD_RESET_INFORMATION_FROM)
        EMailUtilities.DequeueEmail()
    End Sub
    Public Function GetPreparedNameValueForPasswordReset(ByVal EmailAddress As String, ByVal Password As String) As StringDictionary
        Dim drAccountEmployee As AccountEmployee.AccountEmployeeRow
        Dim objAccountEmployee As New AccountEmployeeBLL
        drAccountEmployee = objAccountEmployee.GetAccountEmployeesByEmailAddress(EmailAddress).Rows(0)
        Dim dict As New StringDictionary
        dict.Add("[emailaddress]", drAccountEmployee.EMailAddress)
        dict.Add("[password]", Password)
        dict.Add("[fullname]", drAccountEmployee.FullName)
        Return dict
    End Function
    Public Function GetPreparedNameValueForNewEmployee(ByVal AccountEmployeeId As Integer, ByVal Password As String) As StringDictionary
        Dim drAccountEmployee As AccountEmployee.AccountEmployeeRow
        Dim objAccountEmployee As New AccountEmployeeBLL
        drAccountEmployee = objAccountEmployee.GetAccountEmployeesByAccountEmployeeId(AccountEmployeeId).Rows(0)
        Dim dict As New StringDictionary
        dict.Add("[EMailAddress]", drAccountEmployee.EMailAddress)
        dict.Add("[Password]", Password)
        dict.Add("[url]", System.Configuration.ConfigurationManager.AppSettings("SitePrefix"))
        Return dict
    End Function
    Public Function GetPreparedNameValueForNewADEmployee(ByVal AccountEmployeeId As Integer, ByVal Password As String) As StringDictionary
        Dim drAccountEmployee As AccountEmployee.AccountEmployeeRow
        Dim objAccountEmployee As New AccountEmployeeBLL
        drAccountEmployee = objAccountEmployee.GetAccountEmployeesByAccountEmployeeId(AccountEmployeeId).Rows(0)
        Dim dict As New StringDictionary
        dict.Add("[username]", drAccountEmployee.Username)
        dict.Add("[url]", System.Configuration.ConfigurationManager.AppSettings("SitePrefix"))
        Return dict
    End Function
    Public Shared Sub SetDataForEmployeeDropdown(ByVal SystemSecurtiyCategoryPageId As Integer, ByVal DropDownName As DropDownList)
        Dim objDataView As New DataView()
        Dim bllAccountEmployee As New AccountEmployeeBLL
        Dim dtvueAccountEmployee As AccountEmployee.vueAccountEmployeeDataTable

        Dim WhereClause As String = ""
        Dim IsPermission As Boolean = False
        Dim AccountId As Integer = DBUtilities.GetSessionAccountId
        Dim AccountEmployeeId As Integer = DBUtilities.GetSessionAccountEmployeeId
        If AccountPagePermissionBLL.IsPageHasPermissionOfShowAllData(SystemSecurtiyCategoryPageId) = True Then
            WhereClause = bllAccountEmployee.GetAdministratorWhereClause(AccountId)
            IsPermission = True
        End If

        If AccountPagePermissionBLL.IsPageHasPermissionOfShowMyProjectsData(SystemSecurtiyCategoryPageId) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetProjectManagerWhereClause(WhereClause, AccountEmployeeId, AccountId)
            IsPermission = True
        End If

        If AccountPagePermissionBLL.IsPageHasPermissionOfShowMyTeamsData(SystemSecurtiyCategoryPageId) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetTeamLeadWhereClause(WhereClause, AccountEmployeeId, AccountId)
            IsPermission = True
        End If

        If AccountPagePermissionBLL.IsPageHasPermissionOfShowMyData(SystemSecurtiyCategoryPageId) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetMyOwnWhereClause(WhereClause, AccountEmployeeId)
            IsPermission = True
        End If

        If AccountPagePermissionBLL.IsPageHasPermissionOfShowMySubOrdinatesData(SystemSecurtiyCategoryPageId) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetSubOrdinatesWhereClause(WhereClause, AccountEmployeeId)
            IsPermission = True
        End If

        If IsPermission = False Then
            WhereClause = WhereClause & bllAccountEmployee.GetMyOwnWhereClause(WhereClause, AccountEmployeeId)
        End If

        dtvueAccountEmployee = bllAccountEmployee.GetAccountEmployeesForDropdown(WhereClause)

        If dtvueAccountEmployee.Rows.Count = 0 Then
            WhereClause = ""
            WhereClause = WhereClause & bllAccountEmployee.GetMyOwnWhereClause(WhereClause, AccountEmployeeId)
            dtvueAccountEmployee = bllAccountEmployee.GetAccountEmployeesForDropdown(WhereClause)
        End If

        objDataView = dtvueAccountEmployee.DefaultView
        objDataView.Sort = "EmployeeNameWithCode"
        DropDownName.DataTextField = "EmployeeNameWithCode"
        DropDownName.DataValueField = "AccountEmployeeId"
        DropDownName.DataSource = objDataView
        DropDownName.DataBind()
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesForDropdown(ByVal WhereClause As String, Optional ByVal OrderColumnName As String = "") As AccountEmployee.vueAccountEmployeeDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueAccountEmployeeDataTable", "GetAccountEmployeesForDropdown", "WhereClause=" & WhereClause)
        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAccountEmployeesForDropdown = CacheManager.GetItemFromCache(strCacheKey)
        Else
            Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
            GetAccountEmployeesForDropdown = _vueAccountEmployeeTableAdapter.GetvueAccountEmployeeForReport(WhereClause)
            CacheManager.AddAccountDataInCache(GetAccountEmployeesForDropdown, strCacheKey)
        End If
        Return GetAccountEmployeesForDropdown
    End Function
    Public Shared Sub SetDataForEmployeeDropdownForCurrentEmployee(ByVal DropDownName As DropDownList)
        Dim objDataView As New DataView()
        Dim bllAccountEmployee As New AccountEmployeeBLL
        Dim dtvueAccountEmployee As AccountEmployee.vueAccountEmployeeDataTable

        Dim WhereClause As String = ""
        Dim AccountEmployeeId As Integer = DBUtilities.GetSessionAccountEmployeeId

        WhereClause = WhereClause & bllAccountEmployee.GetMyOwnWhereClause(WhereClause, AccountEmployeeId)

        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        dtvueAccountEmployee = _vueAccountEmployeeTableAdapter.GetvueAccountEmployeeForReport(WhereClause)

        objDataView = dtvueAccountEmployee.DefaultView
        objDataView.Sort = "EmployeeNameWithCode"
        DropDownName.DataTextField = "EmployeeNameWithCode"
        DropDownName.DataValueField = "AccountEmployeeId"
        DropDownName.DataSource = objDataView
        DropDownName.DataBind()
    End Sub
    Public Shared Sub SetDataForEmployeeListBox(ByVal SystemSecurtiyCategoryPageId As Integer, ByVal oListBox As ListBox, ByVal SystemPermissionId As Integer, ByVal AccountProjectId As Integer, Optional ByVal AccountProjectTaskId As Integer = 0)
        Dim objDataView As New DataView()
        Dim bllAccountEmployee As New AccountProjectEmployeeBLL
        Dim dtvueAccountEmployee As TimeLiveDataSet.vueAccountProjectEmployeFullJoinDataTable

        If AccountPagePermissionBLL.IsPageHasPermissionOfShowAllDataByPermission(SystemSecurtiyCategoryPageId, SystemPermissionId) = True Then
            dtvueAccountEmployee = bllAccountEmployee.GetAccountProjectEmployeesByAccountProjectIdAsView(AccountProjectId, AccountProjectTaskId)
        ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyProjectsDataByPermission(SystemSecurtiyCategoryPageId, SystemPermissionId) = True Then
            dtvueAccountEmployee = bllAccountEmployee.GetAccountProjectEmployeesByAccountProjectIdAsView(AccountProjectId, AccountProjectTaskId)
        ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyTeamsDataByPermission(SystemSecurtiyCategoryPageId, SystemPermissionId) = True Then
            dtvueAccountEmployee = bllAccountEmployee.GetAccountProjectEmployeesByAccountProjectIdAsView(AccountProjectId, AccountProjectTaskId)
        ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyDataByPermission(SystemSecurtiyCategoryPageId, SystemPermissionId) = True Then
            dtvueAccountEmployee = bllAccountEmployee.GetAccountProjectEmployeesByAccountEmployeeIdAsView(AccountProjectId, DBUtilities.GetSessionAccountEmployeeId)
        Else
            dtvueAccountEmployee = bllAccountEmployee.GetAccountProjectEmployeesByAccountEmployeeIdAsView(AccountProjectId, DBUtilities.GetSessionAccountEmployeeId)
        End If


        objDataView = dtvueAccountEmployee.DefaultView
        objDataView.Sort = "FullName"
        oListBox.DataSource = objDataView
        oListBox.DataBind()

    End Sub

    Public Shared Function GetAccountEmployeesFromDropdown(ByVal objDropdown As DropDownList) As String

        Dim strEmployees As String = ""

        If objDropdown.SelectedValue = 0 Then


            For Each objListItem As ListItem In objDropdown.Items
                If objListItem.Value > 0 Then
                    strEmployees = strEmployees & IIf(strEmployees = "", "", ",") & objListItem.Value
                End If
            Next


        Else

            strEmployees = objDropdown.SelectedValue

        End If

        Return strEmployees


    End Function

    Public Sub SetAllEmployeePasswordEncrypted(ByVal AccountId As Integer)
        Dim dtEmployees As AccountEmployee.AccountEmployeeDataTable = Me.GetAccountEmployeesByAccountId(AccountId)

        For Each Employee As AccountEmployee.AccountEmployeeRow In dtEmployees.Rows
            If Employee.Password <> "" Then
                Dim LDAP As New LDAPUtilitiesBLL
                If LDAP.IsAspNetActiveDirectoryMembershipProvider <> True Then
                    Employee.Password = CType(Membership.Provider, CustomProviders.LiveMembershipProvider).EncodePassword(Employee.Password)
                End If
                'Employee.AcceptChanges()
            End If
        Next

        Dim rowsAffected As Integer = Adapter.Update(dtEmployees)

    End Sub
    Public Shared Function GetEmployeeIfRowsCountEqualToZero() As AccountEmployee.vueAccountEmployeeDataTable

        Dim bllAccountEmployee As New AccountEmployeeBLL

        GetEmployeeIfRowsCountEqualToZero = bllAccountEmployee.GetViewAccountEmployeesByAccountEmployeeId(DBUtilities.GetSessionAccountEmployeeId)

        Return GetEmployeeIfRowsCountEqualToZero
    End Function
    Public Sub UpdatePasswordReset(ByVal EmailAddress As String, ByVal Password As String)
        Dim MembershipProvider As New CustomProviders.LiveMembershipProvider
        Password = MembershipProvider.EncodePassword(Password)
        Adapter.UpdatePasswordReset(Password, EmailAddress)
    End Sub
    Public Function UpdateIsDisableForAccountClosed(ByVal AccountId As Integer) As Boolean
        Me.Adapter.UpdateIsDisabledForAccountDisable(AccountId)
    End Function
    Public Shared Sub SetDataForEmployeeDropdownForCustomaizeReport(ByVal DropDownName As DropDownList, ByVal AccountReportId As Guid)
        Dim ReportPermission As New ObjectPermissionBLL
        Dim objDataView As New DataView()
        Dim bllAccountEmployee As New AccountEmployeeBLL

        Dim dtvueAccountEmployee As AccountEmployee.vueAccountEmployeeDataTable

        Dim WhereClause As String = ""
        Dim IsReportHasNoPermission As Boolean = False

        If ReportPermission.IsReportHasPermissionOfAllowOwnApproval(AccountReportId, True) = True Then
            If LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "ad0ea79d-c1d7-40ed-a7c4-03cc4f565873" Or LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "e3803dc0-49fd-4fc8-b414-ea264ffe85aa" Then
                SetEmployeeOwnApprovalPermission(DropDownName, AccountReportId)
                Return
            End If
        End If

        If ReportPermission.IsReportHasPermissionOfAllowAllUser(AccountReportId, True) Then
            WhereClause = bllAccountEmployee.GetAdministratorWhereClauseForReport(DBUtilities.GetSessionAccountId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnProject(AccountReportId, True) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetProjectManagerWhereClauseForReport(WhereClause, DBUtilities.GetSessionAccountEmployeeId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnTeam(AccountReportId, True) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetTeamLeadWhereClauseForReport(WhereClause, DBUtilities.GetSessionAccountEmployeeId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnReport(AccountReportId, True) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetMyOwnWhereClauseForReport(WhereClause, DBUtilities.GetSessionAccountEmployeeId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnSubOrdinates(AccountReportId, True) Then
            WhereClause = WhereClause & bllAccountEmployee.GetSubOrdinatesWhereClauseForReport(WhereClause, DBUtilities.GetSessionAccountEmployeeId)
            IsReportHasNoPermission = True
        End If

        If IsReportHasNoPermission = False Then
            WhereClause = WhereClause & bllAccountEmployee.GetMyOwnWhereClauseForReport(WhereClause, DBUtilities.GetSessionAccountEmployeeId)
        End If

        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        dtvueAccountEmployee = _vueAccountEmployeeTableAdapter.GetvueAccountEmployeeForReport(WhereClause, "IsDisabled,EmployeeNameWithCode")

        objDataView = dtvueAccountEmployee.DefaultView
        ' objDataView.Sort = "IsDisabled,EmployeeNameWithCodeWithDisabled"
        DropDownName.DataTextField = "EmployeeNameWithCodeWithDisabled"
        DropDownName.DataValueField = "AccountEmployeeId"
        DropDownName.DataSource = objDataView
        DropDownName.DataBind()
    End Sub
    Public Shared Sub SetEmployeeOwnApprovalPermission(ByVal DropdownName As DropDownList, ByVal AccountReportId As Guid)
        Dim ReportFiler As New ReportFilterBLL
        Dim objDataView As New DataView()
        Dim dt As New DataTable
        If LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "ad0ea79d-c1d7-40ed-a7c4-03cc4f565873" Then
            Dim dtvueApprovedBy As dsReportFilterSource.ApprovedByTimeEntryFilterDataTable
            dtvueApprovedBy = ReportFiler.GetApprovalEmployeesByAccountId(DBUtilities.GetSessionAccountId, DBUtilities.GetSessionAccountEmployeeId)
            dt = dtvueApprovedBy
        ElseIf LiveReportData.GetSystemReportDataSourceIdByAccountReportId(AccountReportId) = "e3803dc0-49fd-4fc8-b414-ea264ffe85aa" Then
            Dim dtvueApprovedBy As dsReportFilterSource.ApprovedByExpenseFilterDataTable
            dtvueApprovedBy = ReportFiler.GetApprovalEmployeesByAccountIdForExpense(DBUtilities.GetSessionAccountId, DBUtilities.GetSessionAccountEmployeeId)
            dt = dtvueApprovedBy
        End If
        objDataView = dt.DefaultView
        objDataView.Sort = "EmployeeName"
        DropdownName.DataTextField = "EmployeeName"
        DropdownName.DataValueField = "AccountEmployeeId"
        DropdownName.DataSource = objDataView
        DropdownName.DataBind()
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountEmployeesByEmployeeManagerId(ByVal AccountEmployeeId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetDataByEmployeeManagerId(AccountEmployeeId)
    End Function
    Public Sub UpdateBillingRateIdInNewEmployee(ByVal AccountId As Integer)
        Adapter.UpdateBillingRateIdInNewEmployee(AccountId)
    End Sub
    Public Sub UpdateEmployeeBillingRateWhichIsNotExists(ByVal AccountId As Integer)
        Adapter.UpdateEmployeeBillingRateWhichIsNotExists(AccountId)
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetVueAccountEmployeesByEmailAddress(ByVal EmailAddress As String) As AccountEmployee.vueAccountEmployeeDataTable
        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetDataByEmailAddress(EmailAddress)
    End Function
    Public Shared Function GetFromEmailAddressDisplayNameByEmailAddress(ByVal EmailAddress As String) As String
        Dim dt As AccountEmployee.vueAccountEmployeeDataTable = New AccountEmployeeBLL().GetVueAccountEmployeesByEmailAddress(EmailAddress)
        Dim dr As AccountEmployee.vueAccountEmployeeRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            If Not IsDBNull(dr.Item("FromEmailAddressDisplayName")) Then
                Return dr.FromEmailAddressDisplayName
            End If
        End If
        Return ""
    End Function
    Public Shared Function GetFromEmailAddressByEmailAddress(ByVal EmailAddress As String) As String
        Dim dt As AccountEmployee.vueAccountEmployeeDataTable = New AccountEmployeeBLL().GetVueAccountEmployeesByEmailAddress(EmailAddress)
        Dim dr As AccountEmployee.vueAccountEmployeeRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            If Not IsDBNull(dr.Item("FromEmailAddress")) Then
                Return dr.FromEmailAddress
            End If
        End If
        Return ""
    End Function
    Public Sub UpdateEmployeeTypeIdAndStatusId(ByVal AccountId As Integer)
        Dim objEmployeeType As New AccountEmployeeTypeBLL
        Dim objStatus As New AccountStatusBLL
        Me.Adapter.UpdateEmployeeTypeIdAndStatusId(objEmployeeType.GetDefaultAccountEmployeeTypeId(AccountId), objStatus.GetDefaultAccountStatusId(AccountId), AccountId)
    End Sub
    Public Function GetAdministratorWhereClauseForReport(ByVal AccountId As Integer, Optional ByVal IsFromPendingEmail As Boolean = False) As String
        If IsFromPendingEmail Then
            Return " WHERE ((AccountId = " & AccountId & ") AND (IsDeleted <> 1)) AND (EmployeeTypeId Is NULL or EmployeeTypeId = 1) "
        End If
        Return " WHERE ((AccountId = " & AccountId & ") AND (IsDeleted <> 1)) "
    End Function
    Public Function GetProjectManagerWhereClauseForReport(ByVal sql As String, ByVal AccountEmployeeId As Integer) As String
        If sql = "" Then
            Return " WHERE ((AccountId = " & DBUtilities.GetSessionAccountId & ") AND (IsDeleted <> 1) and AccountEmployeeId IN (Select AccountEmployeeId From AccountProjectEmployee Where AccountProjectId IN (Select AccountProjectId From AccountProject Where ProjectManagerEmployeeId = " & AccountEmployeeId & ")))"
        Else
            Return " OR ((AccountId = " & DBUtilities.GetSessionAccountId & ") AND (IsDeleted <> 1) and AccountEmployeeId IN (Select AccountEmployeeId From AccountProjectEmployee Where AccountProjectId IN (Select AccountProjectId From AccountProject Where ProjectManagerEmployeeId = " & AccountEmployeeId & ")))"
        End If
        '" OR ((IsDisabled <> 1) AND (AccountEmployeeId IN (SELECT AccountEmployeeId FROM vueAccountProjectEmployeFullJoin WHERE (ProjectManagerEmployeeId = " & DBUtilities.GetSessionAccountEmployeeId & ")))) "
    End Function
    Public Function GetTeamLeadWhereClauseForReport(ByVal sql As String, ByVal AccountEmployeeId As Integer) As String
        If sql = "" Then
            Return " WHERE ((AccountId = " & DBUtilities.GetSessionAccountId & ") AND (IsDeleted <> 1) and AccountEmployeeId IN (Select AccountEmployeeId From AccountProjectEmployee Where AccountProjectId IN (Select AccountProjectId From AccountProject Where LeaderEmployeeId = " & AccountEmployeeId & ")))"
        Else
            Return " OR ((AccountId = " & DBUtilities.GetSessionAccountId & ") AND (IsDeleted <> 1) and AccountEmployeeId IN (Select AccountEmployeeId From AccountProjectEmployee Where AccountProjectId IN (Select AccountProjectId From AccountProject Where LeaderEmployeeId = " & AccountEmployeeId & ")))"
        End If
    End Function
    Public Function GetSubOrdinatesWhereClauseForReport(ByVal sql As String, ByVal AccountEmployeeId As Integer) As String
        If sql = "" Then
            Return " WHERE ((EmployeeManagerId = " & AccountEmployeeId & ") AND (EmployeeTypeId IS NULL OR EmployeeTypeId = 1) AND (IsDeleted <> 1)) "
        Else
            Return " OR ((EmployeeManagerId = " & AccountEmployeeId & ") AND (EmployeeTypeId IS NULL OR EmployeeTypeId = 1) AND (IsDeleted <> 1)) "
        End If
    End Function
    Public Function GetMyOwnWhereClauseForReport(ByVal sql As String, ByVal AccountEmployeeId As Integer) As String
        If sql = "" Then
            Return " WHERE ((AccountEmployeeId = " & AccountEmployeeId & ") AND (IsDeleted <> 1)) "
        Else
            Return " OR ((AccountEmployeeId = " & AccountEmployeeId & ") AND (IsDeleted <> 1)) "
        End If
    End Function
    Public Sub UpdateDefaultAccountWorkingDayTypeId(ByVal AccountId As Integer)
        Adapter.UpdateAccountWorkingDayTypeId(AccountId)
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Sub UpdateEmployeeProfile(ByVal Password As String, ByVal Prefix As String, ByVal FirstName As String, ByVal LastName As String, _
                    ByVal MiddleName As String, ByVal EMailAddress As String, ByVal AccountId As System.Nullable(Of Integer), ByVal AddressLine1 As String, _
                    ByVal AddressLine2 As String, ByVal State As String, ByVal City As String, ByVal Zip As String, ByVal CountryId As System.Nullable(Of Short), _
                    ByVal HomePhoneNo As String, ByVal WorkPhoneNo As String, ByVal MobilePhoneNo As String, ByVal StatusId As Integer, ByVal TimeZoneId As System.Nullable(Of Byte), _
                    ByVal CreatedByEmployeeId As Integer, ByVal ModifiedByEmployeeId As Integer, ByVal Original_AccountEmployeeId As Integer, ByVal Notes As String, _
                    ByVal Username As String, ByVal ModifiedOn As Date, ByVal UserInterfaceLanguage As String)

        Try


            Dim IsRoleUpdated As Boolean
            Dim AccountEmployees As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByAccountEmployeeID(Original_AccountEmployeeId)
            Dim AccountEmployee As AccountEmployee.AccountEmployeeRow = AccountEmployees.Rows(0)

            With AccountEmployee

                'If Login Is Nothing Then

                'End If

                If Password <> "" Then
                    .Password = New CustomProviders.LiveMembershipProvider().EncodePassword(Password)
                End If
                .Prefix = Prefix
                .FirstName = FirstName
                .LastName = LastName
                .MiddleName = MiddleName
                If .EMailAddress <> EMailAddress Then
                    If Me.ValidateExistingEmployee(EMailAddress, Original_AccountEmployeeId) Then
                        .EMailAddress = EMailAddress
                        '.Username = EMailAddress
                    End If
                End If
                '.Username = EMailAddress
                .AddressLine1 = AddressLine1
                .AddressLine2 = AddressLine2
                .State = State
                .City = City
                .Zip = Zip
                .CountryId = CountryId
                .HomePhoneNo = HomePhoneNo
                .WorkPhoneNo = WorkPhoneNo
                .MobilePhoneNo = MobilePhoneNo
                .TimeZoneId = TimeZoneId
                .ModifiedOn = Now
                .ModifiedByEmployeeId = ModifiedByEmployeeId
                .UserInterfaceLanguage = UserInterfaceLanguage

            End With

            Dim rowsAffected As Integer = Adapter.Update(AccountEmployee)

            AfterUpdate()

            If IsRoleUpdated = True Then
                Call New AccountPagePermissionBLL().ResetPageSecurity()
            End If
            Dim objEmployeeBLL As New AccountEmployeeBLL
            objEmployeeBLL.SetSessionValues(Nothing, DBUtilities.GetSessionAccountEmployeeId)

            ' Return true if precisely one row was updated, otherwise false

        Catch ex As Exception
            Throw ex
        End Try
        ''Adapter.UpdateEmployeeProfileByAccountEmployeeId(Password, FirstName, LastName, MiddleName, EMailAddress, AccountId, AddressLine1, AddressLine2, City, Zip, CountryId, HomePhoneNo, WorkPhoneNo, MobilePhoneNo, Prefix, ModifiedOn, ModifiedByEmployeeId, Notes, TimeZoneId, State, Username, Original_AccountEmployeeId)
    End Sub
    Public Function GetAccountWorkingDayTypeIdByEmployeeId(ByVal AccountEmployeeId As Integer) As Guid
        Dim dt As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByAccountEmployeeID(AccountEmployeeId)
        Dim dr As AccountEmployee.AccountEmployeeRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            If IsDBNull(dr.Item("AccountWorkingDayTypeId")) Then
                Return New AccountWorkingDayTypeBLL().GetDefaultAccountWorkingDayTypeId(DBUtilities.GetSessionAccountId)
            Else
                Return dr.AccountWorkingDayTypeId
            End If
        End If
    End Function
    Public Sub SetApprovedByDropDownPermission(ByVal DropDownName As DropDownList, ByVal AccountReportId As Guid)
        Dim ReportPermission As New ObjectPermissionBLL
        Dim objDataView As New DataView()
        Dim bllAccountEmployee As New AccountEmployeeBLL

        Dim dtvueAccountEmployee As AccountEmployee.vueAccountEmployeeDataTable

        Dim WhereClause As String = ""
        Dim IsReportHasNoPermission As Boolean = False

        If ReportPermission.IsReportHasPermissionOfAllowAllUser(AccountReportId, True) Then
            WhereClause = bllAccountEmployee.GetAdministratorWhereClause(DBUtilities.GetSessionAccountId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnProject(AccountReportId, True) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetProjectManagerWhereClause(WhereClause, DBUtilities.GetSessionAccountEmployeeId, DBUtilities.GetSessionAccountId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnTeam(AccountReportId, True) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetTeamLeadWhereClause(WhereClause, DBUtilities.GetSessionAccountEmployeeId, DBUtilities.GetSessionAccountId)
            IsReportHasNoPermission = True
        End If

        If ReportPermission.IsReportHasPermissionOfAllowOwnReport(AccountReportId, True) = True Then
            WhereClause = WhereClause & bllAccountEmployee.GetMyOwnWhereClause(WhereClause, DBUtilities.GetSessionAccountEmployeeId)
            IsReportHasNoPermission = True
        End If

        If IsReportHasNoPermission = False Then
            WhereClause = WhereClause & bllAccountEmployee.GetMyOwnWhereClause(WhereClause, DBUtilities.GetSessionAccountEmployeeId)
        End If

        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        dtvueAccountEmployee = _vueAccountEmployeeTableAdapter.GetvueAccountEmployeeForReport(WhereClause)

        objDataView = dtvueAccountEmployee.DefaultView
        objDataView.Sort = "EmployeeNameWithCode"
        DropDownName.DataTextField = "EmployeeNameWithCode"
        DropDownName.DataValueField = "AccountEmployeeId"
        DropDownName.DataSource = objDataView
        DropDownName.DataBind()
    End Sub
    Public Sub UpdateLastScheduledEmailSentTimeByAccountEmployeeId(ByVal AccountEmployeeId As Integer, ByVal LastScheduledEmailSentTime As DateTime)
        Adapter.UpdateLastScheduledEmailSentTime(LastScheduledEmailSentTime, AccountEmployeeId)
    End Sub
    Public Function GetEmployeesDataTableForTimeEntryPendingEmail(ByVal AccountId As Integer, ByVal AccountEmployeeId As Integer, ByVal PendingEmailType As String, Optional ByVal IsFromOverdueTimesheet As Boolean = False) As AccountEmployee.vueAccountEmployeeDataTable
        Dim ReportPermission As New ObjectPermissionBLL
        Dim bllAccountEmployee As New AccountEmployeeBLL

        Dim WhereClause As String = ""

        If PendingEmailType = "Administrator" Then
            WhereClause = bllAccountEmployee.GetAdministratorWhereClause(AccountId, True)

        ElseIf PendingEmailType = "ProjectManager" Then
            WhereClause = bllAccountEmployee.GetProjectManagerWhereClause(WhereClause, AccountEmployeeId, AccountId)

        ElseIf PendingEmailType = "TeamLead" Then
            WhereClause = bllAccountEmployee.GetTeamLeadWhereClause(WhereClause, AccountEmployeeId, AccountId)

        ElseIf PendingEmailType = "EmployeeManager" Then
            WhereClause = bllAccountEmployee.GetSubOrdinatesWhereClause(WhereClause, AccountEmployeeId)

        ElseIf PendingEmailType = "EmployeeOwn" Then
            WhereClause = bllAccountEmployee.GetMyOwnWhereClause(WhereClause, AccountEmployeeId)
        End If

        Dim _vueAccountEmployeeTableAdapter As New vueAccountEmployeeTableAdapter
        Return _vueAccountEmployeeTableAdapter.GetvueAccountEmployeeForReport(WhereClause, IIf(IsFromOverdueTimesheet, "EmployeeName", "SystemTimesheetPeriodType"))
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountEmployeesWithPreferenceByAccountId(ByVal AccountId As Integer) As AccountEmployee.vueAccountEmployeesWithPreferenceDataTable
        Dim _vueAccountEmployeesWithPreferenceTableAdapter As New vueAccountEmployeesWithPreferenceTableAdapter
        Return _vueAccountEmployeesWithPreferenceTableAdapter.GetDataByAccountId(AccountId)
    End Function
    Public Function IsEmployeeNotificationAllowed(ByVal AccountId As Integer) As Boolean
        If GetvueAccountEmployeesWithPreferenceByAccountId(AccountId).Rows.Count > 0 Then
            Return True
        End If
        Return False
    End Function
    Public Sub UpdateLastTimeOffCalculationScheduledTime(ByVal AccountEmployeeId As Integer)
        Me.Adapter.UpdateLastTimeOffCalculationScheduledTimeByEmployeeId(Now, AccountEmployeeId)
    End Sub
    Public Sub UpdateInitialPolicyByEmployeeId(ByVal AccountEmployeeId As Integer)
        Me.Adapter.UpdateInitialPolicyByEmployeeId(True, AccountEmployeeId)
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForTimeOffApproval(ByVal ApproverEmployeeId As Integer) As AccountEmployee.vueTimeOffApprovalEmployeesDataTable
        Dim _vueTimeOffApprovalEmployeesTableAdapter As New vueTimeOffApprovalEmployeesTableAdapter
        Return _vueTimeOffApprovalEmployeesTableAdapter.GetEmployeesForTimeOffApproval(ApproverEmployeeId)
    End Function
    Public Sub UpdateIsEmailSendByAccountEmployeeId(ByVal AccountEmployeeId As Integer, ByVal IsEmailSend As Boolean)
        Adapter.UpdateIsEmailSendByAccountEmployeeId(IsEmailSend, AccountEmployeeId)
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateEmailAddressAndUserNameForAccountClosed(ByVal AccountId As Integer) As Boolean
        Adapter.UpdateEmailAddressAndUserNameWithAccountIdForDisabledAccount(AccountId)
    End Function
    Public Function GetAdministratorWhereClause(ByVal AccountId As Integer, Optional ByVal IsFromPendingEmail As Boolean = False) As String
        If IsFromPendingEmail Then
            Return " WHERE ((AccountId = " & AccountId & ") AND (IsDisabled <> 1) AND (IsDeleted <> 1)) AND (EmployeeTypeId Is NULL or EmployeeTypeId = 1) "
        End If
        Return " WHERE ((AccountId = " & AccountId & ") AND (IsDisabled <> 1) AND (IsDeleted <> 1)) "
    End Function
    Public Function GetProjectManagerWhereClause(ByVal sql As String, ByVal AccountEmployeeId As Integer, ByVal AccountId As Integer) As String
        If sql = "" Then
            Return " WHERE ((AccountId = " & AccountId & ") AND (IsDisabled <> 1) and (IsDeleted <> 1) and AccountEmployeeId IN (Select AccountEmployeeId From AccountProjectEmployee Where AccountProjectId IN (Select AccountProjectId From AccountProject Where ProjectManagerEmployeeId = " & AccountEmployeeId & ")))"
        Else
            Return " OR ((AccountId = " & AccountId & ") AND (IsDisabled <> 1) and (IsDeleted <> 1) and AccountEmployeeId IN (Select AccountEmployeeId From AccountProjectEmployee Where AccountProjectId IN (Select AccountProjectId From AccountProject Where ProjectManagerEmployeeId = " & AccountEmployeeId & ")))"
        End If
    End Function
    Public Function GetTeamLeadWhereClause(ByVal sql As String, ByVal AccountEmployeeId As Integer, ByVal AccountId As Integer) As String
        If sql = "" Then
            Return " WHERE ((AccountId = " & AccountId & ") AND (IsDisabled <> 1) and (IsDeleted <> 1) and AccountEmployeeId IN (Select AccountEmployeeId From AccountProjectEmployee Where AccountProjectId IN (Select AccountProjectId From AccountProject Where LeaderEmployeeId = " & AccountEmployeeId & ")))"
        Else
            Return " OR ((AccountId = " & AccountId & ") AND (IsDisabled <> 1) and (IsDeleted <> 1) and AccountEmployeeId IN (Select AccountEmployeeId From AccountProjectEmployee Where AccountProjectId IN (Select AccountProjectId From AccountProject Where LeaderEmployeeId = " & AccountEmployeeId & ")))"
        End If
    End Function
    Public Function GetSubOrdinatesWhereClause(ByVal sql As String, ByVal AccountEmployeeId As Integer) As String
        If sql = "" Then
            Return " WHERE ((EmployeeManagerId = " & AccountEmployeeId & ") AND (EmployeeTypeId IS NULL OR EmployeeTypeId = 1) AND (IsDisabled <> 1) AND (IsDeleted <> 1)) "
        Else
            Return " OR ((EmployeeManagerId = " & AccountEmployeeId & ") AND (EmployeeTypeId IS NULL OR EmployeeTypeId = 1) AND (IsDisabled <> 1) AND (IsDeleted <> 1)) "
        End If
    End Function
    Public Function GetMyOwnWhereClause(ByVal sql As String, ByVal AccountEmployeeId As Integer) As String
        If sql = "" Then
            Return " WHERE ((AccountEmployeeId = " & AccountEmployeeId & ") AND (IsDisabled <> 1) AND (IsDeleted <> 1)) "
        Else
            Return " OR ((AccountEmployeeId = " & AccountEmployeeId & ") AND (IsDisabled <> 1) AND (IsDeleted <> 1)) "
        End If
    End Function
    Public Function GetAccountEmployeesViewByAccountIdWithDisabled(ByVal AccountId As Integer) As AccountEmployee.vueAccountEmployeeDataTable
        strCacheKey = CacheManager.GetCacheKeyForAccountsData("vueAccountEmployeeDataTable", "GetAccountEmployeesViewByAccountIdWithDisabled", AccountId)

        If Not CacheManager.GetItemFromCache(strCacheKey) Is Nothing Then
            GetAccountEmployeesViewByAccountIdWithDisabled = CacheManager.GetItemFromCache(strCacheKey)
        Else
            _vueAccountvueEmployeeTableAdapter = New vueAccountEmployeeTableAdapter()
            GetAccountEmployeesViewByAccountIdWithDisabled = _vueAccountvueEmployeeTableAdapter.GetDataByAccountIdWithDisabled(AccountId)
            CacheManager.AddAccountDataInCache(GetAccountEmployeesViewByAccountIdWithDisabled, strCacheKey)
        End If

        Return GetAccountEmployeesViewByAccountIdWithDisabled
    End Function
    Public Function UpdatePasswordAndPasswordChangedDateByEmailAddress(ByVal EmailAddress As String, ByVal Password As String)
        Adapter.UpdatePasswordAndPasswordChangedDateByEmailAddress(Password, EmailAddress)
    End Function
    Public Function UpdatePasswordChangedDateByAccountId(ByVal AccountId As Integer, ByVal PasswordChangedDate As Date)
        Adapter.UpdatePasswordChangedDateByAccountId(PasswordChangedDate, AccountId)
    End Function
    Public Sub AfterUpdate()
        CacheManager.ClearCache("AccountEmployee", , True)
    End Sub
    Public Function SendPasswordResetVerificationCode(EmailAddress As String) As Boolean
        Dim PasswordVerificationCode As New Guid
        PasswordVerificationCode = System.Guid.NewGuid
        Dim link As String = System.Configuration.ConfigurationManager.AppSettings("SitePrefix") & "Authenticate/PasswordConfirm.aspx?Code=" & PasswordVerificationCode.ToString & "&EmailAddress=" & EmailAddress
        Dim dt As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByEmailAddress(EmailAddress)
        Dim dr As AccountEmployee.AccountEmployeeRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            UpdatePasswordVerificationCodeByAccountEmployeeId(dr.AccountEmployeeId, PasswordVerificationCode)
            EMailUtilities.SendEMail("Krooe Password Reset", "PasswordVerificationCodeTemplate", GetPreparedNameValueForPasswordConfirm(EmailAddress, link, dr.FirstName & " " & dr.LastName), EmailAddress, , , EMailUtilities.TIMELIVE_PASSWORD_CONFIRM_INFORMATION_FROM)
            EMailUtilities.DequeueEmail()
            Return True
        End If
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeesByPasswordVerificationCode(ByVal PasswordVerificationCode As Guid) As AccountEmployee.AccountEmployeeDataTable
        Return Adapter.GetDataByPasswordVerificationCode(PasswordVerificationCode)
    End Function
    Public Sub UpdatePasswordVerificationCodeByAccountEmployeeId(AccountEmployeeId As Integer, PasswordVerificationCode As Guid)
        Adapter.UpdatePasswordVerificationCodeByAccountEmployeeId(PasswordVerificationCode, AccountEmployeeId)
    End Sub
    Public Sub UpdatePasswordVerificationCodeNULLByAccountEmployeeId(AccountEMployeeId As Integer)
        Dim dt As AccountEmployee.AccountEmployeeDataTable = Adapter.GetDataByAccountEmployeeID(AccountEMployeeId)
        Dim dr As AccountEmployee.AccountEmployeeRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            dr.Item("PasswordVerificationCode") = System.DBNull.Value
            Dim rowsAffected As Integer = Adapter.Update(dt)
        End If
    End Sub
    Public Function GetPreparedNameValueForPasswordConfirm(ByVal EmailAddress As String, link As String, FullName As String) As StringDictionary
        Dim dict As New StringDictionary
        dict.Add("[emailaddress]", EmailAddress)
        dict.Add("[fullname]", FullName)
        dict.Add("[link]", link)
        Return dict
    End Function
    Public Sub UpdateCustomFieldInEmployee(CustomFieldColumnName As String, ByVal AccountId As Integer)
        Adapter.UpdateEmployeeCustomFieldByCustomFieldId(CustomFieldColumnName, AccountId)
    End Sub
    Public Function FileUpload(ByVal objFileUpload As FileUpload, ByVal AccountEmployeeId As Integer) As Boolean
        If objFileUpload.FileName = "" Then
            Return True
        End If

        Dim strUploadPath As String = System.Configuration.ConfigurationManager.AppSettings("UploadFilesPath")

        Dim strRoot As String = System.Web.HttpContext.Current.Server.MapPath(strUploadPath)
        If Not System.IO.Directory.Exists(strRoot) Then
            System.IO.Directory.CreateDirectory(strRoot)
        End If
        Dim strAccountPath As String = strRoot & DBUtilities.GetSessionAccountId & "\" & AccountEmployeeId & "\"
        If Not System.IO.Directory.Exists(strAccountPath) Then
            System.IO.Directory.CreateDirectory(strAccountPath)
        End If
        Dim strLogoPath As String = strAccountPath & "Sign" & "\"
        If Not System.IO.Directory.Exists(strLogoPath) Then
            System.IO.Directory.CreateDirectory(strLogoPath)
        End If
        Dim strPath As String = strLogoPath & "E-Sign.gif"
        'If System.IO.File.Exists(strPath) Then
        '    System.IO.File.Delete(strPath)
        'End If
        Dim FileToSave As String = strLogoPath & "E-Sign.gif" 'objFileUpload.FileName
        objFileUpload.SaveAs(FileToSave)

    End Function
    Public Function FileUploadForProfile(ByVal objFileUpload As FileUpload, ByVal AccountEmployeeId As Integer) As Boolean
        If objFileUpload.FileName = "" Then
            Return True
        End If

        Dim strUploadPath As String = System.Configuration.ConfigurationManager.AppSettings("UploadFilesPath")

        Dim strRoot As String = System.Web.HttpContext.Current.Server.MapPath(strUploadPath)
        If Not System.IO.Directory.Exists(strRoot) Then
            System.IO.Directory.CreateDirectory(strRoot)
        End If
        Dim strAccountPath As String = strRoot & DBUtilities.GetSessionAccountId & "\" & AccountEmployeeId & "\"
        If Not System.IO.Directory.Exists(strAccountPath) Then
            System.IO.Directory.CreateDirectory(strAccountPath)
        End If
        Dim strLogoPath As String = strAccountPath & "Profile" & "\"
        If Not System.IO.Directory.Exists(strLogoPath) Then
            System.IO.Directory.CreateDirectory(strLogoPath)
        End If
        Dim strpath As String = strLogoPath & "E-Profile.gif"
        'If System.IO.Directory.Exists(strpath) Then
        '    System.IO.File.Delete(strpath)
        'End If
        Dim FileToSave As String = strLogoPath & "E-Profile.gif" 'objFileUpload.FileName
        objFileUpload.SaveAs(FileToSave)

    End Function
    Public Function IsProfileImageExist(ByVal AccountEmployeeId As Integer) As Boolean
        Dim strUploadPath As String = System.Configuration.ConfigurationManager.AppSettings("UploadFilesPath")
        Dim strRoot As String = System.Web.HttpContext.Current.Server.MapPath(strUploadPath)
        Dim strAccountPath As String = strRoot & DBUtilities.GetSessionAccountId & "\" & AccountEmployeeId & "\"
        Dim strLogoPath As String = strAccountPath & "Profile" & "\"
        Dim strpath As String = strLogoPath & "E-Profile.gif"
        If System.IO.File.Exists(strpath) Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function UpdateUILanguage(ByVal UserInterfaceLanguage As String, ByVal AccountEmployeeId As Integer) As Boolean
        Adapter.UpdateUILanguageByAccountEmployeeId(UserInterfaceLanguage, AccountEmployeeId)
    End Function
    Public Function GetProfilePictureUrl() As String
        Dim URL As String = "~/Uploads/" & DBUtilities.GetSessionAccountId & "/" & DBUtilities.GetSessionAccountEmployeeId & "/Profile/E-Profile.gif"
        If IsProfileImageExist(DBUtilities.GetSessionAccountEmployeeId) = False Then
            Return "~/Images/Profile.gif"
        Else
            Return URL
        End If
    End Function
End Class
