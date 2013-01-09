Imports Microsoft.VisualBasic
Imports InteractiveStudios.QlmLicenseLib
Imports System.Security
Imports System.Security.Cryptography

Public Class LicensingBLL
    Public Const ACTIVATION_PRODUCT_ID = 2
    Public Const ACTIVATION_PRODUCT_NAME = "Krooe"
    Public Const ACTIVATION_PRODUCT_KEY = "TLDE"
    Public Const ACTIVATION_GUID_KEY = "{F37FC02F-13E6-4255-AA98-AF526FCA16FE}"
    Public Const ACTIVATION_VERSION_MAJOR = 2
    Public Const ACTIVATION_VERSION_MINOR = 95
    Public Const ACTIVATION_COMMUNICATION_KEY = "{B6163D99-F46A-4580-BB42-BF276A507A14}"
    Public Const ACTIVATION_URL = ""
    Public Const ACTIVATION_APP_SETTING_PARAMETER_NAME = "ActivationURL"
    Public Const ENCRYPTION_KEY = "zooooooooooo123"

    Public Function ActivateLicenseKey(ByVal strLicenseKey As String, ByVal AccountId As Integer) As Boolean

        If Left(strLicenseKey, 4) = "TLDE" Then
            Me.ActivateProduct(strLicenseKey, AccountId)
            Return True
        Else
            Return False
        End If

    End Function
    Public Shared Function IsExpiryDateValid(ByVal strExpiryDateActivation As Object) As Boolean

        If IsDBNull(strExpiryDateActivation) Then
            Return False
        ElseIf strExpiryDateActivation = "" Then
            Return False
        Else
            If LicensingBLL.GetAccountExpiryDateFromDateString(GetStringFromEncryptedValue(strExpiryDateActivation)) > Now.Date Then
                Return True
            Else
                Return False
            End If
        End If

    End Function
    Public Shared Function IsUnlimitedLicense(ByVal strLicenseActivation As Object) As Boolean

        If IsDBNull(strLicenseActivation) Then
            Return False
        Else
            If GetStringFromEncryptedValue(strLicenseActivation).Substring(0, 4) = "TLDE" Then
                Return True
            Else
                Return False
            End If
        End If

    End Function
    Public Shared Function IsUserIsAllowedToLogin(ByVal AccountEmployeeId As Integer, ByVal AccountId As Integer, ByVal AccountExpiryActivation As Object, ByVal LicenseActivation As Object)
        Dim NumberOfAllowedUser As Integer = LicensingBLL.GetNumberOfUsersAllowed(AccountId)
        Dim TotalUsers As Integer = AccountEmployeeBLL.GetAccountEmployeesByAccountIdCount(AccountId)
        If (TotalUsers = NumberOfAllowedUser And LicensingBLL.IsExpiryDateValid(AccountExpiryActivation)) Or IsUnlimitedLicense(LicenseActivation) Then
            Return True
        End If
        If TotalUsers > NumberOfAllowedUser Then
            If New AccountEmployeeBLL().GetAccountEmployeesByNumberOfUsersAllowed(AccountId, AccountEmployeeId, NumberOfAllowedUser).Count > 0 Then
                Return True
            Else
                LoggingBLL.WriteToLog("LicensingBLL:IsUserIsAllowedToLogin: User is not available in top " & NumberOfAllowedUser & ": AccountId = " & AccountId & " EmployeeId " & AccountEmployeeId)
                Throw New Exception("Only top " & NumberOfAllowedUser & " user(s) can login in your TimeLive account.")
                Return False
            End If
        Else
            Return True
        End If

    End Function
    Public Shared Function GetNumberOfUsersAllowed(ByVal AccountId As Integer) As Integer

        Dim Account As TimeLiveDataSet.AccountRow = New AccountBLL().GetAccountByAccountId(AccountId)
        If Account.LicenseActivation = "" Then
            Return LicensingBLL.GetNumberOfUserOfPackage("", GetAccountExpiryDateFromDateString(LicensingBLL.GetStringFromEncryptedValue(Account.Item("AccountExpiryActivation"))))
        End If

        Dim LicenseKey As String
        LicenseKey = LicensingBLL.GetStringFromEncryptedValue(Account.LicenseActivation)

        If Account.AccountExpiryActivation <> "" Then
            Return GetNumberOfUserOfPackage(GetPackgeOfProductCode(LicenseKey), GetAccountExpiryDateFromDateString(GetStringFromEncryptedValue(Account.AccountExpiryActivation)))
        Else
            Return GetNumberOfUserOfPackage(GetPackgeOfProductCode(LicenseKey), GetAccountExpiryDateFromDateString(Account.AccountExpiryActivation))
        End If

    End Function
    Public Shared Function GetDecryptedLicenseKey() As String
        Dim Account As TimeLiveDataSet.AccountRow = New AccountBLL().GetAccountByAccountId(DBUtilities.GetSessionAccountId)
        If IsDBNull(Account("LicenseActivation")) Then
            Return ""
        ElseIf Account("LicenseActivation") = "" Then
            Return ""
        Else
            Dim LicenseKey As String = LicensingBLL.GetStringFromEncryptedValue(Account.LicenseActivation)
            Return LicenseKey
        End If
    End Function
    Public Shared Function GetPackgeOfProductCode(ByVal ProductCode As String)
        If ProductCode.Substring(0, 3) = "TLH" Then
            Return ProductCode.Substring(0, 4)
        ElseIf ProductCode.Substring(0, 3) = "TH4" Then
            Return ProductCode
        ElseIf ProductCode.Substring(0, 2) = "TH" Then
            Return ProductCode.Substring(0, ProductCode.IndexOf("_", 3))
        End If
    End Function
    Public Shared Function GetNumberOfUserOfPackage(ByVal strPackagePrefix As String, ByVal dtExpiry As Date) As Integer
        If System.Configuration.ConfigurationManager.AppSettings("DISABLE_LICENSE") = "Yes" Then
            Return 99999
        End If
        If IsValidLicenseActivation() = True And LicensingBLL.IsLocalInstalled Then
            Return GetValidatedLicenseNumberOfUsers()
        ElseIf (strPackagePrefix = "TLHB" Or strPackagePrefix = "TH_10") And (dtExpiry.Date >= Now.Date) Then
            Return 10
        ElseIf (strPackagePrefix = "TLHS" Or strPackagePrefix = "TH_25") And (dtExpiry.Date >= Now.Date) Then
            Return 25
        ElseIf (strPackagePrefix = "TH_50") And (dtExpiry.Date >= Now.Date) Then
            Return 50
        ElseIf (strPackagePrefix = "TH_75") And (dtExpiry.Date >= Now.Date) Then
            Return 75
        ElseIf (strPackagePrefix = "TH_100") And (dtExpiry.Date >= Now.Date) Then
            Return 100
        ElseIf strPackagePrefix.StartsWith("TH4_STANDARD") And dtExpiry.Date >= Now.Date Then
            Return strPackagePrefix.Substring(strPackagePrefix.LastIndexOf("_") + 1)
        ElseIf (strPackagePrefix = "TLHE" Or strPackagePrefix.Contains("99999")) And (dtExpiry.Date >= Now.Date) Then
            Return 99999
        ElseIf dtExpiry.Date >= Now.Date Then
            Return 99999
        Else
            Return 5
        End If
    End Function
    Public Shared Function GetNumberOfUsersAllowedFromLicenseActivation(ByVal strLicenseActivation As Object) As Integer
        Return GetNumberOfUserOfPackage("", LicensingBLL.GetAccountExpiryDateFromDateString(LicensingBLL.GetStringFromEncryptedValue(strLicenseActivation)))
    End Function
    Public Shared Function GetNumbeOfUsers(ByVal strLicenseActivation As Object) As Integer
        Return GetNumberOfUserOfPackage("", LicensingBLL.GetAccountExpiryDateFromDateString(LicensingBLL.GetStringFromEncryptedValue(strLicenseActivation)))
    End Function
    Public Shared Function GetAccountExpiryDateFromDateString(ByVal strDate As String) As Date
        If strDate = "" Then
            Return Now.AddDays(-1)
        End If
        Return New Date(strDate.Substring(0, 4), strDate.Substring(4, 2), strDate.Substring(6, 2))
    End Function
    Private Sub ActivateProduct(ByVal strLicenseKey As String, ByVal AccountId As Integer)
        Dim objAccountBLL As New AccountBLL
        objAccountBLL.UpdateLicenseKey(strLicenseKey, AccountId)
    End Sub
    Public Shared Function GetEncryptedStringAsBase64(ByVal LicenseKey As String) As String

        Dim sec As New Encryption.Symmetric(Encryption.Symmetric.Provider.DES)

        Dim keyData As New Encryption.Data(LicensingBLL.ENCRYPTION_KEY)
        Dim ivData As New Encryption.Data(LicenseKey)

        Dim EncryptedValue As Encryption.Data = sec.Encrypt(ivData, keyData)

        Return EncryptedValue.ToBase64

    End Function
    Public Shared Function GetEncryptedStringAsBase64ByUTF8(EncryptedValue As String) As String
        Dim Results As Byte()
        Dim UTF8 As New System.Text.UTF8Encoding()
        Dim HashProvider As New MD5CryptoServiceProvider()
        Dim TDESKey As Byte() = HashProvider.ComputeHash(UTF8.GetBytes(LicensingBLL.ENCRYPTION_KEY))
        Dim TDESAlgorithm As New TripleDESCryptoServiceProvider()
        TDESAlgorithm.Key = TDESKey
        TDESAlgorithm.Mode = CipherMode.ECB
        TDESAlgorithm.Padding = PaddingMode.PKCS7
        Dim DataToEncrypt As Byte() = UTF8.GetBytes(EncryptedValue)
        Try
            Dim Encryptor As ICryptoTransform = TDESAlgorithm.CreateEncryptor()
            Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length)
        Finally
            TDESAlgorithm.Clear()
            HashProvider.Clear()
        End Try
        Return Convert.ToBase64String(Results)
    End Function
    Public Shared Function GetStringFromEncryptedValueByUTF8(EncryptedValue As String) As String
        Dim Results As Byte()
        Dim UTF8 As New System.Text.UTF8Encoding()
        Dim HashProvider As New MD5CryptoServiceProvider()
        Dim TDESKey As Byte() = HashProvider.ComputeHash(UTF8.GetBytes(LicensingBLL.ENCRYPTION_KEY))
        Dim TDESAlgorithm As New TripleDESCryptoServiceProvider()
        TDESAlgorithm.Key = TDESKey
        TDESAlgorithm.Mode = CipherMode.ECB
        TDESAlgorithm.Padding = PaddingMode.PKCS7
        Dim DataToDecrypt As Byte() = Convert.FromBase64String(EncryptedValue)
        Try
            Dim Decryptor As ICryptoTransform = TDESAlgorithm.CreateDecryptor()
            Results = Decryptor.TransformFinalBlock(DataToDecrypt, 0, DataToDecrypt.Length)
        Finally
            TDESAlgorithm.Clear()
            HashProvider.Clear()
        End Try
        Return UTF8.GetString(Results)
    End Function
    Public Shared Function GetStringFromEncryptedValue(ByVal EncryptedValue As Object) As String
        If IsDBNull(EncryptedValue) Then
            Return ""
        End If
        Dim keyData As New Encryption.Data(LicensingBLL.ENCRYPTION_KEY)
        Dim ivData As New Encryption.Data()
        ivData.Base64 = EncryptedValue

        Dim sec As New Encryption.Symmetric(Encryption.Symmetric.Provider.DES)
        Dim DecryptedValue As Encryption.Data = sec.Decrypt(ivData, keyData)

        Return DecryptedValue.Text
    End Function
    Public Shared Function ActivateLincese(ByVal ActivationKey As String, ByVal ActivationType As String, ByVal IsOnlineActivation As Boolean, ByVal MachineKey As String, ByVal MachineName As String) As Boolean
        Dim AccountBLL As New AccountBLL
        Dim licenseInfo As ILicenseInfo = New LicenseInfo()
        Dim license As New QlmLicense
        Dim machineID As String = LicensingBLL.GetMachineID()
        Dim message As String = String.Empty
        license.DefineProduct(ACTIVATION_PRODUCT_ID, ACTIVATION_PRODUCT_NAME, ACTIVATION_VERSION_MAJOR, ACTIVATION_VERSION_MINOR, ACTIVATION_PRODUCT_KEY, ACTIVATION_GUID_KEY)
        license.CommunicationEncryptionKey = ACTIVATION_COMMUNICATION_KEY
        Try
            If IsOnlineActivation Then
                Dim response As String = String.Empty
                license.ActivateLicense(GetApplicationURL, ActivationKey, machineID, machineID, "4.0.00", "", response)
                If license.ParseResults(response, licenseInfo, message) Then
                    response = ""
                    Dim NumberOfUsers As String = license.GetUserData(GetApplicationURL, ActivationKey, response)
                    If NumberOfUsers = "" Then
                        NumberOfUsers = "0"
                    End If
                    AccountBLL.UpdateLicenseInformation(DBUtilities.GetSessionAccountId, machineID, licenseInfo.ComputerKey, ActivationType, ActivationKey, NumberOfUsers)
                    LicensingBLL.UpdateFeaturesOfAccounts()
                    Return True
                Else
                    Return False
                End If
            Else
                If license.ValidateMachineLicenseEx(ActivationKey, MachineKey, MachineName, message) = True Then
                    AccountBLL.UpdateLicenseInformation(DBUtilities.GetSessionAccountId, MachineName, MachineKey, ActivationType, ActivationKey, license.NumberOfLicenses)
                    LicensingBLL.UpdateFeaturesOfAccounts()
                    Return True
                Else
                    Return False
                End If
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function
    Public Shared Sub UpdateFeaturesOfAccounts()
        Dim FeatureBll As New AccountFeatureManagementBLL
        Dim TimeOffSystemFeatureId As Object
        TimeOffSystemFeatureId = New System.Guid("76aaf57e-96a4-4476-94a4-575824e9b9fa")
        Dim dtTimeOff As AccountFeatureManagement.AccountFeaturesDataTable = FeatureBll.GetAccountFeatureByAccountIdAndSystemFeatureId(DBUtilities.GetSessionAccountId, TimeOffSystemFeatureId)
        Dim drTimeOff As AccountFeatureManagement.AccountFeaturesRow
        If dtTimeOff.Rows.Count > 0 Then
            drTimeOff = dtTimeOff.Rows(0)
            If IsTimeOffFeature() = False Then
                FeatureBll.DeleteAccountFeatureData(drTimeOff.AccountId, drTimeOff.SystemFeatureId)
            End If
        End If
        Dim TimesheetSystemFeatureId As Object
        TimesheetSystemFeatureId = New System.Guid("db17deb7-51a0-4400-bf3b-9094e01ef038")
        Dim dtTimesheet As AccountFeatureManagement.AccountFeaturesDataTable = FeatureBll.GetAccountFeatureByAccountIdAndSystemFeatureId(DBUtilities.GetSessionAccountId, TimesheetSystemFeatureId)
        Dim drTimesheet As AccountFeatureManagement.AccountFeaturesRow
        If dtTimesheet.Rows.Count > 0 Then
            drTimesheet = dtTimesheet.Rows(0)
            If IsTimesheetFeature() = False Then
                FeatureBll.DeleteAccountFeatureData(drTimesheet.AccountId, drTimesheet.SystemFeatureId)
            End If
        End If
        Dim ExpenseSystemFeatureId As Object
        ExpenseSystemFeatureId = New System.Guid("537f44e5-ec0f-4de6-aa29-09450961c5e9")
        Dim dtExpensesheet As AccountFeatureManagement.AccountFeaturesDataTable = FeatureBll.GetAccountFeatureByAccountIdAndSystemFeatureId(DBUtilities.GetSessionAccountId, ExpenseSystemFeatureId)
        Dim drExpensesheet As AccountFeatureManagement.AccountFeaturesRow
        If dtExpensesheet.Rows.Count > 0 Then
            drExpensesheet = dtExpensesheet.Rows(0)
            If IsExpenseSheetFeature() = False Then
                FeatureBll.DeleteAccountFeatureData(drExpensesheet.AccountId, drExpensesheet.SystemFeatureId)
            End If
        End If
    End Sub
    Public Shared Function GetMachineID() As String
        Return Environment.MachineName
    End Function
    Public Shared Function GetAccountLicense() As QlmLicense
        Dim drAccount As TimeLiveDataSet.AccountRow = New AccountBLL().GetAccountByAccountId(DBUtilities.GetSessionAccountId)
        Dim message As String = String.Empty
        Dim license As New QlmLicense
        license.DefineProduct(ACTIVATION_PRODUCT_ID, ACTIVATION_PRODUCT_NAME, ACTIVATION_VERSION_MAJOR, ACTIVATION_VERSION_MINOR, ACTIVATION_PRODUCT_KEY, ACTIVATION_GUID_KEY)
        license.CommunicationEncryptionKey = ACTIVATION_COMMUNICATION_KEY
        If Not IsDBNull(drAccount.Item("ActivationMachineKey")) Then
            If license.ValidateMachineLicenseEx("", drAccount.ActivationMachineKey, GetMachineID, message) = True Then
                Return license
            End If
        End If
        Return license
    End Function
    Public Shared Function IsValidLicenseActivation() As Boolean
        Dim license As QlmLicense = GetAccountLicense()
        If license.IsValid Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Shared Function GetValidatedLicenseNumberOfUsers() As Integer
        Dim license As QlmLicense = GetAccountLicense()
        If license.IsFeatureEnabledEx(1, 32) Then
            Return 10
        ElseIf license.IsFeatureEnabledEx(1, 16) Then
            Return 25
        ElseIf license.IsFeatureEnabledEx(1, 8) Then
            Return 50
        ElseIf license.IsFeatureEnabledEx(1, 4) Then
            Return 75
        ElseIf license.IsFeatureEnabledEx(1, 2) Then
            Return 100
        ElseIf license.IsFeatureEnabledEx(1, 2) Then
            Return 100
        ElseIf license.IsFeatureEnabledEx(1, 1) Then
            Return 99999
        ElseIf IsFeaturesBasedLicense() Then
            Return LicensingBLL.GetStringFromEncryptedValue(New AccountBLL().GetLicenseID(DBUtilities.GetSessionAccountId))
        ElseIf license.NumberOfLicenses > 1 Then
            Return license.NumberOfLicenses
        Else
            Return 99999
        End If
    End Function
    Public Shared Function IsFeaturesBasedLicense() As Boolean
        If IsTimesheetFeature(True) Or IsExpenseSheetFeature(True) Or IsTimeOffFeature(True) Or IsQuickBooksFeature(True) Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Shared Function IsFeaturesBasedHosted() As Boolean
        If LicensingBLL.IsHosted Then
            If LicensingBLL.GetDecryptedLicenseKey.Contains("TH4_STANDARD") Then
                Return True
            Else
                Return False
            End If
        Else
            Return False
        End If
    End Function
    Public Shared Function IsTimesheetFeature(Optional IsLicensed As Boolean = False) As Boolean
        If LicensingBLL.IsLocalInstalled Then
            Dim license As QlmLicense = GetAccountLicense()
            If IsLicensed = True Then
                Return license.IsFeatureEnabledEx(2, 1)
            ElseIf LicensingBLL.IsValidLicenseActivation = True And IsFeaturesBasedLicense() Then
                Return license.IsFeatureEnabledEx(2, 1)
            Else
                Return True
            End If
        ElseIf LicensingBLL.IsFeaturesBasedHosted Then
            Return LicensingBLL.GetDecryptedLicenseKey().Contains("TIMESHEET")
        ElseIf IsHostedEnterprise() Then
            Return True
        Else
            Return True
        End If
    End Function
    Public Shared Function IsHostedEnterprise() As Boolean
        If LicensingBLL.GetDecryptedLicenseKey().Contains("99999") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Shared Function IsExpenseSheetFeature(Optional IsLicensed As Boolean = False) As Boolean
        If LicensingBLL.IsLocalInstalled Then
            Dim license As QlmLicense = GetAccountLicense()
            If IsLicensed = True Then
                Return license.IsFeatureEnabledEx(2, 2)
            ElseIf LicensingBLL.IsValidLicenseActivation = True And IsFeaturesBasedLicense() Then
                Return license.IsFeatureEnabledEx(2, 2)
            Else
                Return True
            End If
        ElseIf LicensingBLL.IsFeaturesBasedHosted Then
            Return LicensingBLL.GetDecryptedLicenseKey().Contains("EXPENSE")
        ElseIf IsHostedEnterprise() Then
            Return True
        Else
            Return True
        End If
    End Function
    Public Shared Function IsTimeOffFeature(Optional IsLicensed As Boolean = False) As Boolean
        If LicensingBLL.IsLocalInstalled Then
            Dim license As QlmLicense = GetAccountLicense()
            If IsLicensed = True Then
                Return license.IsFeatureEnabledEx(2, 4)
            ElseIf LicensingBLL.IsValidLicenseActivation = True And IsFeaturesBasedLicense() Then
                Return license.IsFeatureEnabledEx(2, 4)
            Else
                Return True
            End If
        ElseIf LicensingBLL.IsFeaturesBasedHosted Then
            Return LicensingBLL.GetDecryptedLicenseKey().Contains("TIMEOFF")
        ElseIf IsHostedEnterprise() Then
            Return True
        Else
            Return True
        End If
    End Function
    Public Shared Function IsQuickBooksFeature(Optional IsLicensed As Boolean = False) As Boolean
        If LicensingBLL.IsLocalInstalled Then
            Dim license As QlmLicense = GetAccountLicense()
            If IsLicensed = True Then
                Return license.IsFeatureEnabledEx(2, 8)
            ElseIf LicensingBLL.IsValidLicenseActivation = True And IsFeaturesBasedLicense() Then
                Return license.IsFeatureEnabledEx(2, 8)
            Else
                Return True
            End If
        ElseIf LicensingBLL.IsFeaturesBasedHosted Then
            Return LicensingBLL.GetDecryptedLicenseKey().Contains("QB")
        ElseIf IsHostedEnterprise() Then
            Return True
        Else
            Return True
        End If
    End Function
    Public Shared Function GetApplicationURL() As String
        If System.Configuration.ConfigurationManager.AppSettings(ACTIVATION_APP_SETTING_PARAMETER_NAME) Is Nothing Then
            Return ACTIVATION_URL
        Else
            Return System.Configuration.ConfigurationManager.AppSettings(ACTIVATION_APP_SETTING_PARAMETER_NAME)
        End If
    End Function
    Public Shared Function GetPaymentURL(ByVal RequestObject As System.Web.HttpRequest, ByVal CustomerId As Integer)
        Dim ProductId As String = RequestObject.QueryString("Mode")
        Dim PaymentURL As String = "https://secure.avangate.com/order/product.php?PRODS=" & ProductId & "&QTY=1&REF=" & CustomerId
        Return PaymentURL
    End Function
    Public Shared Function GetCurrentPackageRow() As DataRow
        Dim dtPackages As DataTable = GetHostedPackagesOfCurrentUsers()
        Dim CurrentHostedPackage As String = GetCurrentHostedPackage()
        Return GetRowOfPackage(CurrentHostedPackage)
    End Function
    Public Shared Function GetRowOfPackage(ByVal PackageCode As String) As DataRow
        Dim dtPackages As DataTable = GetHostedPackagesOfCurrentUsers()
        Dim drSearched() As DataRow = dtPackages.Select("PackageCode='" & PackageCode & "'")
        Return drSearched(0)
    End Function
    Public Shared Function GetHostedPackagesOfCurrentUsers() As DataTable
        Return GetHostedPackages(GetHostedPackageVersion)
    End Function
    Public Shared Function GetCurrentHostedPackage() As String
        Dim LicenseKey As String = GetCurrentHostedPackageKey()
        Return LicenseKey
    End Function
    Public Shared Sub ChangeHostedPlan(ByVal PackageCode As String)
        Dim CurrentPackageCode As String = GetCurrentPackageRow("PackageCode")
        If CurrentPackageCode <> PackageCode Then
            Dim NewPaymentProduct As String = GetRowOfPackage(PackageCode)("ProductCode")
            'Dim CustomerBLL As New LTCustomerBLL
            'Dim drCustomer As TimeLiveDataSet.LTCustomerRow = CustomerBLL.GetLTCustomerByAccountId(DBUtilities.GetSessionAccountId)
            Dim PaymentURL As String = String.Format("https://secure.avangate.com/order/product.php?PRODS={0}&QTY=1&REF={1}", NewPaymentProduct, DBUtilities.GetSessionAccountId)
            System.Web.HttpContext.Current.Response.Redirect(PaymentURL, False)
        End If
    End Sub
    Public Shared Function GetLicense() As String
        Dim BLL As New AccountBLL
        Dim dr As TimeLiveDataSet.AccountRow = BLL.GetAccountByAccountId(DBUtilities.GetSessionAccountId)
        If IsDBNull(dr("LicenseKey")) Then
            Return "Lite"
        Else
            Return dr("LicenseKey")
        End If
    End Function
    Public Shared Function IsHostedPaidCustomer() As Boolean
        Dim BLL As New AccountBLL
        Dim dr As TimeLiveDataSet.AccountRow = BLL.GetAccountByAccountId(DBUtilities.GetSessionAccountId)
        If IsDBNull(dr("LicenseID")) Then
            Return False
        Else
            Return True
        End If
    End Function
    Public Shared Function IsHosted() As Boolean
        If System.Configuration.ConfigurationManager.AppSettings("ApplicationMode") = "Hosted" Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Shared Function IsLocalInstalled() As Boolean
        If System.Configuration.ConfigurationManager.AppSettings("ApplicationMode") = "Installed" Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Shared Function GetCurrentHostedPackageKey() As String
        Dim BLL As New AccountBLL
        Dim dr As TimeLiveDataSet.AccountRow = BLL.GetAccountByAccountId(DBUtilities.GetSessionAccountId)
        If IsDBNull(dr("LicenseKey")) Then
            Return "Lite"
        ElseIf dr.LicenseKey.Substring(0, 3) = "TLH" Then
            Return dr.LicenseKey.Substring(0, 4)
        ElseIf dr.LicenseKey.Substring(0, 3) = "TH4" Then
            Return dr.LicenseKey.Substring(0, dr.LicenseKey.IndexOf("_", 4))
        ElseIf dr.LicenseKey.Substring(0, 2) = "TH" Then
            Return dr.LicenseKey.Substring(0, dr.LicenseKey.IndexOf("_", 3))
        Else
            Return "Lite"
        End If
    End Function
    Public Shared Function GetHostedPackageVersion() As Integer
        Dim LicenseKey As String = GetLicense()
        If LicenseKey = "Lite" Then
            Return 4
        ElseIf LicenseKey.StartsWith("TLH") Then
            Return 1
        ElseIf LicenseKey.EndsWith("_3") Then
            Return 3
        ElseIf LicenseKey.StartsWith("TH_") Then
            Return 2
        ElseIf LicenseKey.StartsWith("TH4_") Then
            Return 4
        Else
            Return 3
        End If
    End Function
    Public Shared Function GetHostedPackages(ByVal Version As Integer) As DataTable

        Dim dtPackages As New DataTable
        dtPackages.Columns.Add("PackageCode")
        dtPackages.Columns.Add("PackageName")
        dtPackages.Columns.Add("NumberOfUsers")
        dtPackages.Columns.Add("Version")
        dtPackages.Columns.Add("ProductCode")

        Dim row As DataRow

        row = dtPackages.NewRow
        row("PackageCode") = "Lite"
        row("PackageName") = "Lite (5 Users)"
        row("NumberOfUsers") = 5
        dtPackages.Rows.Add(row)
        dtPackages.AcceptChanges()

        If Version = 4 Then
            row = dtPackages.NewRow
            row("PackageCode") = "TH4_STANDARD"
            row("PackageName") = "Standard (Per User)"
            row("NumberOfUsers") = 10
            row("Version") = 4
            row("ProductCode") = "4552303"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH4_99999"
            row("PackageName") = "Enterprise (Unlimited Users)"
            row("NumberOfUsers") = 99999
            row("Version") = 3
            row("ProductCode") = "4552884"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()
        End If

        If Version = 3 Then
            row = dtPackages.NewRow
            row("PackageCode") = "TH_10"
            row("PackageName") = "Basic (10 Users)"
            row("NumberOfUsers") = 10
            row("Version") = 3
            row("ProductCode") = "4026900"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_25"
            row("PackageName") = "TimeLive Standard (25 Users)"
            row("NumberOfUsers") = 25
            row("Version") = 3
            row("ProductCode") = "4026884"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_50"
            row("PackageName") = "Standard Plus (50 Users)"
            row("NumberOfUsers") = 50
            row("Version") = 3
            row("ProductCode") = "4026916"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_75"
            row("PackageName") = "Premium (75 Users)"
            row("NumberOfUsers") = 75
            row("Version") = 3
            row("ProductCode") = "4026876"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_100"
            row("PackageName") = "Premium Plus (100 Users)"
            row("NumberOfUsers") = 100
            row("Version") = 3
            row("ProductCode") = "4026863"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_99999"
            row("PackageName") = "Enterprise (Unlimited Users)"
            row("NumberOfUsers") = 99999
            row("Version") = 3
            row("ProductCode") = "4026854"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()
        End If

        If Version = 2 Then
            row = dtPackages.NewRow
            row("PackageCode") = "TH_10"
            row("PackageName") = "Basic (10 Users)"
            row("NumberOfUsers") = 10
            row("Version") = 2
            row("ProductCode") = "2789935"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_25"
            row("PackageName") = "TimeLive Standard (25 Users)"
            row("NumberOfUsers") = 25
            row("Version") = 2
            row("ProductCode") = "2789939"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_50"
            row("PackageName") = "Standard Plus (50 Users)"
            row("NumberOfUsers") = 50
            row("Version") = 2
            row("ProductCode") = "2789980"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_75"
            row("PackageName") = "Premium (75 Users)"
            row("NumberOfUsers") = 75
            row("Version") = 2
            row("ProductCode") = "2789992"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_100"
            row("PackageName") = "Premium Plus (100 Users)"
            row("NumberOfUsers") = 100
            row("Version") = 2
            row("ProductCode") = "2790000"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TH_99999"
            row("PackageName") = "Enterprise (Unlimited Users)"
            row("NumberOfUsers") = 100
            row("Version") = 2
            row("ProductCode") = "2790003"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()
        End If

        If Version = 1 Then
            row = dtPackages.NewRow
            row("PackageCode") = "TLHB"
            row("PackageName") = "Basic (10 Users)"
            row("NumberOfUsers") = 10
            row("Version") = 1
            row("ProductCode") = "1808893"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TLHS"
            row("PackageName") = "TimeLive Standard (25 Users)"
            row("NumberOfUsers") = 25
            row("Version") = 1
            row("ProductCode") = "1808895"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()

            row = dtPackages.NewRow
            row("PackageCode") = "TLHE"
            row("PackageName") = "Enterprise (Unlimited Users)"
            row("NumberOfUsers") = 99999
            row("Version") = 1
            row("ProductCode") = "1808894"
            dtPackages.Rows.Add(row)
            dtPackages.AcceptChanges()
        End If

        Return dtPackages
    End Function


End Class
