<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlTimerControl, App_Web_scad42de" %>
<%@ Register Src="ctlStatusLegend.ascx" TagName="ctlStatusLegend" TagPrefix="uc2" %>
<%@ Reference Control ="~/Employee/Controls/ctlAccountEmployeeTimeEntryWeekView.ascx"%>
<%@ Reference Control ="~/Employee/Controls/ctlAccountEmployeeTimeEntryDayView.ascx"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24D65337282035F2"
    Namespace="eWorld.UI" TagPrefix="ew" %>

<%@ Register Assembly="LiveTools" Namespace="LiveTools" TagPrefix="cc1" %>
<asp:UpdatePanel ID="UP_Timer" runat="server" RenderMode="Inline"> 
<Triggers> 
<asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
</Triggers>
<ContentTemplate> 
<asp:Timer ID="Timer1" runat="server" Interval="800" ontick="Timer1_Tick" Enabled="False" />
<asp:HiddenField ID="hid_Ticker" runat="server" Value="0" />
        <table class="xFormView" style="width: 494px">
            <tr>
                <td align="left" class="caption" colspan="2">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Timer%> "></asp:Literal></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 114px">
                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, Date%> "></asp:Literal>
                    :</td>
                <td>
                    <ew:CalendarPopup ID="txtTimeEntryDate" runat="server" SkinID="DatePicker"
                        Width="111px" Culture="(Default)" OnDateChanged="txtTimeEntryDate_DateChanged1">
                    </ew:CalendarPopup>
                </td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 114px">
                    <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:TimeLive.Web, Client Name%> "></asp:Literal>
                    :</td>
                <td>
                    <asp:DropDownList ID="ddlAccountClientId" runat="server" AutoPostBack="True" DataSourceID="dsAccountClientObject"
                        DataTextField="PartyName" DataValueField="AccountPartyId" OnSelectedIndexChanged="ddlAccountClientId_SelectedIndexChanged"
                        Width="98%">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 114px">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Project%> "></asp:Literal>
                    :</td>
                <td>
                    <asp:DropDownList ID="ddlAccountProjectId" runat="server" AutoPostBack="True" DataSourceID="dsAccountProjectObject"
                        DataTextField="ProjectName" DataValueField="AccountProjectId" OnSelectedIndexChanged="ddlAccountProjectId_SelectedIndexChanged"
                        Width="98%">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 114px">
                    <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Project Tasks%> "></asp:Literal>
                    :</td>
                <td>
                    <asp:DropDownList ID="ddlAccountProjectTaskId" runat="server" DataSourceID="dsAccountProjectTasksObject"
                        DataTextField="TaskName" DataValueField="AccountProjectTaskId" Width="98%">
                    </asp:DropDownList>&nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 114px">
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Start Time%> "></asp:Literal>
                    :</td> 
                <td>
                    <asp:TextBox ID="txtStartTime" runat="server" Width="50px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 114px;">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, End Time%> "></asp:Literal>
                    :</td>
                <td>
                    <asp:TextBox ID="txtEndTime" runat="server" Width="50px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 114px">
                <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Total Time%> "></asp:Literal>
                    :</td>
                <td>
                    <asp:TextBox ID="txtTimesheetTotal" runat="server" Width="50px" ReadOnly="True"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" colspan="2">
                    <asp:Label ID="lblTimer" runat="server" Font-Bold="True" Font-Size="Medium" Text="00:00:00"
                        Width="177px"></asp:Label><br />
                    <asp:Button ID="btnStartTimer" runat="server" Text="<%$ Resources:TimeLive.Web, Start Timer%> " Width="90px" OnClientClick="startTimer()" /><asp:Button ID="btnPauseTimer" runat="server" Text="<%$ Resources:TimeLive.Web, Pause Timer%>" Width="90px" OnClick="btnPauseTimer_Click" Enabled="False" /><asp:Button
                        ID="btnEndTimer" runat="server" Text="<%$ Resources:TimeLive.Web, End Timer And Save%> " Width="125px" Enabled="False"/></td>
            </tr>
        </table>
    <asp:ObjectDataSource ID="dsAccountClientObject" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAccountPartiesForTimeEntryByAccountEmployeeId" TypeName="AccountPartyBLL">
        <SelectParameters>
            <asp:SessionParameter Name="AccountEmployeeId" SessionField="AccountEmployeeId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccountProjectObject" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAccountProjectsForTimer" TypeName="AccountProjectBLL">
        <SelectParameters>
            <asp:Parameter Name="AccountProjectId" Type="Int32" />
            <asp:SessionParameter Name="AccountEmployeeId" SessionField="AccountEmployeeId" Type="Int32" />
            <asp:ControlParameter ControlID="ddlAccountClientId" Name="AccountClientId" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccountProjectTasksObject" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAssignedProjectTasksFromvueAccountProjectTask" TypeName="AccountProjectTaskBLL">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlAccountProjectId" Name="AccountProjectId" PropertyName="SelectedValue"
                Type="Int32" />
            <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                Type="Int32" />
            <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="AccountId" SessionField="AccountId" Type="Int32" />
            <asp:Parameter Name="Completed" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;&nbsp;
</ContentTemplate>
</asp:UpdatePanel> 
