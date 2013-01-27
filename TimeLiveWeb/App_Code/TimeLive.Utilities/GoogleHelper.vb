Imports Microsoft.VisualBasic
Imports System.Net
Imports System.IO
Namespace TimeLive.Utilities
    Public Class GoogleHelper
        Public Shared Function GetEvents(calendar As String, token As String) As List(Of SharedEvent)
            Dim baseURL As String = "https://www.googleapis.com/calendar/v3"

            Dim url As String = baseURL + "/calendars/" & calendar & "/events"
            Dim rq As HttpWebRequest = HttpWebRequest.Create(url)
            rq.Headers.Add("Authorization", "AuthSub token=" + Chr(34) + token + Chr(34))
            rq.Method = "GET"
            Dim rs As HttpWebResponse = rq.GetResponse()
            Dim sr As New StreamReader(rs.GetResponseStream())
            Dim cont As String = sr.ReadToEnd
            Dim obj As CalendarObjects.EventsAnswer
            obj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of CalendarObjects.EventsAnswer)(cont)
            Dim result As New List(Of SharedEvent)
            For Each si As CalendarObjects.EventObject In obj.items

                result.Add(si.GetSharedEvent)
            Next
            Return result
        End Function
        Public Shared Function GetUserID(token As String) As String

        End Function
        Public Shared Sub CreateEvent(TaskEvent As SharedEvent)

        End Sub
        Public Shared Sub UpdateEvent(TaskEvent As SharedEvent)

        End Sub
        Public Shared Sub DeleteEvent(TaskEvent As SharedEvent)

        End Sub
        Public Shared ReadOnly Property CurrentGoogleProcessor As GoogleSyncProcessor
            Get
                Return System.Web.HttpContext.Current.Session("GOOGLE_SYNC_PROCESSOR")
            End Get
        End Property
        Public Shared Function RunSync(CalendarID As String, UserID As Integer) As Boolean
            If CurrentGoogleProcessor IsNot Nothing Then Return False
            Dim r As New GoogleSyncProcessor()
            r.CalendarId = CalendarID
            r.UserId = UserID
            System.Web.HttpContext.Current.Session("GOOGLE_SYNC_PROCESSOR") = r
            r.Go()
            Return True

        End Function
        Friend Shared Sub ClearSyncState()
            System.Web.HttpContext.Current.Session("GOOGLE_SYNC_PROCESSOR") = Nothing
        End Sub
    End Class

    Public Class GoogleDBHelper
        Public Shared        Function GetDefaultCalendarID(GoogleAccountID As String) As String
            Using agc As New AccountGoogleCalendarTableAdapters.AccountGoogleCalendarTableAdapter()
                Dim calendarID As String = agc.GetDefaultCalendar(GoogleAccountID)
                Return calendarID
            End Using

        End Function

        Public Shared Sub SetDefaultCalendarID(GoogleAccountID As String, GoogleCalendarID As String, CurrentID As Integer)
            Using agc As New AccountGoogleCalendarTableAdapters.AccountGoogleCalendarTableAdapter()
                agc.SetDefaultCalendar(CurrentID, GoogleAccountID, GoogleAccountID)
            End Using
        End Sub

        Public Shared Sub ResetDefaultCalendarID(GoogleAccountID As String)
            Using agc As New AccountGoogleCalendarTableAdapters.AccountGoogleCalendarTableAdapter()
                agc.ResetDefaultCalendar(GoogleAccountID)
            End Using
        End Sub
        Public Shared Function GetTaskEvents(UserID As Integer) As List(Of SharedEvent)

        End Function

        Public Shared Sub CreateTask(TaskEvent As SharedEvent)

        End Sub
        Public Shared Sub DeleteTask(TaskEvent As SharedEvent)

        End Sub
        Public Shared Sub UpdateTask(TaskEvent As SharedEvent)

        End Sub
    End Class

    Public Class GoogleSyncProcessor
        Public Property CurrentState As String
        Public Property CalendarId As String
        Public Property UserId As String
        Private token As String
        Public Sub Go()
            token = System.Web.HttpContext.Current.Session("ACCESS_TOKEN").ToString()
            Dim th As New System.Threading.Thread(New System.Threading.ParameterizedThreadStart(AddressOf InternalGo))
            th.IsBackground = True
            th.Start()
        End Sub
        Private Sub InternalGo(obj As Object)
            CurrentState = "Getting events from your google calendar"
            Dim GCEvents = GoogleHelper.GetEvents(CalendarId, token)
            CurrentState = "Getting tasks"
            GoogleHelper.ClearSyncState()
        End Sub
    End Class
End Namespace