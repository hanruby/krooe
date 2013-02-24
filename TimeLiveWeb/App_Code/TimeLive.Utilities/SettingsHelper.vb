Imports Microsoft.VisualBasic
Namespace TimeLive.Utilities
    Public Class SettingsHelper
        Public Shared ReadOnly Property ClientID As String
            Get
                Return System.Web.Configuration.WebConfigurationManager.AppSettings("GoogleApiClientId")
            End Get
        End Property
        Public Shared ReadOnly Property ClientSecret As String
            Get
                Return System.Web.Configuration.WebConfigurationManager.AppSettings("GoogleApiClientSecret")
            End Get
        End Property
        Public Shared ReadOnly Property ClientCallbackUrl As String
            Get
                Return System.Web.Configuration.WebConfigurationManager.AppSettings("GoogleApiCallabckUrl")
            End Get
        End Property
        Public Shared Function GetDefaultProject(UserId As Integer, location As String) As DefaultProjectObject

            Dim res As New DefaultProjectObject
            res.ProjectId = -1
            res.MilestoneId = -1
            ' trying get project from location
            If Not (String.IsNullOrEmpty(location)) Then
                For Each p As String In location.Split(" ")
                    If p.Trim().ToLower.StartsWith("project") Then
                        Dim prts As String() = p.Split(":")
                        If prts.Count() = 2 Then
                            Using acg As New AccountGoogleCalendarTableAdapters.AccountProject1TableAdapter
                                Dim t As AccountGoogleCalendar.AccountProject1DataTable = acg.GetByCode(prts(1))
                                If (t.Rows.Count > 0) Then
                                    res.ProjectId = (CType(t.Rows(0), AccountGoogleCalendar.AccountProject1Row)).AccountProjectId
                                End If
                            End Using
                        End If
                    End If
                Next
            End If
            ' trying get project from default settings
            If res.ProjectId = -1 Then
                Using acg2 As New AccountGoogleCalendarTableAdapters.AccountGCDefProjectTableAdapter
                    Dim t As AccountGoogleCalendar.AccountGCDefProjectDataTable = acg2.GetForUser(DBUtilities.GetCurrentAccountId)
                    If (t.Rows.Count > 0) Then
                        Dim rw As AccountGoogleCalendar.AccountGCDefProjectRow = t.Rows(0)
                        res.ProjectId = rw.ProjectID
                        res.MilestoneId = rw.MileStoneID
                    End If
                End Using
            End If

            ' getting first project of user
            If res.ProjectId = -1 Then
                Using agc As New AccountGoogleCalendarTableAdapters.AccountProject1TableAdapter
                    Dim t As AccountGoogleCalendar.AccountProject1DataTable = agc.GetProjectsForUser(DBUtilities.GetCurrentAccountId)
                    If (t.Rows.Count > 0) Then
                        res.ProjectId = CType(t.Rows(0), AccountGoogleCalendar.AccountProject1Row).AccountProjectId
                    End If
                End Using
            End If

            If (res.ProjectId > -1 And res.MilestoneId = -1) Then
                Using agc1 As New AccountGoogleCalendarTableAdapters.AccountProjectMilestoneTableAdapter
                    Dim t As AccountGoogleCalendar.AccountProjectMilestoneDataTable = agc1.GetMilestones(res.ProjectId)
                    If (t.Rows.Count > 0) Then
                        res.MilestoneId = CType(t.Rows(0), AccountGoogleCalendar.AccountProjectMilestoneRow).AccountProjectMilestoneId
                    End If
                End Using
            End If
            Return res
        End Function
        Public Shared Sub SetDefaultProject(info As DefaultProjectObject)

        End Sub
    End Class

    Public Class DefaultProjectObject
        Public Property UserId As Integer
        Public Property ProjectId As Integer
        Public Property MilestoneId As Integer
    End Class
End Namespace
