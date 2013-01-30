Imports Microsoft.VisualBasic
Namespace TimeLive.Utilities
    Public Class SettingsHelper
        Public Shared ReadOnly Property ClientID As String
            Get
                Return System.Web.Configuration.WebConfigurationManager.AppSettings("GoogleApiClientId")
            End Get
        End Property
        Public Shared ReadOnly Property ClientSecret As String
            Get
                Return System.Web.Configuration.WebConfigurationManager.AppSettings("GoogleApiClientSecret")
            End Get
        End Property
        Public Shared ReadOnly Property ClientCallbackUrl As String
            Get
                Return System.Web.Configuration.WebConfigurationManager.AppSettings("GoogleApiCallabckUrl")
            End Get
        End Property
        Public Shared Function GetDefaultProject(UserId As Integer) As DefaultProjectObject
            Dim res As New DefaultProjectObject
            res.ProjectId = 1
            res.MilestoneId = 1
            Return res
        End Function
        Public Shared Sub SetDefaultProject(info As DefaultProjectObject)

        End Sub
    End Class

    Public Class DefaultProjectObject
        Public Property UserId As Integer
        Public Property ProjectId As Integer
        Public Property MilestoneId As Integer
    End Class
End Namespace
