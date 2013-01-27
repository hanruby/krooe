Imports Microsoft.VisualBasic
Namespace TimeLive.Utilities.CalendarObjects
    Public Class EventObject
        Public Property kind As String
        Public Property etag As String
        Public Property id As String
        Public Property status As String
        Public Property htmlLink As String
        Public Property created As String
        Public Property updated As String
        Public Property summary As String
        Public Property description As String
        Public Property location As String
        Public Property creator As Person
        Public Property organizer As Person
        Public Property start As DateItem
        <Newtonsoft.Json.JsonProperty("end")> _
        Public Property endTime As DateItem

        Public Property iCalUID As String
        Public Property sequence As Integer
        Public Property reminders As RemindersCollection
        Public Function GetSharedEvent() As SharedEvent
            Dim res As New SharedEvent
            res.Name = summary
            res.Description = description
            '  res.MD5= 
            Return res
        End Function
    End Class
End Namespace
