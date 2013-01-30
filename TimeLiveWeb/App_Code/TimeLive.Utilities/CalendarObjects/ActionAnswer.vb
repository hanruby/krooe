Imports Microsoft.VisualBasic
Namespace TimeLive.Utilities.CalendarObjects
    Public Class ActionAnswer
        Public Property id As String
        Public Property etag As String
        Public Property created As String
        Public Property updated As String
        Public Property summary As String
        Public Property description As String
        Public Property location As String
        <Newtonsoft.Json.JsonProperty("start")> _
        Public Property startDate As DateItem
        <Newtonsoft.Json.JsonProperty("end")> _
        Public Property endDate As DateItem
        Public Property iCalUID As String
        Public Property creator As Person
        Public Property organizer As Person
    End Class
End Namespace