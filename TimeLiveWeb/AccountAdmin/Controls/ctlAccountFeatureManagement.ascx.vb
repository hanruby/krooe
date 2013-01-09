Imports TimeLiveDataSetTableAdapters
Partial Class AccountAdmin_Controls_ctlAccountFeatureManagement
    Inherits System.Web.UI.UserControl
    Dim FeatureBLL As New AccountFeatureManagementBLL
    Dim objAccountPagePermission As New AccountPagePermissionBLL

    Dim SecurityBLL As New AccountPagePermissionBLL
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        AccountPagePermissionBLL.SetPagePermissionForGridViewAndButton(150, Me.GridView1, btnUpdate)
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim TimesheetSystemFeatureId As Object
            TimesheetSystemFeatureId = New System.Guid("db17deb7-51a0-4400-bf3b-9094e01ef038")

        End If
    End Sub
    Dim IsUpdate As Boolean = False
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim bll As New AccountBLL
        Dim row As GridViewRow
        Try
            If IsUpdate <> True Then
                For Each row In Me.GridView1.Rows
                    If CType(row.FindControl("chkSelected"), CheckBox).Checked = True And IsDBNull(Me.GridView1.DataKeys(row.RowIndex).Item(2)) Then
                        FeatureBLL.AddAccountFeatures(DBUtilities.GetSessionAccountId, Me.GridView1.DataKeys(row.RowIndex).Item(0))
                    ElseIf CType(row.FindControl("chkSelected"), CheckBox).Checked = True And Not IsDBNull(Me.GridView1.DataKeys(row.RowIndex).Item(2)) Then
                        FeatureBLL.UpdateAccountFeatures(DBUtilities.GetSessionAccountId, Me.GridView1.DataKeys(row.RowIndex).Item(0), Me.GridView1.DataKeys(row.RowIndex).Item(2))

                    ElseIf CType(row.FindControl("chkSelected"), CheckBox).Checked = False And Not IsDBNull(Me.GridView1.DataKeys(row.RowIndex).Item(2)) Then
                        FeatureBLL.DeleteAccountFeature(Me.GridView1.DataKeys(row.RowIndex).Item(2))
                    End If
                Next
                Dim TimeOffSystemFeatureId As Object
                TimeOffSystemFeatureId = New System.Guid("76aaf57e-96a4-4476-94a4-575824e9b9fa")
                Dim dtTimeOff As AccountFeatureManagement.AccountFeaturesDataTable = FeatureBLL.GetAccountFeatureByAccountIdAndSystemFeatureId(DBUtilities.GetSessionAccountId, TimeOffSystemFeatureId)
                Dim drTimeOff As AccountFeatureManagement.AccountFeaturesRow
                If dtTimeOff.Rows.Count > 0 Then
                    drTimeOff = dtTimeOff.Rows(0)
                    bll.UpdateShowTimeOffinTimesheet(DBUtilities.GetSessionAccountId, True)
                Else
                    bll.UpdateShowTimeOffinTimesheet(DBUtilities.GetSessionAccountId, False)
                End If
                objAccountPagePermission.ResetPageSecurity()
                'LicensingBLL.UpdateFeaturesOfAccounts()
                IsUpdate = True
            End If
        Catch ex As Exception
            Throw ex

        End Try
        UIUtilities.RedirectToAdminHomePage()
    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        Dim row As GridViewRow
        Dim TimesheetSystemFeatureId As Object
        TimesheetSystemFeatureId = New System.Guid("db17deb7-51a0-4400-bf3b-9094e01ef038")
        Dim TimeOffSystemFeatureId As Object
        TimeOffSystemFeatureId = New System.Guid("76aaf57e-96a4-4476-94a4-575824e9b9fa")
        Dim ExpensesheetSystemFeatureId As Object
        ExpensesheetSystemFeatureId = New System.Guid("537f44e5-ec0f-4de6-aa29-09450961c5e9")
        If LicensingBLL.IsValidLicenseActivation = True Or LicensingBLL.IsFeaturesBasedHosted Then
            For Each row In Me.GridView1.Rows
                Dim TimesheetId = Me.GridView1.DataKeys(row.RowIndex).Item(0)
                If TimesheetId = TimesheetSystemFeatureId Then
                    If LicensingBLL.IsTimesheetFeature = False Then
                        row.Cells(1).Enabled = False
                    Else
                        row.Cells(1).Enabled = True
                    End If
                End If
                Dim TimeOffId = Me.GridView1.DataKeys(row.RowIndex).Item(0)
                If TimeOffId = TimeOffSystemFeatureId Then
                    If LicensingBLL.IsTimeOffFeature = False Then
                        row.Cells(1).Enabled = False
                    Else
                        row.Cells(1).Enabled = True
                    End If
                End If
                Dim ExpensesheetId = Me.GridView1.DataKeys(row.RowIndex).Item(0)
                If ExpensesheetId = ExpensesheetSystemFeatureId Then
                    If LicensingBLL.IsExpenseSheetFeature = False Then
                        row.Cells(1).Enabled = False
                    Else
                        row.Cells(1).Enabled = True
                    End If
                End If
            Next
        End If
    End Sub
End Class
