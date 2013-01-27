Imports Microsoft.VisualBasic
Namespace TimeLive.Utilities.CalendarObjects
    Public Class EventsAnswer
        Public Property kind As String
        Public Property etag As String
        Public Property summary As String
        Public Property updated As String
        Public Property timeZone As String
        Public Property accessRole As String
        Public Property defaultReminders As Reminder()
        Public Property items As EventObject()
    End Class
End Namespace
