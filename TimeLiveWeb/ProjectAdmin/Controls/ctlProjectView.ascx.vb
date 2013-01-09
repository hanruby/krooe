
Partial Class ProjectAdmin_Controls_ctlProjectView
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtProjectId.Text = CType(New AccountProjectBLL().GetAccountProjectsByAccountProjectId(Me.Request.QueryString("AccountProjectId")).Rows(0), TimeLiveDataSet.AccountProjectRow).AccountProjectId
        txtProjectCode.Text = CType(New AccountProjectBLL().GetAccountProjectsByAccountProjectId(Me.Request.QueryString("AccountProjectId")).Rows(0), TimeLiveDataSet.AccountProjectRow).ProjectCode
        txtProjectName.Text = CType(New AccountProjectBLL().GetAccountProjectsByAccountProjectId(Me.Request.QueryString("AccountProjectId")).Rows(0), TimeLiveDataSet.AccountProjectRow).ProjectName
    End Sub
End Class
