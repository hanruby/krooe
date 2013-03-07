<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_Default, App_Web_v0exk3tf" theme="SkinFile" title="TimeLive - Home" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlOtherRecent.ascx" TagName="ctlOtherRecent" TagPrefix="uc4" %>

<%@ Register Src="Controls/ctlAccountEmployeeTimeEntryWeekSummary.ascx" TagName="ctlAccountEmployeeTimeEntryWeekSummary"
    TagPrefix="uc3" %>

<%@ Register Src="Controls/ctlMyReportedTasksShort.ascx" TagName="ctlMyReportedTasksShort"
    TagPrefix="uc2" %>

<%@ Register Src="Controls/ctlMyTasksShort.ascx" TagName="ctlMyTasksShort" TagPrefix="uc1" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <table class="lighttable" border=0 cellspacing=0 cellpadding=5 width="100%">
        <tr>
            <td style="width: 25%;" valign="top" class="lighttable">
                <uc3:ctlAccountEmployeeTimeEntryWeekSummary ID="WS"
                    runat="server" />
                <br />
              
                <uc4:ctlOtherRecent ID="Or" runat="server" />
            </td>
            <td style="width: 75%;" valign="top" class="lighttable">
                <uc1:ctlMyTasksShort ID="TS" runat="server" /><br />
                <uc2:ctlMyReportedTasksShort ID="MT" runat="server" />

            </td>
        </tr>
        <tr>
            <td style="width: 25%; " valign="top" class="lighttable">
            </td>
            <td style="width: 75%;" class="lighttable" valign="top">
            </td>
        </tr>

    </table>
</asp:Content>

