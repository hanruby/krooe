<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Test_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <%--     <asp:Button runat="server" ID="btLogin" Text="Login via Google" />--%>
        <a href="https://accounts.google.com/o/oauth2/auth?redirect_uri=http%3A%2F%2Fgreenrssreader.com%2Foauth2callback&response_type=code&client_id=755260777773.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar" title="Войти через Google">Войти через Google</a>
    
    <br />
    <asp:HyperLink ID="GotoAuthSubLink" runat="server"/>
    </div>
    </form>
</body>
</html>
