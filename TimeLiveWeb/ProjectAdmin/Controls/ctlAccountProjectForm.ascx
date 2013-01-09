<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountProjectForm.ascx.vb" Inherits="ProjectAdmin_Controls_ctlAccountProjectForm" %>
<%@ Register Assembly="eWorld.UI"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountProjectId" DataSourceID="dsAccountProjectFormObject"
    DefaultMode="Insert" SkinID="formviewSkinEmployee" Width="95%" OnItemUpdating="FormView1_ItemUpdating" OnDataBound="FormView1_DataBound">
    <EditItemTemplate><table style="width: 100%" class="xview">
        <tr>
            <td class="caption" colspan="2" style="height: 21px">
                <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Information") %>' /></td>
        </tr>
        <tr>
            <td class="FormViewSubHeader" colspan="2" style="height: 21px;">
                <asp:Literal ID="Literal21" runat="server" Text='<%# ResourceHelper.GetFromResource("Project") %>' /></td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="height: 21px">
                            <asp:Button ID="btnRoleWiseBillingRate" runat="server"
                    Height="21px" Text="<%$ Resources:TimeLive.Web, Role Wise Billing Rate%> " OnClick="btnRoleWiseBillingRate_Click" /><asp:Button ID="btnProjectEmployees" runat="server"
                    Height="21px" Text="<%$ Resources:TimeLive.Web, Project Team%> " OnClick="btnProjectEmployees_Click" /></td>
        </tr>
        <tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                                    <SPAN 
                  class=reqasterisk>*</SPAN> <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Type") %>' />:</td>
            <td style="width: 70%; height: 26px;">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsProjectTypeObject"
                        DataTextField="ProjectType" DataValueField="AccountProjectTypeId" Width="300px">
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="*" Width="1px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                                    <SPAN 
                  class=reqasterisk>*</SPAN> <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name") %>' />:</td>
            <td style="width: 70%; height: 26px;">
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsClientObject"
                        DataTextField="PartyName" DataValueField="AccountPartyId" Width="300px">
                </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="DropDownList2" Display="Dynamic" ErrorMessage="*" Width="1px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Contact") %>' />:</td>
            <td style="width: 70%; height: 26px">
                <asp:DropDownList ID="ddlAccountPartyContactId" runat="server" AppendDataBoundItems="True" Width="250px">
                    <%--<asp:ListItem Value="0">&lt;Select&gt;</asp:ListItem>--%>
                    <asp:ListItem Value="0" Label ID="Label2" runat="server" Text="<%$ Resources:TimeLive.Web, Select%> "></asp:ListItem>
                </asp:DropDownList><aspToolkit:CascadingDropDown ID="CascadingDropDown1" runat="server"
                        LoadingText="Loading" ParentControlID="DropDownList2" PromptText="<%$ Resources:TimeLive.Web, Select%> "
                        ServiceMethod="GetAccountPartyContacts" ServicePath="~/Services/ProjectService.asmx"
                        TargetControlID="ddlAccountPartyContactId" Category="Client Contact">
                </aspToolkit:CascadingDropDown>
            </td>
        </tr>
        <tr>
            <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Department") %>' />:</td>
            <td style="width: 70%; height: 26px">
                <asp:DropDownList ID="ddlAccountPartyDepartmentId" runat="server" AppendDataBoundItems="True" Width="250px">
                    <%--<asp:ListItem Value="0">&lt;Select&gt;</asp:ListItem>--%>
                    <asp:ListItem Value="0" Label ID="Label1" runat="server" Text="<%$ Resources:TimeLive.Web, Select%> "></asp:ListItem>
                </asp:DropDownList><aspToolkit:CascadingDropDown ID="CascadingDropDown2" runat="server"
                        LoadingText="Loading" ParentControlID="DropDownList2" PromptText="<%$ Resources:TimeLive.Web, Select%> "
                        ServiceMethod="GetAccountPartyDepartments" ServicePath="~/Services/ProjectService.asmx"
                        TargetControlID="ddlAccountPartyDepartmentId" Category="Client Department">
                </aspToolkit:CascadingDropDown>
            </td>
        </tr>
        <tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Billing Type") %>' />:</td>
            <td style="width: 70%; height: 26px;">
                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsBillingTypeObject"
                        DataTextField="BillingType" DataValueField="AccountBillingTypeId" Width="115px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td class="FormViewLabelCell" style="width: 30%;" valign="middle" align="right">
                                                    <SPAN 
                  class=reqasterisk>*</SPAN> 
                  
<asp:Label ID="Label13" runat="server" AssociatedControlID="ProjectCodeTextBox">
                  <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Code") %>' />:</asp:Label></td><td style="width: 70%; height: 26px;">
                <asp:TextBox ID="ProjectCodeTextBox" runat="server" Text='<%# Bind("ProjectCode") %>' MaxLength="25" Width="115px"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator7" runat="server" ControlToValidate="ProjectCodeTextBox"
                    Display="Dynamic" ErrorMessage="*" Width="8px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td></tr><tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                                    <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="Label14" runat="server" AssociatedControlID="ProjectNameTextBox">
                  <asp:Literal ID="Literal8" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' />:</asp:Label></td><td style="width: 70%; height: 26px;">
                <asp:TextBox ID="ProjectNameTextBox" runat="server" Text='<%# Bind("ProjectName") %>' Width="472px" MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ControlToValidate="ProjectNameTextBox"
                    Display="Dynamic" ErrorMessage="*" Width="8px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td></tr><tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="top" align="right">
                                    <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="Label15" runat="server" AssociatedControlID="ProjectDescriptionTextBox">
                  <asp:Literal ID="Literal9" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Description") %>' />:</asp:Label></td><td style="width: 70%; height: 26px;">
                <asp:TextBox ID="ProjectDescriptionTextBox" runat="server" Text='<%# Bind("ProjectDescription") %>' Rows="3" TextMode="MultiLine" Width="472px" MaxLength="4000"></asp:TextBox><br /><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator5" runat="server" ControlToValidate="ProjectDescriptionTextBox"
                    Display="Dynamic" ErrorMessage="*" Width="16px" CssClass="ErrorMessage"></asp:RequiredFieldValidator><asp:CustomValidator
                        ID="CustomValidator1" runat="server" CssClass="ErrorMessage" Display="Dynamic"
                        ErrorMessage="Value exceeds maximum number of digits." OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator></td></tr><tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("Start Date:") %>' /></td>
            <td style="width: 70%; height: 26px;">
                <ew:CalendarPopup ID="StartDate" runat="server" SkinId="DatePicker" PostedDate="" SelectedDate="09/27/2006 17:09:05"
                        SelectedValue='<%# Bind("StartDate") %>' UpperBoundDate="12/31/9999 23:59:59">
                </ew:CalendarPopup></td></tr><tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                <asp:Literal ID="Literal11" runat="server" Text='<%# ResourceHelper.GetFromResource("Deadline") %>' />:</td><td style="width: 70%; height: 26px;">
                <ew:CalendarPopup ID="Deadline" runat="server" SkinId="DatePicker" SelectedDate="09/27/2006 17:09:05"
                        SelectedValue='<%# Bind("Deadline") %>'>
                </ew:CalendarPopup></td></tr><tr>
            <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                <asp:Literal ID="Literal12" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Status") %>' />:</td><td style="width: 70%; height: 26px">
                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="dsProjectStatusObject" DataTextField="Status" DataValueField="AccountStatusId" Width="115px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
               <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal13" runat="server" Text='<%# ResourceHelper.GetFromResource("Team Lead") %>' />:</td><td style="width: 70%; height: 26px;">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="dsEmployeeObject"
                        DataTextField="FullName" DataValueField="AccountEmployeeId" Width="208px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td class="FormViewLabelCell" style="width: 30%;" valign="middle" align="right">
                                                    <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal14" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Manager") %>' />:</td><td style="width: 70%; height: 26px"><asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="dsProjectManagerObject"
                        DataTextField="FullName" DataValueField="AccountEmployeeId" Width="208px">
            </asp:DropDownList><asp:RequiredFieldValidator ControlToValidate="DropDownList5" Display="Dynamic" ErrorMessage="*" ID="RequiredFieldValidator3" runat="server" Width="16px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td></tr><tr>
            <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                       <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal15" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Sheet Approval Type") %>' />:</td><td style="width: 70%; height: 26px">
                <asp:DropDownList ID="ddlTimeSheetApprovalTypeId" runat="server" DataSourceID="dsTimeSheetApprovalType"
                    DataTextField="ApprovalTypeName" DataValueField="AccountApprovalTypeId" AppendDataBoundItems="True">
                    <%--<asp:ListItem Selected="True" Value="0">Approval Not Required</asp:ListItem>--%>
                    <asp:ListItem Selected="True" Value="0" Label ID="Label3" runat="server" Text="<%$ Resources:TimeLive.Web, Approval Not Required%> "></asp:ListItem></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ControlToValidate="ddlTimeSheetApprovalTypeId" Display="Dynamic" ErrorMessage="*" Width="16px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td></tr><tr>
            <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
               <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal16" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Approval Type") %>' />:</td><td style="width: 70%; height: 26px">
                <asp:DropDownList ID="ddlExpenseApprovalTypeId" runat="server" DataSourceID="dsExpenseApprovalType"
                    DataTextField="ApprovalTypeName" DataValueField="AccountApprovalTypeId" AppendDataBoundItems="True">
                    <%--<asp:ListItem Selected="True" Value="0">Approval Not Required</asp:ListItem>--%>
                    <asp:ListItem Selected="True" Value="0" Label ID="Label4" runat="server" Text="<%$ Resources:TimeLive.Web, Approval Not Required%> "></asp:ListItem></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                    ControlToValidate="ddlExpenseApprovalTypeId" CssClass="ErrorMessage" Display="Dynamic"
                    ErrorMessage="*" Width="16px"></asp:RequiredFieldValidator></td></tr><tr>
            <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                
<asp:Label ID="Label16" runat="server" AssociatedControlID="EstimatedDurationTextBox">
                <asp:Literal ID="Literal17" runat="server" Text='<%# ResourceHelper.GetFromResource("Duration") %>' />:</asp:Label></td><td style="width: 70%; height: 26px;">
                <asp:TextBox ID="EstimatedDurationTextBox" runat="server" Text='<%# Bind("EstimatedDuration") %>'
                    Width="72px"></asp:TextBox>&nbsp; <asp:DropDownList ID="DropDownList7" runat="server" SelectedValue='<%# Bind("EstimatedDurationUnit") %>' DataSourceID="dsDurationObject" DataTextField="SystemDurationUnit" DataValueField="SystemDurationUnit">
                </asp:DropDownList>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="EstimatedDurationTextBox"
                    CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="(Invalid Duration Value)"
                    MaximumValue="50000" MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
            <td style="width: 30%;" valign="middle" class="FormViewLabelCell" align="right">
                
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="DefaultBillingRateTextBox">
                <asp:Literal ID="Literal18" runat="server" Text='<%# ResourceHelper.GetFromResource("Default Billing Rate") %>' />:</asp:Label></td><td style="width: 70%; height: 26px">
                <asp:TextBox ID="DefaultBillingRateTextBox" runat="server" Text='<%# Bind("DefaultBillingRate") %>' Width="72px"></asp:TextBox><br /><asp:RangeValidator
                    ID="RangeValidator1" runat="server" ControlToValidate="DefaultBillingRateTextBox"
                    Display="Dynamic" ErrorMessage="Value exceeds maximum number of digits." Font-Bold="False" MaximumValue="9999999" MinimumValue="0" Type="Double" CssClass="ErrorMessage"></asp:RangeValidator></td></tr><tr>
            <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                <asp:Literal ID="Literal19" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Rate Type") %>' />:</td><td style="width: 70%; height: 26px">
                <asp:DropDownList ID="ddlProjectBillingRateTypeId" runat="server"
                    DataSourceID="dsSystemProjectBillingRateType" DataTextField="SystemProjectBillingRateType"
                    DataValueField="SystemProjectBillingRateTypeId" Width="200px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="right" class="FormViewLabelCell" style="width: 30%" valign="middle"><asp:Literal ID="Literal41" runat="server" Text='<%# ResourceHelper.GetFromResource("Completed:") %>' /></td>
            <td style="width: 70%; height: 26px">
                <asp:CheckBox ID="chkCompleted" runat="server" Checked='<%# Bind("Completed") %>' /></td>
        </tr>
        <tr>
            <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                <asp:Literal ID="Literal20" runat="server" Text='<%# ResourceHelper.GetFromResource("Disabled:") %>' /></td>
            <td style="width: 70%; height: 26px">
                <asp:CheckBox ID="chkIsDisabled" runat="server" Checked='<%# Bind("IsDisabled") %>' /></td>
        </tr>
        <tr><td align="left" class="FormViewLabelCell" style="width: 30%" valign="middle">&nbsp;</td><td 
                style="width: 70%; height: 26px">&nbsp;</td></tr><tr>
                <td align="left" class="FormViewSubHeader" colspan="2" style="height: 26px"><asp:Literal 
                    ID="Literal67" runat="server" 
                    Text="Attachment" /></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 24%; height: 26px"><asp:Literal 
                    ID="Literal68" runat="server" 
                    Text="<%$ Resources:TimeLive.Web, Attachment Name:%> " /></td><td 
                    style="height: 26px"><asp:TextBox ID="AttachmentNameTextBox" 
                        runat="server" ValidationGroup="Attachment" Width="288px"></asp:TextBox></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 24%; height: 26px"><asp:Literal 
                    ID="Literal69" runat="server" 
                    Text="<%$ Resources:TimeLive.Web, File Path:%> " /></td><td 
                    style="height: 26px"><asp:FileUpload ID="AttachmentFileUpload" runat="server" 
                        Width="500px" /></td></tr>
                        <tr><td colspan="2"><asp:Table ID="CustomTableEdit" runat="server" Height="100%" 
                    Width="100%"></asp:Table></td></tr><tr>
            <td style="width: 30%;" align="right">
            </td>
            <td style="width: 70%; height: 26px;">
                <asp:Button ID="Update" runat="server" CommandName="Update" Text="<%$ Resources:TimeLive.Web, Update_text%> " Width="55px" OnClick="Update_Click" /><asp:Button ID="Cancel" runat="server" CommandName="Cancel" Text="<%$ Resources:TimeLive.Web, Cancel_text%> " Width="55px" OnClick="Cancel_Click" /></td>
        </tr>
    </table>
    </EditItemTemplate>
    <InsertItemTemplate>
        <table style="width: 100%" class="xview">
            <tr>
                <td class="caption" colspan="2" style="height: 21px">
                    <asp:Literal ID="Literal20" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Information") %>' /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="height: 21px">
                <asp:Literal ID="Literal21" runat="server" Text='<%# ResourceHelper.GetFromResource("Project") %>' /></td>
                    
            </tr>
            <%If Me.Request.QueryString("IsTemplate") <> "True" Then%>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                    <asp:Literal ID="Literal22" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Template:") %>' /></td>
                <td style="width: 70%; height: 26px">
                    <asp:DropDownList ID="ddlAccountProjectTemplateId" runat="server" DataSourceID="dsAccountProjectTemplatesObject"
                        DataTextField="ProjectName" DataValueField="AccountProjectId" SelectedValue='<%# Bind("AccountProjectTemplateId") %>' Width="300px" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlAccountProjectTemplateId_SelectedIndexChanged">
                        <asp:ListItem Value="0" Label ID="Label4" runat="server" Text="<%$ Resources:TimeLive.Web, Select%> "></asp:ListItem><%--<asp:ListItem Value="0">&lt;Select&gt;</asp:ListItem>--%></asp:DropDownList></td></tr><%End If %><tr>
                <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal23" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Type:") %>' /></td>
                <td style="width: 70%; height: 26px;">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsProjectTypeObjectInsert"
                        DataTextField="ProjectType" DataValueField="AccountProjectTypeId" SelectedValue='<%# Bind("AccountProjectTypeId") %>' Width="300px">
                    </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="*" Width="1px"></asp:RequiredFieldValidator></td></tr><tr>
                <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal24" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name:") %>' /></td>
                <td style="width: 70%; height: 26px;">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsClientObjectInsert"
                        DataTextField="PartyName" DataValueField="AccountPartyId" SelectedValue='<%# Bind("AccountClientId") %>' Width="300px">
                    </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="DropDownList2" Display="Dynamic" ErrorMessage="*" Width="1px"></asp:RequiredFieldValidator></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                    <asp:Literal ID="Literal25" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Contact:") %>' /></td>
                <td style="width: 70%; height: 26px">
                    <asp:DropDownList ID="ddlAccountPartyContactId" runat="server" SelectedValue='<%# Bind("AccountPartyContactId") %>' AppendDataBoundItems="True" Width="250px">
                        <asp:ListItem Selected="True" Value="0" Label ID="Label5" runat="server" Text="<%$ Resources:TimeLive.Web, Select%> "></asp:ListItem></asp:DropDownList><aspToolkit:CascadingDropDown ID="CascadingDropDown1" runat="server"
                        LoadingText="Loading" ParentControlID="DropDownList2" PromptText="<%$ Resources:TimeLive.Web, Select%> "
                        ServiceMethod="GetAccountPartyContacts" ServicePath="~/Services/ProjectService.asmx"
                        TargetControlID="ddlAccountPartyContactId" Category="Client Contact">
                    </aspToolkit:CascadingDropDown>
                </td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                    <asp:Literal ID="Literal26" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Department:") %>' /></td>
                <td style="width: 70%; height: 26px">
                    <asp:DropDownList ID="ddlAccountPartyDepartmentId" runat="server" SelectedValue='<%# Bind("AccountPartyDepartmentId") %>' AppendDataBoundItems="True" Width="250px">
                        <%--<asp:ListItem Selected="True" Value="0">&lt;Select&gt;</asp:ListItem>--%>
                        <asp:ListItem Selected="True" Value="0" Label ID="Label6" runat="server" Text="<%$ Resources:TimeLive.Web, Select%> "></asp:ListItem></asp:DropDownList><aspToolkit:CascadingDropDown ID="CascadingDropDown2" runat="server"
                        LoadingText="Loading" ParentControlID="DropDownList2" PromptText="<%$ Resources:TimeLive.Web, Select%> "
                        ServiceMethod="GetAccountPartyDepartments" ServicePath="~/Services/ProjectService.asmx"
                        TargetControlID="ddlAccountPartyDepartmentId" Category="Client Department">
                    </aspToolkit:CascadingDropDown>
                </td>
            </tr>
            <tr>
                <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                    <asp:Literal ID="Literal27" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Billing Type:") %>' /></td>
                <td style="width: 70%; height: 26px;">
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsBillingTypeObjectInsert"
                        DataTextField="BillingType" DataValueField="AccountBillingTypeId" SelectedValue='<%# Bind("ProjectBillingTypeId") %>' Width="120px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="FormViewLabelCell" style="width: 30%;"  align="right">
                                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="ProjectCodeTextBox">
                  <asp:Literal ID="Literal28" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Code:") %>' /></asp:Label></td><td style="width: 70%; height: 26px;">
                    <asp:TextBox 
                        ID="ProjectCodeTextBox" runat="server" Text='<%# Bind("ProjectCode") %>' 
                        MaxLength="25" Width="120px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator6" runat="server" ControlToValidate="ProjectCodeTextBox"
                        Display="Dynamic" ErrorMessage="*" Width="8px"></asp:RequiredFieldValidator><asp:CustomValidator 
                        ID="CustomValidator2" runat="server" ControlToValidate="ProjectCodeTextBox" 
                        CssClass="ErrorMessage" Display="Dynamic" 
                        ErrorMessage="Project Code already exist." 
                        OnServerValidate="CustomValidator2_ServerValidate" Width="185px"></asp:CustomValidator></td></tr><tr>
                <td style="width: 30%;" class="FormViewLabelCell"  align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="Label7" runat="server" AssociatedControlID="ProjectNameTextBox">
                  <asp:Literal ID="Literal29" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name:") %>' /></asp:Label></td><td style="width: 70%; height: 26px;">
                    <asp:TextBox ID="ProjectNameTextBox" runat="server" Text='<%# Bind("ProjectName") %>' Width="472px" MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" runat="server" ControlToValidate="ProjectNameTextBox"
                        Display="Dynamic" ErrorMessage="*" Width="8px"></asp:RequiredFieldValidator></td></tr><tr>
                <td style="width: 30%;" class="FormViewLabelCell" valign="top" align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="Label8" runat="server" AssociatedControlID="ProjectDescriptionTextBox">
                  <asp:Literal ID="Literal30" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Description:") %>' /></asp:Label></td><td style="width: 70%; height: 26px;">
                    <asp:TextBox ID="ProjectDescriptionTextBox" runat="server" Text='<%# Bind("ProjectDescription") %>' Rows="3" TextMode="MultiLine" Width="472px"></asp:TextBox><br /><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator5" runat="server" ControlToValidate="ProjectDescriptionTextBox"
                        Display="Dynamic" ErrorMessage="*" Width="16px" CssClass="ErrorMessage" EnableClientScript="False"></asp:RequiredFieldValidator><asp:CustomValidator ID="CustomValidator1"
                            runat="server" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Value exceeds maximum number of digits."
                            OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator></td></tr><tr>
                <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                    <asp:Literal ID="Literal31" runat="server" Text='<%# ResourceHelper.GetFromResource("Start Date:") %>' /></td>
                <td style="width: 70%; height: 26px;">
                    <ew:CalendarPopup ID="StartDate" runat="server" SkinId="DatePicker" PostedDate=""
                        SelectedValue='<%# Bind("StartDate") %>'  >
                    </ew:CalendarPopup></td></tr><tr>
                <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                    <asp:Literal ID="Literal32" runat="server" Text='<%# ResourceHelper.GetFromResource("Deadline:") %>' /></td>
                <td style="width: 70%; height: 26px;">
                    <ew:CalendarPopup ID="Deadline" runat="server" PostedDate="" SkinId="DatePicker"
                        SelectedValue='<%# Bind("Deadline") %>' >
                    </ew:CalendarPopup></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                    <asp:Literal ID="Literal33" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Status:") %>' /></td>
                <td style="width: 70%; height: 26px">
                    <asp:DropDownList ID="DropDownList6" runat="server" SelectedValue='<%# Bind("ProjectStatusId") %>' DataSourceID="dsProjectStatusObjectInsert" DataTextField="Status" DataValueField="AccountStatusId" Width="120px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                    <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal34" runat="server" Text='<%# ResourceHelper.GetFromResource("Team Lead:") %>' /></td>
                <td style="width: 70%; height: 26px;">
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="dsEmployeeObjectInsert"
                        DataTextField="FullName" DataValueField="AccountEmployeeId" SelectedValue='<%# Bind("LeaderEmployeeId") %>' Width="208px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="FormViewLabelCell" style="width: 30%;" valign="middle" align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal35" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Manager:") %>' /></td>
                <td style="width: 70%; height: 26px">
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="dsEmployeeObjectInsert"
                        DataTextField="FullName" DataValueField="AccountEmployeeId" SelectedValue='<%# Bind("ProjectManagerEmployeeId") %>' Width="208px">
                    </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList5"
                        Display="Dynamic" ErrorMessage="*" Width="16px" CssClass="ErrorMessage" EnableClientScript="False"></asp:RequiredFieldValidator></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                           <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal36" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Sheet Approval Type:") %>' /></td>
                <td style="width: 70%; height: 26px">
                    <asp:DropDownList ID="ddlTimeSheetApprovalTypeId" runat="server" DataSourceID="dsTimeSheetApprovalType"
                        DataTextField="ApprovalTypeName" DataValueField="AccountApprovalTypeId"
                        SelectedValue='<%# Bind("TimeSheetApprovalTypeId") %>' AppendDataBoundItems="True">
                        <asp:ListItem Value="0" Label ID="Label9" runat="server" Text="<%$ Resources:TimeLive.Web, Approval Not Required%> "></asp:ListItem><%--<asp:ListItem Value="0">Approval Not Required</asp:ListItem>--%></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                        ControlToValidate="ddlTimeSheetApprovalTypeId" Display="Dynamic" ErrorMessage="*" Width="16px" CssClass="ErrorMessage" EnableClientScript="False"></asp:RequiredFieldValidator></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                   <SPAN 
                  class=reqasterisk>*</SPAN><asp:Literal ID="Literal37" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Approval Type:") %>' /></td>
                <td style="width: 70%; height: 26px">
                    <asp:DropDownList ID="ddlExpenseApprovalTypeId" runat="server" DataSourceID="dsExpenseApprovalType"
                        DataTextField="ApprovalTypeName" DataValueField="AccountApprovalTypeId"
                        SelectedValue='<%# Bind("ExpenseApprovalTypeId") %>' AppendDataBoundItems="True">
                        <asp:ListItem Value="0" Label ID="Label10" runat="server" Text="<%$ Resources:TimeLive.Web, Approval Not Required%> "></asp:ListItem><%--<asp:ListItem Value="0">Approval Not Required</asp:ListItem>--%></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                        ControlToValidate="ddlExpenseApprovalTypeId" CssClass="ErrorMessage" Display="Dynamic"
                        EnableClientScript="False" ErrorMessage="*" Width="16px"></asp:RequiredFieldValidator></td></tr><tr>
                <td style="width: 30%;" class="FormViewLabelCell" valign="middle" align="right">
                   
                   
<asp:Label ID="Label11" runat="server" AssociatedControlID="EstimatedDurationTextBox">
                    <asp:Literal ID="Literal38" runat="server" Text='<%# ResourceHelper.GetFromResource("Duration") %>' />:</asp:Label></td><td style="width: 70%; height: 26px;">
                    <asp:TextBox ID="EstimatedDurationTextBox" runat="server" Text='<%# Bind("EstimatedDuration") %>'
                        Width="72px"></asp:TextBox>&nbsp; <asp:DropDownList ID="DropDownList7" runat="server" SelectedValue='<%# Bind("EstimatedDurationUnit") %>' DataSourceID="dsDurationObject" DataTextField="SystemDurationUnit" DataValueField="SystemDurationUnit">
                    </asp:DropDownList>&nbsp; <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="EstimatedDurationTextBox"
                        CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="(Invalid Duration Value)"
                        MaximumValue="50000" MinimumValue="0" Type="Double" EnableClientScript="False"></asp:RangeValidator></td></tr><tr>
                <td style="width: 30%;" valign="middle" class="FormViewLabelCell" align="right">
                    
<asp:Label ID="Label12" runat="server" AssociatedControlID="DefaultBillingRateTextBox">
                    <asp:Literal ID="Literal39" runat="server" Text='<%# ResourceHelper.GetFromResource("Default Billing Rate") %>' />:</asp:Label></td><td style="width: 70%; height: 26px">
                    <asp:TextBox ID="DefaultBillingRateTextBox" runat="server" Text='<%# Bind("DefaultBillingRate","{0:N}") %>' Width="72px"></asp:TextBox><br /><asp:RangeValidator
                        ID="RangeValidator1" runat="server" ControlToValidate="DefaultBillingRateTextBox"
                        Display="Dynamic" ErrorMessage="Value exceeds maximum number of digits." Font-Bold="False" MaximumValue="9999999" MinimumValue="0" Type="Integer" CssClass="ErrorMessage" EnableClientScript="False"></asp:RangeValidator></td></tr><tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%;" valign="middle">
                    <asp:Literal ID="Literal40" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Billing Rate Type") %>' />:</td><td style="width: 70%; height: 26px">
                    <asp:DropDownList ID="ddlProjectBillingRateTypeId" runat="server" DataSourceID="dsSystemProjectBillingRateType"
                        DataTextField="SystemProjectBillingRateType" DataValueField="SystemProjectBillingRateTypeId"
                        SelectedValue='<%# Bind("ProjectBillingRateTypeId") %>'>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%" valign="middle"><asp:Literal ID="Literal41" runat="server" Text='<%# ResourceHelper.GetFromResource("Completed:") %>' /></td>
                <td style="width: 70%; height: 26px">
                    <asp:CheckBox ID="chkCompleted" runat="server" Checked='<%# Bind("Completed") %>' /></td>
            </tr>
            <tr><td 
                    align="left" class="FormViewSubHeader" colspan="2" style="height: 26px"><asp:Literal 
                    ID="Literal67" runat="server" 
                    Text="Attachment" /></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 24%; height: 26px"><asp:Literal 
                    ID="Literal68" runat="server" 
                    Text="<%$ Resources:TimeLive.Web, Attachment Name:%> " /></td><td 
                    style="height: 26px"><asp:TextBox ID="AttachmentNameTextBox" 
                        runat="server" ValidationGroup="Attachment" Width="288px"></asp:TextBox></td></tr><tr><td 
                    align="right" class="FormViewLabelCell" style="width: 24%; height: 26px"><asp:Literal 
                    ID="Literal69" runat="server" 
                    Text="<%$ Resources:TimeLive.Web, File Path:%> " /></td><td 
                    style="height: 26px"><asp:FileUpload ID="AttachmentFileUpload" runat="server" 
                        Width="500px" /></td></tr>
                        <tr><td colspan="2"><asp:Table ID="CustomTable" runat="server" Height="100%" 
                        Width="100%"></asp:Table></td></tr><tr>
                <td style="width: 30%; height: 26px;" align="right">
                </td>
                <td>
                    <asp:Button ID="Add" runat="server" CommandName="Insert" Text= "<%$ Resources:TimeLive.Web, Add_text%> "  Width="64px" OnClick="Add_Click" /><asp:Button
                        ID="Cancel" runat="server" CommandName="Cancel" OnClick="Cancel_Click" Text="<%$ Resources:TimeLive.Web, Cancel_text%> "
                        ValidationGroup="Add" Width="64px" /></td>
            </tr>
        </table>
    </InsertItemTemplate>
    <ItemTemplate>
        AccountProjectId: <asp:Label ID="AccountProjectIdLabel" runat="server" Text='<%# Eval("AccountProjectId") %>'></asp:Label><br />AccountId: <asp:Label ID="AccountIdLabel" runat="server" Text='<%# Bind("AccountId") %>'></asp:Label><br />AccountProjectTypeId: <asp:Label ID="AccountProjectTypeIdLabel" runat="server" Text='<%# Bind("AccountProjectTypeId") %>'></asp:Label><br />AccountClientId: <asp:Label ID="AccountClientIdLabel" runat="server" Text='<%# Bind("AccountClientId") %>'></asp:Label><br />ProjectBillingTypeId: <asp:Label ID="ProjectBillingTypeIdLabel" runat="server" Text='<%# Bind("ProjectBillingTypeId") %>'></asp:Label><br />ProjectName: <asp:Label ID="ProjectNameLabel" runat="server" Text='<%# Bind("ProjectName") %>'></asp:Label><br />ProjectDescription: <asp:Label ID="ProjectDescriptionLabel" runat="server" Text='<%# Bind("ProjectDescription") %>'></asp:Label><br />StartDate: <asp:Label ID="StartDateLabel" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label><br />Deadline: <asp:Label ID="DeadlineLabel" runat="server" Text='<%# Bind("Deadline") %>'></asp:Label><br />LeaderEmployeeId: <asp:Label ID="LeaderEmployeeIdLabel" runat="server" Text='<%# Bind("LeaderEmployeeId") %>'></asp:Label><br />EstimatedTime: <asp:Label ID="EstimatedTimeLabel" runat="server" Text='<%# Bind("EstimatedTime") %>'></asp:Label><br /><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit"></asp:LinkButton><asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            Text="Delete"></asp:LinkButton><asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New"></asp:LinkButton></ItemTemplate></asp:FormView><asp:ObjectDataSource ID="dsProjectTypeObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountProjectTypesByAccountIdAndIsDisabled" TypeName="AccountProjectTypeBLL" DeleteMethod="DeleteAccountProjectType" InsertMethod="AddAccountProjectType" UpdateMethod="UpdateAccountProjectType">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectTypeId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="ProjectType" Type="String" />
        <asp:Parameter Name="Original_AccountProjectTypeId" Type="Int32" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="AccountProjectTypeId" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="ProjectType" Type="String" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
    </InsertParameters>
</asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectTemplatesObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectTemplatesByAccountId" TypeName="AccountProjectBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsProjectTypeObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountProjectTypesByAccountIdAndIsDisabled" TypeName="AccountProjectTypeBLL" DeleteMethod="DeleteAccountProjectType" InsertMethod="AddAccountProjectType" UpdateMethod="UpdateAccountProjectType">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectTypeId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="ProjectType" Type="String" />
                <asp:Parameter Name="Original_AccountProjectTypeId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
                <asp:Parameter Name="AccountProjectTypeId" Type="Int32" DefaultValue="0" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="ProjectType" Type="String" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </InsertParameters>
</asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectFormObject" runat="server" DeleteMethod="DeleteAccountProject"
            InsertMethod="AddAccountProject" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectsByAccountProjectId" TypeName="AccountProjectBLL"
            UpdateMethod="UpdateAccountProject" OnSelecting="dsAccountProjectFormObject_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
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
                <asp:Parameter Name="EstimatedDuration" Type="Double" />
                <asp:Parameter Name="EstimatedDurationUnit" Type="String" />
                <asp:Parameter Name="ProjectCode" Type="String" />
                <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
                <asp:Parameter Name="ProjectBillingRateTypeId" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="False" Name="IsTemplate" QueryStringField="IsTemplate"
                    Type="Boolean" />
                <asp:Parameter Name="IsProject" Type="Boolean" />
                <asp:Parameter Name="AccountProjectTemplateId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
                <asp:Parameter Name="Completed" Type="Boolean" />
            <asp:Parameter 
                    Name="CustomField1" Type="String" /><asp:Parameter Name="CustomField2" 
                    Type="String" /><asp:Parameter Name="CustomField3" Type="String" /><asp:Parameter 
                    Name="CustomField4" Type="String" /><asp:Parameter Name="CustomField5" 
                    Type="String" /><asp:Parameter Name="CustomField6" Type="String" /><asp:Parameter 
                    Name="CustomField7" Type="String" /><asp:Parameter Name="CustomField8" 
                    Type="String" /><asp:Parameter Name="CustomField9" Type="String" /><asp:Parameter 
                    Name="CustomField10" Type="String" /><asp:Parameter Name="CustomField11" 
                    Type="String" /><asp:Parameter Name="CustomField12" Type="String" /><asp:Parameter 
                    Name="CustomField13" Type="String" /><asp:Parameter Name="CustomField14" 
                    Type="String" /><asp:Parameter Name="CustomField15" Type="String" /></UpdateParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="AccountProjectId" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
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
                <asp:Parameter Name="EstimatedDuration" Type="Double" />
                <asp:Parameter Name="EstimatedDurationUnit" Type="String" />
                <asp:Parameter Name="ProjectCode" Type="String" />
                <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
                <asp:Parameter Name="ProjectBillingRateTypeId" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="False" Name="IsTemplate" QueryStringField="IsTemplate"
                    Type="Boolean" />
                <asp:Parameter Name="IsProject" Type="Boolean" />
                <asp:Parameter Name="AccountProjectTemplateId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="Completed" Type="Boolean" />
            <asp:Parameter 
                    Name="CustomField1" Type="String" /><asp:Parameter Name="CustomField2" 
                    Type="String" /><asp:Parameter Name="CustomField3" Type="String" /><asp:Parameter 
                    Name="CustomField4" Type="String" /><asp:Parameter Name="CustomField5" 
                    Type="String" /><asp:Parameter Name="CustomField6" Type="String" /><asp:Parameter 
                    Name="CustomField7" Type="String" /><asp:Parameter Name="CustomField8" 
                    Type="String" /><asp:Parameter Name="CustomField9" Type="String" /><asp:Parameter 
                    Name="CustomField10" Type="String" /><asp:Parameter Name="CustomField11" 
                    Type="String" /><asp:Parameter Name="CustomField12" Type="String" /><asp:Parameter 
                    Name="CustomField13" Type="String" /><asp:Parameter Name="CustomField14" 
                    Type="String" /><asp:Parameter Name="CustomField15" Type="String" /></InsertParameters>
        </asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsClientObject" 
    runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountPartiesByAccountIdAndAccountPartyId" 
    TypeName="AccountPartyBLL" DeleteMethod="DeleteAccountParty" 
    InsertMethod="AddAccountParty" UpdateMethod="UpdateAccountParty"><DeleteParameters><asp:Parameter 
            Name="original_AccountPartyId" Type="Int32" /></DeleteParameters><InsertParameters><asp:Parameter 
            Name="AccountId" Type="Int32" /><asp:Parameter Name="PartyName" 
            Type="String" /><asp:Parameter Name="PartyNick" Type="String" /><asp:Parameter 
            Name="EMailAddress" Type="String" /><asp:Parameter Name="Address1" 
            Type="String" /><asp:Parameter Name="Address2" Type="String" /><asp:Parameter 
            Name="CountryId" Type="Int16" /><asp:Parameter Name="State" Type="String" /><asp:Parameter 
            Name="City" Type="String" /><asp:Parameter Name="ZipCode" Type="String" /><asp:Parameter 
            Name="Telephone1" Type="String" /><asp:Parameter Name="Telephone2" 
            Type="String" /><asp:Parameter Name="Fax" Type="String" /><asp:Parameter 
            Name="DefaultBillingRate" Type="Decimal" /><asp:Parameter Name="Website" 
            Type="String" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter 
            Name="IsDisabled" Type="Boolean" /><asp:Parameter Name="IsDeleted" 
            Type="Boolean" /><asp:Parameter Name="CreatedOn" Type="DateTime" /><asp:Parameter 
            Name="CreatedByEmployeeId" Type="Int32" /><asp:Parameter Name="ModifiedOn" 
            Type="DateTime" /><asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" /><asp:Parameter 
            Name="CustomField1" Type="String" /><asp:Parameter Name="CustomField2" 
            Type="String" /><asp:Parameter Name="CustomField3" Type="String" /><asp:Parameter 
            Name="CustomField4" Type="String" /><asp:Parameter Name="CustomField5" 
            Type="String" /><asp:Parameter Name="CustomField6" Type="String" /><asp:Parameter 
            Name="CustomField7" Type="String" /><asp:Parameter Name="CustomField8" 
            Type="String" /><asp:Parameter Name="CustomField9" Type="String" /><asp:Parameter 
            Name="CustomField10" Type="String" /><asp:Parameter Name="CustomField11" 
            Type="String" /><asp:Parameter Name="CustomField12" Type="String" /><asp:Parameter 
            Name="CustomField13" Type="String" /><asp:Parameter Name="CustomField14" 
            Type="String" /><asp:Parameter Name="CustomField15" Type="String" /></InsertParameters><SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="AccountPartyId" Type="Int32" />
    </SelectParameters>
<UpdateParameters><asp:Parameter Name="PartyTypeId" Type="Int16" /><asp:Parameter 
            Name="AccountId" Type="Int32" /><asp:Parameter Name="PartyName" 
            Type="String" /><asp:Parameter Name="PartyNick" Type="String" /><asp:Parameter 
            Name="EMailAddress" Type="String" /><asp:Parameter Name="Address1" 
            Type="String" /><asp:Parameter Name="Address2" Type="String" /><asp:Parameter 
            Name="CountryId" Type="Int16" /><asp:Parameter Name="State" Type="String" /><asp:Parameter 
            Name="City" Type="String" /><asp:Parameter Name="ZipCode" Type="String" /><asp:Parameter 
            Name="Telephone1" Type="String" /><asp:Parameter Name="Telephone2" 
            Type="String" /><asp:Parameter Name="Fax" Type="String" /><asp:Parameter 
            Name="DefaultBillingRate" Type="Decimal" /><asp:Parameter Name="Website" 
            Type="String" /><asp:Parameter Name="Notes" Type="String" /><asp:Parameter 
            Name="IsDisabled" Type="Boolean" /><asp:Parameter Name="IsDeleted" 
            Type="Boolean" /><asp:Parameter Name="CreatedOn" Type="DateTime" /><asp:Parameter 
            Name="CreatedByEmployeeId" Type="Int32" /><asp:Parameter Name="ModifiedOn" 
            Type="DateTime" /><asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" /><asp:Parameter 
            Name="Original_AccountPartyId" Type="Int32" /><asp:Parameter 
            Name="CustomField1" Type="String" /><asp:Parameter Name="CustomField2" 
            Type="String" /><asp:Parameter Name="CustomField3" Type="String" /><asp:Parameter 
            Name="CustomField4" Type="String" /><asp:Parameter Name="CustomField5" 
            Type="String" /><asp:Parameter Name="CustomField6" Type="String" /><asp:Parameter 
            Name="CustomField7" Type="String" /><asp:Parameter Name="CustomField8" 
            Type="String" /><asp:Parameter Name="CustomField9" Type="String" /><asp:Parameter 
            Name="CustomField10" Type="String" /><asp:Parameter Name="CustomField11" 
            Type="String" /><asp:Parameter Name="CustomField12" Type="String" /><asp:Parameter 
            Name="CustomField13" Type="String" /><asp:Parameter Name="CustomField14" 
            Type="String" /><asp:Parameter Name="CustomField15" Type="String" /></UpdateParameters></asp:ObjectDataSource><asp:ObjectDataSource ID="dsClientObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountPartiesByAccountIdAndAccountPartyId" TypeName="AccountPartyBLL" DeleteMethod="DeleteAccountParty" InsertMethod="AddAccountParty" UpdateMethod="UpdateAccountParty">
    <DeleteParameters>
        <asp:Parameter Name="original_AccountPartyId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="PartyTypeId" Type="Int16" />
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="PartyName" Type="String" />
        <asp:Parameter Name="PartyNick" Type="String" />
        <asp:Parameter Name="EMailAddress" Type="String" />
        <asp:Parameter Name="Address1" Type="String" />
        <asp:Parameter Name="Address2" Type="String" />
        <asp:Parameter Name="CountryId" Type="Int16" />
        <asp:Parameter Name="State" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="ZipCode" Type="String" />
        <asp:Parameter Name="Telephone1" Type="String" />
        <asp:Parameter Name="Telephone2" Type="String" />
        <asp:Parameter Name="Fax" Type="String" />
        <asp:Parameter Name="DefaultCurrencyId" Type="Int16" />
        <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="IsDeleted" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="Original_AccountPartyId" Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="AccountPartyId" Type="Int32" DefaultValue="0" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="PartyName" Type="String" />
        <asp:Parameter Name="PartyNick" Type="String" />
        <asp:Parameter Name="EMailAddress" Type="String" />
        <asp:Parameter Name="Address1" Type="String" />
        <asp:Parameter Name="Address2" Type="String" />
        <asp:Parameter Name="CountryId" Type="Int16" />
        <asp:Parameter Name="State" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="ZipCode" Type="String" />
        <asp:Parameter Name="Telephone1" Type="String" />
        <asp:Parameter Name="Telephone2" Type="String" />
        <asp:Parameter Name="Fax" Type="String" />
        <asp:Parameter Name="DefaultCurrencyId" Type="Int16" />
        <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="IsDeleted" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
    </InsertParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsEmployeeObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountEmployeesByAccountIdAndIsDisabled" TypeName="AccountEmployeeBLL">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource><asp:ObjectDataSource ID="dsProjectManagerObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountEmployeesByAccountIdAndIsDisabled" TypeName="AccountEmployeeBLL">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsEmployeeObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountEmployeesByAccountIdAndIsDisabled" TypeName="AccountEmployeeBLL" DeleteMethod="DeleteAccountEmployee" InsertMethod="AddAccountEmployee2" UpdateMethod="UpdateUsernameOfExistingEmployee">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountEmployeeId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Original_AccountEmployeeId" Type="Int32" />
                <asp:Parameter Name="Username" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="AccountEmployeeId" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Prefix" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
            </InsertParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsBillingTypeObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountBillingTypesForProjectByAccountIdAndIsDisabled" TypeName="AccountBillingTypeBLL">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="AccountBillingTypeId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource><asp:ObjectDataSource ID="dsBillingTypeObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountBillingTypesForProjectByAccountIdAndIsDisabled" TypeName="AccountBillingTypeBLL" DeleteMethod="DeleteAccountBillingType" InsertMethod="AddAccountBillingType" UpdateMethod="UpdateAccountBillingType">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountBillingTypeId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="BillingType" Type="String" />
        <asp:Parameter Name="BillingCategoryId" Type="Int32" />
        <asp:Parameter Name="Original_AccountBillingTypeId" Type="Int32" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="AccountBillingTypeId" Type="Int32" DefaultValue="0" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="BillingType" Type="String" />
        <asp:Parameter Name="BillingCategoryId" Type="Int32" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
    </InsertParameters>
</asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsDurationObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDurationUnit" TypeName="SystemDataBLL"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsProjectStatusObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountsStatusForProjectByIsDisabled" TypeName="AccountStatusBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountStatusId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsProjectStatusObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountsStatusForProjectByIsDisabled" TypeName="AccountStatusBLL" DeleteMethod="DeleteAccountStatus" InsertMethod="AddAccountStatus" UpdateMethod="UpdateAccountStatus">
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
        <asp:ObjectDataSource ID="dsAccountProjectEmployees" runat="server" DeleteMethod="DeleteAccountProjectEmployeeId"
            InsertMethod="AddAccountProjectEmployee" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectEmployeesForSelection" TypeName="AccountProjectEmployeeBLL">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectEmployeeId" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="1" Name="AccountProjectId" QueryStringField="AccountProjectId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsSystemProjectBillingRateType" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetProjectBillingRateType" TypeName="SystemDataBLL"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsTimeSheetApprovalType" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountApprovalTypesByAccountIdForTimeSheetApproval" TypeName="AccountApprovalBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsExpenseApprovalType" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountApprovalTypesByAccountIdForTimeSheetApproval" TypeName="AccountApprovalBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
