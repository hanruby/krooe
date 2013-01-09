Imports Microsoft.VisualBasic
Imports AccountTimeOffTypeTableAdapters

<System.ComponentModel.DataObject()> _
Public Class AccountTimeOffTypeBLL

    Private _AccountTimeOffTypeTableAdapter As AccountTimeOffTypeTableAdapter = Nothing
    Protected ReadOnly Property Adapter() As AccountTimeOffTypeTableAdapter
        Get
            If _AccountTimeOffTypeTableAdapter Is Nothing Then
                _AccountTimeOffTypeTableAdapter = New AccountTimeOffTypeTableAdapter()
            End If

            Return _AccountTimeOffTypeTableAdapter
        End Get
    End Property
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountTimeOffTypesByAccountIdForGridView(ByVal AccountId As Integer) As AccountTimeOffType.AccountTimeOffTypeDataTable
        GetAccountTimeOffTypesByAccountIdForGridView = Adapter.GetDataByAccountId(AccountId)
        UIUtilities.FixTableForNoRecords(GetAccountTimeOffTypesByAccountIdForGridView)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountTimeOffTypesByAccountId(ByVal AccountId As Integer) As AccountTimeOffType.AccountTimeOffTypeDataTable
        Return Adapter.GetDataByAccountId(AccountId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountTimeOffTypesByAccountIdAndIsDisabled(ByVal AccountId As Integer, ByVal AccountTimeOffTypeId As Guid) As AccountTimeOffType.AccountTimeOffTypeDataTable
        Return Adapter.GetDataByAccountIdAndIsDisabled(AccountId, AccountTimeOffTypeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountTimeOffTypesByAccountTimeOffTypeId(ByVal AccountTimeOffTypeId As Guid) As AccountTimeOffType.AccountTimeOffTypeDataTable
        Return Adapter.GetDataByAccountTimeOffTypeId(AccountTimeOffTypeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountTimeOffTypesByAccountIdAndRequestRequired(ByVal AccountId As Integer, ByVal AccountTimeOffTypeId As Guid, ByVal RequestRequired As Boolean) As AccountTimeOffType.AccountTimeOffTypeDataTable
        Return Adapter.GetDataByAccountIdAndIsTimeOffRequestRequired(AccountId, RequestRequired, AccountTimeOffTypeId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
    Public Function AddAccountTimeOffTypes( _
                    ByVal AccountId As Integer, ByVal AccountTimeOffType As String, ByVal IsTimeOffRequestRequired As Boolean, ByVal CreatedByEmployeeId As Integer, ByVal ModifiedByEmployeeId As Integer _
                ) As Boolean

        _AccountTimeOffTypeTableAdapter = New AccountTimeOffTypeTableAdapter

        Dim dtTimeOff As New AccountTimeOffType.AccountTimeOffTypeDataTable
        Dim drTimeOff As AccountTimeOffType.AccountTimeOffTypeRow = dtTimeOff.NewAccountTimeOffTypeRow
        Dim nAccountTimeOffTypeId As Guid = System.Guid.NewGuid

        With drTimeOff
            .AccountTimeOffTypeId = nAccountTimeOffTypeId
            .AccountId = AccountId
            .AccountTimeOffType = AccountTimeOffType
            .IsTimeOffRequestRequired = IsTimeOffRequestRequired
            .CreatedOn = Now
            .CreatedByEmployeeId = CreatedByEmployeeId
            .ModifiedOn = Now
            .ModifiedByEmployeeId = ModifiedByEmployeeId
            .IsDisabled = False
        End With

        dtTimeOff.AddAccountTimeOffTypeRow(drTimeOff)
        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)

        Me.AddDefaultPoliciesTimeOffTypes(nAccountTimeOffTypeId)

        Return rowsAffected = 1
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateAccountTimeOffTypes(ByVal AccountTimeOffType As String, ByVal IsTimeOffRequestRequired As Boolean, ByVal Original_AccountTimeOffTypeId As Guid, ByVal ModifiedByEmployeeId As Integer, _
    ByVal IsDisabled As Boolean) As Boolean

        Dim dtTimeOff As AccountTimeOffType.AccountTimeOffTypeDataTable = Adapter.GetDataByAccountTimeOffTypeId(Original_AccountTimeOffTypeId)
        Dim drTimeOff As AccountTimeOffType.AccountTimeOffTypeRow = dtTimeOff.Rows(0)

        With drTimeOff
            .AccountTimeOffType = AccountTimeOffType
            .IsTimeOffRequestRequired = IsTimeOffRequestRequired
            .ModifiedOn = Now
            .ModifiedByEmployeeId = ModifiedByEmployeeId
            .IsDisabled = IsDisabled
        End With

        Dim rowsAffected As Integer = Adapter.Update(dtTimeOff)

        Return rowsAffected = 1
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteAccountTimeOffTypes(ByVal Original_AccountTimeOffTypeId As Guid) As Boolean
        Try
            Dim rowsAffected As Integer = Adapter.Delete(Original_AccountTimeOffTypeId)

            Return rowsAffected = 1
        Catch ex As Exception
            Throw New Exception("Can’t delete. Dependent data is exist with this record.")
        End Try
    End Function
    Public Sub InsertDefault(ByVal AccountId As Integer, ByVal AccountEmployeeId As Integer, Optional ByVal UserInterfaceLanguage As String = "")
        If Adapter.GetDataByAccountId(AccountId).Rows.Count = 0 Then
            Adapter.InsertDefault(AccountId, AccountEmployeeId)
        End If
        If UserInterfaceLanguage <> "" Then
            If Not LocaleUtilitiesBLL.IsEnglishCultureString(UserInterfaceLanguage) Then
                Me.ChangeTimeOffTypesByUICulture(AccountId)
            End If
        End If
    End Sub
    Public Sub ChangeTimeOffTypesByUICulture(ByVal AccountId As Integer)
        Dim dtTimeOff As AccountTimeOffType.AccountTimeOffTypeDataTable = Adapter.GetDataByAccountId(AccountId)
        Dim drTimeOff As AccountTimeOffType.AccountTimeOffTypeRow
        For Each drTimeOff In dtTimeOff.Rows
            Me.UpdateAccountTimeOffTypes(ResourceHelper.GetFromResource(drTimeOff.AccountTimeOffType), drTimeOff.IsTimeOffRequestRequired, drTimeOff.AccountTimeOffTypeId, drTimeOff.ModifiedByEmployeeId, drTimeOff.IsDisabled)
        Next
    End Sub
    Public Sub AddDefaultPoliciesTimeOffTypes(ByVal AccountTimeOffTypeId As Guid)
        Dim objPolicy As New AccountTimeOffPolicyBLL
        Dim objEmployeeTimeOff As New AccountEmployeeTimeOffBLL
        objPolicy.InsertDefaultForNewTimeOffTypes(AccountTimeOffTypeId, DBUtilities.GetSessionAccountId, DBUtilities.GetSessionAccountEmployeeId)
        objEmployeeTimeOff.InsertDefaultForNewTimeOffType(AccountTimeOffTypeId, DBUtilities.GetSessionAccountId)
    End Sub
End Class
