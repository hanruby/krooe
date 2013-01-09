Imports Microsoft.VisualBasic

Public Class SystemUtilitiesBLL

    Public Shared Function GetStringFromTextFile(ByVal FileName As String) As String
        Dim FileText As String

        FileText = System.IO.File.ReadAllText(FileName)

        Return FileText
    End Function
    Public Shared Function GetApplicationVersion() As Version
        Dim FileName As String
        FileName = System.Web.Hosting.HostingEnvironment.MapPath("~/Version.txt")
        Dim VersionText As String = GetStringFromTextFile(FileName)

        If VersionText <> "" Then
            Return New Version(VersionText)
        Else
            Return Nothing
        End If

    End Function
End Class
