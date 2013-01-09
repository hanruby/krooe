<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountEmployeeTimeEntryPeriodList.ascx.vb" Inherits="Employee_Controls_ctlAccountEmployeeTimeEntryPeriodList" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <table class="xFormView" width="50%">
            <tr>
                <td class="caption" colspan="2">
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Timesheet Period List%>"></asp:Literal></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Search Parameter%> "></asp:Literal></td>
            </tr>
            <tr>
                <td align="right" class="HighlightedTextMedium" style="width: 35%">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Name:%> "></asp:Literal></td>
                <td style="width: 65%">
                    <asp:DropDownList ID="ddlEmployee" runat="server" Width="300px" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="HighlightedTextMedium" style="width: 35%">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Approval Status:%> "></asp:Literal></td>
                <td style="width: 65%">
                    <asp:DropDownList ID="ddlApprovalStatus" runat="server" Width="300px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="HighlightedTextMedium" style="width: 35%">
                    <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Include Date Range:%> "></asp:Literal></td>
                <td style="width: 65%">
                    <asp:CheckBox ID="chkIncludeDateRange" runat="server" /></td>
            </tr>
            <tr>
                <td align="right" class="HighlightedTextMedium" style="width: 35%">
                    <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Start Date:%> "></asp:Literal></td>
                <td style="width: 65%">
                    <ew:calendarpopup id="StartDateTextBox" runat="server" width="100px"></ew:calendarpopup>
                </td>
            </tr>
            <tr>
                <td align="right" class="HighlightedTextMedium" style="width: 35%">
                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, End Date:%> "></asp:Literal></td>
                <td style="width: 65%">
                    <ew:calendarpopup id="EndDateTextBox" runat="server" width="100px">
        </ew:calendarpopup>
                    </td>
            </tr>
            <tr>
                <td align="right" class="HighlightedTextMedium" style="width: 35%">
                </td>
                <td style="width: 65%">
                    <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="<%$ Resources:TimeLive.Web, Show_text%> " /></td>
            </tr>
            <tr>
                <td align="right" class="HighlightedTextMedium" style="width: 35%">
                </td>
                <td align="right" style="width: 65%">
                    <asp:Button ID="btnAddTimesheet" runat="server" OnClick="btnAddTimesheet_Click" Text="Add Timesheet" /></td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" SkinID="xgridviewSkinEmployee" AutoGenerateColumns="False" DataKeyNames="AccountEmployeeTimeEntryPeriodId"
            DataSourceID="dsAccountEmployeeTimeEntryPeriodListObject" CssClass="xgridview" Width="835px" AllowPaging="True" Caption="<%$ Resources:TimeLive.Web, Timesheet Period List%> "><Columns>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Period %>">
<ItemStyle Width="150px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
<ItemTemplate>
<asp:Label id="lblPSD" runat="server" __designer:wfdid="w8"></asp:Label>&nbsp;- <asp:Label id="lblPED" runat="server" __designer:wfdid="w8"></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="TimeEntryViewType" HeaderText="<%$ Resources:TimeLive.Web, Period Type %>">
<ItemStyle Width="125px" VerticalAlign="Middle"></ItemStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Total Duration %>">
<ItemStyle Width="100px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
<ItemTemplate>
<asp:Label id="lblTotalDuration" runat="server" __designer:wfdid="w1"></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField ReadOnly="True" DataField="TotalHours" HeaderText="<%$ Resources:TimeLive.Web, Total Hours %>">
<ItemStyle Width="75px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Timesheet Status %>">
<ItemStyle Width="125px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
<ItemTemplate>
<asp:Label id="lblTimesheetStatus" runat="server" __designer:wfdid="w13"></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField HtmlEncode="False" DataFormatString="{0:d}" DataField="SubmittedDate" HeaderText="<%$ Resources:TimeLive.Web, Submitted On %>">
<ItemStyle Width="85px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:BoundField>
<asp:BoundField HtmlEncode="False" DataFormatString="{0:d}" DataField="ApprovedOn" HeaderText="<%$ Resources:TimeLive.Web, Approved On %>">
<ItemStyle Width="85px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:BoundField>
<asp:BoundField HtmlEncode="False" DataFormatString="{0:d}" DataField="RejectedOn" HeaderText="<%$ Resources:TimeLive.Web, Rejected On %>">
<ItemStyle Width="85px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="Open">
<ItemStyle Width="5px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
<ItemTemplate>
<asp:HyperLink id="lnkEdit" runat="server" __designer:wfdid="w7">Open</asp:HyperLink> 
</ItemTemplate>
</asp:TemplateField>
</Columns>
</x:GridView>
        <asp:ObjectDataSource ID="dsAccountEmployeeTimeEntryPeriodListObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountEmployeeTimeEntryPeriodList"
            TypeName="AccountEmployeeTimeEntryBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
                <asp:Parameter Name="PeriodStartDate" Type="DateTime" />
                <asp:Parameter Name="PeriodEndDate" Type="DateTime" />
                <asp:Parameter Name="IncludeDateRange" Type="Boolean" />
                <asp:Parameter Name="TimesheetApprovalStatusId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
