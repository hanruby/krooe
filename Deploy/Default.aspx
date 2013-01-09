<%@ page language="VB" autoeventwireup="false" inherits="_Default, App_Web_umknxtln" title="Welcome to Krooe" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Authenticate/Controls/ctlLoginWithAccountAdd.ascx" TagName="ctlLoginWithAccountAdd"
    TagPrefix="uc2" %>
<%@ Register Src="~/Authenticate/Controls/ctlLogin.ascx" TagName="ctlLogin" TagPrefix="uc1" %>
<%  If System.Configuration.ConfigurationManager.AppSettings("SHOW_LOGIN_WITH_ACCOUNT_PAGE") = "Yes" Then%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%End If %>
<html>
<head id="Head1" runat=server>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="OT.css" type="text/css"/>
</head>
<body leftmargin="0" topmargin="0" style="background:url(Images/StandIn.jpg) top right no-repeat; background-position:fixed; background-size: cover;
  -moz-background-size: cover;">
<form id="form1" runat="server">
<%  If System.Configuration.ConfigurationManager.AppSettings("SHOW_LOGIN_WITH_ACCOUNT_PAGE") <> "Yes" Then%>
    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 100%" align=center>
<uc1:ctlLogin ID="CtlLogin1" runat="server" EnableViewState="false" />
            </td>
        </tr>
    </table> 
    <%Else%>                
    <uc2:ctlLoginWithAccountAdd ID="CtlLoginWithAccountAdd1" runat="server" />
    <%End If%>                
</form>
</body>
</html>