Imports Microsoft.VisualBasic
Namespace TimeLive.Utilities.CalendarObjects

    Public Class SharedEvent
        Public Property TaskId As Integer
        Public Property GoogleEventId As String
        Public Property Name As String
        Dim _decs As String
        Public Property Description As String
            Get
                If String.IsNullOrEmpty(_decs) Then
                    Return ""
                Else
                    Return _decs
                End If
            End Get
            Set(value As String)
                _decs = value
            End Set
        End Property
        Public Property StartDate As DateTime
        Public Property EndDate As DateTime
        Public Property LastUpdate As DateTime
        Public Property isDeleted As Boolean
        Public Property isGoogleCalendarEvent As Boolean
        Public Property isDBEvent As Boolean
        Public Property MD5 As String
        Public Property location As String
        Public Function GetActuallyMD5() As String
            Return GetMD5(String.Format("{0}{1}{2}{3}", Name, Description, StartDate.ToUniversalTime().ToString("o"), EndDate.ToUniversalTime().ToString("o")))
        End Function
        Private Function GetMD5(data As String) As String
            Dim textBytes As Byte() = System.Text.Encoding.Default.GetBytes(data)
            Try
                Dim cryptHandler As New System.Security.Cryptography.MD5CryptoServiceProvider
                Dim hash As Byte() = cryptHandler.ComputeHash(textBytes)
                Dim ret As String = ""
                For Each a As Byte In hash
                    If (a < 16) Then
                        ret &= "0" + a.ToString("x")
                    Else
                        ret &= a.ToString("x")
                    End If
                Next
                Return ret
            Catch ex As Exception
                Throw
            End Try

        End Function

        Public Function GetShortEvent() As ShortEventObject
            Dim res As New ShortEventObject
            res.summary = Name
            res.description = Description
            res.location = "Krooe"
            If (EndDate < StartDate) Then EndDate = StartDate.AddHours(1)
            res.start = New DateItem2(StartDate)
            res.endField = New DateItem2(EndDate)
            Return res
        End Function

    End Class
End Namespace