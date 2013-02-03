
Partial Class Employee_SyncSettings
    Inherits System.Web.UI.Page

    Protected Sub lbResetDefaukltCalendar_Click(sender As Object, e As System.EventArgs) Handles lbResetDefaukltCalendar.Click
        Dim calendarID As String = TimeLive.Utilities.GoogleDBHelper.GetDefaultCalendarID(DBUtilities.GetCurrentAccountId)
        If Not (String.IsNullOrEmpty(calendarID)) Then TimeLive.Utilities.GoogleDBHelper.ResetDefaultCalendarID(calendarID)
        mvSettings.ActiveViewIndex = 1
    End Sub

    Protected Sub Page_DataBinding(sender As Object, e As System.EventArgs) Handles Me.DataBinding
        ddlProject.Items.Clear()
        Dim defProj As Integer = -1
        Dim defMilestone As Integer = -1
        Using agc0 As New AccountGoogleCalendarTableAdapters.AccountGCDefProjectTableAdapter
            Dim dt As AccountGoogleCalendar.AccountGCDefProjectDataTable = agc0.GetForUser(DBUtilities.GetCurrentAccountId)
            If dt.Rows.Count > 0 Then
                Dim rw As AccountGoogleCalendar.AccountGCDefProjectRow = dt.Rows(0)
                defProj = rw.ProjectID
                defMilestone = rw.MileStoneID
            End If
        End Using
        Using agc As New AccountGoogleCalendarTableAdapters.AccountProject1TableAdapter
            For Each r As AccountGoogleCalendar.AccountProject1Row In agc.GetProjectsForUser(DBUtilities.GetCurrentAccountId)
                If (defProj = -1) Then defProj = r.AccountProjectId
                Dim li As New System.Web.UI.WebControls.ListItem
                li.Text = r.ProjectName
                li.Value = r.AccountProjectId
                li.Selected = (r.AccountProjectId = defProj)
                ddlProject.Items.Add(li)
            Next
        End Using
        Using agc1 As New AccountGoogleCalendarTableAdapters.AccountProjectMilestoneTableAdapter
            ddlMilestone.Items.Clear()
            If (defProj <> -1) Then
                For Each r As AccountGoogleCalendar.AccountProjectMilestoneRow In agc1.GetMilestones(defProj)
                    Dim li As New System.Web.UI.WebControls.ListItem
                    li.Text = r.MilestoneDescription
                    li.Value = r.AccountProjectMilestoneId
                    li.Selected = (r.AccountProjectMilestoneId = defMilestone)
                    ddlMilestone.Items.Add(li)
                Next
            End If
        End Using
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As System.EventArgs) Handles Me.PreRender
        DataBind()
    End Sub

    Protected Sub ddlProject_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlProject.SelectedIndexChanged
        Using agc1 As New AccountGoogleCalendarTableAdapters.AccountProjectMilestoneTableAdapter
            ddlMilestone.Items.Clear()

            For Each r As AccountGoogleCalendar.AccountProjectMilestoneRow In agc1.GetMilestones(CInt(ddlProject.SelectedValue))
                Dim li As New System.Web.UI.WebControls.ListItem
                li.Text = r.MilestoneDescription
                li.Value = r.AccountProjectMilestoneId
                ddlMilestone.Items.Add(li)
            Next

        End Using
    End Sub

    Protected Sub btSave_Click(sender As Object, e As System.EventArgs) Handles btSave.Click
        Using agc0 As New AccountGoogleCalendarTableAdapters.AccountGCDefProjectTableAdapter
            agc0.DeleteForUser(DBUtilities.GetCurrentAccountId)
            agc0.Insert1(DBUtilities.GetCurrentAccountId, CInt(ddlProject.SelectedValue), CInt(ddlMilestone.SelectedValue))
            lbMessage.Text = "Settings saved successfully!"
        End Using
    End Sub
End Class


