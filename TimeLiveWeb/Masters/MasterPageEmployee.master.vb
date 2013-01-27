Imports Google.GData.Client
Imports Google.GData.Calendar

Partial Class MasterPageEmployee
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Dim service As New CalendarService("KrooeTestApp")
        'GotoAuthSubLink.NavigateUrl = AuthSubUtil.getRequestUrl("http://greenrssreader.com/oauth2callback/default.aspx",
        '                                                   "https://www.google.com/calendar/feeds/",
        '                                                   False,
        '                                                   True)

        Dim CONSUMER_KEY As String = "755260777773.apps.googleusercontent.com"
        Dim CONSUMER_SECRET As String = "u0jqn7WLyd3zWQzQ2VQKB7BN"
        Dim SCOPE As String = "https://www.google.com/calendar/feeds/"


        Dim parameters As New OAuth2Parameters()

        parameters.ClientId = CONSUMER_KEY
        parameters.ClientSecret = CONSUMER_SECRET
        parameters.Scope = SCOPE
        parameters.RedirectUri = "http://greenrssreader.com/oauth2callback/default.aspx"


        Dim authorizationUrl As String = OAuthUtil.CreateOAuth2AuthorizationUrl(parameters)
        GotoAuthSubLink.NavigateUrl = authorizationUrl

    End Sub
End Class

