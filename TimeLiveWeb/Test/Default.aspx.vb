Imports DotNetOpenAuth.OAuth2
Imports DotNetOpenAuth.Messaging
Imports Google.GData.Client



Partial Class Test_Default
    Inherits System.Web.UI.Page

    Private _state As IAuthorizationState
    Protected Overrides Sub OnInit(e As System.EventArgs)
        MyBase.OnInit(e)
        GotoAuthSubLink.Text = "Login to your Google Account"

        GotoAuthSubLink.NavigateUrl = AuthSubUtil.getRequestUrl("http://greenrssreader.com/oauth2callback/default.aspx",
                                                              "https://www.google.com/calendar/feeds/",
                                                              False,
                                                              True)
    End Sub

    'Protected Sub btLogin_Click(sender As Object, e As System.EventArgs) Handles btLogin.Click
    '    'Dim _auth As OAuth2Authenticator(Of DotNetOpenAuth.OAuth2.WebServerClient)
    '    '_auth = CreateAuthenticator()

    '    '_auth.LoadAccessToken()


    'End Sub

    'Private Function CreateAuthenticator() As OAuth2Authenticator(Of DotNetOpenAuth.OAuth2.WebServerClient)
    '    Dim provider As DotNetOpenAuth.OAuth2.WebServerClient = New DotNetOpenAuth.OAuth2.WebServerClient(GoogleAuthenticationServer.Description)
    '    provider.ClientIdentifier = ClientCredentials.ClientID
    '    provider.ClientSecret = ClientCredentials.ClientSecret
    '    Dim authenticator As OAuth2Authenticator(Of DotNetOpenAuth.OAuth2.WebServerClient)
    '    authenticator = New OAuth2Authenticator(Of DotNetOpenAuth.OAuth2.WebServerClient)(provider, System.Func(Of GetAuthorization))
    '    authenticator.NoCaching = True
    '    Return authenticator
    'End Function
    'Private ReadOnly Property AuthState As IAuthorizationState
    '    Get
    '        If _state Is Nothing Then
    '            _state = CType(HttpContext.Current.Session("AUTH_STATE"), IAuthorizationState)
    '        End If
    '        Return _state
    '    End Get

    'End Property
    'Private Function GetAuthorization(client As DotNetOpenAuth.OAuth2.WebServerClient) As DotNetOpenAuth.OAuth2.IAuthorizationState
    '    Dim state As IAuthorizationState = AuthState
    '    If state IsNot Nothing Then
    '        Return state
    '    End If
    '    state = client.ProcessUserAuthorization(New HttpRequestInfo(HttpContext.Current.Request))
    '    If (state IsNot Nothing) And (Not (String.IsNullOrEmpty(state.AccessToken)) Or Not (String.IsNullOrEmpty(state.RefreshToken))) Then
    '        HttpContext.Current.Session("AUTH_STATE") = state
    '        _state = state

    '        Return state
    '    End If


    '    Dim scope As String = Google.Apis.Tasks.v1.TasksService.Scopes.Tasks.ToString()

    '    '    dim response As OutgoingWebResponse  = client.PrepareRequestUserAuthorization(
    '    'Response.Send()
    '    Return Nothing
    'End Function






End Class
Public Class ClientCredentials
    Public Shared ClientID As String
    Public Shared ClientSecret As String
End Class
