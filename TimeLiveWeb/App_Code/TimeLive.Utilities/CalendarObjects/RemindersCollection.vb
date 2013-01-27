Imports Microsoft.VisualBasic
Namespace TimeLive.Utilities.CalendarObjects
    Public Class RemindersCollection
        Public Property useDefault As Boolean
        Public Property reminders As Reminder()
    End Class
    Public Class Reminder
        Public Property method As String
        Public Property minutes As Integer
    End Class
End Namespace

