<%@ page language="VB" autoeventwireup="false" inherits="Employee_TimerControl, App_Web_v0exk3tf" title="TimeLive - Timer Control" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Src="Controls/ctlTimerControl.ascx" TagName="ctlTimerControl"
    TagPrefix="uc1" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
    
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<link href="../Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager runat="server" ID="ScriptManager2" >
    </asp:ScriptManager>
        <uc1:ctlTimerControl ID="CtlTimerControl2" runat="server" />
           </div>
    </form>
</body>
</html>