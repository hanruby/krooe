
Partial Class Employee_Controls_ctlMyTimeOff
    Inherits System.Web.UI.UserControl
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Employee/TimeOffRequest.aspx", False)
    End Sub
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim LockSubmittedRecords As Boolean = LocaleUtilitiesBLL.IsShowLockSubmittedRecords
            Dim LockApprovedRecords As Boolean = LocaleUtilitiesBLL.IsShowLockApprovedRecords
            Dim IsApproved As Boolean = IIf(IsDBNull(DataBinder.Eval(e.Row.DataItem, "Approved")), False, DataBinder.Eval(e.Row.DataItem, "Approved"))
            Dim IsRejected As Boolean = IIf(IsDBNull(DataBinder.Eval(e.Row.DataItem, "Rejected")), False, DataBinder.Eval(e.Row.DataItem, "Rejected"))
            If LockSubmittedRecords = True And IsRejected = False And IsApproved = False Then
                e.Row.Cells(6).FindControl("EditHyperLink").Visible = False
                e.Row.Cells(7).FindControl("DeleteLinkButton").Visible = False
            End If
            If LockApprovedRecords = True And IsApproved = True Then
                e.Row.Cells(6).FindControl("EditHyperLink").Visible = False
                e.Row.Cells(7).FindControl("DeleteLinkButton").Visible = False
            End If
        End If
    End Sub
    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Call New AccountEmployeeTimeOffRequestBLL().DeleteAccountEmployeeTimeOffRequest(Me.GridView1.DataKeys(e.RowIndex)("AccountEmployeeTimeOffRequestId"))
        e.Cancel = True
        GridView1.DataBind()
        CType(Me.CtlTimeOffStatusReadOnly1.FindControl("GridView1"), GridView).DataBind()
    End Sub
    Public Sub SetPermissions()
        AccountPagePermissionBLL.SetPagePermissionForGridView(142, Me.GridView1, 6, 7)
        AccountPagePermissionBLL.SetPagePermissionForAddButton(142, Me.btnAdd)

        If GridView1.Visible = False Then
            Me.btnAdd.Visible = False
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SetPermissions()
    End Sub
End Class