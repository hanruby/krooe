<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlAccountEmployeeTimeEntryWeekSummary, App_Web_uitpp31g" %>
<x:GridView ID="G" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    Caption="<%$ Resources:TimeLive.Web, My Open Timesheet Periods%> " CssClass="xgridview" DataKeyNames="AccountEmployeeTimeEntryPeriodId"
    DataSourceID="dsWeekSummary" SkinID="xgridviewSkinEmployee" Width="99%">
    <Columns>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Period%> ">
            <itemstyle horizontalalign="Center" verticalalign="Middle" width="150px" />
            <itemtemplate>
<asp:Label id="lblPSD" runat="server" __designer:wfdid="w3"></asp:Label><BR /><asp:Label id="lblPED" runat="server" __designer:wfdid="w2"></asp:Label> 
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Duration%> ">
            <itemstyle horizontalalign="Center" verticalalign="Middle" width="100px" />
            <itemtemplate>
<asp:Label id="lblTotalDuration" runat="server" __designer:wfdid="w1"></asp:Label> 
</itemtemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="TotalHours" HeaderText="<%$ Resources:TimeLive.Web, Hours%> " ReadOnly="True">
            <itemstyle horizontalalign="Center" verticalalign="Middle" width="75px" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Status%> ">
            <itemstyle horizontalalign="Center" verticalalign="Middle" width="125px" />
            <itemtemplate>
<asp:Label id="lblTimesheetStatus" runat="server" __designer:wfdid="w3"></asp:Label>
</itemtemplate>
        </asp:TemplateField>
    </Columns>
</x:GridView>
<asp:ObjectDataSource ID="dsWeekSummary" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountEmployeeTimeEntryPeriodList" TypeName="AccountEmployeeTimeEntryBLL">
    <SelectParameters>
        <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:Parameter DefaultValue="1/1/2010" Name="PeriodStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="1/7/2010" Name="PeriodEndDate" Type="DateTime" />
        <asp:Parameter DefaultValue="False" Name="IncludeDateRange" Type="Boolean" />
        <asp:Parameter DefaultValue="1" Name="TimesheetApprovalStatusId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
