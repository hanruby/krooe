Imports Google.GData.Client
Imports Google.GData.Calendar

Partial Class MasterPageEmployee
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        
        Dim SCOPE As String = "https://www.google.com/calendar/feeds/"


        Dim parameters As New OAuth2Parameters()

        parameters.ClientId = TimeLive.Utilities.SettingsHelper.ClientID
        parameters.ClientSecret = TimeLive.Utilities.SettingsHelper.ClientSecret
        parameters.Scope = SCOPE
        parameters.RedirectUri = TimeLive.Utilities.SettingsHelper.ClientCallbackUrl


        Dim authorizationUrl As String = OAuthUtil.CreateOAuth2AuthorizationUrl(parameters)
        GotoAuthSubLink.NavigateUrl = authorizationUrl

    End Sub
End Class

