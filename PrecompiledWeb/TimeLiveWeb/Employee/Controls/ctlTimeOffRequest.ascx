<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlTimeOffRequest, App_Web_uitpp31g" %>
<%@ Register Assembly="eWorld.UI.Compatibility" Namespace="eWorld.UI.Compatibility"
    TagPrefix="cc2" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<style type="text/css">
    .style1
    {
        height: 23px;
    }
</style>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountEmployeeTimeOffRequestId"
            DataSourceID="dsEmployeeTimeOffRequestFormViewObject" DefaultMode="Insert" Width="600px"  SkinID="formviewSkinEmployee">
            <InsertItemTemplate>
                <table width="100%" class="xformview">
                    <tr>
                        <td colspan="2" class="caption">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Request Information") %>' /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="FormViewSubHeader">
                            <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Request") %>' /></td>
                    </tr>
                    <tr>
                        <td align="left" class="style1" colspan="2">
                            &nbsp;&nbsp; Time Off Available:
                            <asp:Label ID="lblAvailableTimeOff" runat="server" Font-Bold="True" 
                                Text="Label" Width="70px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            <asp:Literal ID="Literal3" runat="server" 
                                Text='<%# ResourceHelper.GetFromResource("Time Off Type:") %>' />
                        </td>
                        <td style="width: 70%">
                            <asp:DropDownList ID="ddlTimeOffTypeId" runat="server" AutoPostBack="True" 
                                DataSourceID="dsTimeOffTypesObject" DataTextField="AccountTimeOffType" 
                                DataValueField="AccountTimeOffTypeId" 
                                onselectedindexchanged="ddlTimeOffTypeId_SelectedIndexChanged" 
                                SelectedValue='<%# Bind("AccountTimeOffTypeId") %>' Width="200px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="ddlTimeOffTypeId" CssClass="ErrorMessage" Display="Dynamic" 
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                            <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Begin Date:") %>' /></td>
                        <td style="width: 70%">
                            <cc1:CalendarPopup ID="StartDateTextBox" runat="server" SelectedDate='<%# Bind("StartDate") %>' AutoPostBack="True" OnDateChanged="StartDateTextBox_DateChanged"
                                >
                            </cc1:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                            <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("End Date:") %>' /></td>
                        <td style="width: 70%">
                            <cc1:CalendarPopup ID="EndDateTextBox" runat="server" SelectedDate='<%# Bind("EndDate") %>' AutoPostBack="True" OnDateChanged="EndDateTextBox_DateChanged"
                                >
                            </cc1:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                            
<asp:Label ID="Label2" runat="server" AssociatedControlID="DaysOffTextBox">
                            <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Days Off:") %>' /></asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="DaysOffTextBox" runat="server" Text='<%# Bind("DayOff") %>' Width="84px" AutoPostBack="True" OnTextChanged="DaysOffTextBox_TextChanged"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="DaysOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="DaysOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Invalid value" MaximumValue="99999999"
                                MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                            
<asp:Label ID="Label4" runat="server" AssociatedControlID="HoursOffTextBox">
                            <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Hours Off:") %>' /></asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="HoursOffTextBox" runat="server" Text='<%# Bind("HoursOff") %>' Width="84px" AutoPostBack="True" OnTextChanged="HoursOffTextBox_TextChanged"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3" runat="server" ControlToValidate="HoursOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="HoursOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="This request must include at least one working day." MaximumValue="99999999"
                                MinimumValue="0.1" ></asp:RangeValidator><asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="HoursOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Invalid value" MaximumValue="99999999"
                                MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><% If LocaleUtilitiesBLL.IsShowProjectForTimeOff Then%><tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            Project Name: </td><td style="width: 70%">
                            <asp:DropDownList ID="ddlProjectName" runat="server" Width="200px" DataSourceID="dsAccountProjectObject" DataTextField="ProjectName" DataValueField="AccountProjectId" SelectedValue='<%# Bind("AccountProjectId") %>' AppendDataBoundItems="True">
                                <asp:ListItem Value="0">&lt;None&gt;</asp:ListItem></asp:DropDownList></td></tr><% End If%><tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell" valign="top">
                            
                            
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="DescriptionTextBox">
                            <asp:Literal ID="Literal8" runat="server" Text='<%# ResourceHelper.GetFromResource("Description:") %>' /></asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" MaxLength="1000" Rows="5" Text='<%# Bind("Description") %>'
                                TextMode="MultiLine" Width="300px"></asp:TextBox></td></tr><tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                        </td>
                        <td style="width: 70%">
                            <asp:Button ID="btnAdd" runat="server" Text="<%$ Resources:TimeLive.Web, Submit_text%> " OnClick="btnAdd_Click" CommandName="Insert" /><asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:TimeLive.Web, Cancel_text%> " OnClick="btnCancel_Click" ValidationGroup="1" />
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <EditItemTemplate>
                <table width="100%" class="xformview">
                    <tr>
                        <td colspan="2" class="caption">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Request Information") %>' /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="FormViewSubHeader">
                            <asp:Literal ID="Literal9" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Request") %>' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2">
                            &nbsp;&nbsp; Time Off Available:
                            <asp:Label ID="lblAvailableTimeOff" runat="server" Font-Bold="True" 
                                Text="Label" Width="70px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                            <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Type:") %>' /></td>
                        <td style="width: 70%">
                            <asp:DropDownList ID="ddlTimeOffTypeId" runat="server" Width="200px" DataSourceID="dsTimeOffTypesObject" DataTextField="AccountTimeOffType" DataValueField="AccountTimeOffTypeId">
                            </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="ddlTimeOffTypeId" CssClass="ErrorMessage" Display="Dynamic"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr style="color: #000000">
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                            <asp:Literal ID="Literal11" runat="server" Text='<%# ResourceHelper.GetFromResource("Begin Date:") %>' /></td>
                        <td style="width: 70%">
                            <cc1:CalendarPopup ID="StartDateTextBox" runat="server" SelectedDate='<%# Bind("StartDate") %>' AutoPostBack="True" OnDateChanged="StartDateTextBox_DateChanged"
                                >
                            </cc1:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                            <asp:Literal ID="Literal12" runat="server" Text='<%# ResourceHelper.GetFromResource("End Date:") %>' /></td>
                        <td style="width: 70%">
                            <cc1:CalendarPopup ID="EndDateTextBox" runat="server" SelectedDate='<%# Bind("EndDate") %>' AutoPostBack="True" OnDateChanged="EndDateTextBox_DateChanged"
                                >
                            </cc1:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                           
<asp:Label ID="Label1" runat="server" AssociatedControlID="DaysOffTextBox">

                            <asp:Literal ID="Literal13" runat="server" Text='<%# ResourceHelper.GetFromResource("Days Off:") %>' /></asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="DaysOffTextBox" runat="server" Text='<%# Bind("DayOff") %>' Width="84px" AutoPostBack="True" OnTextChanged="DaysOffTextBox_TextChanged1"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" runat="server" ControlToValidate="DaysOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="DaysOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Invalid value" MaximumValue="99999999"
                                MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                            
<asp:Label ID="Label3" runat="server" AssociatedControlID="HoursOffTextBox">
                            <asp:Literal ID="Literal14" runat="server" Text='<%# ResourceHelper.GetFromResource("Hours Off:") %>' /></asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="HoursOffTextBox" runat="server" Text='<%# Bind("HoursOff") %>' Width="84px" AutoPostBack="True" OnTextChanged="HoursOffTextBox_TextChanged1"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator4" runat="server" ControlToValidate="HoursOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="HoursOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="This request must include at least one working day." MaximumValue="99999999"
                                MinimumValue="0.1" Type="Double"></asp:RangeValidator><asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="HoursOffTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Invalid value" MaximumValue="99999999"
                                MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><% If LocaleUtilitiesBLL.IsShowProjectForTimeOff Then%><tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            Project Name: </td><td style="width: 70%">
                            <asp:DropDownList ID="ddlProjectName" runat="server" Width="200px" DataSourceID="dsAccountProjectObject" DataTextField="ProjectName" DataValueField="AccountProjectId" AppendDataBoundItems="True">
                                <asp:ListItem Selected="True" Value="0">&lt;None&gt;</asp:ListItem></asp:DropDownList></td></tr><% End If%><tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell" valign="top">
                            
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="DescriptionTextBox">
                            <asp:Literal ID="Literal15" runat="server" Text='<%# ResourceHelper.GetFromResource("Description:") %>' /></asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" MaxLength="1000" Rows="5" Text='<%# Bind("Description") %>'
                                TextMode="MultiLine" Width="300px"></asp:TextBox></td></tr><tr>
                        <td style="width: 30%" align="right" class="FormViewLabelCell">
                        </td>
                        <td style="width: 70%">
                            <asp:Button ID="btnUpdate" runat="server" Text="<%$ Resources:TimeLive.Web, Update_text%> " CommandName="Update" /><asp:Button ID="btnCancel" runat="server" Text="<%$ Resources:TimeLive.Web, Cancel_text%> " OnClick="btnCancel_Click" ValidationGroup="1" /></td>
                    </tr>
                </table>
            </EditItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="dsEmployeeTimeOffRequestFormViewObject" runat="server"
            InsertMethod="AddAccountEmployeeTimeOffRequest" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountEmployeeTimeOffRequestByEmployeeRequestId" TypeName="AccountEmployeeTimeOffRequestBLL" UpdateMethod="UpdateAccountEmployeeTimeOffRequest">
            <SelectParameters>
                <asp:Parameter   Name="AccountEmployeeTimeOffRequestId" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:SessionParameter Name="AccountEmployeeId" SessionField="AccountEmployeeId" Type="Int32" />
                <asp:Parameter   Name="AccountTimeOffTypeId" />
                <asp:Parameter Name="HoursOff" Type="Double" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="DayOff" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter   Name="AccountTimeOffTypeId" />
                <asp:Parameter Name="HoursOff" Type="Double" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="DayOff" Type="Double" />
                <asp:Parameter   Name="Original_AccountEmployeeTimeOffRequestId" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsTimeOffTypesObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountTimeOffTypesByAccountIdAndRequestRequired" TypeName="AccountTimeOffTypeBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter   Name="AccountTimeOffTypeId" />
                <asp:Parameter DefaultValue="True" Name="RequestRequired" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectObject" 
            runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeletedClient"
            TypeName="AccountProjectBLL" DeleteMethod="DeleteAccountProject" 
            InsertMethod="AddAccountProject" UpdateMethod="UpdateProjectDescription"><DeleteParameters><asp:Parameter 
                    Name="Original_AccountProjectId" Type="Int32" /></DeleteParameters><InsertParameters><asp:Parameter 
                    Name="AccountId" Type="Int32" /><asp:Parameter Name="AccountProjectTypeId" 
                    Type="Int32" /><asp:Parameter Name="AccountClientId" Type="Int32" /><asp:Parameter 
                    Name="AccountPartyContactId" Type="Int32" /><asp:Parameter 
                    Name="AccountPartyDepartmentId" Type="Int32" /><asp:Parameter 
                    Name="ProjectBillingTypeId" Type="Int32" /><asp:Parameter 
                    Name="ProjectName" Type="String" /><asp:Parameter Name="ProjectDescription" 
                    Type="String" /><asp:Parameter Name="StartDate" Type="DateTime" /><asp:Parameter 
                    Name="Deadline" Type="DateTime" /><asp:Parameter Name="ProjectStatusId" 
                    Type="Int32" /><asp:Parameter Name="LeaderEmployeeId" Type="Int32" /><asp:Parameter 
                    Name="ProjectManagerEmployeeId" Type="Int32" /><asp:Parameter 
                    Name="TimeSheetApprovalTypeId" Type="Int32" /><asp:Parameter 
                    Name="ExpenseApprovalTypeId" Type="Int32" /><asp:Parameter 
                    Name="EstimatedDuration" Type="Double" /><asp:Parameter 
                    Name="EstimatedDurationUnit" Type="String" /><asp:Parameter 
                    Name="ProjectCode" Type="String" /><asp:Parameter Name="DefaultBillingRate" 
                    Type="Decimal" /><asp:Parameter Name="ProjectBillingRateTypeId" 
                    Type="Int32" /><asp:Parameter Name="IsTemplate" Type="Boolean" /><asp:Parameter 
                    Name="IsProject" Type="Boolean" /><asp:Parameter 
                    Name="AccountProjectTemplateId" Type="Int32" /><asp:Parameter 
                    Name="CreatedOn" Type="DateTime" /><asp:Parameter 
                    Name="CreatedByEmployeeId" Type="Int32" /><asp:Parameter Name="ModifiedOn" 
                    Type="DateTime" /><asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" /><asp:Parameter 
                    Name="Completed" Type="Boolean" /><asp:Parameter Name="CustomField1" 
                    Type="String" /><asp:Parameter Name="CustomField2" Type="String" /><asp:Parameter 
                    Name="CustomField3" Type="String" /><asp:Parameter Name="CustomField4" 
                    Type="String" /><asp:Parameter Name="CustomField5" Type="String" /><asp:Parameter 
                    Name="CustomField6" Type="String" /><asp:Parameter Name="CustomField7" 
                    Type="String" /><asp:Parameter Name="CustomField8" Type="String" /><asp:Parameter 
                    Name="CustomField9" Type="String" /><asp:Parameter Name="CustomField10" 
                    Type="String" /><asp:Parameter Name="CustomField11" Type="String" /><asp:Parameter 
                    Name="CustomField12" Type="String" /><asp:Parameter Name="CustomField13" 
                    Type="String" /><asp:Parameter Name="CustomField14" Type="String" /><asp:Parameter 
                    Name="CustomField15" Type="String" /></InsertParameters><SelectParameters>
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:SessionParameter Name="AccountEmployeeId" SessionField="AccountEmployeeId" Type="Int32" />
                <asp:Parameter Name="Completed" Type="Boolean" />
                <asp:Parameter DefaultValue="" Name="IsTemplate" Type="Boolean" />
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
            </SelectParameters>
        <UpdateParameters><asp:Parameter Name="ProjectDescription" Type="String" /><asp:Parameter 
                    Name="Original_AccountProjectId" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
