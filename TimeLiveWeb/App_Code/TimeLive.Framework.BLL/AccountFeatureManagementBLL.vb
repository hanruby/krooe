Imports Microsoft.VisualBasic
Imports AccountFeatureManagementTableAdapters
Imports TimeLiveDataSetTableAdapters

<System.ComponentModel.DataObject()> _
Public Class AccountFeatureManagementBLL

    Private _AccountFeaturesTableAdapter As AccountFeaturesTableAdapter = Nothing
    Private _vueAccountFeaturesTableAdapter As vueAccountFeaturesTableAdapter = Nothing
    Private _SystemSecurityCategoryPageTableAdapter As SystemSecurityCategoryPageTableAdapter = Nothing
    Protected ReadOnly Property Adapter() As AccountFeaturesTableAdapter
        Get
            If _AccountFeaturesTableAdapter Is Nothing Then
                _AccountFeaturesTableAdapter = New AccountFeaturesTableAdapter()
            End If

            Return _AccountFeaturesTableAdapter
        End Get
    End Property
    Protected ReadOnly Property vueAdapter() As vueAccountFeaturesTableAdapter
        Get
            If _vueAccountFeaturesTableAdapter Is Nothing Then
                _vueAccountFeaturesTableAdapter = New vueAccountFeaturesTableAdapter()
            End If

            Return _vueAccountFeaturesTableAdapter
        End Get
    End Property
    Protected ReadOnly Property SecurityAdapter() As SystemSecurityCategoryPageTableAdapter
        Get
            If _SystemSecurityCategoryPageTableAdapter Is Nothing Then
                _SystemSecurityCategoryPageTableAdapter = New SystemSecurityCategoryPageTableAdapter()
            End If

            Return _SystemSecurityCategoryPageTableAdapter
        End Get
    End Property
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountFeatureByAccountId(ByVal AccountId As Integer) As AccountFeatureManagement.AccountFeaturesDataTable
        GetAccountFeatureByAccountId = Adapter.GetDataByAccountId(AccountId)
        UIUtilities.FixTableForNoRecords(GetAccountFeatureByAccountId)
        Return GetAccountFeatureByAccountId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetvueAccountFeatureByAccountId(ByVal AccountId As Integer) As AccountFeatureManagement.vueAccountFeaturesDataTable
        GetvueAccountFeatureByAccountId = vueAdapter.GetDataByAccountId(AccountId)
        Return GetvueAccountFeatureByAccountId
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, True)> _
    Public Function GetAccountFeatureByAccountIdAndSystemFeatureId(ByVal AccountId As Integer, ByVal SystemFeatureId As Guid) As AccountFeatureManagement.AccountFeaturesDataTable
        Return Adapter.GetDataByAccountIdandSystemFeatureId(AccountId, SystemFeatureId)
    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, True)> _
     Public Function AddAccountFeatures(ByVal AccountId As Integer, ByVal SystemFeatureId As Guid) As Boolean

        _AccountFeaturesTableAdapter = New AccountFeaturesTableAdapter

        Dim dtAccountFeatures As New AccountFeatureManagement.AccountFeaturesDataTable
        Dim drAccountFeatures As AccountFeatureManagement.AccountFeaturesRow = dtAccountFeatures.NewAccountFeaturesRow
        Dim AccountFeatureId As Guid = System.Guid.NewGuid

        With drAccountFeatures
            .AccountFeatureId = AccountFeatureId
            .SystemFeatureId = SystemFeatureId
            .AccountId = AccountId
        End With

        dtAccountFeatures.AddAccountFeaturesRow(drAccountFeatures)

        ' Add the new product
        Dim rowsAffected As Integer = Adapter.Update(dtAccountFeatures)
        System.Web.HttpContext.Current.Session.Add("AccountFeatureId", AccountFeatureId)
        ' Return true if precisely one row was inserted, otherwise false
        Return rowsAffected = 1

    End Function
    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    Public Function UpdateAccountFeatures(ByVal AccountId As Integer, ByVal SystemFeatureId As Guid, ByVal Original_AccountFeatureId As Guid) As Boolean

        ' Update the product record

        Dim AccountFeature As AccountFeatureManagement.AccountFeaturesDataTable = Adapter.GetDataByAccountFeatureId(Original_AccountFeatureId)
        Dim AccountFeaturerow As AccountFeatureManagement.AccountFeaturesRow = AccountFeature.Rows(0)

        With AccountFeaturerow
            .AccountFeatureId = Original_AccountFeatureId
            .SystemFeatureId = SystemFeatureId
            .AccountId = AccountId
        End With

        Dim rowsAffected As Integer = Adapter.Update(AccountFeature)

        ' Return true if precisely one row was updated, otherwise false
        Return rowsAffected = 1
    End Function
    '<System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    'Public Function UpdateSystemSecurityCategoryPage(ByVal SystemFeatureId As Guid) As Boolean

    '    ' Update the product record
    '    Dim dtSystemSecurity As TimeLiveDataSet.SystemSecurityCategoryPageDataTable = SecurityAdapter.GetDataBySystemSecurityCategoryBySystemFeatureId(SystemFeatureId)
    '    If dtSystemSecurity.Rows.Count <> 0 Then
    '        Dim drSystemSecurity As TimeLiveDataSet.SystemSecurityCategoryPageRow = dtSystemSecurity.Rows(0)
    '        With drSystemSecurity
    '            For Each drSystemSecurity In dtSystemSecurity.Rows
    '                drSystemSecurity.SystemFeatureId = SystemFeatureId
    '            Next
    '            Dim rowsAffected As Integer = SecurityAdapter.Update(dtSystemSecurity)
    '        End With
    '    End If
    'End Function
    '<System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, True)> _
    'Public Function UpdateSystemSecurityCategoryPageDelete(ByVal SystemFeatureId As Guid) As Boolean

    '    ' Update the product record
    '    Dim dtSystemSecurity As TimeLiveDataSet.SystemSecurityCategoryPageDataTable = SecurityAdapter.GetDataBySystemSecurityCategoryBySystemFeatureId(SystemFeatureId)
    '    If dtSystemSecurity.Rows.Count <> 0 Then
    '        Dim drSystemSecurity As TimeLiveDataSet.SystemSecurityCategoryPageRow = dtSystemSecurity.Rows(0)
    '        With drSystemSecurity
    '            For Each drSystemSecurity In dtSystemSecurity.Rows
    '                drSystemSecurity.Item("SystemFeatureId") = DBNull.Value
    '            Next
    '            Dim rowsAffected As Integer = SecurityAdapter.Update(dtSystemSecurity)
    '        End With
    '    End If
    'End Function

    <System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, True)> _
    Public Function DeleteAccountFeature(ByVal AccountFeatureId As Guid) As Boolean
        Dim rowsAffected As Integer = Adapter.DeleteQuery(AccountFeatureId)

        Return rowsAffected = 1
    End Function
    Public Function DeleteAccountFeatureData(ByVal AccountId As Integer, ByVal SystemFeatureId As Guid) As Boolean
        Dim rowsAffected As Integer = Adapter.DeleteAccountFeatureData(AccountId, SystemFeatureId)

        Return rowsAffected = 1
    End Function
    Public Sub InsertDefault(ByVal AccountId As Integer)
        Adapter.InsertQuery(AccountId)
    End Sub
    Public Sub InsertDefault(ByVal AccountId As Integer, ByVal UserInterfaceLanguage As String)
        Adapter.InsertQuery(AccountId)
        If Not LocaleUtilitiesBLL.IsEnglishCultureString(UserInterfaceLanguage) Then
            'Me.ChangeTaskNameByUICulture(AccountId)
        End If
    End Sub
    Public Sub ChangeTaskNameByUICulture(ByVal AccountId As Integer)
        Dim dtFeatureManagement As AccountFeatureManagement.AccountFeaturesDataTable = Me.GetAccountFeatureByAccountId(AccountId)
        Dim drFeatureManagement As AccountFeatureManagement.AccountFeaturesRow
        For Each drFeatureManagement In dtFeatureManagement.Rows
            'Dim dt As AccountFeatureManagement.SystemFeaturesDataTable = 
            ' Me.UpdateAccountFeatures(DBUtilities.GetSessionAccountId, , , )
        Next
    End Sub
    Public Function GetLastInsertedId() As Guid
        Return System.Web.HttpContext.Current.Session("AccountFeatureId")
    End Function
End Class
