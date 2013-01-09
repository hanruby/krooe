<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountTimeOffPoliciesDetail.ascx.vb" Inherits="AccountAdmin_Controls_ctlAccountTimeOffPoliciesDetail" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountTimeOffPolicyId"
            DataSourceID="dsTimeOffPoliciesDetailFormViewObject" DefaultMode="Insert" Width="775px" SkinID="formviewSkinEmployee">
            <InsertItemTemplate>
                <table class="xview" width="100%">
                    <tr>
                        <td class="caption" colspan="2">
                            <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Policy Information")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Policy")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewLabelCell" style="width: 25%;" align="right">
                           

<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtTimeOffPolicy">
                            <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Policy:")%> ' /></asp:Label></td>
                        <td style="width: 75%;">
                            <asp:TextBox ID="txtTimeOffPolicy" runat="server" Width="400px"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTimeOffPolicy"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <x:GridView ID="GridView1" PageSize="500" runat="server" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Time Off Policies Detail List %>"
                                DataSourceID="dsTimeOffPoliciesDetailGridViewObject" Width="100%" SkinID="xgridviewSkinEmployee" AllowSorting="True" DataKeyNames="AccountTimeOffPolicyDetailId,AccountTimeOffPolicyId,AccountTimeOffTypeId,SystemEarnPeriodId,SystemResetToZeroTypeId" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
<asp:BoundField DataField="AccountTimeOffType" HeaderText="<%$ Resources:TimeLive.Web, Time Off Type %>" SortExpression="AccountTimeOffType">
<ItemStyle Width="27%"></ItemStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="Effective Date">
    <itemtemplate>
<cc1:CalendarPopup id="EffectiveDateCalendarPopup" runat="server" Width="85px" Text="..." __designer:wfdid="w73" SelectedDate=""></cc1:CalendarPopup> 
</itemtemplate>
    <itemstyle width="17%" />
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Initial Set to Hours %>"><EditItemTemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("InitialSetToHours") %>' __designer:wfdid="w25"></asp:TextBox> 
</EditItemTemplate>
<ItemTemplate>
<asp:TextBox id="InitialHoursTextBox" runat="server" Width="90%" Text='<%# Bind("InitialSetToHours") %>' __designer:wfdid="w23"></asp:TextBox><asp:RangeValidator id="InitialHoursRangeValidator" runat="server" ErrorMessage="Incorrect value" Display="Dynamic" ControlToValidate="InitialHoursTextBox" __designer:wfdid="w24" Type="Double" MinimumValue="0" MaximumValue="99999" Font-Size="X-Small" Font-Names="Verdana" Font-Bold="False"></asp:RangeValidator> 
</ItemTemplate>

<ItemStyle VerticalAlign="Top" Width="7%"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Earn Hours %>"><ItemTemplate>
<asp:TextBox id="EarnHourTextBox" runat="server" Width="90%" Text='<%# Bind("EarnHours") %>' __designer:wfdid="w26"></asp:TextBox><asp:RangeValidator id="EarnHourRangeValidator" runat="server" ErrorMessage="Incorrect value" Display="Dynamic" ControlToValidate="EarnHourTextBox" __designer:wfdid="w27" Type="Double" MinimumValue="0" MaximumValue="99999" Font-Size="X-Small" Font-Names="Verdana" Font-Bold="False"></asp:RangeValidator> 
</ItemTemplate>

<ItemStyle VerticalAlign="Top" Width="7%"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Earn Period %>"><ItemTemplate>
<asp:DropDownList id="ddlSystemEarnPeriodId" runat="server" Width="100%" DataSourceID="dsSystemEarnPeriodObject" __designer:wfdid="w28" AppendDataBoundItems="True" DataTextField="SystemEarnPeriod" DataValueField="SystemEarnPeriodId"><asp:ListItem Value="0">Never</asp:ListItem>
</asp:DropDownList><asp:ObjectDataSource id="dsSystemEarnPeriodObject" runat="server" TypeName="SystemDataBLL" SelectMethod="GetSystemEarnPeriods" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w29"></asp:ObjectDataSource> 
</ItemTemplate>

<ItemStyle VerticalAlign="Top" Width="14%"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Reset at %>"><ItemTemplate>
<asp:DropDownList id="ddlSystemResetToZeroTypeId" runat="server" Width="100%" DataSourceID="dsSystemResetToZeroObject" __designer:wfdid="w65" DataValueField="SystemResetToZeroTypeId" DataTextField="SystemResetToZeroType" AppendDataBoundItems="True"><asp:ListItem Value="0">Never</asp:ListItem>
</asp:DropDownList><asp:ObjectDataSource id="dsSystemResetToZeroObject" runat="server" TypeName="SystemDataBLL" SelectMethod="GetSystemResetToZeroType" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w66"></asp:ObjectDataSource> 
</ItemTemplate>

<ItemStyle VerticalAlign="Top" Width="14%"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Reset Hours %>"><ItemTemplate>
<asp:TextBox id="ResetToHoursTextBox" runat="server" Width="90%" Text='<%# Bind("ResetToHours") %>' __designer:wfdid="w30"></asp:TextBox><asp:RangeValidator id="ResetToHoursRangeValidator" runat="server" ErrorMessage="Incorrect value" Display="Dynamic" ControlToValidate="ResetToHoursTextBox" __designer:wfdid="w31" Type="Double" MinimumValue="0" MaximumValue="99999" Font-Size="X-Small" Font-Names="Verdana" Font-Bold="False"></asp:RangeValidator> 
</ItemTemplate>

<ItemStyle VerticalAlign="Top" Width="7%"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Maximum Available %>"><EditItemTemplate>
&nbsp; 
</EditItemTemplate>
<ItemTemplate>
<asp:TextBox id="AvailableTextBox" runat="server" Width="90%" Text='<%# Bind("MaximumAvailable") %>' __designer:wfdid="w32"></asp:TextBox><asp:RangeValidator id="AvailableRangeValidator" runat="server" ErrorMessage="Incorrect value" Display="Dynamic" ControlToValidate="AvailableTextBox" __designer:wfdid="w33" Type="Double" MinimumValue="0" MaximumValue="99999" Font-Size="X-Small" Font-Names="Verdana" Font-Bold="False"></asp:RangeValidator> 
</ItemTemplate>

<ItemStyle VerticalAlign="Top" Width="7%" horizontalalign="Left"></ItemStyle>
</asp:TemplateField>
</Columns>
                            </x:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="<%$ Resources:TimeLive.Web, Add_text%> " /></td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <EditItemTemplate>
                <table class="xview" width="100%">
                    <tr>
                        <td class="caption" colspan="2">
                            <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Policy Information")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2">
                            <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Policy")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewLabelCell" style="width: 25%;" align="right">
                            
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtTimeOffPolicy">
                            <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Policy:")%> ' /></asp:Label></td>
                        <td style="width: 75%;">
                            &nbsp;<asp:TextBox ID="txtTimeOffPolicy" runat="server" Width="400px" Text='<%# Bind("AccountTimeOffPolicy") %>'></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTimeOffPolicy"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 25%">
                            <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Disabled:")%> ' /></td>
                        <td style="width: 75%">
                            <asp:CheckBox ID="chkIsDisabled" runat="server" Checked='<%# Bind("IsDisabled") %>' /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <x:GridView ID="GridView1" PageSize="500" runat="server" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Time Off Policies Detail List %>"
                                DataSourceID="dsTimeOffPoliciesDetailGridViewObject" Width="100%" SkinID="xgridviewSkinEmployee" AllowSorting="True" DataKeyNames="AccountTimeOffPolicyDetailId,AccountTimeOffPolicyId,AccountTimeOffTypeId,SystemEarnPeriodId,SystemResetToZeroTypeId" OnRowDataBound="GridView1_RowDataBound1">
                                <Columns>
                                    <asp:BoundField DataField="AccountTimeOffType" HeaderText="<%$ Resources:TimeLive.Web, Time Off Type %>" SortExpression="AccountTimeOffType" >
                                        <itemstyle width="27%" />
                                    </asp:BoundField>
<asp:TemplateField HeaderText="Effective Date">
<ItemTemplate>
<cc1:CalendarPopup id="EffectiveDateCalendarPopup" runat="server" Width="85px" Text="..." __designer:wfdid="w83" SelectedDate=""></cc1:CalendarPopup> 
</ItemTemplate>
<ItemStyle Width="17%"></ItemStyle>
</asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Initial Set to Hours %>">
                                        <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("InitialSetToHours") %>' __designer:wfdid="w45"></asp:TextBox> 
</edititemtemplate>
                                        <itemtemplate>
<asp:TextBox id="InitialHoursTextBox" runat="server" Width="90%" Text='<%# Bind("InitialSetToHours") %>' __designer:wfdid="w43"></asp:TextBox><asp:RangeValidator id="InitialHoursRangeValidator" runat="server" ErrorMessage="Incorrect value" Display="Dynamic" ControlToValidate="InitialHoursTextBox" __designer:wfdid="w44" Type="Double" MinimumValue="0" MaximumValue="99999" Font-Size="X-Small" Font-Names="Verdana" Font-Bold="False"></asp:RangeValidator> 
</itemtemplate>
                                        <itemstyle verticalalign="Top" width="7%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Earn Hours %>">
                                        <itemtemplate>
<asp:TextBox id="EarnHourTextBox" runat="server" Width="90%" Text='<%# Bind("EarnHours") %>' __designer:wfdid="w46"></asp:TextBox> <asp:RangeValidator id="EarnHourRangeValidator" runat="server" ErrorMessage="Incorrect value" Display="Dynamic" ControlToValidate="EarnHourTextBox" __designer:wfdid="w47" Type="Double" MinimumValue="0" MaximumValue="99999" Font-Size="X-Small" Font-Names="Verdana" Font-Bold="False"></asp:RangeValidator> 
</itemtemplate>
                                        <itemstyle width="7%" verticalalign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Earn Period %>">
                                        <itemtemplate>
<asp:DropDownList id="ddlSystemEarnPeriodId" runat="server" Width="100%" DataSourceID="dsSystemEarnPeriodObject" __designer:wfdid="w50" AppendDataBoundItems="True" DataTextField="SystemEarnPeriod" DataValueField="SystemEarnPeriodId"><asp:ListItem Value="0">Never</asp:ListItem>
</asp:DropDownList><asp:ObjectDataSource id="dsSystemEarnPeriodObject" runat="server" TypeName="SystemDataBLL" SelectMethod="GetSystemEarnPeriods" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w51"></asp:ObjectDataSource> 
</itemtemplate>
                                        <itemstyle width="14%" verticalalign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Reset At %>">
                                        <itemtemplate>
<asp:DropDownList id="ddlSystemResetToZeroTypeId" runat="server" Width="100%" DataSourceID="dsSystemResetToZeroObject" __designer:wfdid="w52" AppendDataBoundItems="True" DataTextField="SystemResetToZeroType" DataValueField="SystemResetToZeroTypeId"><asp:ListItem Value="0">Never</asp:ListItem>
</asp:DropDownList><asp:ObjectDataSource id="dsSystemResetToZeroObject" runat="server" TypeName="SystemDataBLL" SelectMethod="GetSystemResetToZeroType" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w53"></asp:ObjectDataSource> 
</itemtemplate>
                                        <itemstyle width="14%" verticalalign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Reset Hours %>">
                                        <itemtemplate>
<asp:TextBox id="ResetToHoursTextBox" runat="server" Width="90%" Text='<%# Bind("ResetToHours") %>' __designer:wfdid="w54"></asp:TextBox> <asp:RangeValidator id="ResetToHoursRangeValidator" runat="server" ErrorMessage="Incorrect value" Display="Dynamic" ControlToValidate="ResetToHoursTextBox" __designer:wfdid="w55" Type="Double" MinimumValue="0" MaximumValue="99999" Font-Size="X-Small" Font-Names="Verdana" Font-Bold="False"></asp:RangeValidator> 
</itemtemplate>
                                        <itemstyle width="7%" verticalalign="Top" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Maximum Available %>">
                                        <edititemtemplate>
&nbsp; 
</edititemtemplate>
                                        <itemtemplate>
<asp:TextBox id="AvailableTextBox" runat="server" Width="90%" Text='<%# Bind("MaximumAvailable") %>' __designer:wfdid="w56"></asp:TextBox> <asp:RangeValidator id="AvailableRangeValidator" runat="server" ErrorMessage="Incorrect value" Display="Dynamic" ControlToValidate="AvailableTextBox" __designer:wfdid="w57" Type="Double" MinimumValue="0" MaximumValue="99999" Font-Size="X-Small" Font-Names="Verdana" Font-Bold="False"></asp:RangeValidator> 
</itemtemplate>
                                        <itemstyle width="7%" verticalalign="Top" />
                                    </asp:TemplateField>
</Columns>
</x:GridView>
</td>
</tr>
<tr>
                        <td colspan="2" align="right">
                            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="<%$ Resources:TimeLive.Web, Update_Text%> " /></td>
                    </tr>
                </table>
            </EditItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="dsTimeOffPoliciesDetailFormViewObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountTimeOffPolicyByAccountTimeOffPolicyId"
            TypeName="AccountTimeOffPolicyBLL">
            <SelectParameters>
                <asp:Parameter   Name="AccountTimeOffPolicyId" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsTimeOffPoliciesDetailGridViewObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountTimeOffPolicyDetailByAccountTimeOffPolicyId" TypeName="AccountTimeOffPolicyBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:QueryStringParameter   Name="AccountTimeOffPolicyId" QueryStringField="AccountTimeOffPolicyId" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
