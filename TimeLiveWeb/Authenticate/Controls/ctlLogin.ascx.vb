Imports System.Security.Principal
Imports System.Web.Security
Imports System.Globalization

Partial Class Auth_Controls_ctlLogin1
    Inherits System.Web.UI.UserControl
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.SetImageUrl()
        If UIUtilities.IsSignUpOnLogin Then
            CType(Me.Login1.FindControl("Button2"), Button).Visible = True
        Else
            CType(Me.Login1.FindControl("Button2"), Button).Visible = False
        End If

    End Sub
    Public Sub SetImageUrl()
        If System.Configuration.ConfigurationManager.AppSettings("SHOW_HELP_ICON") = "No" Then
            CType(Me.Login1.FindControl("Literal1"), Literal).Visible = False
        End If
        If UIUtilities.GetApplicationMode = "Installed" Then
            If Membership.Provider.Name = "AspNetActiveDirectoryMembershipProvider" Then
                CType(Me.Login1.FindControl("Literal5"), Literal).Visible = False
            End If
            CType(Me.Login1.FindControl("TimeLiveLogin"), Literal).Text = ResourceHelper.GetFromResource("TimeLive Login")
            Me.Page.Title = ResourceHelper.GetFromResource(Me.Page.Title)
        End If
    End Sub
    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Dim Username As String = CType(Me.Login1.FindControl("UserName"), TextBox).Text
        Dim Password As String = CType(Me.Login1.FindControl("Password"), TextBox).Text
        Dim BLL As New AuthenticateBLL
        Try
            If BLL.AuthenticateLogin(Username, Password) = True Then
                Me.UpdateUILanguage()
                e.Authenticated = True
            Else
                e.Authenticated = False
            End If
        Catch ex As Exception
            Response.Write("Configuration Error: " & ex.Message)
            'CType(Me.Login1.FindControl("ErrorText"), Label).Visible = True
            'CType(Me.Login1.FindControl("ErrorText"), Label).Text = "Configuration Error: " & ex.Message
        End Try
    End Sub
    Protected Sub Login1_LoggedIn(ByVal sender As Object, ByVal e As System.EventArgs) Handles Login1.LoggedIn
        Dim Username As String = CType(Me.Login1.FindControl("UserName"), TextBox).Text
        Dim Password As String = CType(Me.Login1.FindControl("Password"), TextBox).Text
        Dim BLL As New AuthenticateBLL
        BLL.LoggedIn(Username, Password)
        If DBUtilities.IsTimeLiveMobileLogin Then
            Login1.DestinationPageUrl = UIUtilities.RedirectToMobileHomePage()
        Else
            Login1.DestinationPageUrl = UIUtilities.RedirectToHomePage()
        End If
    End Sub
    Public Sub UpdateUILanguage()
        Dim bll As New AccountEmployeeBLL
        Dim Accountbll As New AccountBLL
        Dim dt As AccountEmployee.vueAccountEmployeeDataTable = bll.GetAccountEmployeeIdByEmailAddress(CType(Me.Login1.FindControl("UserName"), TextBox).Text)
        Dim dr As AccountEmployee.vueAccountEmployeeRow
        Dim EmployeeId As Integer
        Dim AccountId As Integer
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            EmployeeId = dr.AccountEmployeeId
            AccountId = dr.AccountId
            If CType(Me.Login1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue <> "0" Then
                If CType(Me.Login1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue <> dr.UserInterfaceLanguage Then
                    'bll.UpdateUILanguage(CType(Me.Login1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue, EmployeeId)
                    bll.SetSessionValuesUILanguage(Nothing, EmployeeId, CType(Me.Login1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue)
                End If
            End If
        End If
        'AccountEmployeeBLL.get
        'System.Web.HttpContext.Current.Session.Add("UserInterfaceLanguage", CType(Me.Login1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue)
    End Sub
    Protected Sub Button2_Click(sender As Object, e As System.EventArgs)
        Response.Redirect(SignUpURL, False)
    End Sub
    Public Shared Function SignUpURL() As String
        Return "~/Home/SignUp.aspx"
    End Function



End Class
