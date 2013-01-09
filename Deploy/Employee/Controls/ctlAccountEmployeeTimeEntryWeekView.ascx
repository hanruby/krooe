<%@ control autoeventwireup="false" clientidmode="Predictable" inherits="Employee_Controls_ctlAccountEmployeeTimeEntryWeekView, App_Web_k5jcht5i" language="VB" %>
<%@ Register Src="ctlStatusLegend.ascx" TagName="ctlStatusLegend" TagPrefix="uc1" %>
    <%@ Register Src="ctlAccountEmployeeTimeEntryApprovalDetailsReadOnly.ascx" TagName="ctlAccountEmployeeTimeEntryApprovalDetailsReadOnly"
    TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="LiveTools" Namespace="LiveTools" TagPrefix="cc1" %>

<script type="text/javascript">
    evt = ""; // Defeat the Chrome bug
</script> 
<table cellpadding="0" cellspacing="0" width="1%">
    <tr>
        <td align="right" rowspan="1" style="width: 100%; height: 170px;">
<table class="xFormView" width="100%">
    <tr>
        <td align="left" class="HighlightedTextMedium" colspan="4" valign="middle"><asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate><asp:Button ID="btnDayView" runat="server" Text="<%$ Resources:TimeLive.Web, Day View%>" Width="115px" /><asp:Button ID="btnMyPeriods" runat="server" Text="<%$ Resources:TimeLive.Web, Timesheet Periods%>" Width="115px" /><asp:Button ID="btnAudit" runat="server" Text="<%$ Resources:TimeLive.Web, Audit%>" Visible="False" Width="115px" /><asp:Button ID="btnTopSave" runat="server" Text="<%$ Resources:TimeLive.Web, Save_text%> " Width="115px" Enabled=true Visible="true" CssClass="DisabledButton" OnClientClick='<%# ResourceHelper.GetSaveMessageJavascript()%>' OnClick="Button1_Click1"/><asp:Button ID="btnTopSubmit" runat="server" Text="<%$ Resources:TimeLive.Web, Submit_text%> " Width="115px" Enabled=true Visible="true" CssClass="DisabledButton" ToolTip="Submit for Approval" OnClick="btnSubmit_Click"  /><asp:Button ID="btnTimerTimesheet" runat="server" CssClass="DisabledButton" OnClick="btnTimerTimesheet_Click" Text="<%$ Resources:TimeLive.Web, Start Timer%>" ToolTip="<%$ Resources:TimeLive.Web, Start Timer%>" Visible="true" Width="115px" />
                </ContentTemplate>
            </asp:UpdatePanel>
                         <asp:HyperLink ID="lnkTimesheetPeriodList" runat="server" Visible="False">[lnkTimesheetPeriodList]</asp:HyperLink><asp:HyperLink ID="lnkDayView" runat="server" Visible="False">[lnkDayView]</asp:HyperLink></td>
    </tr>
    <tr>
        <td align="right" class="HighlightedTextMedium" colspan="2" style="width: 20%" valign="middle">
            <asp:Label ID="EmployeeNameLabel" runat="server" Text="<%$ Resources:TimeLive.Web, Employees: %>"
                Width="150px"></asp:Label></td>
        <td align="left" class="HighlightedTextMedium" colspan="2" valign="middle">
            <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" Width="300px">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td align="right" class="HighlightedTextMedium" colspan="2" valign="middle" style="width: 20%">
            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:TimeLive.Web, Current Week: %>"
                Width="160px"></asp:Label>
        </td>
        <td align="left" class="HighlightedTextMedium" colspan="2" valign="middle">
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/right.gif" ToolTip="<%$ Resources:TimeLive.Web, Previous Week%> " /><asp:Label ID="lblCurrenctdate" runat="server" BackColor="#EFEFF1" Font-Bold="True"
                                                Font-Names="Tahoma" Font-Size="11px" Text="Label"></asp:Label><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/left.gif"
                             ToolTip="<%$ Resources:TimeLive.Web, Next Week%> " /></td>
    </tr>
    <tr>
        <td align="right" class="HighlightedTextMedium" colspan="2" valign="middle" style="width: 20%">
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:TimeLive.Web, Time Entry Date : %>"
                Width="110px"></asp:Label></td>
        <td align="left" class="HighlightedTextMedium" colspan="2" valign="middle">
        <ew:calendarpopup id="txtTimeEntryDate" runat="server"  SkinId="DatePicker" Width="75px" AutoPostBack="True" 
                            ></ew:calendarpopup>
            &nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td align="right" class="HighlightedTextMedium" colspan="2" valign="middle" style="width: 20%">
            <asp:Label ID="lblTSTotal" runat="server" Text="<%$ Resources:TimeLive.Web, Timesheet Total :%> " Width="110px"></asp:Label></td>
        <td align="left" class="HighlightedTextMedium" colspan="2" valign="middle">
            <asp:TextBox ID="txtTimesheetTotal" runat="server" Width="50px" ReadOnly="True"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="HighlightedTextMedium" colspan="2" align="right" valign="middle" style="width: 20%">
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:TimeLive.Web, Timesheet Status : %>" Width="110px"></asp:Label></td>
        <td align="left" class="HighlightedTextMedium" colspan="2" valign="middle">
            <asp:Image ID="imgTSL" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/clearpixel.gif"
                Width="10px" AlternateText="Timesheet Status" />
            &nbsp;
            <asp:Label ID="lblTimesheetStatus" runat="server" Text="Label" Width="100px"></asp:Label></td>
    </tr>
</table>
        </td>
    </tr>
    <tr>
        <td style="width: 100%" align="left">
<x:GridView ID="G" runat="server" AutoGenerateColumns="False"
    Caption="<%$ Resources:TimeLive.Web, Time Entry Week View %>"
    DataSourceID="dsAccountEmployeeTimeEntriesWeek" EnableInsert="True" EnableViewState="False"
    HeaderStyle-Height="25px" InsertRowCount="1" SaveButtonID="" ShowFooter="True"
    SkinID="xgridviewSkinTimesheet" Width="100%" cssclass="xGridView">
    <Columns>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Client %>">
            <headertemplate>
<asp:Label id="lblClient" Text='<%# ResourceHelper.GetFromResource("Client Name") %>' runat="server" __designer:wfdid="w5"></asp:Label> 
</headertemplate>
            <itemtemplate>
<asp:DropDownList id="C" Width="185px" runat="server" DataSourceID="dsAccountClientObject" DataValueField="AccountPartyId" DataTextField="PartyName" __designer:wfdid="w1"></asp:DropDownList><asp:Label id="lblTimeTypesClient" Text="<%$ Resources:TimeLive.Web, Time Off%>" runat="server" Visible="False" Font-Bold="True" __designer:wfdid="w2"></asp:Label><BR /><asp:ObjectDataSource id="dsAccountClientObject" runat="server" TypeName="AccountPartyBLL" SelectMethod="GetAccountPartiesForTimeEntryByAccountEmployeeId" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w3"><SelectParameters>
<asp:SessionParameter SessionField="AccountEmployeeID" Type="Int32" Name="AccountEmployeeId"></asp:SessionParameter>
</SelectParameters>
</asp:ObjectDataSource><asp:Image id="imgC" Width="10px" runat="server" ImageUrl="~/Images/clearpixel.gif" __designer:wfdid="w4" EnableTheming="True"></asp:Image> 
</itemtemplate>
            <itemstyle horizontalalign="Center" width="185px" verticalalign="Middle" wrap="True" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Project %>">
            <headertemplate>
<asp:Label id="lblProject" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' runat="server" __designer:wfdid="w33"></asp:Label> 
</headertemplate>
            <itemtemplate>
<asp:Label id="lblTimeTypes" Width="25%" Text="Label" runat="server" Visible="False" __designer:wfdid="w27"></asp:Label><asp:DropDownList id="P" runat="server" DataValueField="AccountProjectId" DataTextField="ProjectName" __designer:wfdid="w28"></asp:DropDownList><BR />
                <asp:ObjectDataSource id="dsAccountProjectsObject" runat="server" 
                    DeleteMethod="DeleteAccountProject" TypeName="AccountProjectBLL" 
                    SelectMethod="GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient" 
                    OldValuesParameterFormatString="original_{0}" __designer:wfdid="w29" 
                    InsertMethod="AddAccountProject" UpdateMethod="UpdateProjectDescription"><DeleteParameters>
<asp:Parameter Name="Original_AccountProjectId" Type="Int32"></asp:Parameter>
</DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:Parameter Name="AccountProjectTypeId" Type="Int32" />
                        <asp:Parameter Name="AccountClientId" Type="Int32" />
                        <asp:Parameter Name="AccountPartyContactId" Type="Int32" />
                        <asp:Parameter Name="AccountPartyDepartmentId" Type="Int32" />
                        <asp:Parameter Name="ProjectBillingTypeId" Type="Int32" />
                        <asp:Parameter Name="ProjectName" Type="String" />
                        <asp:Parameter Name="ProjectDescription" Type="String" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="ProjectStatusId" Type="Int32" />
                        <asp:Parameter Name="LeaderEmployeeId" Type="Int32" />
                        <asp:Parameter Name="ProjectManagerEmployeeId" Type="Int32" />
                        <asp:Parameter Name="TimeSheetApprovalTypeId" Type="Int32" />
                        <asp:Parameter Name="ExpenseApprovalTypeId" Type="Int32" />
                        <asp:Parameter Name="EstimatedDuration" Type="Double" />
                        <asp:Parameter Name="EstimatedDurationUnit" Type="String" />
                        <asp:Parameter Name="ProjectCode" Type="String" />
                        <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
                        <asp:Parameter Name="ProjectBillingRateTypeId" Type="Int32" />
                        <asp:Parameter Name="IsTemplate" Type="Boolean" />
                        <asp:Parameter Name="IsProject" Type="Boolean" />
                        <asp:Parameter Name="AccountProjectTemplateId" Type="Int32" />
                        <asp:Parameter Name="CreatedOn" Type="DateTime" />
                        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                        <asp:Parameter Name="Completed" Type="Boolean" />
                        <asp:Parameter Name="CustomField1" Type="String" />
                        <asp:Parameter Name="CustomField2" Type="String" />
                        <asp:Parameter Name="CustomField3" Type="String" />
                        <asp:Parameter Name="CustomField4" Type="String" />
                        <asp:Parameter Name="CustomField5" Type="String" />
                        <asp:Parameter Name="CustomField6" Type="String" />
                        <asp:Parameter Name="CustomField7" Type="String" />
                        <asp:Parameter Name="CustomField8" Type="String" />
                        <asp:Parameter Name="CustomField9" Type="String" />
                        <asp:Parameter Name="CustomField10" Type="String" />
                        <asp:Parameter Name="CustomField11" Type="String" />
                        <asp:Parameter Name="CustomField12" Type="String" />
                        <asp:Parameter Name="CustomField13" Type="String" />
                        <asp:Parameter Name="CustomField14" Type="String" />
                        <asp:Parameter Name="CustomField15" Type="String" />
                    </InsertParameters>
<SelectParameters>
<asp:Parameter Name="AccountProjectId" Type="Int32"></asp:Parameter>
<asp:SessionParameter SessionField="AccountEmployeeId" DefaultValue="39" Name="AccountEmployeeId" Type="Int32"></asp:SessionParameter>
    <asp:Parameter Name="Completed" Type="Boolean" />
<asp:QueryStringParameter QueryStringField="IsTemplate" Name="IsTemplate" Type="Boolean"></asp:QueryStringParameter>
    <asp:Parameter Name="AccountId" Type="Int32" />
</SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProjectDescription" Type="String" />
                        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
                    </UpdateParameters>
</asp:ObjectDataSource><asp:ObjectDataSource id="dsAccountProjectTasksObject" runat="server" TypeName="AccountProjectTaskBLL" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w30"><SelectParameters>
<asp:ControlParameter PropertyName="Text" Type="Int32" DefaultValue="9" Name="AccountProjectId" ControlID="P"></asp:ControlParameter>
<asp:SessionParameter SessionField="AccountEmployeeId" Type="Int32" DefaultValue="39" Name="AccountEmployeeId"></asp:SessionParameter>
<asp:Parameter Type="Int32" Name="AccountProjectTaskId"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource><aspToolkit:CascadingDropDown id="CP" runat="server" __designer:wfdid="w31" TargetControlID="P" Category="Project" ServiceMethod="GetAccountProjectsByClient" ServicePath="~/Services/ProjectService.asmx" PromptText="Select Project" ParentControlID="C" LoadingText="Loading"></aspToolkit:CascadingDropDown><asp:Image id="imgP" Width="10px" runat="server" ImageUrl="~/Images/clearpixel.gif" __designer:wfdid="w32" EnableTheming="True"></asp:Image> 
</itemtemplate>
            <itemstyle horizontalalign="Left" width="225px" verticalalign="Middle" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Task %>">
            <headertemplate>
<asp:Label id="lblProjectTask" Text='<%# ResourceHelper.GetFromResource("Project Task") %>' runat="server" __designer:wfdid="w39"></asp:Label> 
</headertemplate>
            <itemtemplate>
<asp:DropDownList id="PT" Width="230px" runat="server" Data Field="TaskName" 
                    DataValueField="AccountProjectTaskId" DataTextField="TaskName" 
                    __designer:wfdid="w34" enabled="False"></asp:DropDownList><asp:DropDownList id="ddlTimeOffTypeId" Width="98%" runat="server" Visible="False" DataSourceID="dsTimeOffTypesObject" DataValueField="AccountTimeOffTypeId" DataTextField="AccountTimeOffType" __designer:wfdid="w35"></asp:DropDownList><asp:ObjectDataSource id="dsTimeOffTypesObject" runat="server" TypeName="AccountTimeOffTypeBLL" SelectMethod="GetAccountTimeOffTypesByAccountIdAndRequestRequired" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w36"><SelectParameters>
<asp:SessionParameter SessionField="AccountId" Type="Int32" Name="AccountId"></asp:SessionParameter>
<asp:Parameter Name="AccountTimeOffTypeId"></asp:Parameter>
<asp:Parameter Type="Boolean" DefaultValue="False" Name="RequestRequired"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource><BR /><aspToolkit:CascadingDropDown id="CT" runat="server" __designer:wfdid="w37" TargetControlID="PT" Category="Tasks" ServiceMethod="GetAccountProjectTasksInTimeSheet" ServicePath="~/Services/ProjectService.asmx" PromptText="<%$ Resources:TimeLive.Web, Select Tasks%>" ParentControlID="P" LoadingText="Loading"></aspToolkit:CascadingDropDown><asp:Image id="imgPT" Width="10px" runat="server" ImageUrl="~/Images/clearpixel.gif" __designer:wfdid="w38" EnableTheming="True"></asp:Image> 
</itemtemplate>
            <itemstyle horizontalalign="Center" width="230px" verticalalign="Middle" />
        </asp:TemplateField>
        <asp:TemplateField>
            <headertemplate>
<asp:Label id="lblCostCenter" Text='<%# ResourceHelper.GetFromResource("Cost Center") %>' runat="server" __designer:wfdid="w22"></asp:Label> 
</headertemplate>
            <itemtemplate>
<asp:DropDownList id="CC" Width="150px" runat="server" DataSourceID="dsAccountCostCenterObject" DataValueField="AccountCostCenterId" DataTextField="AccountCostCenter" __designer:wfdid="w19" AppendDataBoundItems="True"><asp:ListItem Selected="True" Value="0"></asp:ListItem>
</asp:DropDownList><BR />
                <asp:ObjectDataSource id="dsAccountCostCenterObject" runat="server" 
                    TypeName="AccountCostCenterBLL" 
                    SelectMethod="GetAccountCostCenterByAccountIdAndIsDisabled" 
                    OldValuesParameterFormatString="original_{0}" __designer:wfdid="w20">
                    <SelectParameters>
<asp:SessionParameter SessionField="AccountId" DefaultValue="131" Name="AccountId" Type="Int32"></asp:SessionParameter>
<asp:Parameter Name="AccountCostCenterId" Type="Int32"></asp:Parameter>
                        <asp:ControlParameter ControlID="ddlEmployee" Name="AccountEmployeeId" 
                            PropertyName="SelectedValue" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource><asp:Image id="imgCC" Width="10px" runat="server" ImageUrl="~/Images/clearpixel.gif" __designer:wfdid="w21" EnableTheming="True"></asp:Image> 
</itemtemplate>
            <itemstyle horizontalalign="Center" width="150px" verticalalign="Middle" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Work Type %>">
            <headertemplate>
<asp:Label id="lblWorkType" Text='<%# ResourceHelper.GetFromResource("Work Type") %>' runat="server" __designer:wfdid="w26"></asp:Label> 
</headertemplate>
            <itemtemplate>
<asp:DropDownList id="W" Width="150px" runat="server" DataSourceID="dsAccountWorkTypeObject" DataValueField="AccountWorkTypeId" DataTextField="AccountWorkType" __designer:wfdid="w23"></asp:DropDownList><BR /><asp:ObjectDataSource id="dsAccountWorkTypeObject" runat="server" TypeName="AccountWorkTypeBLL" SelectMethod="GetAccountWorkTypesByAccountIdAndIsDisabled" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w24"><SelectParameters>
<asp:SessionParameter SessionField="AccountId" Type="Int32" DefaultValue="131" Name="AccountId"></asp:SessionParameter>
<asp:Parameter Type="Int32" Name="AccountWorkTypeId"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource><asp:Image id="imgWT" Width="10px" runat="server" ImageUrl="~/Images/clearpixel.gif" __designer:wfdid="w25" EnableTheming="True"></asp:Image> 
</itemtemplate>
            <itemstyle horizontalalign="Center" width="150px" verticalalign="Middle" />
        </asp:TemplateField>
        <asp:TemplateField >
            <itemtemplate>
<asp:Image id="Image1" runat="server" Width="10px" ImageUrl="~/Images/clearpixel.gif" __designer:wfdid="w5" EnableTheming="True" Height="6px"></asp:Image><BR /><asp:Label id="lS" runat="server" Width="33px" Text="Start:" CssClass="FormViewLabelCell" __designer:wfdid="w6" Height="20px"></asp:Label><asp:Label id="lE" runat="server" Width="33px" Text="End:" CssClass="FormViewLabelCell" __designer:wfdid="w7" Height="20px"></asp:Label><asp:Label id="lT" runat="server" Width="33px" Text="Total:" CssClass="FormViewLabelCell" __designer:wfdid="w8" Height="20px"></asp:Label>
                <asp:Label id="lP" runat="server" Width="40px" Text="Task%:" 
                    CssClass="FormViewLabelCell" __designer:wfdid="w8" Height="20px"></asp:Label><BR /><asp:Image id="imgT" runat="server" Width="10px" ImageUrl="~/Images/clearpixel.gif" __designer:wfdid="w9" EnableTheming="True"></asp:Image> 
</itemtemplate>
            <itemstyle horizontalalign="Center" width="33px" verticalalign="Middle" />
            
        </asp:TemplateField>
    </Columns>
    <HeaderStyle Height="25px" />
</x:GridView>
            &nbsp; &nbsp;
            <table width="100%">
                <tr>
                    <td align="left" colspan="2" valign="top">
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:TimeLive.Web, Description: %>"
                            Width="150px" Font-Bold="True"></asp:Label><br />
                        <asp:TextBox ID="txtPeriodDescription" runat="server" Height="75px" TextMode="MultiLine"
                            Width="35%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
<asp:Button ID="WeekButton1" runat="server" Text="<%$ Resources:TimeLive.Web, Save_text%> " Width="104px" Enabled=true Visible="true" CssClass="DisabledButton" OnClientClick='<%# ResourceHelper.GetSaveMessageJavascript()%>'/><asp:Button ID="btnSubmit" runat="server" Text="<%$ Resources:TimeLive.Web, Submit_text%> " Width="104px" Enabled=true Visible="true" CssClass="DisabledButton" ToolTip="Submit for Approval"  />
                    <asp:Button ID="btnExportOfflineTimesheet" runat="server" Enabled="true" 
                        Text="Export Offline Timesheet" CssClass="DisabledButton" ToolTip="Export Offline Timesheet" 
                        Visible="true" Width="150px" />
                    <asp:Button ID="btnImportOfflineTimesheet" runat="server" Enabled="true" 
                        Text="Import Offline Timesheet" CssClass="DisabledButton" ToolTip="Import Offline Timesheet" 
                        Visible="true" Width="150px" />
                </ContentTemplate>
            </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="lblCopyFrom" runat="server" Text="<%$ Resources:TimeLive.Web, Copy From%>" Font-Bold="True"></asp:Label>
    <ew:CalendarPopup id="CopyFromCalendarPopup" runat="server" SkinId="DatePicker" Width="80px" >
                        </ew:CalendarPopup> <asp:Button id="btnCopy" runat="server" Text="<%$ Resources:TimeLive.Web, Copy Timesheet%> " ></asp:Button>&nbsp;<asp:Button id="btnCopyActivities" runat="server" Text="<%$ Resources:TimeLive.Web, Copy Activities%> " ></asp:Button>
                        <asp:Button ID="btnPrint" runat="server"
                            Text="<%$ Resources:TimeLive.Web, Print%> " Width="75px" />&nbsp;</td>
                </tr>
            </table>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td align="left" style="width: 100%">
            <uc1:ctlStatusLegend ID="SL" runat="server" />
               <uc2:ctlAccountEmployeeTimeEntryApprovalDetailsReadOnly ID="CW2"
                            runat="server" />
        </td>
    </tr>
</table>
<asp:ObjectDataSource ID="dsAccountEmployeeTimeEntriesWeek" runat="server"
    InsertMethod="AddAccountEmployeeTimeEntry" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountEmployeeTimeEntriesForPeriodView" TypeName="AccountEmployeeTimeEntryBLL"
    UpdateMethod="UpdateAccountEmployeeTimeEntry" DeleteMethod="DeleteAccountEmployeeTimeEntry">
    <UpdateParameters>
        <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
        <asp:Parameter Name="TimeEntryDate" Type="DateTime" />
        <asp:Parameter Name="StartTime" Type="String" />
        <asp:Parameter Name="EndTime" Type="String" />
        <asp:Parameter Name="TotalTime" Type="String" />
        <asp:Parameter Name="AccountProjectId" Type="Int32" />
        <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Approved" Type="Boolean" />
        <asp:Parameter Name="TeamLeadApproved" Type="Boolean" />
        <asp:Parameter Name="ProjectManagerApproved" Type="Boolean" />
        <asp:Parameter Name="AdministratorApproved" Type="Boolean" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="Original_AccountEmployeeTimeEntryId" Type="Int32" />
        <asp:Parameter Name="AccountPartyId" Type="Int32" />
        <asp:Parameter Name="Submitted" Type="Boolean" />
        <asp:Parameter Name="AccountWorkTypeId" Type="Int32" />
        <asp:Parameter Name="AccountCostCenterId" Type="Int32" />
        <asp:Parameter Name="TimesheetPeriodType" Type="String" />
        <asp:Parameter Name="PeriodStartDate" Type="DateTime" />
        <asp:Parameter Name="PeriodEndDate" Type="DateTime" />
        <asp:Parameter Name="AccountEmployeeTimeEntryPeriodId" DbType="Guid"   />
        <asp:Parameter Name="IsTimeOff" Type="Boolean" />
        <asp:Parameter Name="AccountTimeOffTypeId" DbType="Guid"   />
        <asp:Parameter Name="AccountEmployeeTimeEntryApprovalProjectId" 
            DbType="Guid"   />
        <asp:Parameter Name="Percentage" Type="Double" />
        <asp:Parameter Name="CustomField1" Type="String" />
        <asp:Parameter Name="CustomField2" Type="String" />
        <asp:Parameter Name="CustomField3" Type="String" />
        <asp:Parameter Name="CustomField4" Type="String" />
        <asp:Parameter Name="CustomField5" Type="String" />
        <asp:Parameter Name="CustomField6" Type="String" />
        <asp:Parameter Name="CustomField7" Type="String" />
        <asp:Parameter Name="CustomField8" Type="String" />
        <asp:Parameter Name="CustomField9" Type="String" />
        <asp:Parameter Name="CustomField10" Type="String" />
        <asp:Parameter Name="CustomField11" Type="String" />
        <asp:Parameter Name="CustomField12" Type="String" />
        <asp:Parameter Name="CustomField13" Type="String" />
        <asp:Parameter Name="CustomField14" Type="String" />
        <asp:Parameter Name="CustomField15" Type="String" />
    </UpdateParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="39" Name="AccountEmployeeId" Type="Int32" />
        <asp:Parameter DefaultValue="11/1/2006" Name="TimeEntryStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="11/7/2006" Name="TimeEntryEndDate" Type="DateTime" />
        <asp:Parameter Name="AccountEmployeeTimeEntryPeriodId" DbType="Guid"   />
        <asp:Parameter Name="IsCopy" Type="Boolean" />
        <asp:Parameter Name="CopyToStartDate" Type="DateTime" />
        <asp:Parameter Name="CopyToEndDate" Type="DateTime" />
           <asp:Parameter Name="IsFromMobileTimeSheet" Type="Boolean" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
        <asp:Parameter Name="TimeEntryDate" Type="DateTime" />
        <asp:Parameter Name="StartTime" Type="String" />
        <asp:Parameter Name="EndTime" Type="String" />
        <asp:Parameter Name="TotalTime" Type="String" />
        <asp:Parameter Name="AccountProjectId" Type="Int32" />
        <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Approved" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="AccountPartyId" Type="Int32" />
        <asp:Parameter Name="Submitted" Type="Boolean" />
        <asp:Parameter Name="AccountWorkTypeId" Type="Int32" />
        <asp:Parameter Name="AccountCostCenterId" Type="Int32" />
        <asp:Parameter Name="TimesheetPeriodType" Type="String" />
        <asp:Parameter Name="PeriodStartDate" Type="DateTime" />
        <asp:Parameter Name="PeriodEndDate" Type="DateTime" />
        <asp:Parameter Name="AccountEmployeeTimeEntryPeriodId" DbType="Guid"   />
        <asp:Parameter Name="IsTimeOff" Type="Boolean" />
        <asp:Parameter Name="AccountTimeOffTypeId" DbType="Guid"   />
        <asp:Parameter Name="AccountEmployeeTimeOffRequestId" DbType="Guid"   />
        <asp:Parameter Name="AccountEmployeeTimeEntryApprovalProjectId" 
            DbType="Guid"   />
        <asp:Parameter Name="Percentage" Type="Double" />
        <asp:Parameter Name="CustomField1" Type="String" />
        <asp:Parameter Name="CustomField2" Type="String" />
        <asp:Parameter Name="CustomField3" Type="String" />
        <asp:Parameter Name="CustomField4" Type="String" />
        <asp:Parameter Name="CustomField5" Type="String" />
        <asp:Parameter Name="CustomField6" Type="String" />
        <asp:Parameter Name="CustomField7" Type="String" />
        <asp:Parameter Name="CustomField8" Type="String" />
        <asp:Parameter Name="CustomField9" Type="String" />
        <asp:Parameter Name="CustomField10" Type="String" />
        <asp:Parameter Name="CustomField11" Type="String" />
        <asp:Parameter Name="CustomField12" Type="String" />
        <asp:Parameter Name="CustomField13" Type="String" />
        <asp:Parameter Name="CustomField14" Type="String" />
        <asp:Parameter Name="CustomField15" Type="String" />
    </InsertParameters>
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountEmployeeTimeEntryId" Type="Int32" />
        <asp:Parameter Name="Original_TimeEntryViewType" Type="Object" />
        <asp:Parameter Name="Original_AccountEmployeeId" Type="Int32" />
        <asp:Parameter Name="Original_TimeEntryStartDate" Type="Object" />
        <asp:Parameter Name="Original_TimeEntryEndDate" Type="Object" />
        <asp:Parameter Name="Original_AccountEmployeeTimeEntryApprovalProjectId" Type="Object" />
        <asp:Parameter Name="Original_AccountEmployeeTimeEntryPeriodId" Type="Object" />
        <asp:Parameter Name="Original_TimeEntryDate" Type="DateTime" />
    </DeleteParameters>
</asp:ObjectDataSource>


