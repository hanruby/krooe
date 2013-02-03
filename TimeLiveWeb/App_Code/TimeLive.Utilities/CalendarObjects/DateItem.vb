Imports Microsoft.VisualBasic
Namespace TimeLive.Utilities.CalendarObjects
    Public Class DateItem
        Private _dt As DateTime
        <Newtonsoft.Json.JsonProperty("dateTime")> _
        Public Property dateTime As String
            Get
                Return _dt.ToString("o")
            End Get
            Set(value As String)
                System.DateTime.TryParse(value, _dt)
            End Set
        End Property
        <Newtonsoft.Json.JsonProperty("date")> _
        Public Property dateOnly As String
        Public Sub New(inputDate As DateTime)
            _dt = inputDate
        End Sub
        Public Function GetDateTIme() As DateTime
            Return _dt
        End Function
    End Class
    Public Class DateItem2
        Private _dt As DateTime
        <Newtonsoft.Json.JsonProperty("dateTime")> _
        Public Property dateTime As String
            Get
                Return _dt.ToString("o")
            End Get
            Set(value As String)
                System.DateTime.TryParse(value, _dt)
            End Set
        End Property
        Public Sub New(inputDate As DateTime)
            _dt = inputDate
        End Sub
        Public Function GetDateTIme() As DateTime
            Return _dt
        End Function
    End Class
End Namespace