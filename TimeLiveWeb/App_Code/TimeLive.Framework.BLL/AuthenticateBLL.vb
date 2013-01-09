Imports System.DirectoryServices
Imports Microsoft.VisualBasic
Imports System.Security.Principal
Imports System.Web.Security

Public Class AuthenticateBLL

    Public Function AfterLoggedIn(ByVal Username As String, ByVal Password As String) As Boolean
        If Not Username.ToLower = "systemadmin" Then
            Dim InstalledCustomerId As Integer = Me.GetInstalledAccountId
            Dim EmployeeBLL As New AccountEmployeeBLL
            Dim dtEmployee As AccountEmployee.AccountEmployeeDataTable = EmployeeBLL.GetAccountEmployeesByUsername(Username)
            Dim drEmployee As AccountEmployee.AccountEmployeeRow

            If dtEmployee.Rows.Count > 0 Then
                drEmployee = dtEmployee.Rows(0)
                Return True
            Else
                If UIUtilities.GetIntegratedAuthentication() <> "Yes" Then
                    Return InsertDefaultDataAndUser(InstalledCustomerId, Username, Password)
                End If
            End If
        Else
            Return True
        End If
    End Function
    Public Function InsertDefaultDataAndUser(ByVal InstalledCustomerId As Integer, ByVal Username As String, ByVal Password As String)
        Dim RoleId As Integer = LDAPUtilitiesBLL.CheckAllRolesInADGroup(Username, InstalledCustomerId)
        Dim GroupCollection As Collection = LDAPUtilitiesBLL.GetUserGroups(Username)
        If RoleId > 0 Then
            Dim nDefaultDepartmentId As Integer
            Dim objDepartment As New AccountDepartmentBLL
            Dim dtDepartment As TimeLiveDataSet.AccountDepartmentDataTable = objDepartment.GetDefaultDepartmentByAccountId(InstalledCustomerId)
            Dim drDepartment As TimeLiveDataSet.AccountDepartmentRow
            If dtDepartment.Rows.Count > 0 Then
                drDepartment = dtDepartment.Rows(0)
                nDefaultDepartmentId = drDepartment.AccountDepartmentId
            Else
                nDefaultDepartmentId = objDepartment.AddAccountDepartment(InstalledCustomerId, "Default", "Default Department", 0, 0)
            End If

            Dim nDefaultLocationId As Integer
            Dim objLocation As New AccountLocationBLL
            Dim dtLocation As TimeLiveDataSet.AccountLocationDataTable = objLocation.GetDefaultLocationByAccountId(InstalledCustomerId)
            Dim drLocation As TimeLiveDataSet.AccountLocationRow
            If dtLocation.Rows.Count > 0 Then
                drLocation = dtLocation.Rows(0)
                nDefaultLocationId = drLocation.AccountLocationId
            Else
                nDefaultLocationId = objLocation.AddAccountLocation(InstalledCustomerId, "Default Location", 0, 0)
            End If

            Dim objCurrency As New AccountCurrencyBLL
            Dim drCurrency As AccountCurrency.AccountCurrencyRow = objCurrency.GetAccountCurrencyBySystemCurrencyId(1, InstalledCustomerId).Rows(0)
            Dim nBillingRateCurrencyId As Integer = drCurrency.AccountCurrencyId
            Dim nEmployeeRateCurrencyId As Integer = drCurrency.AccountCurrencyId


            Dim nAccountEmployeeTypeId As Guid = New AccountEmployeeTypeBLL().GetDefaultAccountEmployeeTypeId(InstalledCustomerId)
            Dim nEmployeeStatusId As Integer = New AccountStatusBLL().GetDefaultAccountStatusId(InstalledCustomerId)
            Dim objWorkingDayType As New AccountWorkingDayTypeBLL
            Dim nAccountWorkingDayTypeId As Guid = objWorkingDayType.InsertDefault(InstalledCustomerId, 0)

            Dim LDAP As New LDAPUtilitiesBLL

            If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
                Dim Admin As DirectoryEntry = LDAPUtilitiesBLL.GetUserByName(Username)
                If Not Admin Is Nothing Then
                    Dim FirstName As String
                    Dim LastName As String
                    Dim Email As String
                    If Admin.Properties("givenname").Value Is Nothing Then
                        FirstName = Username
                    Else
                        FirstName = Admin.Properties("givenname").Item(0)
                    End If
                    If Admin.Properties("sn").Value Is Nothing Then
                        LastName = Username
                    Else
                        LastName = Admin.Properties("sn").Item(0)
                    End If

                    If Admin.Properties("mail").Value Is Nothing Then
                        Email = Username & "@" & Username & ".com"
                    Else
                        Email = Admin.Properties("mail").Item(0)
                    End If

                    Call New AccountEmployeeBLL().AddAccountEmployeeActiveDirectory(Username, Username, FirstName, LastName, Email, Nothing, InstalledCustomerId, nDefaultDepartmentId, RoleId, nDefaultLocationId, DBUtilities.GetAccountCountryId, Nothing, Now, -1, 0, DBUtilities.GetTimeZoneId, 0, 0, nAccountEmployeeTypeId, nEmployeeStatusId, Nothing, Now.Date, Nothing, nAccountWorkingDayTypeId, Nothing, Nothing, Nothing, False, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, "Mr.", False)
                    Return True
                Else
                    Return False
                End If
            End If
        Else
            Return False
        End If
    End Function
    Public Function ValidateUsingStandardIfExternalUser(ByVal Username As String, ByVal Password As String) As Boolean
        If AccountEmployeeBLL.IsExternalUser(Username) Then
            Return New CustomProviders.LiveMembershipProvider().ValidateUser(Username, Password)
        End If
    End Function
    Public Function AuthenticateLogin(ByVal Username As String, ByVal Password As String, Optional ByVal IsAutoLogin As Boolean = True) As Boolean
        Dim LDAP As New LDAPUtilitiesBLL

        If Username.ToLower = "systemadmin" Then
            If New AccountEmployeeBLL().ValidateLogin(Username.ToLower, Password) = True Then
                Return True
            Else
                Return False
            End If
        Else
            If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
                Dim BLL As New AuthenticateBLL
                ' Validate using database authentication for external users
                If ValidateUsingStandardIfExternalUser(Username, Password) Then
                    Return True
                End If
                Dim MembershipValidUser As Boolean
                If UIUtilities.GetIntegratedAuthentication() = "Yes" And IsAutoLogin = False Then
                    MembershipValidUser = True
                Else
                    MembershipValidUser = Membership.ValidateUser(Username, Password)
                End If
                If MembershipValidUser = True Then
                    Call New AccountEmployeeBLL().ValidateLogin(Username, Password)
                    If BLL.AfterLoggedIn(Username, Password) Then
                        Return True
                    Else
                        Return False
                    End If
                Else
                    Return False
                End If
            Else
                If Membership.ValidateUser(Username, Password) = True Then
                    Return True
                End If
            End If
        End If

    End Function
    Public Function LoggedIn(ByVal Username As String, ByVal Password As String, Optional ByVal IsTimeLiveMobile As Boolean = False) As Boolean
        Dim authTicket As System.Web.Security.FormsAuthenticationTicket
        Dim BLL As New AuthenticateBLL
        If New LDAPUtilitiesBLL().IsAspNetActiveDirectoryMembershipProvider = True Then
            Call New AccountEmployeeBLL().ValidateLogin(Username, Password)
        End If
        FormsAuthentication.Initialize()

        If Username.ToLower = "systemadmin" Then
            authTicket = New FormsAuthenticationTicket(1, Username.ToLower, Now, Now.AddMinutes(System.Web.HttpContext.Current.Session.Timeout), True, -1, FormsAuthentication.FormsCookiePath)
        Else
            authTicket = New FormsAuthenticationTicket(1, Username, Now, Now.AddMinutes(System.Web.HttpContext.Current.Session.Timeout), True, System.Web.HttpContext.Current.Session("AccountEmployeeId"), FormsAuthentication.FormsCookiePath)
        End If
        Dim encTicket As String = FormsAuthentication.Encrypt(authTicket)
        If Username.ToLower = "systemadmin" Then
            System.Web.HttpContext.Current.Session("UserName") = Username.ToLower
        Else
            System.Web.HttpContext.Current.Session("UserName") = Username
        End If
        System.Web.HttpContext.Current.Response.Cookies.Add(New HttpCookie(FormsAuthentication.FormsCookieName, encTicket))
        Call New AccountPagePermissionBLL().GetAccountPermissionsOfCurrentRoles()
        System.Web.HttpContext.Current.Session.Add("IsTimeLiveMobile", IsTimeLiveMobile)        
    End Function
    Public Function GetInstalledAccountId() As Integer

        Dim AccountBLL As New AccountBLL
        Dim dtAccount As TimeLiveDataSet.AccountDataTable = AccountBLL.GetAccounts()
        Dim drAccount As TimeLiveDataSet.AccountRow

        If dtAccount.Rows.Count > 0 Then
            drAccount = dtAccount.Rows(0)
            Return drAccount.AccountId
        Else
            Return 0
        End If

    End Function
    Public Shared Sub DoLogout(ByVal CurrentPage As Page, Optional ByVal IsTimeLiveMobileLogin As Boolean = False)
        System.Web.HttpContext.Current.Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        UIUtilities.RedirectToLoginPage(CurrentPage, IsTimeLiveMobileLogin)
    End Sub
    Public Shared Sub DoLogoutForCallBack(ByVal CurrentPage As Page, Optional ByVal IsTimeLiveMobileLogin As Boolean = False)
        System.Web.HttpContext.Current.Session.Abandon()
        System.Web.Security.FormsAuthentication.SignOut()
        UIUtilities.RedirectToLoginPageForCallBack(CurrentPage, IsTimeLiveMobileLogin)
    End Sub


    Public Shared Function IsNewSession() As Boolean
        If (System.Web.HttpContext.Current.Session.IsNewSession) Or (System.Web.HttpContext.Current.Session.Count = 0) Or (System.Web.HttpContext.Current.User.Identity.Name = "") Then
            Return True
        End If
    End Function
    Public Shared Sub CheckSession(ByVal Page As System.Web.UI.Page)
        If AuthenticateBLL.IsNewSession() Then
            AuthenticateBLL.DoLogout(Page)
        End If
        LocaleUtilitiesBLL.SetPageCultureSetting(Page)
    End Sub
End Class
