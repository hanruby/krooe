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
        Public Shared Function UpdateEvent(TaskEvent As SharedEvent, CalendarId As String, token As String) As String
            DeleteEvent(TaskEvent, CalendarId, token)
            Return CreateEvent(TaskEvent, CalendarId, token)
        End Function
        Public Shared Sub DeleteEvent(TaskEvent As SharedEvent, CalendarId As String, token As String)
            Dim baseURL As String = "https://www.googleapis.com/calendar/v3"

            Dim url As String = baseURL & "/calendars/" & Uri.EscapeDataString(CalendarId) & "/events/" & TaskEvent.GoogleEventId & "?pp=1&key=" + TimeLive.Utilities.SettingsHelper.ClientID
            Dim rq As HttpWebRequest = HttpWebRequest.Create(url)
            rq.Headers.Add("Authorization", "OAuth " + token)
            rq.Headers.Add("Accept-Charset", "utf-8")
            rq.KeepAlive = True
            rq.ContentType = "application/json"
            rq.Method = "DELETE"
            Dim rs As HttpWebResponse = rq.GetResponse()
            Dim sr As New StreamReader(rs.GetResponseStream())
            Dim cont As String = sr.ReadToEnd
            Dim ans As ActionAnswer
            ans = Newtonsoft.Json.JsonConvert.DeserializeAnonymousType(Of ActionAnswer)(cont, ans)
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
        Public Shared Function GetDefaultCalendarID(UserID As Integer) As String
            Using agc As New AccountGoogleCalendarTableAdapters.AccountGoogleCalendarTableAdapter()
                Dim calendarID As String = agc.GetDefaultCalendarByUserID(UserID)
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
        Public Shared Function GetSyncedEvents(UserID As Integer) As List(Of SharedEvent)
            Dim res As New List(Of SharedEvent)
            Using agc As New AccountGoogleCalendarTableAdapters.vueAccountTasksForSyncTableAdapter()
                For Each itm As AccountGoogleCalendar.vueAccountTasksForSyncRow In agc.GetSyncedEvents(UserID)
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
        Public Shared Function GetDeletedTaskEvents(UserID As Integer) As List(Of SharedEvent)
            Dim res As New List(Of SharedEvent)
            Using agc As New AccountGoogleCalendarTableAdapters.AccountTaskSyncInfoTableAdapter()
                For Each itm As AccountGoogleCalendar.AccountTaskSyncInfoRow In agc.GetDeletedTasks()
                    Dim se As New SharedEvent

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
                Dim dpr As DefaultProjectObject = SettingsHelper.GetDefaultProject(UserId, TaskEvent.location)
                Dim newid As Integer
                agc.InsertTaskForSync(dpr.ProjectId, TaskEvent.Name, TaskEvent.Description, TaskEvent.EndDate, dpr.MilestoneId, Now, UserId, Now, UserId, 1, "", TaskEvent.StartDate, newid)
                TaskEvent.TaskId = newid
                agc.AssignToUser(UserId, newid)
                UpdateGoogleEventID(TaskEvent, TaskEvent.GoogleEventId)
            End Using
        End Sub
        Public Shared Sub DeleteTask(TaskEvent As SharedEvent)
            Using agc As New AccountGoogleCalendarTableAdapters.AccountProjectTaskTableAdapter
                agc.FullDeleteTask(TaskEvent.GoogleEventId)
            End Using
        End Sub
        Public Shared Sub UpdateTask(TaskEvent As SharedEvent)
            Using agc As New AccountGoogleCalendarTableAdapters.AccountProjectTaskTableAdapter
                agc.UpdateTask(TaskEvent.Name, TaskEvent.Description, TaskEvent.StartDate, TaskEvent.EndDate, TaskEvent.TaskId)
            End Using
        End Sub
        Public Shared Sub DeleteSyncInfo(TaskId As Integer)
            Using agc As New AccountGoogleCalendarTableAdapters.AccountTaskSyncInfoTableAdapter
                agc.DeleteSyncInfo(TaskId)
            End Using
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

            ' Delete from calendar events deleted from DB
            Dim DelEvents As List(Of SharedEvent) = GoogleDBHelper.GetDeletedTaskEvents(UserId)
            Dim GCEvents As List(Of SharedEvent) = GoogleHelper.GetEvents(CalendarId, token)
            For Each se As SharedEvent In GCEvents
                Dim found As Boolean = False
                Dim ti As Integer = 0
                For Each dbse As SharedEvent In DelEvents
                    If dbse.GoogleEventId = se.GoogleEventId And dbse.isDeleted Then
                        found = True
                        ti = dbse.TaskId
                        Exit For
                    End If
                Next
                If found Then
                    GoogleHelper.DeleteEvent(se, CalendarId, token)
                    GoogleDBHelper.DeleteSyncInfo(ti)
                End If
            Next

            'Delete from DB event deleted from calendar
            Dim SyncedDBEvents As List(Of SharedEvent) = GoogleDBHelper.GetSyncedEvents(UserId)
            For Each dbse As SharedEvent In SyncedDBEvents
                Dim found As Boolean = False
                For Each se In GCEvents
                    If (se.GoogleEventId = dbse.GoogleEventId) Then found = True
                Next
                If Not (found) Then
                    GoogleDBHelper.DeleteTask(dbse)
                End If
            Next

            GCEvents = GoogleHelper.GetEvents(CalendarId, token)
            SyncedDBEvents = GoogleDBHelper.GetSyncedEvents(UserId)
            ' Update events changed events
            For Each dbse As SharedEvent In SyncedDBEvents
                Dim CalSE As SharedEvent = Nothing
                For Each se In GCEvents
                    If (se.GoogleEventId = dbse.GoogleEventId) Then CalSE = se
                Next
                If Not (CalSE Is Nothing) Then
                    If dbse.GetActuallyMD5() <> CalSE.GetActuallyMD5() Then
                        If (dbse.LastUpdate > CalSE.LastUpdate) Then
                            'update event in calendar
                            Dim ncid As String = GoogleHelper.UpdateEvent(dbse, CalendarId, token)
                            GoogleDBHelper.UpdateGoogleEventID(dbse, ncid)
                        Else
                            'update event in datatbase
                            CalSE.TaskId = dbse.TaskId
                            GoogleDBHelper.UpdateTask(CalSE)
                        End If

                    End If
                End If
            Next

            GCEvents = GoogleHelper.GetEvents(CalendarId, token)

            ' New event DB -> GC
            Dim NewDBEvents As List(Of SharedEvent) = GoogleDBHelper.GetTaskEvents(UserId)
            For Each se As SharedEvent In NewDBEvents
                Dim GoogleCalendarId As String = GoogleHelper.CreateEvent(se, CalendarId, token)
                GoogleDBHelper.UpdateGoogleEventID(se, GoogleCalendarId)
            Next
            ' New event GC -> DB

            Dim AllDBEvents As List(Of SharedEvent) = GoogleDBHelper.GetAllTaskEvents(UserId)
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



            Dim s As String
        End Sub
    End Class
End Namespace