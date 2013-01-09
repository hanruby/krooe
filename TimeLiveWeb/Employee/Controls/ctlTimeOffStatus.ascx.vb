
Partial Class Employee_Controls_ctlTimeOffStatus
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnResetButton.Attributes.Add("onclick", ResourceHelper.GetResetPolicyMessageJavascript)
        GetEmployeeName()
        Me.GridView1.Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(141, 1)
        If Me.GridView1.Visible <> False Then
            Me.btnUpdate.Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(141, 3)
        Else
            Me.btnUpdate.Visible = False
        End If

        If GridView1.Rows.Count > 0 Then
            For Each row As GridViewRow In Me.GridView1.Rows
                If IsDBNull(Me.GridView1.DataKeys(row.RowIndex)(0)) Then
                    btnUpdate.Enabled = False
                    'For exit the sub
                    Exit Sub
                End If
            Next
        End If

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        UpdateTimeOffStatus()
        Response.Redirect("~/AccountAdmin/AccountEmployees.aspx", False)
    End Sub
    Public Sub UpdateTimeOffStatus()
        Dim objTimeOff As New AccountEmployeeTimeOffBLL
        For Each row As GridViewRow In Me.GridView1.Rows
            objTimeOff.UpdateEmployeeTimeOffAvailable(Me.GridView1.DataKeys(row.RowIndex)(0), IIf(CType(row.FindControl("AvailableTextBox"), TextBox).Text = "", 0, CType(row.FindControl("AvailableTextBox"), TextBox).Text))
        Next
    End Sub
    Public Sub GetEmployeeName()
        Dim dt As AccountEmployee.vueAccountEmployeeDataTable = New AccountEmployeeBLL().GetViewAccountEmployeesByAccountEmployeeId(Me.Request.QueryString("AccountEmployeeId"))
        Dim dr As AccountEmployee.vueAccountEmployeeRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Me.txtEmployeeName.Text = dr.EmployeeName
        End If
    End Sub

    Protected Sub btnResetButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnResetButton.Click
        Dim objtimeoff As New AccountEmployeeTimeOffBLL
        objtimeoff.ExecuteScheduledOffDaysProcedure(Me.Request.QueryString("AccountEmployeeId"))
        Response.Redirect("~/AccountAdmin/AccountEmployees.aspx", False)
    End Sub
End Class
