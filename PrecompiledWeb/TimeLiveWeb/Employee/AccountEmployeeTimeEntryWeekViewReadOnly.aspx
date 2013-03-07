<%@ page language="VB" autoeventwireup="false" title="TimeLive - Time Entry Week View Read-only" inherits="Employee_AccountEmployeeTimeEntryWeekViewReadOnly, App_Web_v0exk3tf" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeTimeEntryWeekViewDescriptionReadOnly.ascx"
    TagName="ctlAccountEmployeeTimeEntryWeekViewDescriptionReadOnly" TagPrefix="uc2" %>

<%@ Register Src="Controls/ctlAccountEmployeeTimeEntryWeekViewReadOnly.ascx" TagName="ctlAccountEmployeeTimeEntryWeekViewReadOnly"
    TagPrefix="uc1" %>
<%@ Register Assembly="eWorld.UI"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="../Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="xFormView">
            <tr>
                <td align="left" >
                    &nbsp; &nbsp;
                    <asp:Image ID="imgCompanyLogo" runat="server" Height="50px" /></td>
            </tr>
        <%If Me.Request.QueryString("IsPrint") <> "True" Then%>
        <%  If LocaleUtilitiesBLL.ShowAllInTimesheetReadOnly = True Then %>
            <tr>
                <td align="left" >
                    &nbsp; &nbsp;
                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="<%$ Resources:TimeLive.Web, Show All%> " Font-Bold="True" /></td>
            </tr>
            <tr>
        <%End If %>
        <%End If %>
                <td align="center" >
        <uc1:ctlAccountEmployeeTimeEntryWeekViewReadOnly ID="CtlAccountEmployeeTimeEntryWeekViewReadOnly1"
            runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center" >
                    <br />
        <uc2:ctlAccountEmployeeTimeEntryWeekViewDescriptionReadOnly ID="CtlAccountEmployeeTimeEntryWeekViewDescriptionReadOnly1"
            runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <ew:calendarpopup id="txtTimeEntryDate" runat="server" SkinId="DatePicker" UpperBoundDate="2010-11-13" Width="104px" Visible="False"></ew:calendarpopup>
    </form>
</body>
</html>
