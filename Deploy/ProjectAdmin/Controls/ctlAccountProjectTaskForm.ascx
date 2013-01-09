<%@ control language="VB" autoeventwireup="false" inherits="ProjectAdmin_Controls_ctlAccountProjectTaskForm, App_Web_wln1wvyv" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<script language="vb" runat="server">
    Sub ValidateListAndCheck(ByVal sender As Object, ByVal args As ServerValidateEventArgs)
        Dim n As Integer = 0
        Dim l As ListBox = Me.FormView1.FindControl("ListBoxEmployees")
        If CType(Me.FormView1.FindControl("CheckBox1"), CheckBox).Checked <> True Then
            If CType(Me.FormView1.FindControl("CheckBox2"), CheckBox).Checked <> True Then
                For Each s As ListItem In l.Items
                    If s.Selected = True Then
                        n = n + 1
                    End If
                    If n <> 0 Then
                        args.IsValid = True
                    Else
                        args.IsValid = False
                    End If
                Next
            End If
        End If
    End Sub
    'Public Event UpdateIssueClick(ByVal sender As Object)
    Sub ValidateListAndCheckUpdate(ByVal sender As Object, ByVal args As ServerValidateEventArgs)
        Dim n As Integer = 0
        Dim l As ListBox = Me.FormView1.FindControl("ListBoxEmployeesUpdate")
        If CType(Me.FormView1.FindControl("CheckBox1"), CheckBox).Checked <> True Then
            If CType(Me.FormView1.FindControl("CheckBox3"), CheckBox).Checked <> True Then
                For Each s As ListItem In l.Items
                    If s.Selected = True Then
                        n = n + 1
                    End If
                    If n <> 0 Then
                        args.IsValid = True
                    Else
                        args.IsValid = False
                    End If
                Next
            End If
            '       If args.IsValid = False Then
            'RaiseEvent UpdateIssueClick(sender)
            'End If
        End If
    End Sub
</script>
<%@ Register Src="ctlAccountProjectTaskAttachmentList.ascx" TagName="ctlAccountProjectTaskAttachmentList"
    TagPrefix="uc1" %>
<%@ Register Assembly="eWorld.UI"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:FormView ID="FormView1" runat="server" 
    DataKeyNames="AccountProjectTaskId,Predecessors" DataSourceID="dsAccountProjectTaskFormObject"
    DefaultMode="Insert" SkinID="formviewSkinEmployee" Width="700px" 
    OnPageIndexChanging="FormView1_PageIndexChanging2">
    <EditItemTemplate>
        <table id="Table1" width="100%" class="xview">
            <tr>
                <td class="caption" colspan="4" style="height: 21px">
                    <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Task Information") %>' /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="4" style="height: 21px">
                    <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Task") %>' /></td>
            </tr>
              <tr>
                <td align="right" class="FormViewLabelCell" style="width: 23%; height: 26px">
                    <SPAN 
                  class=reqasterisk>*</SPAN> <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Project:") %>' /></td>
                  <td colspan="3" style="height: 26px">
                    <asp:DropDownList ID="ddlAccountProjectId" runat="server" 
                        DataSourceID="dsAccountProjectObject" DataTextField="ProjectName" DataValueField="AccountProjectId" Width="224px" AutoPostBack="True" OnSelectedIndexChanged="ddlAccountProjectId_SelectedIndexChanged" ValidationGroup="ProjectTaskForm" Enabled='<%# IIf(Me.Request.QueryString("AccountProjectId") Is Nothing,True,False) %>'>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 23%; height: 26px">
                    <asp:Literal ID="Literal3" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Parent Task:") %>' />
                </td>
                <td colspan="3" style="height: 26px">
                    <asp:DropDownList ID="ddlParentAccountProjectTaskId" runat="server" 
                        AppendDataBoundItems="True" DataSourceID="dsParentAccountProjectTaskObject" 
                        DataTextField="TaskName" DataValueField="AccountProjectTaskId" 
                        ValidationGroup="ProjectTaskForm" Width="352px">
                    </asp:DropDownList>
                </td>
            <tr>
                <td align="right" class="FormViewLabelCell" style="height: 26px; width: 23%;">
                    <span class="reqasterisk">*</span>
                    <asp:Literal ID="Literal5" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Milestone:") %>' />
                </td>
                <td colspan="3" style="height: 26px">
                    <asp:DropDownList ID="ddlAccountProjectMilestoneId" runat="server" 
                        DataSourceID="dsAccountProjectMilestone" DataTextField="MilestoneDescription" 
                        DataValueField="AccountProjectMilestoneId" ValidationGroup="ProjectTaskForm" 
                        Width="224px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddlAccountProjectMilestoneId" CssClass="ErrorMessage" 
                        ErrorMessage="*" InitialValue="0" ValidationGroup="ProjectTaskForm"></asp:RequiredFieldValidator>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 23%; height: 26px">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="TextBox1">
                        <asp:Literal ID="Literal6" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Task Code:") %>' /></asp:Label></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="TextBox1" runat="server" 
                        MaxLength="15" Text='<%# Bind("TaskCode") %>'></asp:TextBox></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><span 
                    class="reqasterisk">*</span><asp:Label ID="Label1" runat="server" 
                    AssociatedControlID="TaskNameTextBox">
                  <asp:Literal ID="Literal7" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Task Name:") %>' /></asp:Label></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="TaskNameTextBox" 
                        runat="server" MaxLength="100" Text='<%# Bind("TaskName") %>' 
                        ValidationGroup="ProjectTaskForm" Width="320px"></asp:TextBox><asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator2" runat="server" ControlToValidate="TaskNameTextBox" 
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="ProjectTaskForm" 
                        Width="8px"></asp:RequiredFieldValidator></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="height: 26px; width: 23%;"><span 
                    class="reqasterisk">*</span><asp:Label ID="Label4" runat="server" 
                    AssociatedControlID="TaskDescriptionTextBox">
                  <asp:Literal ID="Literal8" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Task Description:") %>' /></asp:Label></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="TaskDescriptionTextBox" 
                        runat="server" Rows="6" Text='<%# Bind("TaskDescription") %>' 
                        TextMode="MultiLine" ValidationGroup="ProjectTaskForm" Width="450px"></asp:TextBox><br /><asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TaskDescriptionTextBox" Display="Dynamic" 
                        ErrorMessage="* Description field is required" 
                        ValidationGroup="ProjectTaskForm" Width="196px"></asp:RequiredFieldValidator><asp:CustomValidator 
                        ID="CustomValidator3" runat="server" CssClass="ErrorMessage" Display="Dynamic" 
                        ErrorMessage="Value exceeds maximum number of digits." 
                        OnServerValidate="CustomValidator3_ServerValidate" 
                        ValidationGroup="ProjectTaskForm"></asp:CustomValidator></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="height: 26px; width: 23%;"><span 
                    class="reqasterisk"></span></td><td colspan="3" style="height: 26px"></td></tr><tr><td 
                align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><span 
                class="reqasterisk">*</span> <asp:Literal ID="Literal9" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Task Type:") %>' /></td><td 
                style="width: 27%; height: 26px"><asp:DropDownList ID="DropDownList1" 
                    runat="server" DataSourceID="dsAccountProjectTaskTypeObject" 
                    DataTextField="TaskType" DataValueField="AccountTaskTypeId" 
                    ValidationGroup="ProjectTaskForm" Width="184px"></asp:DropDownList><asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" 
                    Display="Dynamic" ErrorMessage="*" ValidationGroup="ProjectTaskForm" 
                    Width="8px"></asp:RequiredFieldValidator></td><td 
                class="FormViewLabelCell" style="width: 18%; height: 26px;"><asp:Label 
                    ID="Label6" runat="server" AssociatedControlID="DurationTextBox">
                <asp:Literal ID="Literal10" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Duration:") %>' /></asp:Label></td><td 
                style="width: 60%; height: 26px;">&nbsp;<asp:TextBox ID="DurationTextBox" 
                    runat="server" MaxLength="10" Text='<%# Bind("Duration") %>' 
                    ValidationGroup="ProjectTaskForm" Width="30%"></asp:TextBox>&nbsp;<asp:Label 
                    ID="lblSystemDurationUnit" runat="server" Text="Hours"></asp:Label><asp:DropDownList 
                    ID="DropDownList3" runat="server" DataSourceID="dsSystemDurationUnit" 
                    DataTextField="SystemDurationUnit" DataValueField="SystemDurationUnit" 
                    SelectedValue='<%# Bind("DurationUnit") %>' ValidationGroup="ProjectTaskForm" 
                    Visible="False" Width="30%"></asp:DropDownList><asp:RangeValidator 
                    ID="RangeValidator2" runat="server" ControlToValidate="DurationTextBox" 
                    CssClass="ErrorMessage" ErrorMessage="(Inv Dur Val)" MaximumValue="50000" 
                    MinimumValue="0" Type="Double" ValidationGroup="ProjectTaskForm" Width="30%"></asp:RangeValidator></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Label 
                    ID="Label7" runat="server" AssociatedControlID="CompletedPercentTextBox">
                <asp:Literal ID="Literal64" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Completed%:") %>' /></asp:Label></td><td 
                    style="width: 27%; height: 26px"><asp:TextBox ID="CompletedPercentTextBox" 
                        runat="server" Text='<%# Bind("CompletedPercent") %>' 
                        ValidationGroup="ProjectTaskForm" Width="86px"></asp:TextBox><asp:RangeValidator 
                        ID="RangeValidator1" runat="server" ControlToValidate="CompletedPercentTextBox" 
                        CssClass="ErrorMessage" ErrorMessage="(Range 0-100)%" MaximumValue="100" 
                        MinimumValue="0" Type="Double" ValidationGroup="ProjectTaskForm"></asp:RangeValidator></td><td 
                    class="FormViewLabelCell" style="width: 18%; height: 26px">&nbsp;</td><td 
                    style="height: 26px; width: 60%;">&nbsp;</td></tr><tr><td align="right" 
                    class="FormViewLabelCell" style="width: 23%; height: 26px">Start Date:</td><td 
                    style="width: 27%; height: 26px"><ew:CalendarPopup ID="StartDate" 
                        runat="server" PostedDate="" SelectedDate="12/20/2011 15:33:51" 
                        SelectedValue='<%# Bind("StartDate") %>' SkinId="DatePicker" 
                        UpperBoundDate="12/31/9999 23:59:59" VisibleDate="12/20/2011 15:33:51"></ew:CalendarPopup></td><td 
                    class="FormViewLabelCell" style="width: 18%; height: 26px"><asp:Literal 
                        ID="Literal11" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Deadline:") %>' /></td><td 
                    style="height: 26px; width: 60%;"><ew:CalendarPopup ID="DeadlineDate" 
                        runat="server" SelectedValue='<%# Bind("DeadlineDate") %>' SkinId="DatePicker"></ew:CalendarPopup></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal12" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Task Status:") %>' /></td><td 
                    style="width: 27%; height: 26px"><asp:DropDownList ID="DropDownList6" 
                        runat="server" DataSourceID="dsProjectTaskStatusObject" DataTextField="Status" 
                        DataValueField="AccountStatusId" ValidationGroup="ProjectTaskForm"></asp:DropDownList></td><td 
                    class="FormViewLabelCell" style="width: 18%; height: 26px"><asp:Literal 
                        ID="Literal13" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Priority:") %>' /></td><td 
                    style="height: 26px; width: 60%;">&nbsp;<asp:DropDownList ID="DropDownList7" 
                        runat="server" DataSourceID="dsAccountPriorityObject" DataTextField="Priority" 
                        DataValueField="AccountPriorityId" ValidationGroup="ProjectTaskForm"></asp:DropDownList></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal14" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("All Employee Task:") %>' /></td><td 
                    style="width: 27%; height: 26px"><asp:CheckBox ID="CheckBox3" runat="server" 
                        Checked='<%# Bind("IsForAllEmployees") %>' ValidationGroup="ProjectTaskForm" /></td><td 
                    class="FormViewLabelCell" style="width: 18%; height: 26px"><asp:Literal 
                        ID="Literal15" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("All Project Task:") %>' /></td><td 
                    style="height: 26px; width: 60%;">&nbsp;<asp:CheckBox ID="CheckBox5" runat="server" 
                        Checked='<%# iif(isdbnull(eval("IsForAllProjectTask")),"False",eval("IsForAllProjectTask")) %>' 
                        ValidationGroup="ProjectTaskForm" /></td></tr><tr><td align="right" 
                    class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal16" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Completed:") %>' /></td><td 
                    style="width: 27%; height: 26px"><asp:CheckBox ID="CompletedCheckBox" 
                        runat="server" Checked='<%# Bind("Completed") %>' 
                        ValidationGroup="ProjectTaskForm" /></td><td class="FormViewLabelCell" 
                    style="width: 18%; height: 26px"><asp:Literal ID="Literal17" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Parent Task:") %>' /></td><td 
                    style="height: 26px; width: 60%;">&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" 
                        Checked='<%# Bind("IsParentTask") %>' ValidationGroup="ProjectTaskForm" /></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal18" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Billable:") %>' /></td><td 
                    style="height: 26px; width: 27%;"><asp:CheckBox ID="chkIsBillable" 
                        runat="server" ValidationGroup="ProjectTaskForm" /></td><td 
                    class="FormViewLabelCell" style="width: 18%; height: 26px"><asp:Literal 
                        ID="Literal19" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Disabled:") %>' /></td><td 
                    style="height: 26px; width: 60%;">&nbsp;<asp:CheckBox ID="chkIsDisabled" 
                        runat="server" Checked='<%# Bind("IsDisabled") %>' /></td></tr><tr><td 
                    class="FormViewSubHeader" colspan="4" style="height: 21px"><asp:Literal 
                    ID="Literal20" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Assign To") %>' /></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal21" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Assign To") %>' />:</td><td 
                    colspan="3" style="height: 26px"><asp:ListBox ID="ListBoxEmployeesUpdate" 
                        runat="server" DataSourceID="dsAccountProjectTask" DataTextField="FullName" 
                        DataValueField="AccountEmployeeId" SelectionMode="Multiple" 
                        ValidationGroup="ProjectTaskForm" Width="424px"></asp:ListBox><br /><asp:CustomValidator 
                        ID="CustomValidator2" runat="server" ControlToValidate="TaskDescriptionTextBox" 
                        CssClass="ErrorMessage" Display="Dynamic" EnableClientScript="False" 
                        ErrorMessage="Select Assigned To:" 
                        OnServerValidate="ValidateListAndCheckUpdate" ValidateEmptyText="True" 
                        ValidationGroup="ProjectTaskForm" /></td></tr><tr><td 
                    class="FormViewSubHeader" colspan="4" style="height: 21px"><asp:Literal 
                    ID="Literal22" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Estimates") %>' /></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal23" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Estimated Cost:") %>' /></td><td 
                    colspan="3" style="height: 26px"><asp:DropDownList ID="ddlEstimatedCurrencyId" 
                        runat="server" DataSourceID="dsEstimatedCurrencyObject" 
                        DataTextField="CurrencyCode" DataValueField="AccountCurrencyId" Width="75px"></asp:DropDownList><asp:TextBox 
                        ID="EstimatedCostTextBox" runat="server" Text='<%# Bind("EstimatedCost") %>' 
                        Width="91px"></asp:TextBox><asp:RangeValidator ID="RangeValidator4" 
                        runat="server" ControlToValidate="EstimatedCostTextBox" CssClass="ErrorMessage" 
                        Display="Dynamic" ErrorMessage="Numeric Required" Font-Bold="False" 
                        MaximumValue="999999999" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Label 
                    ID="Label10" runat="server" AssociatedControlID="EstimatedTimeSpentTextBox">
                        <asp:Literal ID="Literal24" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Estimated Time (Hours):") %>' /></asp:Label></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="EstimatedTimeSpentTextBox" 
                        runat="server" Text='<%# Bind("EstimatedTimeSpent") %>' 
                        ValidationGroup="ProjectTaskForm" Width="72px"></asp:TextBox>&nbsp; <asp:RangeValidator 
                        ID="RangeValidator5" runat="server" 
                        ControlToValidate="EstimatedTimeSpentTextBox" CssClass="ErrorMessage" 
                        Display="Dynamic" ErrorMessage="(Invalid Duration Value)" MaximumValue="50000" 
                        MinimumValue="0" Type="Double" ValidationGroup="ProjectTaskForm"></asp:RangeValidator></td></tr><tr><td 
                    align="left" class="FormViewSubHeader" colspan="4" style="height: 26px"><asp:Literal 
                    ID="Literal25" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Billing Rate") %>' /></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal26" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Work Type:") %>' /></td><td 
                    colspan="3"><asp:DropDownList ID="ddlAccountWorkTypeId" runat="server" 
                        AutoPostBack="True" DataSourceID="dsAccountWorkTypeObject" 
                        DataTextField="AccountWorkType" DataValueField="AccountWorkTypeId" 
                        OnSelectedIndexChanged="ddlAccountWorkTypeId_SelectedIndexChanged" 
                        Width="100px"></asp:DropDownList></td></tr><tr><td align="right" 
                    class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal27" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Employee Rate Currency:") %>' /></td><td 
                    style="width: 27%; height: 26px"><asp:DropDownList 
                        ID="ddlEmployeeRateCurrencyId" runat="server" 
                        DataSourceID="dsEmployeeRateCurrencyObject" DataTextField="CurrencyCode" 
                        DataValueField="AccountCurrencyId" Width="50px"></asp:DropDownList></td><td 
                    class="FormViewLabelCell" style="width: 18%; height: 26px;"><asp:Label 
                        ID="Label11" runat="server" AssociatedControlID="EmployeeRateTextBox">
                        <asp:Literal ID="Literal28" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Employee Rate:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 60%;"><asp:TextBox ID="EmployeeRateTextBox" 
                        runat="server" ValidationGroup="Insert" Width="56px"></asp:TextBox><asp:RangeValidator 
                        ID="RangeValidator7" runat="server" ControlToValidate="EmployeeRateTextBox" 
                        CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Numeric Required" 
                        Font-Bold="True" Font-Names="Verdana" Font-Size="X-Small" 
                        MaximumValue="999999999" MinimumValue="0" Type="Double" 
                        ValidationGroup="Insert"></asp:RangeValidator></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal29" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Billing Rate Currency:") %>' /></td><td 
                    style="width: 27%; height: 26px"><asp:DropDownList 
                        ID="ddlBillingRateCurrencyId" runat="server" 
                        DataSourceID="dsBillingRateCurrencyObject" DataTextField="CurrencyCode" 
                        DataValueField="AccountCurrencyId" Width="50px"></asp:DropDownList></td><td 
                    class="FormViewLabelCell" style="width: 18%; height: 26px;"><asp:Label 
                        ID="Label14" runat="server" AssociatedControlID="BillingRateTextBox">
                        <asp:Literal ID="Literal30" runat="server" 
                Text='<%# ResourceHelper.GetFromResource("Billing Rate:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 60%;"><asp:TextBox ID="BillingRateTextBox" 
                        runat="server" ValidationGroup="Update" Width="56px"></asp:TextBox><asp:RangeValidator 
                        ID="RangeValidator6" runat="server" ControlToValidate="BillingRateTextBox" 
                        CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Numeric Required" 
                        Font-Bold="True" Font-Names="Verdana" Font-Size="X-Small" 
                        MaximumValue="999999999" MinimumValue="0" Type="Double" 
                        ValidationGroup="Insert"></asp:RangeValidator><asp:LinkButton 
                        ID="lnkBillingRateHistory" runat="server" OnClick="LinkButton1_Click" 
                        Visible='<%# IIF(IsDBNULL(Eval("AccountBillingRateId")) orelse Eval("AccountBillingRateId")=0,False,True) %>'><asp:Literal ID="Literal65" 
                runat="server" Text="<%$ Resources:TimeLive.Web, Billing Rate History%> " /></asp:LinkButton></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 23%; height: 26px"><asp:Literal 
                    ID="Literal31" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Billing Rate Start Date:") %>' /></td><td 
                    style="width: 27%; height: 26px">&nbsp;<ew:CalendarPopup 
                        ID="BillingRateStartDateTextBox" runat="server" 
                        SelectedValue='<%# Bind("DeadlineDate") %>' SkinId="DatePicker"></ew:CalendarPopup></td><td 
                    class="FormViewLabelCell" style="width: 18%; height: 26px;"><asp:Literal 
                        ID="Literal32" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Billing Rate End Date:") %>' /></td><td 
                    style="height: 26px; width: 60%;">&nbsp;<ew:CalendarPopup 
                        ID="BillingRateEndDateTextBox" runat="server" 
                        SelectedValue='<%# Bind("DeadlineDate") %>' SkinId="DatePicker"></ew:CalendarPopup></td></tr><tr><td 
                    align="left" class="FormViewSubHeader" colspan="4" style="height: 26px"><asp:Literal 
                    ID="Literal67" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Attachment") %>' /></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 24%; height: 26px"><asp:Literal 
                    ID="Literal68" runat="server" 
                    Text="<%$ Resources:TimeLive.Web, Attachment Name:%> " /></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="AttachmentNameTextBox" 
                        runat="server" ValidationGroup="Attachment" Width="288px"></asp:TextBox></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 24%; height: 26px"><asp:Literal 
                    ID="Literal69" runat="server" 
                    Text="<%$ Resources:TimeLive.Web, File Path:%> " /></td><td colspan="3" 
                    style="height: 26px"><asp:FileUpload ID="AttachmentFileUpload" runat="server" 
                        Width="500px" /></td></tr><tr><td align="right" 
                    style="width: 23%; height: 25px"></td><td colspan="3" style="height: 25px"><asp:Button 
                        ID="btnUpdate" runat="server" CommandName="Update" 
                        Text="<%$ Resources:TimeLive.Web, Update_text%> " 
                        ValidationGroup="ProjectTaskForm" Width="68px" /><asp:Button ID="btnCancel" 
                        runat="server" CommandName="Cancel" OnClick="btnCancel_Click" 
                        Text="<%$ Resources:TimeLive.Web, Cancel_text%> " 
                        ValidationGroup="ProjectTaskForm" Width="68px" /></td></tr></table>
    </EditItemTemplate>
    <InsertItemTemplate>
        <table style="width: 100%" class="xview">
            <tr>
                <td class="caption" colspan="4" style="height: 21px"><asp:Literal ID="Literal32" runat="server" Text='<%# ResourceHelper.GetFromResource("Add Task") %>' /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="4" style="height: 21px"><asp:Literal ID="Literal33" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Task") %>' /></td>
            </tr>
            <%If CType(Me.FormView1.FindControl("lblProjectTeamException"), Label).Visible = True Then%>
            <tr>
                <td colspan="4" style="height: 26px"><asp:Label ID="lblProjectTeamExceptionHeader" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="10pt" ForeColor="Red">
                <asp:Literal ID="Literal66" runat="server" Text="<%$ Resources:TimeLive.Web, strmsg %>" /></asp:Label></td></tr><%End If%><tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal34" runat="server" Text='<%# ResourceHelper.GetFromResource("Project:") %>' /></td>
                <td 
                    colspan="3" style="height: 26px"><asp:DropDownList ID="ddlAccountProjectId" runat="server" DataSource='<%# Eval("ParentAccountProjectTaskId") %>'
                        DataSourceID="dsAccountProjectObjectInsert" DataTextField="ProjectName" DataValueField="AccountProjectId"
                        SelectedValue='<%# Bind("AccountProjectId") %>' Width="224px" AutoPostBack="True" OnSelectedIndexChanged="ddlAccountProjectId_SelectedIndexChanged" Enabled='<%# IIf(Me.Request.QueryString("AccountProjectId") Is Nothing,True,False) %>'>

                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="height: 26px; width: 24%;" class="FormViewLabelCell" align="right">
                    <asp:Literal ID="Literal35" runat="server" Text='<%# ResourceHelper.GetFromResource("Parent Task:") %>' /></td>
                <td 
                    colspan="3" style="height: 26px"><asp:DropDownList ID="ddlParentAccountProjectTaskId" runat="server" 
                        DataSourceID="dsParentAccountProjectTaskObject" DataTextField="TaskName" DataValueField="AccountProjectTaskId"
                         Width="352px" AppendDataBoundItems="True">
                    </asp:DropDownList>&nbsp; </td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal36" runat="server" Text='<%# ResourceHelper.GetFromResource("Milestone:") %>' /></td>
                <td 
                    colspan="3" style="height: 26px"><asp:DropDownList ID="ddlAccountProjectMilestoneId" runat="server" Width="224px"  DataSourceID="dsAccountProjectMilestone" DataTextField="MilestoneDescription" DataValueField="AccountProjectMilestoneId">
                    </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlAccountProjectMilestoneId"
                        ErrorMessage="*" InitialValue="0" CssClass="ErrorMessage"></asp:RequiredFieldValidator>&nbsp; </td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="TextBox1">
                    <asp:Literal ID="Literal37" runat="server" Text='<%# ResourceHelper.GetFromResource("Task Code:") %>' /></asp:Label></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TaskCode") %>' MaxLength="15"></asp:TextBox></td></tr><tr>
                <td style="height: 26px; width: 24%;" class="FormViewLabelCell" align="right">
                                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="Label2" runat="server" AssociatedControlID="TaskNameTextBox">
                  <asp:Literal ID="Literal38" runat="server" Text='<%# ResourceHelper.GetFromResource("Task Name:") %>' /></asp:Label></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="TaskNameTextBox" runat="server" Text='<%# Bind("TaskName") %>' Width="320px" MaxLength="100"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TaskNameTextBox"
                        Display="Dynamic" ErrorMessage="*" Width="8px" CssClass="ErrorMessage" ValidationGroup="ProjectTaskInsert"></asp:RequiredFieldValidator></td></tr><tr>
                <td style="height: 26px; width: 24%;" class="FormViewLabelCell" align="right">
                                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="Label3" runat="server" AssociatedControlID="TaskDescriptionTextBox">
                  <asp:Literal ID="Literal39" runat="server" Text='<%# ResourceHelper.GetFromResource("Task Description:") %>' /></asp:Label></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="TaskDescriptionTextBox" runat="server" Text='<%# Bind("TaskDescription") %>' Width="450px" Rows="6" TextMode="MultiLine"></asp:TextBox><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TaskDescriptionTextBox"
                        Display="Dynamic" ErrorMessage="* Description field is required" Width="198px" CssClass="ErrorMessage" ValidationGroup="ProjectTaskInsert"></asp:RequiredFieldValidator><asp:CustomValidator
                            ID="CustomValidator3" runat="server" CssClass="ErrorMessage" Display="Dynamic"
                            ErrorMessage="Value exceeds maximum number of digits." OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 23px">
                    <span 
                        class=reqasterisk>*</span> <asp:Literal ID="Literal40" runat="server" Text='<%# ResourceHelper.GetFromResource("Task Type:") %>' /></td>
                <td style="width: 26%; height: 23px">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsAccountProjectTaskTypeObjectInsert"
                        DataTextField="TaskType" DataValueField="AccountTaskTypeId" SelectedValue='<%# Bind("AccountTaskTypeId") %>' Width="166px">
                    </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1"
                        Display="Dynamic" ErrorMessage="*" Width="8px"></asp:RequiredFieldValidator></td><td class="FormViewlabelCell" style="width: 17%;" align="right">
                    
                    
<asp:Label ID="Label5" runat="server" AssociatedControlID="DurationTextBox">
                    <asp:Literal ID="Literal41" runat="server" Text='<%# ResourceHelper.GetFromResource("Duration:") %>' /></asp:Label></td><td 
                    style="width: 325px;">&nbsp;<asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' Width="30%" MaxLength="10"></asp:TextBox>&nbsp;<asp:Label 
                        ID="lblSystemDurationUnit" runat="server" Text="Hours"></asp:Label><asp:DropDownList 
                        ID="DropDownList3" runat="server" DataSourceID="dsSystemDurationUnit"
                        DataTextField="SystemDurationUnit" DataValueField="SystemDurationUnit" 
                        SelectedValue='<%# Bind("DurationUnit") %>' Width="30%" Visible="False"></asp:DropDownList>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="DurationTextBox"
                        CssClass="ErrorMessage" ErrorMessage="(Inv. Val)" MaximumValue="50000"
                        MinimumValue="0" Type="Double" Width="30%"></asp:RangeValidator></td></tr><tr><td align="right" class="FormViewLabelCell" style="width: 24%; height: 15px">
                    
<asp:Label ID="Label8" runat="server" AssociatedControlID="CompletedPercentTextBox">
                    <asp:Literal ID="Literal42" runat="server" Text='<%# ResourceHelper.GetFromResource("Completed%:") %>' /></asp:Label></td><td style="width: 26%; height: 15px">
                    <asp:TextBox ID="CompletedPercentTextBox" runat="server" Text='<%# Bind("CompletedPercent") %>' Width="76px"></asp:TextBox></td><td class="FormViewlabelCell" style="width: 17%; height: 15px" align="right">
                    &nbsp;</td><td 
                    style="height: 15px; width: 325px;">&nbsp;</td></tr><tr><td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    Start Date:</td><td><ew:CalendarPopup 
                        ID="StartDate" runat="server" SelectedDate='<%# Bind("StartDate") %>' 
                        SkinId="DatePicker" 
                        VisibleDate="12/20/2011 15:32:08" Width="125px"></ew:CalendarPopup></td>
                <td class="FormViewlabelCell" style="width: 17%; height: 26px" align="right">
                    <asp:Literal 
                        ID="Literal43" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Deadline:") %>' /></td><td 
                    style="height: 26px; width: 325px;"><ew:CalendarPopup ID="DeadlineDate" 
                        runat="server" SelectedDate='<%# Bind("DeadlineDate") %>' SkinId="DatePicker" 
                        Width="125px"></ew:CalendarPopup></td></tr><tr><td align="right" 
                    class="FormViewLabelCell" style="width: 24%; height: 26px"><asp:Literal 
                    ID="Literal44" runat="server" 
                    Text='<%# ResourceHelper.GetFromResource("Task Status:") %>' /></td><td 
                    style="width: 26%; height: 26px"><asp:DropDownList ID="DropDownList4" 
                        runat="server" DataSourceID="dsProjectTaskStatusObjectInsert" 
                        DataTextField="Status" DataValueField="AccountStatusId" 
                        SelectedValue='<%# Bind("TaskStatusId") %>'></asp:DropDownList></td><td 
                    align="right" class="FormViewlabelCell" style="width: 17%; height: 26px"><asp:Literal 
                        ID="Literal45" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Priority:") %>' /></td><td 
                    style="height: 26px; width: 325px;">&nbsp;<asp:DropDownList ID="DropDownList5" 
                        runat="server" DataSourceID="dsAccountPriorityObjectInsert" 
                        DataTextField="Priority" DataValueField="AccountPriorityId" 
                        SelectedValue='<%# Bind("AccountPriorityId") %>'></asp:DropDownList></td></tr><tr><td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal46" runat="server" Text='<%# ResourceHelper.GetFromResource("All Employee Task:") %>' /></td>
                <td style="width: 26%; height: 26px">
                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("IsForAllEmployees") %>' /></td>
                <td class="FormViewlabelCell" style="width: 17%; height: 26px" align="right">
                    <asp:Literal ID="Literal47" runat="server" Text='<%# ResourceHelper.GetFromResource("All Project Task:") %>' /></td>
                <td 
                    style="height: 26px; width: 325px;">&nbsp;<asp:CheckBox ID="CheckBox4" runat="server" Checked='<%# Bind("IsForAllProjectTask") %>' Width="107px" /></td>
            </tr>
            <tr><td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal48" runat="server" Text='<%# ResourceHelper.GetFromResource("Completed:") %>' /></td>
                <td style="width: 26%; height: 26px">
                    <asp:CheckBox ID="CompletedCheckBox" runat="server" Checked='<%# Bind("Completed") %>' /></td>
                <td class="FormViewlabelCell" style="width: 17%; height: 26px" align="right">
                    <asp:Literal ID="Literal49" runat="server" Text='<%# ResourceHelper.GetFromResource("Parent Task:") %>' /></td>
                <td 
                    style="height: 26px; width: 325px;">&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsParentTask") %>' Width="108px" /></td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal50" runat="server" Text='<%# ResourceHelper.GetFromResource("Billable:") %>' /></td>
                <td 
                    colspan="3" style="height: 26px"><asp:CheckBox ID="chkIsBillable" runat="server" Checked='<%# Bind("IsBillable") %>' /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="4" style="height: 21px"><asp:Literal ID="Literal51" runat="server" Text='<%# ResourceHelper.GetFromResource("Assign To") %>' /></td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal52" runat="server" Text='<%# ResourceHelper.GetFromResource("Assign To") %>' />:</td><td 
                    colspan="3" style="height: 26px"><asp:ListBox ID="ListBoxEmployees" runat="server" DataSourceID="dsAccountProjectTaskInsert"
                        DataTextField="FullName" DataValueField="AccountEmployeeId" SelectionMode="Multiple"
                        Width="424px"></asp:ListBox><br />
                    <asp:CustomValidator runat="server" id="CustomValidator1"
        ControlToValidate="ListBoxEmployees"
        ErrorMessage="Select Assigned To:" CssClass="ErrorMessage" OnServerValidate="ValidateListAndCheck" EnableClientScript="False" Display="Dynamic" ValidateEmptyText="True" ValidationGroup="ProjectTaskInsert" /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="4" style="height: 21px"><asp:Literal ID="Literal53" runat="server" Text='<%# ResourceHelper.GetFromResource("Estimates") %>' /></td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal54" runat="server" Text='<%# ResourceHelper.GetFromResource("Estimated Cost:") %>' /></td>
                <td 
                    colspan="3" style="height: 26px"><asp:DropDownList ID="ddlEstimatedCurrencyId" runat="server" DataSourceID="dsEstimatedCurrencyObjectInsert"
                        DataTextField="CurrencyCode" DataValueField="AccountCurrencyId" Width="75px">
                    </asp:DropDownList>
                    <asp:TextBox ID="EstimatedCostTextBox" runat="server" Text='<%# Bind("EstimatedCost") %>' Width="94px"></asp:TextBox><asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="EstimatedCostTextBox"
                        CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Numeric Required"
                        Font-Bold="False" MaximumValue="999999999" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    
<asp:Label ID="Label9" runat="server" AssociatedControlID="EstimatedTimeSpentTextBox">
                    <asp:Literal ID="Literal55" runat="server" Text="<%$ Resources:TimeLive.Web, Estimated Time (Hours):%> " /></asp:Label></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="EstimatedTimeSpentTextBox" runat="server" Text='<%# Bind("EstimatedTimeSpent") %>'
                        Width="72px"></asp:TextBox>&nbsp; <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="EstimatedTimeSpentTextBox"
                        CssClass="ErrorMessage" ErrorMessage="(Invalid Duration Value)" MaximumValue="50000"
                        MinimumValue="0" Type="Double" Display="Dynamic"></asp:RangeValidator></td></tr><tr>
                <td 
                    align="left" class="FormViewSubHeader" colspan="4" style="height: 26px"><asp:Literal ID="Literal56" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Rate") %>' /></td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal57" runat="server" Text='<%# ResourceHelper.GetFromResource("Work Type:") %>' /></td>
                <td 
                    colspan="3" style="height: 26px"><asp:DropDownList ID="ddlAccountWorkTypeId" runat="server" DataSourceID="dsAccountWorkTypeObject"
                        DataTextField="AccountWorkType" DataValueField="AccountWorkTypeId" Width="100px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal58" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Rate Currency:") %>' /></td>
                <td style="width: 26%; height: 26px">
                    <asp:DropDownList ID="ddlEmployeeRateCurrencyId" runat="server" DataSourceID="dsAccountCurrencyObjectInsert"
                        DataTextField="CurrencyCode" DataValueField="AccountCurrencyId" Width="50px">
                    </asp:DropDownList></td>
                <td class="FormViewlabelCell" style="width: 17%;" align="right">
                    
<asp:Label ID="Label12" runat="server" AssociatedControlID="EmployeeRateTextBox">
                    <asp:Literal ID="Literal59" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Rate:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 325px;"><asp:TextBox ID="EmployeeRateTextBox" runat="server" ValidationGroup="Insert" Width="56px"></asp:TextBox><asp:RangeValidator ID="RangeValidator7" runat="server" ControlToValidate="BillingRateTextBox"
                        CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Numeric Required" Font-Bold="True"
                        Font-Names="Verdana" Font-Size="X-Small" MaximumValue="999999999" MinimumValue="0"
                        Type="Double" ValidationGroup="Insert"></asp:RangeValidator></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal60" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Rate Currency:") %>' /></td>
                <td style="width: 26%; height: 26px">
                    <asp:DropDownList ID="ddlBillingRateCurrencyId" runat="server" DataSourceID="dsAccountCurrencyObjectInsert"
                        DataTextField="CurrencyCode" DataValueField="AccountCurrencyId" Width="50px">
                    </asp:DropDownList></td>
                <td class="FormViewlabelCell" style="width: 17%;" align="right">
                    
<asp:Label ID="Label13" runat="server" AssociatedControlID="BillingRateTextBox">
                    <asp:Literal ID="Literal61" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Rate:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 325px;"><asp:TextBox ID="BillingRateTextBox" runat="server" ValidationGroup="Insert" Width="56px"></asp:TextBox><asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="BillingRateTextBox"
                        CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Numeric Required" Font-Bold="True"
                        Font-Names="Verdana" Font-Size="X-Small" MaximumValue="999999999" MinimumValue="0"
                        Type="Double" ValidationGroup="Insert"></asp:RangeValidator></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 24%; height: 26px">
                    <asp:Literal ID="Literal62" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Rate Start Date:") %>' /></td>
                <td style="width: 26%; height: 26px"><ew:CalendarPopup ID="BillingRateStartDateTextBox" runat="server" SkinId="DatePicker" PostedDate="" SelectedValue="10/17/2008 12:58:36" UpperBoundDate="12/31/9999 23:59:59">
                </ew:CalendarPopup>
                </td>
                <td class="FormViewlabelCell" style="width: 17%;" align="right">
                    <asp:Literal ID="Literal63" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Rate End Date:") %>' /></td>
                <td 
                    style="height: 26px; width: 325px;"><ew:CalendarPopup ID="BillingRateEndDateTextBox" runat="server" SkinId="DatePicker" Nullable="True" Text="..."
                        UpperBoundDate="12/31/9999 23:59:59" VisibleDate="">
                    </ew:CalendarPopup>
                </td>
            </tr>
            <tr><td align="left" class="FormViewSubHeader" 
                    style="height: 26px" colspan="4"><asp:Literal ID="Literal67" runat="server" 
                        Text='<%# ResourceHelper.GetFromResource("Attachment") %>' /></td>
                </tr><tr><td align="right" class="FormViewLabelCell" 
                    style="width: 24%; height: 26px"><asp:Literal ID="Literal1" runat="server" 
                    Text="<%$ Resources:TimeLive.Web, Attachment Name:%> " /></td><td 
                    colspan="3" style="height: 26px"><asp:TextBox ID="AttachmentNameTextBox" 
                        runat="server" ValidationGroup="Attachment" Width="288px"></asp:TextBox></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 24%; height: 26px"><asp:Literal 
                    ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, File Path:%> " /></td><td 
                    colspan="3" style="height: 26px"><asp:FileUpload ID="AttachmentFileUpload" 
                        runat="server" Width="500px" /></td></tr><tr><td align="right" 
                    class="FormViewLabelCell" style="width: 24%; height: 26px"></td><td 
                    colspan="3" style="height: 26px"><asp:Button ID="Add" runat="server" 
                        CommandName="Insert" Text="<%$ Resources:TimeLive.Web, Add_text%> " 
                        ValidationGroup="ProjectTaskInsert" Width="55px" /><asp:Button 
                        ID="btnCancel" runat="server" CommandName="Cancel" OnClick="btnCancel_Click" 
                        Text="<%$ Resources:TimeLive.Web, Cancel_text%> " ValidationGroup="Add" 
                        Width="55px" /><asp:Label ID="lblProjectTeamException" runat="server" 
                        CssClass="ErrorMessage" Visible="False"></asp:Label></td></tr></table></InsertItemTemplate><ItemTemplate>
        ProjectTaskId: <asp:Label ID="ProjectTaskIdLabel" runat="server" Text='<%# Eval("ProjectTaskId") %>'>
        </asp:Label><br />AccountProjectId: <asp:Label ID="AccountProjectIdLabel" runat="server" Text='<%# Bind("AccountProjectId") %>'>
        </asp:Label><br />ParentProjectTaskId: <asp:Label ID="ParentProjectTaskIdLabel" runat="server" Text='<%# Bind("ParentProjectTaskId") %>'>
        </asp:Label><br />TaskName: <asp:Label ID="TaskNameLabel" runat="server" Text='<%# Bind("TaskName") %>'></asp:Label><br />TaskDescription: <asp:Label ID="TaskDescriptionLabel" runat="server" Text='<%# Bind("TaskDescription") %>'>
        </asp:Label><br />AccountTaskTypeId: <asp:Label ID="AccountTaskTypeIdLabel" runat="server" Text='<%# Bind("AccountTaskTypeId") %>'>
        </asp:Label><br />Duration: <asp:Label ID="DurationLabel" runat="server" Text='<%# Bind("Duration") %>'></asp:Label><br />CompletedPercent: <asp:Label ID="CompletedPercentLabel" runat="server" Text='<%# Bind("CompletedPercent") %>'>
        </asp:Label><br />Completed: <asp:CheckBox ID="CompletedCheckBox" runat="server" Checked='<%# Bind("Completed") %>'
            Enabled="false" /><br />
        EstimatedTime: <asp:Label ID="EstimatedTimeLabel" runat="server" Text='<%# Bind("EstimatedTime") %>'>
        </asp:Label><br /><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit">
        </asp:LinkButton><asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            Text="Delete">
        </asp:LinkButton><asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New">
        </asp:LinkButton></ItemTemplate></asp:FormView><asp:ObjectDataSource ID="dsAccountWorkTypeObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountWorkTypesByAccountIdAndIsDisabled" TypeName="AccountWorkTypeBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="99" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountWorkTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsAccountProjectTaskTypeObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountTaskTypesByAccountIdAndAccountTaskTypeId" TypeName="AccountTaskTypeBLL" DeleteMethod="DeleteAccountTaskType" InsertMethod="AddAccountTaskType" UpdateMethod="UpdateAccountTaskType">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountTaskTypeId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="TaskType" Type="String" />
        <asp:Parameter Name="Original_AccountTaskTypeId" Type="Int32" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="AccountTaskTypeId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="TaskType" Type="String" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
    </InsertParameters>
</asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectTaskTypeObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountTaskTypesByAccountIdAndAccountTaskTypeId" TypeName="AccountTaskTypeBLL" DeleteMethod="DeleteAccountTaskType" InsertMethod="AddAccountTaskType" UpdateMethod="UpdateAccountTaskType">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountTaskTypeId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="TaskType" Type="String" />
                <asp:Parameter Name="Original_AccountTaskTypeId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
                <asp:Parameter Name="AccountTaskTypeId" Type="Int32" DefaultValue="0" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="TaskType" Type="String" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </InsertParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsParentAccountProjectTaskObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetParentAccountProjectTasksByAccountProjectId" TypeName="AccountProjectTaskBLL" DeleteMethod="DeleteAccountProjectType">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectTaskId" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="1" Name="AccountProjectId" Type="Int32" />
        <asp:Parameter Name="ParentAccountProjectTaskId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsSystemDurationUnit" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDurationUnit" TypeName="SystemDataBLL"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsProjectTaskStatusObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountsStatusForTaskByAccountStatusId" TypeName="AccountStatusBLL" DeleteMethod="DeleteAccountStatus" InsertMethod="AddAccountStatus" UpdateMethod="UpdateAccountStatus">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountStatusId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="StatusTypeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountStatusId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountStatusId" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="StatusTypeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsProjectTaskStatusObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountsStatusForTaskByAccountStatusId" TypeName="AccountStatusBLL" DeleteMethod="DeleteAccountStatus" InsertMethod="AddAccountStatus" UpdateMethod="UpdateAccountStatus">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountStatusId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="StatusTypeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountStatusId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountStatusId" Type="Int32" DefaultValue="0" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="StatusTypeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectMilestone" runat="server" DeleteMethod="DeleteAccountProjectMilestone"
            InsertMethod="AddAccountProjectMilestone" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectMilestonesByAccountProjectId" TypeName="AccountProjectMilestoneBLL"
            UpdateMethod="UpdateAccountProjectMilestone">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectMilestoneId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="MilestoneDescription" Type="String" />
                <asp:Parameter Name="MilestoneDate" Type="DateTime" />
                <asp:Parameter Name="Original_AccountProjectMilestoneId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="NotFixTable" Type="Boolean" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="MilestoneDescription" Type="String" />
                <asp:Parameter Name="MilestoneDate" Type="DateTime" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountPriorityObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountPrioritiesByAccountIdAndAccountPriorityId" TypeName="AccountPriorityBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountPriorityId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsAccountPriorityObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountPrioritiesByAccountIdAndAccountPriorityId" TypeName="AccountPriorityBLL" DeleteMethod="DeleteAccountPriority" InsertMethod="AddAccountPriority" UpdateMethod="UpdateAccountPriority">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountPriorityId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter Name="PriorityOrder" Type="Byte" />
                <asp:Parameter Name="Original_AccountPriorityId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountPriorityId" Type="Int32" DefaultValue="0" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter Name="PriorityOrder" Type="Byte" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectTask" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectEmployeesByAccountProjectIdAsView" TypeName="AccountProjectEmployeeBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsAccountProjectTaskInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectEmployeesByAccountProjectIdAsView" TypeName="AccountProjectEmployeeBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="AccountProjectTaskId" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:ObjectDataSource>
<asp:ObjectDataSource 
    ID="dsAccountProjectTaskFormObject" runat="server"
    InsertMethod="AddAccountProjectTask" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountProjectTypesByAccountProjectTaskId" TypeName="AccountProjectTaskBLL"
    UpdateMethod="UpdateAccountProjectTask"><UpdateParameters>
        <asp:QueryStringParameter DefaultValue="3" Name="AccountProjectId" QueryStringField="AccountProjectId"
            Type="Int32" />
        <asp:Parameter Name="ParentAccountProjectTaskId" Type="Int32" />
        <asp:Parameter Name="TaskName" Type="String" />
        <asp:Parameter Name="TaskDescription" Type="String" />
        <asp:Parameter Name="AccountTaskTypeId" Type="Int32" />
        <asp:Parameter Name="Duration" Type="Double" />
        <asp:Parameter Name="DurationUnit" Type="String" />
        <asp:Parameter Name="CompletedPercent" Type="Double" />
        <asp:Parameter Name="Completed" Type="Boolean" />
        <asp:Parameter Name="DeadlineDate" Type="DateTime" />
        <asp:Parameter Name="TaskStatusId" Type="Int32" />
        <asp:Parameter Name="AccountPriorityId" Type="Int32" />
        <asp:Parameter Name="IsForAllEmployees" Type="Boolean" />
        <asp:Parameter Name="IsParentTask" Type="Boolean" />
        <asp:Parameter Name="AccountProjectMilestoneId" Type="Int32" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="EstimatedCost" Type="Double" />
        <asp:Parameter Name="EstimatedTimeSpent" Type="Double" />
        <asp:Parameter Name="EstimatedTimeSpentUnit" Type="String" />
        <asp:Parameter Name="IsBillable" Type="Boolean" />
        <asp:Parameter Name="Original_AccountProjectTaskId" Type="Int32" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="TaskCode" Type="String" />
        <asp:Parameter Name="IsForAllProjectTask" Type="Boolean" />
        <asp:Parameter Name="EstimatedCurrencyId" Type="Int32" />
        <asp:Parameter Name="StartDate" Type="DateTime" />
        <asp:Parameter Name="original_Predecessors" Type="String" /></UpdateParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="34" Name="AccountProjectTaskId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:QueryStringParameter DefaultValue="3" Name="AccountProjectId" QueryStringField="AccountProjectId"
            Type="Int32" />
        <asp:Parameter Name="ParentAccountProjectTaskId" Type="Int32" />
        <asp:Parameter Name="TaskName" Type="String" />
        <asp:Parameter Name="TaskDescription" Type="String" />
        <asp:Parameter Name="AccountTaskTypeId" Type="Int32" />
        <asp:Parameter Name="Duration" Type="Double" />
        <asp:Parameter Name="DurationUnit" Type="String" />
        <asp:Parameter Name="CompletedPercent" Type="Double" />
        <asp:Parameter Name="Completed" Type="Boolean" />
        <asp:Parameter Name="DeadlineDate" Type="DateTime" />
        <asp:Parameter Name="TaskStatusId" Type="Int32" />
        <asp:Parameter Name="AccountPriorityId" Type="Int32" />
        <asp:Parameter Name="AccountProjectMilestoneId" Type="Int32" />
        <asp:Parameter Name="IsForAllEmployees" Type="Boolean" />
        <asp:Parameter Name="IsParentTask" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="EstimatedCost" Type="Double" />
        <asp:Parameter Name="EstimatedTimeSpent" Type="Double" />
        <asp:Parameter Name="EstimatedTimeSpentUnit" Type="String" />
        <asp:Parameter Name="IsBillable" Type="Boolean" />
        <asp:Parameter Name="TaskCode" Type="String" />
        <asp:Parameter Name="AccountBillingRateId" Type="Int32" />
        <asp:Parameter Name="IsForAllProjectTask" Type="Boolean" />
        <asp:Parameter Name="EstimatedCurrencyId" Type="Int32" />
        <asp:Parameter Name="StartDate" Type="DateTime" />
        <asp:Parameter Name="original_Predecessors" Type="String" /></InsertParameters>
    </asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsAccountProjectObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId" TypeName="AccountProjectBLL" DeleteMethod="DeleteAccountProject" InsertMethod="AddAccountProject" UpdateMethod="UpdateProjectDescription">
    <SelectParameters>
        <asp:Parameter Name="AccountProjectId" Type="Int32" />
        <asp:SessionParameter DefaultValue="99" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:QueryStringParameter Name="IsTemplate" QueryStringField="IsTemplate" Type="Boolean" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProjectDescription" Type="String" />
        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
    </UpdateParameters>
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
        <asp:Parameter Name="DeadLine" Type="DateTime" />
        <asp:Parameter Name="ProjectStatusId" Type="Int32" />
        <asp:Parameter Name="LeaderEmployeeId" Type="Int32" />
        <asp:Parameter Name="ProjectManagerEmployeeId" Type="Int32" />
        <asp:Parameter Name="TimeSheetApprovalTypeId" Type="Int32" />
        <asp:Parameter Name="ExpenseApprovalTypeId" Type="Int32" />
        <asp:Parameter Name="EstimatedDuration" Type="Int32" />
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
    </InsertParameters>
</asp:ObjectDataSource><asp:ObjectDataSource ID="dsAccountProjectObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId" TypeName="AccountProjectBLL" DeleteMethod="DeleteAccountProject" InsertMethod="AddAccountProject" UpdateMethod="UpdateProjectDescription">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="AccountProjectId" Type="Int32" />
        <asp:SessionParameter DefaultValue="99" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:QueryStringParameter DefaultValue="" Name="IsTemplate" QueryStringField="IsTemplate"
            Type="Boolean" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProjectDescription" Type="String" />
        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
    </UpdateParameters>
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
        <asp:Parameter Name="DeadLine" Type="DateTime" />
        <asp:Parameter Name="ProjectStatusId" Type="Int32" />
        <asp:Parameter Name="LeaderEmployeeId" Type="Int32" />
        <asp:Parameter Name="ProjectManagerEmployeeId" Type="Int32" />
        <asp:Parameter Name="TimeSheetApprovalTypeId" Type="Int32" />
        <asp:Parameter Name="ExpenseApprovalTypeId" Type="Int32" />
        <asp:Parameter Name="EstimatedDuration" Type="Int32" />
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
    </InsertParameters>
</asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountCurrencyObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="AccountCurrencyId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsBillingRateCurrencyObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsEmployeeRateCurrencyObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsEstimatedCurrencyObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsEstimatedCurrencyObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="AccountCurrencyId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
