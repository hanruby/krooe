Imports Microsoft.VisualBasic
Imports System.Net
Imports System.IO
Imports Google.GData.Calendar
Imports TimeLive.Utilities.CalendarObjects

Namespace TimeLive.Utilities
    Public Class GoogleHelper
        Public Shared Function GetEvents(calendar As String, token As String) As List(Of SharedEvent)
            Dim baseURL As String = "https://www.googleapis.com/calendar/v3"

            Dim url As String = baseURL + "/calendars/" & calendar & "/events"
            Dim rq As HttpWebRequest = HttpWebRequest.Create(url)
            'rq.Headers.Add("Authorization", "AuthSub token=" + Chr(34) + token + Chr(34))
            rq.Headers.Add("Authorization", "OAuth " + token)
            rq.Method = "GET"
            Dim rs As HttpWebResponse = rq.GetResponse()
            Dim sr As New StreamReader(rs.GetResponseStream())
            Dim cont As String = sr.ReadToEnd
            Dim obj As CalendarObjects.EventsAnswer
            obj = Newtonsoft.Json.JsonConvert.DeserializeObject(Of CalendarObjects.EventsAnswer)(cont)
            Dim result As New List(Of SharedEvent)
            For Each si As CalendarObjects.EventObject In obj.items
                If si.location IsNot Nothing Then
                    If si.location.ToLower().Trim() = "krooe" Or si.summary.ToLower.Trim.StartsWith("krooe") Then
                        result.Add(si.GetSharedEvent)
                    End If
                End If
            Next
            Return result
        End Function
        ''' <summary>
        ''' Create new event in google calendar
        ''' </summary>
        ''' <param name="TaskEvent">Event object</param>
        ''' <param name="CalendarId">Google Calendar ID for saving</param>
        ''' <param name="token">Auth token</param>
        ''' <returns>New Google Event ID</returns>
        ''' <remarks></remarks>
        Public Shared Function CreateEvent(TaskEvent As SharedEvent, CalendarId As String, token As String) As String
            Dim baseURL As String = "https://www.googleapis.com/calendar/v3"

            Dim url As String = baseURL & "/calendars/" & Uri.EscapeDataString(CalendarId) & "/events?pp=1&key=" + TimeLive.Utilities.SettingsHelper.ClientID
            Dim rq As HttpWebRequest = HttpWebRequest.Create(url)
            rq.Headers.Add("Authorization", "OAuth " + token)
            rq.Headers.Add("Accept-Charset", "utf-8")
            rq.KeepAlive = True
            rq.ContentType = "application/json"
            rq.Method = "POST"
            Dim Post As String = Newtonsoft.Json.JsonConvert.SerializeObject(TaskEvent.GetShortEvent)
            Dim strm As Stream = rq.GetRequestStream
            Dim bytes As Byte() = System.Text.Encoding.UTF8.GetBytes(Post)
            strm.Write(bytes, 0, bytes.Count)
            Dim rs As HttpWebResponse = rq.GetResponse()
            Dim sr As New StreamReader(rs.GetResponseStream())
            Dim cont As String = sr.ReadToEnd
            Dim ans As ActionAnswer
            ans = Newtonsoft.Json.JsonConvert.DeserializeAnonymousType(Of ActionAnswer)(cont, ans)
            Return ans.id
        End Function
        Public Shared Sub UpdateEvent(TaskEvent As SharedEvent, CalendarId As String, token As String)

        End Sub
        Public Shared Sub DeleteEvent(TaskEvent As SharedEvent, CalendarId As String, token As String)

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
        Public Shared Sub ClearSyncState()
            System.Web.HttpContext.Current.Session("GOOGLE_SYNC_PROCESSOR") = Nothing
        End Sub
    End Class

    Public Class GoogleDBHelper
        Public Shared Function GetDefaultCalendarID(GoogleAccountID As String) As String
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
            Dim res As New List(Of SharedEvent)
            Using agc As New AccountGoogleCalendarTableAdapters.vueAccountTasksForSyncTableAdapter()
                For Each itm As AccountGoogleCalendar.vueAccountTasksForSyncRow In agc.GetNewTasks(UserID)
                    Dim se As New SharedEvent
                    se.Name = itm.TaskName
                    se.Description = itm.TaskDescription
                    se.StartDate = itm.StartDate.ToUniversalTime
                    se.EndDate = itm.DeadlineDate.ToUniversalTime
                    se.LastUpdate = itm.ModifiedOn
                    se.MD5 = itm.MD5Hash
                    se.TaskId = itm.TaskId
                    se.GoogleEventId = itm.GoogleEventID
                    se.isDeleted = itm.isDeleted
                    se.isDBEvent = True
                    res.Add(se)
                Next
            End Using
            Return res
        End Function
        Public Shared Function GetAllTaskEvents(UserID As Integer) As List(Of SharedEvent)
            Dim res As New List(Of SharedEvent)
            Using agc As New AccountGoogleCalendarTableAdapters.vueAccountTasksForSyncTableAdapter()
                For Each itm As AccountGoogleCalendar.vueAccountTasksForSyncRow In agc.GetTasksForUser(UserID)
                    Dim se As New SharedEvent
                    se.Name = itm.TaskName
                    se.Description = itm.TaskDescription
                    se.StartDate = itm.StartDate.ToUniversalTime
                    se.EndDate = itm.DeadlineDate.ToUniversalTime
                    se.LastUpdate = itm.ModifiedOn
                    se.MD5 = itm.MD5Hash
                    se.TaskId = itm.TaskId
                    se.GoogleEventId = itm.GoogleEventID
                    se.isDeleted = itm.isDeleted
                    se.isDBEvent = True
                    res.Add(se)
                Next
            End Using
            Return res
        End Function
        Public Shared Sub UpdateGoogleEventID(EventItem As SharedEvent, GoogleEventID As String)
            Using agc As New AccountGoogleCalendarTableAdapters.AccountTaskSyncInfoTableAdapter

                agc.UpdateGoogleEventID(GoogleEventID, EventItem.GetActuallyMD5(), EventItem.TaskId)
            End Using
        End Sub
        Public Shared Sub CreateTask(TaskEvent As SharedEvent, UserId As Integer)
            Dim s As String = ""
            Using agc As New AccountGoogleCalendarTableAdapters.AccountProjectTaskTableAdapter
                Dim dpr As DefaultProjectObject = SettingsHelper.GetDefaultProject(UserId)
                Dim newid As Integer = agc.InsertTask(dpr.ProjectId, TaskEvent.Name, TaskEvent.Description, TaskEvent.EndDate, dpr.MilestoneId, Now, UserId, Now, UserId, 1, "111", TaskEvent.StartDate)
                TaskEvent.TaskId = newid
            End Using
        End Sub
        Public Shared Sub DeleteTask(TaskEvent As SharedEvent)

        End Sub
        Public Shared Sub UpdateTask(TaskEvent As SharedEvent)

        End Sub
        
    End Class

    Public Class GoogleSyncProcessor
        Public Property CurrentState As String
        Public Property CalendarId As String
        Public Property UserId As Integer
        Private token As String
        Public Sub Go()
            token = System.Web.HttpContext.Current.Session("ACCESS_TOKEN").ToString()
            Dim th As New System.Threading.Thread(New System.Threading.ParameterizedThreadStart(AddressOf InternalGo))
            th.IsBackground = True
            th.Start()
        End Sub
        Private Sub InternalGo(obj As Object)
            CurrentState = "Getting events from your google calendar"

            CurrentState = "Getting tasks"
            ' New event DB -> GC
            Dim NewDBEvents As List(Of SharedEvent) = GoogleDBHelper.GetTaskEvents(UserId)
            For Each se As SharedEvent In NewDBEvents
                Dim GoogleCalendarId As String = GoogleHelper.CreateEvent(se, CalendarId, token)
                GoogleDBHelper.UpdateGoogleEventID(se, GoogleCalendarId)
            Next
            ' New event DB -> GC
            Dim GCEvents As List(Of SharedEvent) = GoogleHelper.GetEvents(CalendarId, token)
            Dim AllDBEvents As List(Of SharedEvent) = GoogleDBHelper.GetTaskEvents(UserId)
            For Each se As SharedEvent In GCEvents
                Dim found As Boolean = False
                For Each dbse As SharedEvent In AllDBEvents
                    If dbse.GoogleEventId = se.GoogleEventId Then
                        found = True
                        Exit For
                    End If
                Next
                If Not found Then
                    GoogleDBHelper.CreateTask(se, UserId)
                End If
            Next
            'GoogleHelper.ClearSyncState()
            Dim s As String
        End Sub
    End Class
End Namespace