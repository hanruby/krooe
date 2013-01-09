<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlAccountEmployeeTimeEntryDayView, App_Web_k5jcht5i" %>
<%@ Register Src="ctlStatusLegend.ascx" TagName="ctlStatusLegend" TagPrefix="uc2" %>
<%@ Register Src="ctlAccountEmployeeAttendanceList.ascx" TagName="ctlAccountEmployeeAttendanceList"
    TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24D65337282035F2"
    Namespace="eWorld.UI" TagPrefix="ew" %>

<%@ Register Assembly="LiveTools" Namespace="LiveTools" TagPrefix="cc1" %>
<script type="text/javascript">
    evt = ""; // Defeat the Chrome bug
</script> 
<TABLE class="xFormView" width="100%"><TBODY>
    <tr>
        <td align="left" class="HighlightedTextMedium" colspan="3" valign="middle"><asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate><asp:Button ID="btnWeekView" runat="server" Width="135px" /><asp:Button ID="btnMyPeriods" runat="server" Text="<%$ Resources:TimeLive.Web, Timesheet Periods%> " Width="135px" /><asp:Button ID="btnAudit" runat="server" Text="<%$ Resources:TimeLive.Web, Audit%> " Visible="False" Width="135px" /><asp:Button ID="btnTopSubmit" runat="server" Text="<%$ Resources:TimeLive.Web, Submit_text%> " Width="135px" ValidationGroup="TimeEntry" ToolTip="<%$ Resources:TimeLive.Web, Submit for Approval%> " Visible="False" /><asp:Button ID="btnTopSave" runat="server" Text="<%$ Resources:TimeLive.Web, Save_text%> " OnClick="Button1_Click" Width="135px" ValidationGroup="TimeEntry" OnClientClick='<%# ResourceHelper.GetSaveMessageJavascriptForDayView()%>' /><asp:Button ID="btnTimerTimesheet" runat="server" CssClass="DisabledButton"
                    OnClick="btnTimerTimesheet_Click" Text="<%$ Resources:TimeLive.Web, Start Timer%> " ToolTip="<%$ Resources:TimeLive.Web, Timer%> "
                    Visible="true" Width="135px" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:HyperLink ID="lnkTimesheetPeriodList" runat="server" Visible="False">[lnkTimesheetPeriodList]</asp:HyperLink><asp:HyperLink id="lnkWeekView" runat="server" Visible="False">[lnkWeekView]</asp:HyperLink></td>
    </tr>
    <tr>
        <td align="right" class="HighlightedTextMedium" style="width: 5%" valign="middle">
            <asp:Label ID="EmployeeNameLabel" runat="server" Text="<%$ Resources:TimeLive.Web, Employees: %>"
                Width="150px"></asp:Label></td>
        <td align="left" class="HighlightedTextMedium" colspan="2" style="width: 50%" valign="middle">
            <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" Width="300px">
            </asp:DropDownList></td>
    </tr>
    <TR><TD style="WIDTH: 5%; height: 21px;" class="HighlightedTextMedium" align="right" valign="middle">
         <asp:Label id="lblCurrenctdate1" runat="server" Text="<%$ Resources:TimeLive.Web, Current Date: %>" Font-Bold="True" Font-Names="Tahoma" Font-Size="11px" Width="110px"></asp:Label>
  </TD>
    <td align="left" class="HighlightedTextMedium" style="width: 50%; height: 21px;" colspan="2" valign="middle" >
        <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" ImageUrl="~/Images/right.gif" ToolTip="<%$ Resources:TimeLive.Web, Previous Date%> "></asp:ImageButton>&nbsp;
        <asp:Label id="lblCurrenctdate" runat="server" Text="Label" Font-Bold="True" Font-Names="Tahoma" Font-Size="11px"></asp:Label>
        <asp:ImageButton id="ImageButton2" onclick="ImageButton2_Click" runat="server" ImageUrl="~/Images/left.gif" ToolTip="<%$ Resources:TimeLive.Web, Next Date%> "></asp:ImageButton></td>
    </TR>
    <tr>
 <td class="HighlightedTextMedium" style="width: 5%;" align="right" valign="middle">
          <asp:Label id="lblCurrenctdate2" runat="server" Text="<%$ Resources:TimeLive.Web, Time Entry Date : %>" Font-Bold="True" Font-Names="Tahoma" Font-Size="11px" Width="110px"></asp:Label>
  </td>
        <td align="left" class="HighlightedTextMedium" style="width: 50%; height: 27px;" colspan="2" valign="middle" >
         <ew:CalendarPopup id="txtTimeEntryDate" runat="server" SkinId="DatePicker" Width="111px" AutoPostBack="True">
                        </ew:CalendarPopup>
            &nbsp;<asp:Image ID="Image1" runat="server" Height="18px" ImageUrl="~/Images/Holiday.gif"
                Visible="False" Width="18px" /></td>
    </tr>
    <tr>
        <td align="right" class="HighlightedTextMedium" style="width: 5%; height: 27px;" valign="middle">
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:TimeLive.Web, Timesheet Status : %>" Width="110px"></asp:Label></td>
        <td align="left" class="HighlightedTextMedium" colspan="2" style="width: 50%; height: 27px"
            valign="middle">
            <asp:Image ID="imgTSL" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/Images/clearpixel.gif"
                Width="10px" AlternateText="Timesheet Status" />&nbsp; &nbsp;<asp:Label ID="lblTimesheetStatus" runat="server" Text="Label" Width="100px"></asp:Label></td>
    </tr>
</TBODY></TABLE>
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%" >
    <%  If AccountPagePermissionBLL.IsPageHasPermissionOf(18, 1) = True Then%>
    <tr>
        <td align="left">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 95%px; height: 50px" valign=top align="right">



        <x:GridView ID="BulkEditGridViewVB1" runat="server" AutoGenerateColumns="False" PageSize="500"
            
                
                
                
                DataKeyNames="AccountEmployeeTimeEntryId,AccountProjectId,AccountProjectTaskId,StartTime,EndTime,TotalTime,Description,AccountEmployeeTimeEntryApprovalProjectId,AccountEmployeeTimeEntryPeriodId,IsTimeOff,AccountTimeOffTypeId,AccountEmployeeTimeOffRequestId,Approved,Percentage,AccountWorkTypeId,AccountCostCenterId,Hours,CustomField1,CustomField2,CustomField3,CustomField4,CustomField5,CustomField6,CustomField7,CustomField8,CustomField9" DataSourceID="dsAccountEmployeeTimeEntry"
 Caption="<%$ Resources:TimeLive.Web, Time Entry Day View %>" cssclass="xGridView" 
                ShowFooter="True" EnableViewState="False"  SkinID="xgridviewSkinEmployee" 
                Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Client %>">
                    <itemtemplate>
<asp:DropDownList id="ddlAccountClientId" runat="server" Width="100%" DataSourceID="dsAccountClientObject" DataTextField="PartyName" DataValueField="AccountPartyId" __designer:wfdid="w14"></asp:DropDownList><asp:Label id="lblTimeTypesClient" runat="server" Text="Time Off" Font-Bold="True" Visible="False" __designer:wfdid="w7"></asp:Label><asp:ObjectDataSource id="dsAccountClientObject" runat="server" TypeName="AccountPartyBLL" SelectMethod="GetAccountPartiesForTimeEntryByAccountEmployeeId" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w16"><SelectParameters>
<asp:SessionParameter SessionField="AccountEmployeeId" Type="Int32" Name="AccountEmployeeId"></asp:SessionParameter>
</SelectParameters>
</asp:ObjectDataSource> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" verticalalign="Middle" width="35%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Project %>">
                                    <itemtemplate>
<asp:Label id="lblTimeOff" runat="server" Width="25%" Visible="False" __designer:wfdid="w15"></asp:Label><asp:DropDownList id="ddlAccountProjectId" runat="server" __designer:wfdid="w35" DataTextField="ProjectName" DataValueField="AccountProjectId"></asp:DropDownList><asp:ObjectDataSource id="dsAccountProjectsObject" __designer:dtid="1688867040133120" runat="server" UpdateMethod="UpdateProjectDescription" TypeName="AccountProjectBLL" SelectMethod="GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId" OldValuesParameterFormatString="original_{0}" InsertMethod="AddAccountProject" __designer:wfdid="w36" DeleteMethod="DeleteAccountProject"><DeleteParameters>
<asp:Parameter Type="Int32" Name="Original_AccountProjectId"></asp:Parameter>
</DeleteParameters>
<UpdateParameters>
<asp:Parameter Type="String" Name="ProjectDescription"></asp:Parameter>
<asp:Parameter Type="Int32" Name="Original_AccountProjectId"></asp:Parameter>
</UpdateParameters>
<SelectParameters>
<asp:Parameter Type="Int32" Name="AccountProjectId"></asp:Parameter>
<asp:Parameter Type="Int32" DefaultValue="67" Name="AccountEmployeeId"></asp:Parameter>
<asp:QueryStringParameter Type="Boolean" Name="IsTemplate" QueryStringField="IsTemplate"></asp:QueryStringParameter>
</SelectParameters>
<InsertParameters>
<asp:Parameter Type="Int32" Name="AccountId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AccountProjectTypeId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AccountClientId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AccountPartyContactId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AccountPartyDepartmentId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ProjectBillingTypeId"></asp:Parameter>
<asp:Parameter Type="String" Name="ProjectName"></asp:Parameter>
<asp:Parameter Type="String" Name="ProjectDescription"></asp:Parameter>
<asp:Parameter Type="DateTime" Name="StartDate"></asp:Parameter>
<asp:Parameter Type="DateTime" Name="DeadLine"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ProjectStatusId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="LeaderEmployeeId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ProjectManagerEmployeeId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="TimeSheetApprovalTypeId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ExpenseApprovalTypeId"></asp:Parameter>
<asp:Parameter Type="Int32" Name="EstimatedDuration"></asp:Parameter>
<asp:Parameter Type="String" Name="EstimatedDurationUnit"></asp:Parameter>
<asp:Parameter Type="String" Name="ProjectCode"></asp:Parameter>
<asp:Parameter Type="Decimal" Name="DefaultBillingRate"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ProjectBillingRateTypeId"></asp:Parameter>
<asp:Parameter Type="Boolean" Name="IsTemplate"></asp:Parameter>
<asp:Parameter Type="Boolean" Name="IsProject"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AccountProjectTemplateId"></asp:Parameter>
<asp:Parameter Type="DateTime" Name="CreatedOn"></asp:Parameter>
<asp:Parameter Type="Int32" Name="CreatedByEmployeeId"></asp:Parameter>
<asp:Parameter Type="DateTime" Name="ModifiedOn"></asp:Parameter>
<asp:Parameter Type="Int32" Name="ModifiedByEmployeeId"></asp:Parameter>
</InsertParameters>
</asp:ObjectDataSource><asp:ObjectDataSource id="dsAccountProjectTasksObject" __designer:dtid="1970324836974643" runat="server" TypeName="AccountProjectTaskBLL" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w37"><SelectParameters __designer:dtid="1970324836974644">
<asp:ControlParameter PropertyName="SelectedValue" Type="Int32" DefaultValue="9" Name="AccountProjectId" ControlID="ddlAccountProjectId" __designer:dtid="1970324836974645"></asp:ControlParameter>
<asp:SessionParameter SessionField="AccountEmployeeId" Type="Int32" DefaultValue="39" Name="AccountEmployeeId"></asp:SessionParameter>
<asp:Parameter Type="Int32" Name="AccountProjectTaskId"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource><aspToolkit:CascadingDropDown id="ddlAccountProjectIdCascadingDropDown" __designer:dtid="1970324836974685" runat="server" __designer:wfdid="w38" TargetControlID="ddlAccountProjectId" LoadingText="Loading" ParentControlID="ddlAccountClientId" PromptText="Select Project" ServicePath="~/Services/ProjectService.asmx" ServiceMethod="GetAccountProjectsByClient" Category="Projects"></aspToolkit:CascadingDropDown> 
</itemtemplate>
                    <itemstyle width="35%" verticalalign="Middle" horizontalalign="Left"  />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Task %>">
                    <itemtemplate>
<asp:DropDownList id="ddlAccountProjectTaskId" __designer:dtid="1970324836974684" Width="100%" runat="server" DataTextField="TaskName" DataValueField="AccountProjectTaskId" __designer:wfdid="w3"></asp:DropDownList><asp:DropDownList id="ddlTimeOffTypes" __designer:dtid="1970324836974684" Width="100%" runat="server" Visible="False" DataSourceID="dsTimeOffTypeObject" DataTextField="AccountTimeOffType" DataValueField="AccountTimeOffTypeId" __designer:wfdid="w4"></asp:DropDownList><asp:ObjectDataSource id="dsTimeOffTypeObject" runat="server" TypeName="AccountTimeOffTypeBLL" SelectMethod="GetAccountTimeOffTypesByAccountIdAndRequestRequired" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w5"><SelectParameters>
<asp:SessionParameter SessionField="AccountId" Type="Int32" Name="AccountId"></asp:SessionParameter>
<asp:Parameter Name="AccountTimeOffTypeId"></asp:Parameter>
<asp:Parameter Type="Boolean" DefaultValue="False" Name="RequestRequired"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource> <aspToolkit:CascadingDropDown id="ddlAccountProjectTaskIdCascadingDropDown" __designer:dtid="1970324836974685" runat="server" __designer:wfdid="w6" TargetControlID="ddlAccountProjectTaskId" LoadingText="Loading" ParentControlID="ddlAccountProjectId" PromptText="<%$ Resources:TimeLive.Web, Select Tasks%>" ServicePath="~/Services/ProjectService.asmx" ServiceMethod="GetAccountProjectTasksInTimeSheet" Category="Tasks"></aspToolkit:CascadingDropDown> 
</itemtemplate>
                    <itemstyle width="40%" horizontalalign="Center" verticalalign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Cost Center %>">
                    <itemtemplate>
<asp:DropDownList id="ddlAccountCostCenterId" Width="150px" runat="server" DataSourceID="dsAccountCostCenterObject" AppendDataBoundItems="True" DataTextField="AccountCostCenter" DataValueField="AccountCostCenterId" __designer:wfdid="w7"><asp:ListItem Value="0"></asp:ListItem>
</asp:DropDownList><asp:ObjectDataSource id="dsAccountCostCenterObject" runat="server" TypeName="AccountCostCenterBLL" SelectMethod="GetAccountCostCenterByAccountIdAndIsDisabled" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w8"><SelectParameters>
<asp:SessionParameter SessionField="AccountId" DefaultValue="151" Name="AccountId" Type="Int32"></asp:SessionParameter>
<asp:Parameter Name="AccountCostCenterId" Type="Int32"></asp:Parameter>
                            <asp:ControlParameter ControlID="ddlEmployee" Name="AccountEmployeeId" 
                                PropertyName="SelectedValue" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" verticalalign="Middle" width="0%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Work Type %>">
                    <itemtemplate>
<asp:DropDownList id="ddlAccountWorkTypeId" Width="150px" runat="server" DataSourceID="dsAccountWorkTypeObject" DataTextField="AccountWorkType" DataValueField="AccountWorkTypeId" __designer:wfdid="w1"></asp:DropDownList><asp:ObjectDataSource id="dsAccountWorkTypeObject" runat="server" TypeName="AccountWorkTypeBLL" SelectMethod="GetAccountWorkTypesByAccountIdAndIsDisabled" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w35"><SelectParameters>
<asp:SessionParameter SessionField="AccountId" Type="Int32" DefaultValue="99" Name="AccountId"></asp:SessionParameter>
<asp:Parameter Type="Int32" Name="AccountWorkTypeId"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" verticalalign="Middle" width="0%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, StartTime %>">
                    <itemtemplate>
<asp:TextBox id="StartTime" runat="server" Width="70px" ValidationGroup="TimeEntry" __designer:wfdid="w3" onchange="javascript:OnTimeChange(this);"></asp:TextBox> <cc2:MaskedEditExtender id="MaskedEditExtenderStartTime" runat="server" __designer:wfdid="w4" AutoCompleteValue="00:00" AutoComplete="true" AcceptAMPM="true" MaskType="Time" Mask="99:99 " TargetControlID="StartTime"></cc2:MaskedEditExtender> <cc2:MaskedEditValidator id="MaskedEditValidatorStartTime" runat="server" ValidationGroup="TimeEntry" __designer:wfdid="w5" Display="Dynamic" InvalidValueMessage="Invalid Time" EmptyValueMessage="*" IsValidEmpty="true" ControlToValidate="StartTime" ControlExtender="MaskedEditExtenderStartTime"></cc2:MaskedEditValidator> 
</itemtemplate>
                    <itemstyle width="0%" horizontalalign="Center" verticalalign="Middle" />
                    
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, EndTime %>">
                    <itemtemplate>
<asp:TextBox id="EndTime" runat="server" Width="70px" ValidationGroup="TimeEntry" __designer:wfdid="w47" onchange="javascript:OnTimeChange(this);"></asp:TextBox> <cc2:MaskedEditExtender id="MaskedEditExtenderEndTime" runat="server" __designer:wfdid="w48" TargetControlID="EndTime" Mask="99:99 " MaskType="Time" AcceptAMPM="true" AutoComplete="true" AutoCompleteValue="00:00"></cc2:MaskedEditExtender> <cc2:MaskedEditValidator id="MaskedEditValidatorEndTime" runat="server" ValidationGroup="TimeEntry" __designer:wfdid="w49" ControlExtender="MaskedEditExtenderEndTime" ControlToValidate="EndTime" IsValidEmpty="true" EmptyValueMessage="*" InvalidValueMessage="Invalid Time" Display="Dynamic"></cc2:MaskedEditValidator> 
</itemtemplate>
                    <itemstyle width="0%" horizontalalign="Center" verticalalign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, TotalTime %>">
                    <footertemplate>
<asp:TextBox id="sumTime" runat="server" Width="70px" __designer:wfdid="w54" readonly="true"></asp:TextBox> 
<asp:TextBox id="sumPercent" runat="server" Width="70px" __designer:wfdid="w54" readonly="true"></asp:TextBox> 
</footertemplate>
                    <itemtemplate>
<asp:TextBox id="TotalTime" runat="server" Width="70px" ValidationGroup="TimeEntry" __designer:wfdid="w55" onchange="javascript:UpdateSum();"></asp:TextBox><cc2:MaskedEditExtender id="MaskedEditExtenderTotalTime" runat="server" __designer:wfdid="w56" TargetControlID="TotalTime" Mask="99:99 " MaskType="Time" AcceptAMPM="false" AutoComplete="true" AutoCompleteValue="00:00"></cc2:MaskedEditExtender> <cc2:MaskedEditValidator id="MaskedEditValidatorTotalTime" runat="server" ValidationGroup="TimeEntry" __designer:wfdid="w57" ControlExtender="MaskedEditExtenderTotalTime" ControlToValidate="TotalTime" IsValidEmpty="true" EmptyValueMessage="*" InvalidValueMessage="Invalid Time" Display="Dynamic"></cc2:MaskedEditValidator> 
                        <asp:RangeValidator ID="rvTT" runat="server" ControlToValidate="TotalTime" 
                            Display="Dynamic" ErrorMessage="Invalid Time" MaximumValue='<%# Convert.ToDouble(23.99).ToString("N", LocaleUtilitiesBLL.GetCurrentCultureInfoWithThreadCulture) %>'
                            MinimumValue="0" ValidationGroup="TimeEntry" Type="Double"></asp:RangeValidator>
                        <asp:TextBox ID="Percentage" runat="server" ValidationGroup="TimeEntry" 
                            Width="70px" onchange="javascript:UpdateSum();"></asp:TextBox>
                        <cc2:MaskedEditExtender ID="MaskedEditExtenderPercentage" runat="server" 
                            __designer:wfdid="w56" AcceptAMPM="false" AutoComplete="False" Mask="999" 
                            MaskType="Number" TargetControlID="Percentage">
                        </cc2:MaskedEditExtender>
                        <cc2:MaskedEditValidator ID="MaskedEditValidatorPercentage" runat="server" 
                            __designer:wfdid="w57" ControlExtender="MaskedEditExtenderPercentage" 
                            ControlToValidate="Percentage" Display="Dynamic" EmptyValueMessage="*" 
                            ErrorMessage="MaskedEditValidatorPercentage" 
                            InvalidValueMessage="Invalid Percentage" IsValidEmpty="true" MaximumValue="100" 
                            MaximumValueMessage="Invalid Percentage" ValidationGroup="TimeEntry"></cc2:MaskedEditValidator>
</itemtemplate>
<itemstyle width="0%" horizontalalign="Center" verticalalign="Middle" />

                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Description %>">
                    <edititemtemplate>
&nbsp;
</edititemtemplate>
                    <itemtemplate>
<asp:TextBox id="Description" runat="server" Width="175px" Text='<%# Bind("Description") %>' __designer:wfdid="w60" Height="30px" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
</itemtemplate>
                    <itemstyle width="175px" horizontalalign="Center" verticalalign="Middle" />
                </asp:TemplateField>
                
                

                <asp:BoundField DataField="AccountEmployeeTimeEntryId" HeaderText="AccountEmployeeTimeEntryId"
                    InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:TemplateField ShowHeader="False" Visible="False">
                    <itemtemplate>
<asp:UpdatePanel id="UpdatePanelDelete" runat="server" __designer:wfdid="w1" RenderMode="Inline" UpdateMode="Conditional"><ContentTemplate>
<asp:ImageButton id="btnDelete" runat="server" Visible="False" ToolTip="Delete" OnClientClick="<%# ResourceHelper.GetDeleteMessageJavascript()%>" ImageUrl="~/Images/Delete.gif" ImageAlign="AbsMiddle" __designer:wfdid="w7" CommandName="Delete"></asp:ImageButton> 
</ContentTemplate>
</asp:UpdatePanel> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" verticalalign="Middle" width="0%" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" Visible="False">
                    <itemtemplate>
<asp:Image id="imgStatus" runat="server" Width="10px" ImageAlign="AbsMiddle" Visible="False" __designer:wfdid="w62"></asp:Image> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" verticalalign="Middle" width="0%" />
                </asp:TemplateField>

            </Columns>
        </x:GridView>
        <asp:ObjectDataSource ID="dsAccountEmployeeTimeEntry" runat="server"
            InsertMethod="AddAccountEmployeeTimeEntry" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountEmployeeTimeEntriesByDate" TypeName="AccountEmployeeTimeEntryBLL"
            UpdateMethod="UpdateAccountEmployeeTimeEntry" 
                DeleteMethod="DeleteAccountEmployeeTimeEntry">
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
                <asp:Parameter Name="AccountEmployeeTimeEntryPeriodId" DbType="Guid" />
                <asp:Parameter Name="IsTimeOff" Type="Boolean" />
                <asp:Parameter Name="AccountTimeOffTypeId" DbType="Guid" />
                <asp:Parameter Name="AccountEmployeeTimeEntryApprovalProjectId" DbType="Guid" />
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
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountEmployeeTimeEntryId" Type="Int32" />
                <asp:Parameter Name="Original_TimeEntryViewType" Type="Object" />
                <asp:Parameter Name="Original_AccountEmployeeId" Type="Int32" />
                <asp:Parameter Name="Original_TimeEntryStartDate" Type="Object" />
                <asp:Parameter Name="Original_TimeEntryEndDate" Type="Object" />
                <asp:Parameter Name="Original_AccountEmployeeTimeEntryApprovalProjectId" 
                    Type="Object" />
                <asp:Parameter Name="Original_AccountEmployeeTimeEntryPeriodId" Type="Object" />
                <asp:Parameter Name="Original_TimeEntryDate" Type="DateTime" />
            </DeleteParameters>
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
                <asp:Parameter Name="AccountEmployeeTimeEntryPeriodId" DbType="Guid" />
                <asp:Parameter Name="IsTimeOff" Type="Boolean" />
                <asp:Parameter Name="AccountTimeOffTypeId" DbType="Guid"/>
                <asp:Parameter Name="AccountEmployeeTimeOffRequestId" DbType="Guid" />
                <asp:Parameter Name="AccountEmployeeTimeEntryApprovalProjectId" DbType="Guid" />
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
            <SelectParameters>
                <asp:Parameter DefaultValue="39" Name="AccountEmployeeId" Type="Int32" />
                <asp:Parameter DefaultValue="8/29/2006" Name="TimeEntryDate" Type="DateTime" />
                <asp:Parameter DefaultValue="" Name="IsCopy" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
<script language="javascript">
    // This function should iterate through all the TextBoxes and get the values 
function UpdateSum() {
        var tBox;
        var deli;
        var sumTextBox;
        var sumPTextBox;
        // clear the sum variable 
        var sumMinutes = 0;
        var sumPercents = 0;
        // Iterate through all the TextBoxes
        tBox = document.getElementsByTagName("INPUT"); 
        var IsMinutes = false;
        for(i = 0; i< (tBox.length - 2) ; i++) 
        {                   
           if(tBox[i].type == "text") 
           {
              if(tBox[i].id.indexOf('sumTime') > 0) {
                sumTextBox =  tBox[i];
              }
              if(tBox[i].id.indexOf('TotalTime') > 0) 
              {
                // The Number function forces the JavaScript to recognizes the input as a number 
                textValue = tBox[i].value;
                if (textValue.indexOf(':') > 0) {
                    IsMinutes = true;
                   deli = ':'
                }
               if (deli == ':') {
                   minutesValue = GetTotalMinutesOfTime(textValue);
                   sumMinutes += Number(minutesValue);
               }
               if (deli != ':') {
                   sumMinutes += Number(textValue.replace(',', '.'));
               }
            }
            if (tBox[i].id.indexOf('sumPercent') > 0) {
                sumPTextBox = tBox[i];
            }
            if (tBox[i].id.indexOf('Percentage') > 0) {
                // The Number function forces the JavaScript to recognizes the input as a number 
                ptextValue = tBox[i].value;
                percentsVal = ptextValue;
                sumPercents += Number(percentsVal);
            }
            }
    }
    if (deli == ':') {
        var h = Math.floor(sumMinutes / 60);
    }
    var pt = Math.floor(sumPercents);
    if (sumTextBox != null) {
        if (deli == ':') {
            sumTextBox.value = padl(h, 2, '0')
            if (IsMinutes == true) {
                sumTextBox.value = sumTextBox.value + ':' + padl((sumMinutes - (h * 60)), 2, '0');
            }
        }
        if (deli != ':') {                     
                sumTextBox.value = parseFloat(sumMinutes).toFixed(2);         
        }        
        if (sumPTextBox != null) {
            sumPTextBox.value = pt + '%';
        }
    }
}
function padl(n, w, c) {
    n = String(n);
    while (n.length < w)
        n = c + n;
    return n;
}
function GetTimeFromMinutes(minutes, IsMinutes) {
    var h = Math.floor(minutes / 60);
    valueToReturn = padl(h,2,'0');
    if (IsMinutes == true) {
        valueToReturn = valueToReturn + ':' + padl((minutes - (h * 60)),2,'0');
    }
    return  valueToReturn
}
function GetTotalMinutesOfTime(timeValue) {

    if (timeValue == '') {
        return 0;
    }
    if (timeValue.substring(1,2) == '_') {
        timeValue = '0' + timeValue.substring(0,1) + timeValue.substring(2) 
    }
    timeValue = timeValue.replace('_','0')
    minutesValue = timeValue.substring(0,2) * 60 
    if (timeValue.indexOf(':') > 0) {
            minutesValue = parseInt(minutesValue) + Number(timeValue.substring(3,6))
    }
    if (timeValue.indexOf('PM') > 0) {
        if (timeValue.indexOf('12') != -1) {
            if (timeValue.indexOf('12') != 3) {
            minutesValue = minutesValue - (12 * 60); 
            }
        }
        minutesValue = minutesValue + (12 * 60);           
     }
     if (timeValue.indexOf('AM') > 0) {
        if (timeValue.indexOf('12') != -1) {
            if (timeValue.indexOf('12') != 3) {
            minutesValue = minutesValue - (12 * 60); 
            }
        }
     }
    return minutesValue ;
}
function OnTimeChange(targetObject) {
    targetId = targetObject.id;
    if (targetId.indexOf("StartTime") > 0 )  {
        StartTime = targetObject.value;
        otherId = targetId.replace("StartTime","EndTime") ;
        otherobj = window.document.getElementById(otherId);
        EndTime = otherobj.value;
        TotalTimeId = targetId.replace("StartTime","TotalTime") ;
    }
    else
    {
        EndTime = targetObject.value;
        otherId = targetId.replace("EndTime","StartTime") ; 
        otherobj = window.document.getElementById(otherId);
        StartTime = otherobj.value;
        TotalTimeId = targetId.replace("EndTime","TotalTime") ;
    }
    objEndTime = window.document.getElementById(TotalTimeId);
    minStartTime = GetTotalMinutesOfTime(StartTime);
    minEndTime = GetTotalMinutesOfTime(EndTime);
    if (minEndTime == 0) {
        return
     }
    if (minStartTime > minEndTime) {
        minEndTime = minEndTime + (24*60)
        }
    minTotalTime = minEndTime - minStartTime ;
    if (StartTime.indexOf(':') > 0) {
        IsMinutes = true;
     } else {
        IsMinutes = false;
     }
    strTotalTime = GetTimeFromMinutes(minTotalTime, IsMinutes);
    objEndTime.value = strTotalTime;
    UpdateSum() ;
    }   
    
function replaceAll( str, from, to ) {
    var idx = str.indexOf( from );
    while ( idx > -1 ) {
        str = str.replace( from, to ); 
        idx = str.indexOf( from );
    }
    return str;
}
    </script>
        </td>
    </tr>
    <tr>
        <td align="right" valign="top">
            <table width="100%">
                <tr>
                    <td align="left" colspan="2">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
        <asp:Button ID="btnSubmit" runat="server" Text="<%$ Resources:TimeLive.Web, Submit_text%> " Width="88px" ValidationGroup="TimeEntry" ToolTip="<%$ Resources:TimeLive.Web, Submit for Approval%> " Visible="False" />
    <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:TimeLive.Web, Save_text%> " OnClick="Button1_Click" Width="88px" ValidationGroup="TimeEntry" OnClientClick='<%# ResourceHelper.GetSaveMessageJavascriptForDayView()%>' />
                </ContentTemplate>
            </asp:UpdatePanel>
                        <asp:Label ID="lblPermissionMessage" runat="server" Font-Bold="True" Font-Size="Large"
                            Text="Non-working day." Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="lblCopyFrom" runat="server" Font-Bold="True" Text="<%$ Resources:TimeLive.Web, Copy From%> "></asp:Label>&nbsp;<ew:CalendarPopup id="CopyFromCalendarPopup" runat="server" SkinId="DatePicker" Width="80px" >
                        </ew:CalendarPopup> <asp:Button id="btnCopy" runat="server" Text="<%$ Resources:TimeLive.Web, Copy Timesheet%> " ></asp:Button>
                        <asp:Button ID="btnCopyActivities" runat="server" Text="<%$ Resources:TimeLive.Web, Copy Activities%> " />&nbsp;</td>
                </tr>
            </table>
            <br />
        </td>
    </tr>
    <tr>
        <td valign="top" style="width: 273px; height: 44px;" >
            <div style="text-align: left">
                <uc2:ctlStatusLegend ID="CtlStatusLegend1" runat="server" />
                &nbsp;</div>
            <br />
        </td>
    </tr>            
    <% End If %>
            <uc1:ctlAccountEmployeeAttendanceList ID="CtlAccountEmployeeAttendanceList1" runat="server" /></table>
<script language="javascript">
</script>
