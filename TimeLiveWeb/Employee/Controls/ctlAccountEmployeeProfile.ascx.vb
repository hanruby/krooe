
Partial Class Controls_ctlAccountEmployeeProfile
    Inherits System.Web.UI.UserControl
    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        If Not IsDBNull(Me.FormView1.DataItem("CountryId")) Then
            CType(Me.FormView1.FindControl("DropDownList3"), DropDownList).SelectedValue = Me.FormView1.DataItem("CountryId")
        End If
        If Not IsDBNull(Me.FormView1.DataItem("TimeZoneId")) Then
            CType(Me.FormView1.FindControl("ddlTimeZoneId"), DropDownList).SelectedValue = Me.FormView1.DataItem("TimeZoneId")
        End If
        If Not IsDBNull(Me.FormView1.DataItem("UserInterfaceLanguage")) Then
            CType(Me.FormView1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue = Me.FormView1.DataItem("UserInterfaceLanguage")
        End If
        If DBUtilities.EnablePasswordComplexity = False Then
            CType(Me.FormView1.FindControl("RegularExpressionValidator2"), RegularExpressionValidator).Enabled = False
        End If
        Dim LDAP As New LDAPUtilitiesBLL

        CType(Me.FormView1.FindControl("txtUsername"), TextBox).ReadOnly = True
        If FormView1.CurrentMode = FormViewMode.Edit Then
            CType(Me.FormView1.FindControl("FileUpload2"), FileUpload).DataBind()
        End If
    End Sub
    Protected Sub FormView1_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles FormView1.ItemCommand
        If e.CommandName = "Cancel" Then
        End If
    End Sub
    Dim IsUpdate As Boolean
    Protected Sub Update_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If CType(Me.FormView1.FindControl("PasswordTextBox"), TextBox).Text <> "" And CType(Me.FormView1.FindControl("VerifyPasswordTextbox"), TextBox).Text <> "" Then
            Dim AccountEmployeeId As Integer
            Dim Username As String = ""
            Dim IsPasswordExpired As Boolean = False
            Dim CurrentPassword As String = CType(Membership.Provider, CustomProviders.LiveMembershipProvider).EncodePassword(CType(Me.FormView1.FindControl("CurrentPasswordTextBox"), TextBox).Text)
            Dim NewPassword As String = CType(Membership.Provider, CustomProviders.LiveMembershipProvider).EncodePassword(CType(Me.FormView1.FindControl("PasswordTextBox"), TextBox).Text)

            Dim AccountEmployeeBLL As New AccountEmployeeBLL
            AccountEmployeeId = DBUtilities.GetSessionAccountEmployeeId
            Username = AccountEmployeeBLL.GetEmailAddressByAccountEmployeeId(AccountEmployeeId)

            ''If Not Request.QueryString("IsPasswordExpired") Is Nothing Then
            ''    IsPasswordExpired = Request.QueryString("IsPasswordExpired")
            ''End If
            If IsCheckPasswordValidation() = False Then
                Return
            End If
            Dim AccountEmployees As AccountEmployee.vueAccountEmployeeDataTable = AccountEmployeeBLL.GetViewAccountEmployeesByUsernameAndPassword(Username, CurrentPassword)
            Dim dr As AccountEmployee.vueAccountEmployeeRow
            If AccountEmployees.Rows.Count > 0 Then
                dr = AccountEmployees.Rows(0)
                AccountEmployeeBLL.UpdatePasswordAndPasswordChangedDateByEmailAddress(Username, NewPassword)
                If IsPasswordExpired Then
                    AccountEmployeeBLL.UpdatePasswordChangedDateByAccountId(dr.AccountId, Now)
                End If
                ''ShowPasswordChangedMessage()
            Else
                If CType(Me.FormView1.FindControl("CurrentPasswordTextBox"), TextBox).Text <> "" Then
                    Me.ShowNotFoundMessagePasswordWrongValidation()
                    IsUpdate = True
                End If
            End If
        End If
        ''Me.dsAccountEmployeeObject.Update()
    End Sub
    Public Sub ShowPasswordChangedMessage()
        Dim strMessage As String = "Your password has been successfully changed. Please login with your new password."
        Dim strScript As String = "alert('" & strMessage & "'); window.location.href = '../Default.aspx';"
        If (Not Me.Page.ClientScript.IsStartupScriptRegistered("clientScript")) Then
            ScriptManager.RegisterClientScriptBlock(Me.Page, Me.GetType, "clientScript", strScript, True)
        End If
        'window.location = '" & URL & "';
    End Sub
    Public Sub ShowNotFoundMessagePasswordSameValidation()
        Dim strMessage As String = "The New Password cannot be the same as the Current Password. Please enter a new password."
        Dim strScript As String = "alert('" & strMessage & "'); "
        If (Not Me.Page.ClientScript.IsStartupScriptRegistered("clientScript")) Then
            ScriptManager.RegisterClientScriptBlock(Me.Page, Me.GetType, "clientScript", strScript, True)
        End If
    End Sub
    Public Sub ShowNotFoundMessagePasswordWrongValidation()
        Dim strMessage As String = "Incorrect current password."
        Dim strScript As String = "alert('" & strMessage & "'); "
        If (Not Me.Page.ClientScript.IsStartupScriptRegistered("clientScript")) Then
            ScriptManager.RegisterClientScriptBlock(Me.Page, Me.GetType, "clientScript", strScript, True)
        End If
    End Sub
    Protected Sub ObjectDataSource1_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles ObjectDataSource1.Inserting
        DBUtilities.SetRowForInserting(e)
    End Sub
    Protected Sub FormView1_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.ItemCreated
        Dim dllBillingType As DropDownList = Me.FormView1.Row.FindControl("dllBillingTypeEdit")

        If Not dllBillingType Is Nothing And Not Me.FormView1.DataItem Is Nothing Then
            If Not IsDBNull(Me.FormView1.DataItem("BillingTypeId")) Then
                dllBillingType.SelectedValue = Me.FormView1.DataItem("BillingTypeId")
            End If
        End If

    End Sub
    Protected Sub ObjectDataSource1_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Updated
        If IsCheckPasswordValidation() = True Then
            Response.Redirect(UIUtilities.RedirectToHomePage, False)
        End If

    End Sub
    Protected Sub ObjectDataSource1_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles ObjectDataSource1.Updating
        Dim EmployeeBLL As New AccountEmployeeBLL
        Dim txtPasswordTextBox As TextBox = Me.FormView1.Row.FindControl("PasswordTextBox")
        If txtPasswordTextBox.Text <> "" Then
            e.InputParameters("Password") = txtPasswordTextBox.Text
        End If
        e.InputParameters("CountryId") = CType(Me.FormView1.FindControl("DropDownList3"), DropDownList).SelectedValue
        e.InputParameters("TimeZoneId") = CType(Me.FormView1.FindControl("ddlTimeZoneId"), DropDownList).SelectedValue
        e.InputParameters("UserInterfaceLanguage") = CType(Me.FormView1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue


        DBUtilities.SetRowForUpdating(e)
        If IsCheckPasswordValidation() = False And CType(Me.FormView1.FindControl("VerifyPasswordTextBox"), TextBox).Text <> "" Then
            ShowNotFoundMessagePasswordSameValidation()
            e.Cancel = True
        End If
        If IsUpdate = True Then
            e.Cancel = True
        End If
    End Sub
    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect(UIUtilities.RedirectToHomePage, False)
    End Sub
    Public Function IsCheckPasswordValidation() As Boolean
        Dim LDAP As New LDAPUtilitiesBLL
        Dim AccountEmployeeId As Integer
        Dim Username As String
        If LDAP.IsAspNetActiveDirectoryMembershipProvider() Then
            Return True
        Else
            Dim CurrentPassword As String = CType(Membership.Provider, CustomProviders.LiveMembershipProvider).EncodePassword(CType(Me.FormView1.FindControl("CurrentPasswordTextBox"), TextBox).Text)
            Dim NewPassword As String = CType(Membership.Provider, CustomProviders.LiveMembershipProvider).EncodePassword(CType(Me.FormView1.FindControl("PasswordTextBox"), TextBox).Text)

            Dim AccountEmployeeBLL As New AccountEmployeeBLL
            AccountEmployeeId = DBUtilities.GetSessionAccountEmployeeId
            Username = AccountEmployeeBLL.GetEmailAddressByAccountEmployeeId(AccountEmployeeId)
            If CType(Me.FormView1.FindControl("VerifyPasswordTextBox"), TextBox).Text <> "" Then
                If CurrentPassword = NewPassword Then
                    Return False
                Else
                    Return True
                End If
            Else
                Return True
            End If
        End If
    End Function

    Protected Sub FormView1_ItemUpdated(sender As Object, e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Dim EmployeeBLL As New AccountEmployeeBLL
        EmployeeBLL.FileUploadForProfile(Me.FormView1.FindControl("FileUpload2"), DBUtilities.GetSessionAccountEmployeeId)
    End Sub

    Protected Sub FormView1_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating

    End Sub
End Class
