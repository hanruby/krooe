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
            res.GoogleEventId = id
            res.isGoogleCalendarEvent = True
            res.Name = summary
            res.Description = description
            If Not (String.IsNullOrEmpty(start.dateTime)) Then
                res.StartDate = DateTime.Parse(start.dateTime)
                If (res.StartDate = DateTime.MinValue) Then
                    If Not (String.IsNullOrEmpty(start.dateOnly)) Then res.StartDate = DateTime.Parse(start.dateOnly)
                End If
            Else
                If Not (String.IsNullOrEmpty(start.dateOnly)) Then res.StartDate = DateTime.Parse(start.dateOnly)
            End If

            If Not (String.IsNullOrEmpty(endTime.dateTime)) Then
                res.EndDate = DateTime.Parse(endTime.dateTime)
                If Not (String.IsNullOrEmpty(endTime.dateOnly)) Then res.EndDate = DateTime.Parse(endTime.dateOnly)

            Else
                If Not (String.IsNullOrEmpty(endTime.dateOnly)) Then res.EndDate = DateTime.Parse(endTime.dateOnly)
            End If
            res.LastUpdate = DateTime.Parse(updated)
            res.MD5 = res.GetActuallyMD5()
            Return res
        End Function
    End Class
    Public Class ShortEventObject
        Public Property summary As String
        Public Property location As String
        Public Property description As String
        <Newtonsoft.Json.JsonProperty("start")> _
        Public Property start As DateItem2
        <Newtonsoft.Json.JsonProperty("end")> _
        Public Property endField As DateItem2

    End Class
End Namespace
