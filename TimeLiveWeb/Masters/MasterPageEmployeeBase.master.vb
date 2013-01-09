Partial Class MasterPageEmployeeBase
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init '
        If AuthenticateBLL.IsNewSession() Then
            If Me.Page.IsCallback Then
                AuthenticateBLL.DoLogoutForCallBack(Me.Page)
            Else
                AuthenticateBLL.DoLogout(Me.Page)
            End If
        End If
        LocaleUtilitiesBLL.SetPageCultureSetting(Me.Page)
        If Not AccountPagePermissionBLL.IsPageHasRightsByPage(Me.Page) Then
            If Me.Page.IsCallback Then
                DevExpress.Web.ASPxClasses.ASPxWebControl.RedirectOnCallback("~/Employee/NoPermission.aspx")
            Else
                Response.Redirect("~/Employee/NoPermission.aspx", False)
            End If
        End If
    End Sub
End Class

