Imports Microsoft.VisualBasic
Imports AccountEmployeeTimeOffTableAdapters

<System.ComponentModel.DataObject()> _
Public Class AccountEmployeeTimeOffBLL

    Private _AccountEmployeeTimeOffTableAdapter As AccountEmployeeTimeOffTableAdapter = Nothing
    Protected ReadOnly Property Adapter() As AccountEmployeeTimeOffTableAdapter
        Get
            If _AccountEmployeeTimeOffTableAdapter Is Nothing Then
                _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter()
            End If

            Return _AccountEmployeeTimeOffTableAdapter
        End Get
    End Property
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeeTimeOffByAccountEmployeeId(ByVal AccountEmployeeId As Integer) As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable
        GetAccountEmployeeTimeOffByAccountEmployeeId = Adapter.GetDataByAccountEmployeeId(AccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeeTimeOffByAccountEmployeeIdAndTimeOffTypeId(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid) As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable
        Return Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountEmployeeTimeOffByEmployeeIdAndTimeOffTypeId(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid) As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable
        Return Adapter.GetDataByAccountEmployeeIdAndAccountTimeOffTypeId(AccountEmployeeId, AccountTimeOffTypeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountEmployeeTimeOffByAccountEmployeeId(ByVal AccountEmployeeId As Integer) As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffDataTable
        Dim vueEmployee As New vueAccountEmployeeTimeOffTableAdapter
        GetvueAccountEmployeeTimeOffByAccountEmployeeId = vueEmployee.GetDataByAccountEmployeeId(DBUtilities.GetSessionAccountId, AccountEmployeeId)
        UIUtilities.FixTableForNoRecords(GetvueAccountEmployeeTimeOffByAccountEmployeeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdatePoliciesByEachYear() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataForEachYear
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdatePoliciesByEachWeeks() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataForEachWeek
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdatePoliciesByEachMonth() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataForEachMonth
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdatePoliciesFirstTime() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataByLastEarnedDateIsNull
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdatePoliciesFirstTimeOnlyForAnniversary() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataByLastEarnedDateIsNullAndForAnniversaryEarned
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdatePoliciesByEachYearAnniversaryDay() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataForEachYearAnniversaryDay
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdatePoliciesByAccountEmployeeId(ByVal AccountEmployeeID As Integer) As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataByAccountEmployeeId(AccountEmployeeID)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdateResetPolicyByEachMonth() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataForResetEveryMonth
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdateResetPolicyByEveryYear() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataForResetEveryYear
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetEmployeesForUpdateResetPolicyByEveryYearAnniversaryDay() As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim _vueAccountEmployeeTimeOffLastScheduleTableAdapter As New vueAccountEmployeeTimeOffLastScheduleTableAdapter
        Return _vueAccountEmployeeTimeOffLastScheduleTableAdapter.GetDataForResetEveryYearAnniversary
    End Function
    Public Function IsEmployeeTimeOffExists(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid) As Boolean
        If Me.Adapter.GetDataByAccountEmployeeIdAndAccountTimeOffTypeId(AccountEmployeeId, AccountTimeOffTypeId).Rows.Count > 0 Then
            Return True
        End If
        Return False
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function AddAccountEmployeeTimeOff( _
                ByVal AccountId As Integer, ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal Earned As Double, _
                ByVal Consume As Double, ByVal Available As Double, ByVal LastEarnedDate As Date, ByVal CarryForward As Double, ByVal AccountTimeOffPolicyId As Guid) As Boolean

        _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter

        Dim dtTimeOff As New AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow = dtTimeOff.NewAccountEmployeeTimeOffRow

        With drTimeOff
            .AccountEmployeeTimeOffId = System.Guid.NewGuid
            .AccountId = AccountId
            .AccountEmployeeId = AccountEmployeeId
            .AccountTimeOffTypeId = AccountTimeOffTypeId
            .Earned = Earned
            .Consume = Consume
            .Available = Available
            .CarryForward = CarryForward
            ' .LastEarnedDate = LastEarnedDate
            .CreatedByEmployeeId = DBUtilities.GetSessionAccountEmployeeId
            .CreatedOn = Now
            .ModifiedByEmployeeId = DBUtilities.GetSessionAccountEmployeeId
            .ModifiedOn = Now
            .AccountTimeOffPolicyId = AccountTimeOffPolicyId
        End With
        dtTimeOff.AddAccountEmployeeTimeOffRow(drTimeOff)
        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)
        Return rowsAffected = 1
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function UpdateEmployeeTimeOffAvailable( _
            ByVal AccountEmployeeTimeOffId As Guid, ByVal Available As Double) As Boolean

        _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter

        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByAccountEmployeeTimeOffId(AccountEmployeeTimeOffId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow = dtTimeOff.Rows(0)

        With drTimeOff
            .Available = Available
            .ModifiedByEmployeeId = DBUtilities.GetSessionAccountEmployeeId
            .ModifiedOn = Now
        End With

        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)

        Return rowsAffected = 1
    End Function
    Public Sub InsertDefaultForNewTimeOffType(ByVal AccountTimeOffTypeId As Guid, ByVal AccountId As Integer)
        Adapter.InsertEmployeeTimeOffForNewTimeOffType(AccountTimeOffTypeId, AccountId)
    End Sub
    Public Sub SetPolicies()
        Dim AccountEmployees As String = ExecuteScheduledResetTimeOffPolicy()
        ExecuteScheduledOffDaysProcedure(0, AccountEmployees)
    End Sub
    Public Function CheckEffectiveDate(ByVal dr As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleRow) As Boolean
        If Not IsDBNull(dr.Item("EffectiveDate")) Then
            If Now.Date >= dr.EffectiveDate.Date Then
                Return True
            End If
        ElseIf IsDBNull(dr.Item("EffectiveDate")) Then
            Return True
        End If
        Return False
    End Function
    Public Function ExecuteScheduledResetTimeOffPolicy() As String
        Dim dt As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim dr As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleRow
        Dim AccountEmployees As String = ""

        dt = Me.GetEmployeesForUpdateResetPolicyByEachMonth
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            For Each dr In dt.Rows
                If CheckEffectiveDate(dr) And Now.Date.Day >= dr.LastResetDate.Day Then
                    UpdateResetHoursInAvailableHours(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.ResetToHours, dr.AccountTimeOffPolicyId)
                    UpdateConsumedHoursInEmployeeTimeOff(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, 0, dr.AccountTimeOffPolicyId)
                    AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                End If
            Next
        End If
        dt = Me.GetEmployeesForUpdateResetPolicyByEveryYear
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            For Each dr In dt.Rows
                If CheckEffectiveDate(dr) Then
                    UpdateResetHoursInAvailableHours(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.ResetToHours, dr.AccountTimeOffPolicyId)
                    UpdateConsumedHoursInEmployeeTimeOff(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, 0, dr.AccountTimeOffPolicyId)
                    AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                End If
            Next
        End If
        dt = Me.GetEmployeesForUpdateResetPolicyByEveryYearAnniversaryDay
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            For Each dr In dt.Rows
                If CheckEffectiveDate(dr) Then
                    If IIf(IsDBNull(dr.Item("LastResetDate")), Now.Date.AddDays(-1), dr.Item("LastResetDate")) < Now.Date Then
                        UpdateResetHoursInAvailableHours(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.ResetToHours, dr.AccountTimeOffPolicyId)
                        UpdateConsumedHoursInEmployeeTimeOff(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, 0, dr.AccountTimeOffPolicyId)
                        AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                    End If
                End If
            Next
        End If
        Return AccountEmployees
    End Function
    Public Sub ExecuteScheduledOffDaysProcedure(Optional ByVal AccountEmployeeId As Integer = 0, Optional ByVal AccountEmployees As String = "")
        Dim dt As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim dr As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleRow

        If AccountEmployeeId = 0 Then
            dt = Me.GetEmployeesForUpdatePoliciesFirstTime
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                For Each dr In dt.Rows
                    If CheckEffectiveDate(dr) Then
                        UpdateCarryForward(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        Dim available As Double = GetNewAvailableHours(IIf(IsDBNull(dr.Item("InitialSetToHours")), 0, dr.Item("InitialSetToHours")), dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        available = Me.SetAvailableByMaximumAvailable(dr.MaximumAvailable, available)
                        Me.UpdatePolicyHourBySchecdule(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId, IIf(IsDBNull(dr.Item("InitialSetToHours")), 0, dr.Item("InitialSetToHours")), available, True)
                        AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                    End If
                Next
            End If
            dt = Me.GetEmployeesForUpdatePoliciesFirstTimeOnlyForAnniversary
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                For Each dr In dt.Rows
                    If CheckEffectiveDate(dr) Then
                        UpdateCarryForward(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        Dim available As Double = GetNewAvailableHours(IIf(IsDBNull(dr.Item("InitialSetToHours")), 0, dr.Item("InitialSetToHours")), dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        available = Me.SetAvailableByMaximumAvailable(dr.MaximumAvailable, available)
                        Me.UpdatePolicyHourBySchecdule(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId, IIf(IsDBNull(dr.Item("InitialSetToHours")), 0, dr.Item("InitialSetToHours")), available, True)
                        AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                    End If
                Next
            End If
            dt = Me.GetEmployeesForUpdatePoliciesByEachYear
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                For Each dr In dt.Rows
                    If CheckEffectiveDate(dr) Then
                        UpdateCarryForward(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        Dim EarnHours As Double = GetEarnHoursByTotalNoOfPolicyDays(dr.EarnHours, dr.TotalYears)
                        Dim available As Double = GetNewAvailableHours(EarnHours, dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        available = Me.SetAvailableByMaximumAvailable(dr.MaximumAvailable, available)
                        Me.UpdatePolicyHourBySchecdule(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId, EarnHours, available)
                        AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                    End If
                Next
            End If
            dt = Me.GetEmployeesForUpdatePoliciesByEachYearAnniversaryDay
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                For Each dr In dt.Rows
                    If CheckEffectiveDate(dr) Then
                        If IIf(IsDBNull(dr.Item("LastResetDate")), Now.Date.AddDays(-1), dr.Item("LastResetDate")) < Now.Date Then
                            UpdateCarryForward(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                            'Dim EarnHours As Double = GetEarnHoursByTotalNoOfPolicyDays(dr.EarnHours, dr.TotalYears)
                            Dim available As Double = GetNewAvailableHours(dr.EarnHours, dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                            available = Me.SetAvailableByMaximumAvailable(dr.MaximumAvailable, available)
                            Me.UpdatePolicyHourBySchecdule(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId, dr.EarnHours, available)
                            AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                        End If
                    End If
                Next
            End If
            dt = Me.GetEmployeesForUpdatePoliciesByEachWeeks
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                For Each dr In dt.Rows
                    If CheckEffectiveDate(dr) Then
                        UpdateCarryForward(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        Dim EarnHours As Double = GetEarnHoursByTotalNoOfPolicyDays(dr.EarnHours, dr.TotalWeeks)
                        Dim available As Double = GetNewAvailableHours(EarnHours, dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        available = Me.SetAvailableByMaximumAvailable(dr.MaximumAvailable, available)
                        Me.UpdatePolicyHourBySchecdule(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId, EarnHours, available)
                        AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                    End If
                Next
            End If
            dt = Me.GetEmployeesForUpdatePoliciesByEachMonth
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                For Each dr In dt.Rows
                    If CheckEffectiveDate(dr) And Now.Date.Day >= dr.LastEarnedDate.Day Then
                        UpdateCarryForward(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        Dim EarnHours As Double = GetEarnHoursByTotalNoOfPolicyDays(dr.EarnHours, dr.TotalMonth)
                        Dim available As Double = GetNewAvailableHours(EarnHours, dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        available = Me.SetAvailableByMaximumAvailable(dr.MaximumAvailable, available)
                        Me.UpdatePolicyHourBySchecdule(dr.AccountEmployeeId, dr.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId, EarnHours, available)
                        AccountEmployees += IIf(AccountEmployees = "", dr.AccountEmployeeId, "," & dr.AccountEmployeeId).ToString
                    End If
                Next
            End If
            If AccountEmployees <> "" Then
                Me.UpdateEmployeeFieldsForTimeOff(AccountEmployees)
            End If
        Else
            Me.SetResetPolicy(AccountEmployeeId)
        End If
    End Sub
    Public Function SetAvailableByMaximumAvailable(ByVal MaximumAvailable As Double, ByVal Available As Double)
        If MaximumAvailable <> 0 Then
            If Available > MaximumAvailable Then
                Return MaximumAvailable
            Else
                Return Available
            End If
        Else
            Return Available
        End If
    End Function
    Public Function GetEarnHoursByTotalNoOfPolicyDays(ByVal EarnHours As Double, ByVal EarnHoursTypeNo As Integer) As Double
        Return Math.Round(EarnHours * EarnHoursTypeNo, 2)
    End Function
    Public Sub SetResetPolicy(ByVal AccountEmployeeId As Integer)
        Dim dt As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleDataTable
        Dim dr As AccountEmployeeTimeOff.vueAccountEmployeeTimeOffLastScheduleRow
        dt = Me.GetEmployeesForUpdatePoliciesByAccountEmployeeId(AccountEmployeeId)
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Dim dtPolicy As AccountTimeOffPolicy.AccountTimeOffPolicyDetailDataTable = New AccountTimeOffPolicyBLL().GetAccountTimeOffPolicyDetailByTimeOffPolicyId(dr.AccountId, dr.AccountTimeOffPolicyId)
            Dim drPolicy As AccountTimeOffPolicy.AccountTimeOffPolicyDetailRow
            If dtPolicy.Rows.Count > 0 Then
                drPolicy = dtPolicy.Rows(0)
                For Each drPolicy In dtPolicy.Rows
                    If CheckEffectiveDate(dr) And Not IsDBNull(drPolicy.Item("SystemEarnPeriodId")) Then
                        UpdateCarryForwardByParameter(AccountEmployeeId, drPolicy.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId, 0)
                        Dim available As Double = GetNewAvailableHoursForResetPolicy(IIf(IsDBNull(drPolicy.Item("InitialSetToHours")), 0, drPolicy.Item("InitialSetToHours")), AccountEmployeeId, drPolicy.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId)
                        UpdatePolicyHourBySchecdule(AccountEmployeeId, drPolicy.AccountTimeOffTypeId, dr.AccountTimeOffPolicyId, IIf(IsDBNull(drPolicy.Item("InitialSetToHours")), 0, drPolicy.Item("InitialSetToHours")), available, True)
                    End If
                Next
            End If
        End If
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function UpdatePolicyHourBySchecdule(ByVal AccountEmployeeId As Integer, _
        ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid, ByVal Earned As Double, ByVal Available As Double, _
        Optional ByVal LastResetDate As Boolean = False) As Boolean

        _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter

        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow = dtTimeOff.Rows(0)

        With drTimeOff
            .Earned = Earned
            .Available = Available
            .LastEarnedDate = Now.Date
            .ModifiedOn = Now
            If LastResetDate Then
                .LastResetDate = Now.Date
            End If
        End With

        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)

        Return rowsAffected = 1
    End Function
    Public Sub UpdateEmployeeFieldsForTimeOff(ByVal AcountEmployees As String)
        Dim objEmployee As New AccountEmployeeBLL
        Dim AccountEmployeeId() As String = Split(AcountEmployees, ",")
        For n As Integer = 0 To AccountEmployeeId.Length - 1
            objEmployee.UpdateLastTimeOffCalculationScheduledTime(AccountEmployeeId(n))
            objEmployee.UpdateInitialPolicyByEmployeeId(AccountEmployeeId(n))
        Next
    End Sub
    Public Function UpdateCarryForward(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid)
        Dim CarryForward As Double = GetAvailableHoursByEmployeeIdAndTimeOffTypeId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter
        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow = dtTimeOff.Rows(0)
        With drTimeOff
            .CarryForward = Math.Round(CarryForward, 2)
        End With
        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)
        Return rowsAffected = 1
    End Function
    Public Function GetAvailableHoursByEmployeeIdAndTimeOffTypeId(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid) As Double
        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow
        If dtTimeOff.Rows.Count > 0 Then
            drTimeOff = dtTimeOff.Rows(0)
            Return drTimeOff.Available
        Else
            Return 0
        End If
    End Function
    Public Function GetCarryForwardHoursByEmployeeIdAndTimeOffTypeId(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid) As Double
        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow
        If dtTimeOff.Rows.Count > 0 Then
            drTimeOff = dtTimeOff.Rows(0)
            If Not IsDBNull(drTimeOff.Item("CarryForward")) Then
                Return drTimeOff.CarryForward
            End If
        Else
            Return 0
        End If
    End Function
    Public Function GetNewAvailableHours(ByVal Hours As Double, ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid) As Double
        Dim CarryForward As Double = GetCarryForwardHoursByEmployeeIdAndTimeOffTypeId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        'Dim Available As Double = GetAvailableHoursByEmployeeIdAndTimeOffTypeId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Return CDbl(Hours) + CDbl(CarryForward)
        'Dim value As Double = 
        'If Available < 0 Then
        '    value = value + Available
        'End If
        'Return value
    End Function
    Public Function UpdateResetHoursInAvailableHours(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal ResetHours As Double, ByVal AccountTimeOffPolicyId As Guid)
        _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter
        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow = dtTimeOff.Rows(0)
        With drTimeOff
            If .Available > ResetHours Then
                .Available = ResetHours
            End If
        End With
        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)
        Return rowsAffected = 1
    End Function
    Public Function SetEmployeeTimeOffHoursFromTimeOffRequest(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal HoursOff As Double) As Boolean
        Dim dt As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByAccountEmployeeIdAndAccountTimeOffTypeId(AccountEmployeeId, AccountTimeOffTypeId)
        Dim dr As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Dim TEMP As Double
            TEMP = Math.Round(dr.Consume, 2) + Math.Round(HoursOff, 2)
            dr.Consume = Math.Round(TEMP, 2)
            TEMP = Math.Round(dr.Available, 2) - Math.Round(HoursOff, 2)
            dr.Available = Math.Round(TEMP, 2)
            Dim rowsAffected As Integer = Adapter.Update(dt)
            Return True
        End If
    End Function
    Public Shared Sub UpdateTimeOffPolicies()
        Call New AccountEmployeeTimeOffBLL().SetPolicies()
    End Sub
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function UpdatePolicyIdByPolicyChanged(ByVal AccountEmployeeId As Integer, _
         ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid) As Boolean

        _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter

        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByAccountEmployeeIdAndAccountTimeOffTypeId(AccountEmployeeId, AccountTimeOffTypeId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow
        If dtTimeOff.Rows.Count > 0 Then
            drTimeOff = dtTimeOff.Rows(0)
            Me.Adapter.UpdateAccountTimeOffPolicyId(AccountTimeOffPolicyId, drTimeOff.AccountEmployeeTimeOffId)
        End If
    End Function
    Public Function UpdateConsumedHoursInEmployeeTimeOff(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal ConsumedHours As Double, ByVal AccountTimeOffPolicyId As Guid)
        _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter
        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow = dtTimeOff.Rows(0)
        With drTimeOff
            .Consume = ConsumedHours
            .LastResetDate = Now.Date
        End With
        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)
        Return rowsAffected = 1
    End Function
    Public Function GetNewAvailableHoursForResetPolicy(ByVal Hours As Double, ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid) As Double
        Dim CarryForward As Double = GetCarryForwardHoursByEmployeeIdAndTimeOffTypeId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim TotalHours As Double = Math.Round(Hours, 2) + Math.Round(CarryForward, 2)
        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow = dtTimeOff.Rows(0)
        If Not IsDBNull(drTimeOff.Item("Consume")) Then
            Return Math.Round(TotalHours - drTimeOff.Consume, 2)
        End If
        Return TotalHours
    End Function
    Public Function UpdateCarryForwardByParameter(ByVal AccountEmployeeId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal AccountTimeOffPolicyId As Guid, ByVal CarryForward As Double)
        _AccountEmployeeTimeOffTableAdapter = New AccountEmployeeTimeOffTableAdapter
        Dim dtTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByEmployeeIdAndTimeOffTypeIdAndPolicyId(AccountEmployeeId, AccountTimeOffTypeId, AccountTimeOffPolicyId)
        Dim drTimeOff As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow = dtTimeOff.Rows(0)
        With drTimeOff
            .CarryForward = CarryForward
        End With
        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)
        Return rowsAffected = 1
    End Function
    Public Function CheckTimeEntryTimeOffDeduction(ByVal drTimeEntry As AccountEmployeeTimeEntry.AccountEmployeeTimeEntryRow) As Boolean
        Dim dt As AccountEmployeeTimeOff.AccountEmployeeTimeOffDataTable = Adapter.GetDataByAccountEmployeeIdAndAccountTimeOffTypeId(drTimeEntry.AccountEmployeeId, drTimeEntry.AccountTimeOffTypeId)
        Dim dr As AccountEmployeeTimeOff.AccountEmployeeTimeOffRow
        Dim IsTimeOffConsumed As Boolean = IIf(IsDBNull(drTimeEntry.Item("IsTimeOffConsumed")), True, drTimeEntry.Item("IsTimeOffConsumed"))
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            If IsDBNull(dr.Item("LastResetDate")) Then
                Return IsTimeOffConsumed
            End If
            If dr.LastResetDate <= drTimeEntry.TimeEntryDate Then
                Return IsTimeOffConsumed
            End If
        End If
    End Function
End Class