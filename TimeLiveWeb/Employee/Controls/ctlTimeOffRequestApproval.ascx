<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlTimeOffRequestApproval.ascx.vb" Inherits="Employee_Controls_ctlTimeOffRequestApproval" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24D65337282035F2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="450" class="xFormView">
            <tr>
                <td colspan="2" class="caption">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Time Off Approval%> "></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2" class="FormViewSubHeader">
                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, Search Parameters%> "></asp:Literal></td>
            </tr>
            <tr>
                <td style="width: 200px" align="right" class="FormViewLabelCell">
                    <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Name:%> "></asp:Literal></td>
                <td style="width: 250px">
                    <asp:DropDownList ID="ddlAccountEmployeeId" runat="server" AppendDataBoundItems="True"
                        DataSourceID="dsAccountEmployeeObject" DataTextField="FullName" DataValueField="AccountEmployeeId"
                        Width="200px">
                        <asp:ListItem Selected="True" Value="0">&lt;All&gt;</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 200px" align="right" class="FormViewLabelCell">
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Time Off Types:%> "></asp:Literal></td>
                </td>
                <td style="width: 250px">
                    <asp:DropDownList ID="ddlTimeOffTypeId" runat="server" DataSourceID="dsTimeOffTypeObject"
                        DataTextField="AccountTimeOffType" DataValueField="AccountTimeOffTypeId" Width="200px" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0">&lt;ALL&gt;</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 200px" align="right" class="FormViewLabelCell">
                    <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Include Date Range:%> "></asp:Literal></td>
                <td style="width: 250px">
                    <asp:CheckBox ID="chkIncludeDateRange" runat="server" /></td>
            </tr>
            <tr>
                <td style="width: 200px" align="right" class="FormViewLabelCell">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Time Off Start Date:%> "></asp:Literal></td>
                </td>
                <td style="width: 250px">
                    <ew:CalendarPopup ID="txtStartDate" runat="server">
                    </ew:CalendarPopup>
                </td>
            </tr>
            <tr>
                <td style="width: 200px" align="right" class="FormViewLabelCell">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Time Off End Date:%> "></asp:Literal></td>
                </td>
                <td style="width: 250px">
                    <ew:CalendarPopup ID="txtEndDate" runat="server">
                    </ew:CalendarPopup>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 200px; height: 26px;" class="FormViewLabelCell">
                </td>
                <td style="width: 250px; height: 26px;">
                    <asp:Button ID="btnShow" runat="server" Text="<%$ Resources:TimeLive.Web, Show_text%> " OnClick="btnShow_Click" /></td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsAccountEmployeeObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetEmployeesForTimeOffApproval" TypeName="AccountEmployeeBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="129" Name="ApproverEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsTimeOffTypeObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountTimeOffTypesByAccountIdAndIsDisabled" TypeName="AccountTimeOffTypeBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountTimeOffTypeId" Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsTimeOffApprovalEntriesForSpecificEmployee" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountEmployeeTimeOffRequestApprovalForSpecificEmployee"
            TypeName="AccountEmployeeTimeOffRequestBLL">
            <SelectParameters>
                <asp:Parameter Name="AccountTimeOffTypeId" Type="Object" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" Name="TimeOffAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
                <asp:Parameter DefaultValue="11/02/2006" Name="StartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="11/02/2006" Name="EndDate" Type="DateTime" />
                <asp:SessionParameter DefaultValue="" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsTimeOffApprovalEntriesForEmployeeManager" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountEmployeeTimeOffRequestApprovalForEmployeeManager"
            TypeName="AccountEmployeeTimeOffRequestBLL">
            <SelectParameters>
                <asp:Parameter Name="AccountTimeOffTypeId" Type="Object" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="" Name="TimeOffAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
                <asp:Parameter DefaultValue="10/02/2005" Name="StartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="10/02/2005" Name="EndDate" Type="DateTime" />
                <asp:SessionParameter DefaultValue="" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Button ID="btnUpdate" runat="server" Text="<%$ Resources:TimeLive.Web, Update Time Off Approvals%> " /><br />
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <x:GridView ID="SpecificEmployeeGridView" runat="server" AutoGenerateColumns="False" DataSourceID="dsTimeOffApprovalEntriesForSpecificEmployee" Width="98%" Caption="<%$ Resources:TimeLive.Web, Specific Employee Time Off Approvals%> " skinID="xgridviewSkinEmployee" DataKeyNames="AccountEmployeeTimeOffRequestId,AccountApprovalTypeId,AccountApprovalPathId,AccountEmployeeId,IsRejected,IsApproved,ApprovalPathSequence,MaxApprovalPathSequence,HoursOff,AccountTimeOffTypeId,TimeOffAccountEmployeeId,StartDate">
            <Columns>
                <asp:BoundField DataField="FullName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name%> " SortExpression="FullName" >
                    <itemstyle width="23%" />
                </asp:BoundField>
                <asp:BoundField DataField="AccountTimeOffType" HeaderText="<%$ Resources:TimeLive.Web, Time Off Type%> " SortExpression="AccountTimeOffType" >
                    <itemstyle width="18%" />
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="<%$ Resources:TimeLive.Web, Description%> " SortExpression="Description">
                    <itemstyle width="13%" />
                </asp:BoundField>
                <asp:BoundField DataField="DayOff" HeaderText="<%$ Resources:TimeLive.Web, Day Off%> " >
                    <itemstyle width="4%" horizontalalign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="HoursOff" HeaderText="<%$ Resources:TimeLive.Web, Hours Off%> " >
                    <itemstyle width="4%" horizontalalign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="StartDate" HeaderText="<%$ Resources:TimeLive.Web, Start Date%> " DataFormatString="{0:d}" HtmlEncode="False" >
                    <itemstyle width="6%" />
                </asp:BoundField>
                <asp:BoundField DataField="EndDate" HeaderText="<%$ Resources:TimeLive.Web, End Date%> " DataFormatString="{0:d}" HtmlEncode="False" >
                    <itemstyle width="6%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved%> ">
                    <itemtemplate>
<asp:RadioButton id="rdSpecificEmployee" runat="server" __designer:wfdid="w10" GroupName="SpecificEmployee"></asp:RadioButton>
</itemtemplate>
                    <itemstyle width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected%> ">
                    <itemtemplate>
<asp:RadioButton id="rdSpecificEmployeeRejected" runat="server" __designer:wfdid="w11" GroupName="SpecificEmployee"></asp:RadioButton>
</itemtemplate>
                    <itemstyle width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Comments%> ">
                    <itemtemplate>
<asp:TextBox id="CommentsTextBox" runat="server" Width="100%" TextMode="MultiLine" __designer:wfdid="w23"></asp:TextBox> 
</itemtemplate>
                    <itemstyle width="15%" />
                </asp:TemplateField>
            </Columns>
        </x:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
        <x:GridView ID="EmployeeManagerGridView" runat="server" AutoGenerateColumns="False" DataSourceID="dsTimeOffApprovalEntriesForEmployeeManager" Width="98%" Caption="<%$ Resources:TimeLive.Web, Employee Manager Time Off Approvals%> " skinID="xgridviewSkinEmployee" DataKeyNames="AccountEmployeeTimeOffRequestId,AccountApprovalTypeId,AccountApprovalPathId,EmployeeManagerId,IsRejected,IsApproved,ApprovalPathSequence,MaxApprovalPathSequence,HoursOff,AccountTimeOffTypeId,TimeOffAccountEmployeeId,StartDate">
            <Columns>
                <asp:BoundField DataField="FullName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name%> " SortExpression="FullName" >
                    <itemstyle width="23%" />
                </asp:BoundField>
                <asp:BoundField DataField="AccountTimeOffType" HeaderText="<%$ Resources:TimeLive.Web, Time Off Type%> " SortExpression="AccountTimeOffType" >
                    <itemstyle width="18%" />
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="<%$ Resources:TimeLive.Web, Description%> " SortExpression="Description">
                    <itemstyle width="13%" />
                </asp:BoundField>
                <asp:BoundField DataField="DayOff" HeaderText="<%$ Resources:TimeLive.Web, Day Off%> " >
                    <itemstyle width="4%" />
                </asp:BoundField>
                <asp:BoundField DataField="HoursOff" HeaderText="<%$ Resources:TimeLive.Web, Hours Off%> " >
                    <itemstyle width="4%" />
                </asp:BoundField>
                <asp:BoundField DataField="StartDate" HeaderText="<%$ Resources:TimeLive.Web, Start Date%> " DataFormatString="{0:d}" HtmlEncode="False" >
                    <itemstyle width="6%" />
                </asp:BoundField>
                <asp:BoundField DataField="EndDate" HeaderText="<%$ Resources:TimeLive.Web, End Date%> " DataFormatString="{0:d}" HtmlEncode="False" >
                    <itemstyle width="6%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved%> ">
                    <itemtemplate>
<asp:RadioButton id="rdEmployeeManager" runat="server" __designer:wfdid="w20" GroupName="EmployeeManager"></asp:RadioButton> 
</itemtemplate>
                    <itemstyle width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected%> ">
                    <itemtemplate>
<asp:RadioButton id="rdEmployeeManagerRejected" runat="server" __designer:wfdid="w21" GroupName="EmployeeManager"></asp:RadioButton> 
</itemtemplate>
                    <itemstyle width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Comments%> ">
                    <itemtemplate>
<asp:TextBox id="CommentsTextBox" runat="server" Width="100%" TextMode="MultiLine" __designer:wfdid="w22"></asp:TextBox> 
</itemtemplate>
                    <itemstyle width="15%" />
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    </ContentTemplate>
</asp:UpdatePanel>
