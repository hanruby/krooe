Imports Google.GData.Client
Imports Google.GData.Calendar
Imports Microsoft.VisualBasic
Imports TimeLiveDataSetTableAdapters
Imports AccountEmployeeTableAdapters
Imports System.Web

Partial Class Employee_SyncTasks
    Inherits System.Web.UI.Page
    Dim Service As CalendarService
    Dim baseURL As String = "https://www.googleapis.com/calendar/v3"
    Public Property GoogleUserID As String
        Get
            Return Session("GOOGLE_USER_ID")
        End Get
        Set(value As String)
            Session("GOOGLE_USER_ID") = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim authFactory As New GAuthSubRequestFactory("cl", "KrooeTestApp")
            authFactory.Token = Session("ACCESS_TOKEN").ToString()
            Service = New CalendarService(authFactory.ApplicationName)
            Service.RequestFactory = authFactory

            Dim query As New CalendarQuery()
            query.Uri = New Uri("https://www.google.com/calendar/feeds/default/owncalendars/full")
            Dim resultFeed As AtomFeed = Service.Query(query)
            GoogleUserID = resultFeed.Authors(0).Email

            If resultFeed.Entries.Count = 1 Then
                Dim calendarId As String = resultFeed.Entries(0).Id.AbsoluteUri
                Dim part As String() = calendarId.Split("/")
                GoToStep2(part(part.Count - 1))
            Else
                Dim defCal As String = TimeLive.Utilities.GoogleDBHelper.GetDefaultCalendarID(GoogleUserID)
                If String.IsNullOrEmpty(defCal) Then
                    rpCalendars.DataSource = resultFeed.Entries
                    rpCalendars.DataBind()
                Else
                    GoToStep2(defCal)
                End If
            End If
        End If
    End Sub
    Public Sub GoToStep2(calendarID As String)
        Dim aeb As New AccountEmployeeBLL()
        Dim empTable As AccountEmployee.AccountEmployeeDataTable
        empTable = aeb.GetAccountEmployeesByAccountId(DBUtilities.GetSessionAccountId)
        Dim currentUserId As Integer = empTable(0).AccountId
        TimeLive.Utilities.GoogleHelper.RunSync(calendarID, currentUserId)
        mwSync.SetActiveView(vwProgress)

    End Sub
    Protected Sub rpCalendars_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpCalendars.ItemCommand
        If (cbRemeberCalendar.Checked) Then
            TimeLive.Utilities.GoogleDBHelper.SetDefaultCalendarID(GoogleUserID, e.CommandArgument.ToString(), DBUtilities.GetCurrentAccountId)
        End If
        Dim calendarId As String = Uri.UnescapeDataString(e.CommandArgument.ToString())
        Dim part As String() = calendarId.Split("/")

        GoToStep2(part(part.Count - 1))

       
    End Sub
End Class
