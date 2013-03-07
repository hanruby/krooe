<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlAccountEmployeeTimeEntryWeekViewReadOnly, App_Web_uitpp31g" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="LiveTools" Namespace="LiveTools" TagPrefix="cc1" %>
<br />
<table cellpadding="0" cellspacing="0" class="xFormView">
    <tr>
        <td rowspan="1" valign="middle" class="HighlightedTextMedium" align="left">
            <asp:Label ID="Label6" runat="server" CssClass="xrlabel" Text="<%$ Resources:TimeLive.Web, Employee Name: %>"></asp:Label>
            &nbsp;
            <asp:Label
                ID="lblEmployeeName" runat="server" CssClass="xrlabel" Text="Label"></asp:Label></td>
        <td align="right" class="HighlightedTextMedium" rowspan="1" valign="middle">
            <asp:Label ID="Label7" runat="server" CssClass="xrlabel" Text="Period Date:"></asp:Label>&nbsp;
            <asp:Label ID="lblStartDate" runat="server" Text="Label"></asp:Label>
            -
            <asp:Label ID="lblEndDate" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td align="center" colspan="2" rowspan="1" valign="middle">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/clearpixel.gif" /></td>
    </tr>
    <tr>
        <td align="center" colspan="2" rowspan="3" valign="middle">


<x:GridView ID="WG" runat="server" AutoGenerateColumns="False"
    Caption='<%# ResourceHelper.GetFromResource("Time Entry Week View") %>' 
    DataKeyNames="AccountEmployeeTimeEntryId0,AccountEmployeeTimeEntryId1,AccountEmployeeTimeEntryId2,AccountEmployeeTimeEntryId3,AccountEmployeeTimeEntryId4,AccountEmployeeTimeEntryId5,AccountEmployeeTimeEntryId6,TotalTime0,TotalTime1,TotalTime2,TotalTime3,TotalTime4,TotalTime5,TotalTime6"
    DataSourceID="dsAccountEmployeeTimeEntriesWeek" EnableInsert="True" EnableViewState="False"
    HeaderStyle-Height="25px" InsertRowCount="1" SaveButtonID="" ShowFooter="True"
    SkinID="xgridviewSkinEmployee" cssclass="xGridView" PageSize="500">
    <Columns>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Client Name %>">
    <headertemplate>
<asp:Label id="lblClientName" Text='<%# ResourceHelper.GetFromResource("Client Name") %>' runat="server" __designer:wfdid="w13"></asp:Label> 
</headertemplate>
<itemtemplate>
<asp:Label id="Label12343" Text='<%# Bind("PartyName") %>' runat="server" Font-Bold="True" __designer:wfdid="w1"></asp:Label> 
</itemtemplate>

<itemstyle horizontalalign="Left" verticalalign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Project %>">
    <headertemplate>
<asp:Label id="lblProjectName" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' runat="server" __designer:wfdid="w15"></asp:Label> 
</headertemplate>
<itemtemplate>
<asp:Label id="Label1" Text='<%# IIF(Eval("IsTimeOff")="False",Eval("ProjectName"),IIF(IsDBNULL(Eval("ProjectName")),"Time Off","Time Off/") & Eval("ProjectName")) %>' runat="server" Font-Bold="True" __designer:wfdid="w122"></asp:Label> 
</itemtemplate>

<itemstyle horizontalalign="Left" verticalalign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Task %>">
    <footertemplate>
<asp:Label id="Label3" Text="<%$ Resources:TimeLive.Web, Total %>" runat="server" Font-Bold="True" __designer:wfdid="w18"></asp:Label> 
</footertemplate>
    <headertemplate>
<asp:Label id="lblTaskName" Text='<%# ResourceHelper.GetFromResource("Task Name") %>' runat="server" __designer:wfdid="w17"></asp:Label> 
</headertemplate>
    <itemtemplate>
<asp:Label id="Label2" Text='<%# IIF(Eval("IsTimeOff")="False",Eval("TaskName"),Eval("AccountTimeOffType")) %>' runat="server" Font-Bold="True" __designer:wfdid="w3"></asp:Label> 
</itemtemplate>

<itemstyle horizontalalign="Left" verticalalign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Cost Center %>">
    <headertemplate>
<asp:Label id="lblCostCenter" Text='<%# ResourceHelper.GetFromResource("Cost Center") %>' runat="server" __designer:wfdid="w9"></asp:Label> 
</headertemplate>
<ItemTemplate>
<asp:Label id="Label4" Text='<%# Bind("AccountCostCenter") %>' runat="server" Font-Bold="True" __designer:wfdid="w6"></asp:Label> 
</ItemTemplate>

<itemstyle horizontalalign="Left" verticalalign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Work Type %>">
    <headertemplate>
<asp:Label id="lblWorkType" Text='<%# ResourceHelper.GetFromResource("Work Type") %>' runat="server" __designer:wfdid="w11"></asp:Label> 
</headertemplate>
<ItemTemplate>
<asp:Label id="Label5" Text='<%# Bind("AccountWorkType") %>' runat="server" Font-Bold="True" __designer:wfdid="w8"></asp:Label> 
</ItemTemplate>

<itemstyle horizontalalign="Left" verticalalign="Middle" />
</asp:TemplateField>
        <asp:TemplateField>
            <itemtemplate>
<asp:Label id="lblST" Text="Start:" runat="server" Font-Bold="True" __designer:wfdid="w1" Visible="False"></asp:Label> <asp:Label id="lblET" Text="End:" runat="server" Font-Bold="True" __designer:wfdid="w1" Visible="False"></asp:Label> <asp:Label id="lblTT" Text="Total:" runat="server" Font-Bold="True" __designer:wfdid="w6"></asp:Label>
</itemtemplate>
        </asp:TemplateField>
</Columns>
    <HeaderStyle Height="25px" />
</x:GridView>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
    <tr>
        <td align="left" class="HighlightedTextMedium" colspan="2" rowspan="1" valign="middle">
            <asp:Label ID="lblTimesheetPrintFooterTotalDuration" runat="server" Text="Total Duration:"></asp:Label>
            <asp:Label ID="lblTimesheetPrintFooterTotalDurationValue" runat="server"></asp:Label></td>
    </tr>
    <%If Request.QueryString("IsPrint") = "True" Then%>
    <tr>
        <td align="left" class="HighlightedTextMedium" colspan="2" rowspan="1" valign="middle">
            <asp:Label ID="lblTimesheetPrintFooterTotalHours" runat="server" Text="Total Hours:"></asp:Label>
            <asp:Label ID="lblTimesheetPrintFooterTotalHoursValue" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="2" rowspan="1" align="center">
            </td>
    </tr>
    <%End If%>
</table>
<asp:ObjectDataSource ID="dsAccountEmployeeTimeEntriesWeek" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAllAccountEmployeeTimeEntriesByDateWeekViewReadOnly" TypeName="AccountEmployeeTimeEntryBLL"><SelectParameters>
        <asp:QueryStringParameter DefaultValue="956" Name="AccountEmployeeId" QueryStringField="AccountEmployeeId"
            Type="Int32" />
        <asp:Parameter DefaultValue="7/21/2009" Name="TimeEntryStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="7/27/2009" Name="TimeEntryEndDate" Type="DateTime" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsAccountEmployeeTimeEntriesWeekForRelevantProject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountEmployeeTimeEntriesByDateWeekViewReadOnly" TypeName="AccountEmployeeTimeEntryBLL">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="956" Name="AccountEmployeeId" QueryStringField="AccountEmployeeId"
            Type="Int32" />
        <asp:Parameter DefaultValue="7/21/2009" Name="TimeEntryStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="7/27/2009" Name="TimeEntryEndDate" Type="DateTime" />
        <asp:QueryStringParameter DefaultValue="" Name="Type" QueryStringField="Type" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>