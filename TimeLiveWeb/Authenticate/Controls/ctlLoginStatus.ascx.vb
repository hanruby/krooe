
Partial Class Employee_Controls_ctlLoginStatus
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.LN.Text = Session("AccountEmployeeFullName")
        If DBUtilities.IsTimeLiveMobileLogin() Then
            'Label1.Font.Bold = False
            'lblLoggedName.Font.Bold = False
            'LoginStatus1.Font.Bold = False
            ' Label1.Font.Size = 10
            'LN.Font.Size = 10
            'oginStatus1.Font.Size = 10
        End If
        Dim EmployeeBll As New AccountEmployeeBLL
        Me.L.ImageUrl = EmployeeBll.GetProfilePictureUrl

    End Sub

    Protected Sub LoginStatus1_LoggingOut(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles S.LoggingOut
        Dim IsTimeLiveMobileLogin As Boolean = DBUtilities.IsTimeLiveMobileLogin()
        System.Web.Security.FormsAuthentication.SignOut()
        System.Web.HttpContext.Current.Session.Abandon()
        UIUtilities.RedirectToLoginPage(, IsTimeLiveMobileLogin)
    End Sub
End Class
