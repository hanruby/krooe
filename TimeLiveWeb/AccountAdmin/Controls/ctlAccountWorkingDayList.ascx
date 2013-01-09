<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountWorkingDayList.ascx.vb" Inherits="Employee_Controls_ctlAccountWorkingDayList" %>
<style type="text/css">
    .style2
    {
        height: 24px;
        width: 34%;
    }
    .style9
    {
        width: 34%;
    }
</style>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="AccountWorkingDayTypeId" Caption='<%# ResourceHelper.GetFromResource("Working Day Type List") %>' DataSourceID="dsAccountWorkingDayTypeGridViewObject" SkinID="xgridviewSkinEmployee" Width="98%" CssClass="TableView">
            <Columns>
                <asp:TemplateField SortExpression="AccountWorkingDayType">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("AccountWorkingDayType") %>' __designer:wfdid="w29"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Day Type") %>' CommandArgument="AccountWorkingDayType" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("AccountWorkingDayType") %>' __designer:wfdid="w28"></asp:Label>
</itemtemplate>
                    <itemstyle width="30%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="WorkingDay">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("WorkingDay") %>' __designer:wfdid="w37"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Week Start Day") %>' CommandArgument="WorkingDay" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("WorkingDay") %>' __designer:wfdid="w36"></asp:Label>
</itemtemplate>
                    <itemstyle width="22%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="HoursPerDay">
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("HoursPerDay") %>' __designer:wfdid="w40"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Hours Per Day") %>' CommandArgument="HoursPerDay" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("HoursPerDay") %>' __designer:wfdid="w39"></asp:Label>
</itemtemplate>
                    <itemstyle width="8%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="MinimumHoursPerDay">
                    <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("MinimumHoursPerDay") %>' __designer:wfdid="w43"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Minimum Hours Per Day") %>' CommandArgument="MinimumHoursPerDay" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label4" runat="server" Text='<%# Bind("MinimumHoursPerDay") %>' __designer:wfdid="w42"></asp:Label>
</itemtemplate>
                    <itemstyle width="7%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="MaximumHoursPerDay">
                    <edititemtemplate>
<asp:TextBox id="TextBox5" runat="server" Text='<%# Bind("MaximumHoursPerDay") %>' __designer:wfdid="w46"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton7" runat="server" Text='<%# ResourceHelper.GetFromResource("Maximum Hours Per Day") %>' CommandArgument="MaximumHoursPerDay" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("MaximumHoursPerDay") %>' __designer:wfdid="w45"></asp:Label>
</itemtemplate>
                    <itemstyle width="7%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="MinimumHoursPerWeek">
                    <edititemtemplate>
<asp:TextBox id="TextBox6" runat="server" Text='<%# Bind("MinimumHoursPerWeek") %>' __designer:wfdid="w49"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton8" runat="server" Text='<%# ResourceHelper.GetFromResource("Minimum Hours Per Week") %>' CommandArgument="MinimumHoursPerWeek" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label6" runat="server" Text='<%# Bind("MinimumHoursPerWeek") %>' __designer:wfdid="w48"></asp:Label>
</itemtemplate>
                    <itemstyle width="8%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="MaximumHoursPerWeek">
                    <edititemtemplate>
<asp:TextBox id="TextBox7" runat="server" Text='<%# Bind("MaximumHoursPerWeek") %>' __designer:wfdid="w52"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton9" runat="server" Text='<%# ResourceHelper.GetFromResource("Maximum Hours Per Week") %>' CommandArgument="MaximumHoursPerWeek" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label7" runat="server" Text='<%# Bind("MaximumHoursPerWeek") %>' __designer:wfdid="w51"></asp:Label>
</itemtemplate>
                    <itemstyle width="8%" />
                </asp:TemplateField>
            
                <asp:TemplateField 
                    HeaderText="Overdue After Days" SortExpression="TimesheetOverdueAfterDays">
                    <EditItemTemplate>
<asp:TextBox id="txtTimesheetOverdueAfterDays" runat="server" Text='<%# Bind("TimesheetOverdueAfterDays") %>' __designer:wfdid="w52"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
<asp:Label id="lblTimesheetOverdueAfterDays" runat="server" Text='<%# Bind("TimesheetOverdueAfterDays") %>' __designer:wfdid="w51"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            
                <asp:CommandField HeaderText="<%$ Resources:TimeLive.Web, Edit_Text %>" SelectText="Edit" ShowSelectButton="True">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="6%" cssclass="edit_button" />
        </asp:CommandField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
                    <ItemTemplate>
<asp:LinkButton id="DeleteLinkButton" runat="server" Text="Delete" CommandName="Delete" Visible='<%# IIF(NOT IsDbnull(Eval("MasterWorkingDayTypeId")),"False","True") %>' __designer:wfdid="w29" OnClientClick="<%# ResourceHelper.GetDeleteMessageJavascript() %>" CausesValidation="False"></asp:LinkButton> 
</ItemTemplate>
                <ItemStyle Width="3%" cssclass="delete_button" />
                    </asp:TemplateField>
                <asp:TemplateField HeaderText="Disabled">
                    <HeaderTemplate>
<asp:Image id="DisabledImage" runat="server" __designer:wfdid="w28" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> "></asp:Image> 
</HeaderTemplate>
                    <ItemTemplate>
<asp:Image id="DisabledImageRO" runat="server" Visible='<%# IIF(IsDBNull(Eval("IsDisabled")),"False",Eval("IsDisabled")) %>' __designer:wfdid="w27" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> "></asp:Image> 
</ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="2%" />
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <table style="width: 100%">
            <tr>
                <td align="left">
                    <asp:Button ID="btnAddWorkingDay" runat="server" OnClick="btnAddWorkingDay_Click"
                        Text="Add" Width="75px" /></td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsAccountWorkingDayTypeGridViewObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountWorkingDayTypeByAccountId"
            TypeName="AccountWorkingDayTypeBLL" 
            InsertMethod="AddAccountWorkingDayType" 
            UpdateMethod="UpdateAccountWorkingDayType">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountWorkingDayType" Type="String" />
                <asp:Parameter Name="WeekStartDay" Type="Int16" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="HoursPerDay" Type="Double" />
                <asp:Parameter Name="MinimumHoursPerDay" Type="Double" />
                <asp:Parameter Name="MaximumHoursPerDay" Type="Double" />
                <asp:Parameter Name="MinimumHoursPerWeek" Type="Double" />
                <asp:Parameter Name="MaximumHoursPerWeek" Type="Double" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
                <asp:Parameter Name="Original_AccountWorkingDayTypeId" DbType="Guid" />
                <asp:Parameter Name="AccountTimesheetPeriodTypeId" DbType="Guid" />
                <asp:Parameter Name="TimesheetOverdueAfterDays" Type="Int16" />
                <asp:Parameter Name="MinimumPercentagePerDay" Type="Int32" />
                <asp:Parameter Name="MaximumPercentagePerDay" Type="Int32" />
                <asp:Parameter Name="MinimumPercentagePerWeek" Type="Int32" />
                <asp:Parameter Name="MaximumPercentagePerWeek" Type="Int32" />
                <asp:Parameter Name="LockAllPreviousTimesheets" Type="Boolean" />
                <asp:Parameter Name="LockAllFutureTimesheets" Type="Boolean" />
                <asp:Parameter Name="LockPreviousTimesheetPeriods" Type="Int32" />
                <asp:Parameter Name="LockFutureTimsheetPeriods" Type="Int32" />
                <asp:Parameter Name="LockPreviousNextMonthTimesheetOn" Type="Int32" />
                <asp:Parameter Name="EnableBalanceValidationForTimeOff" Type="Boolean" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountWorkingDayType" Type="String" />
                <asp:Parameter Name="HoursPerDay" Type="Double" />
                <asp:Parameter Name="MinimumHoursPerDay" Type="Double" />
                <asp:Parameter Name="MaximumHoursPerDay" Type="Double" />
                <asp:Parameter Name="MinimumHoursPerWeek" Type="Double" />
                <asp:Parameter Name="MaximumHoursPerWeek" Type="Double" />
                <asp:Parameter Name="WeekStartDay" Type="Int16" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="AccountTimesheetPeriodTypeId" DbType="Guid" />
                <asp:Parameter Name="TimesheetOverdueAfterDays" Type="Int16" />
                <asp:Parameter Name="MinimumPercentagePerDay" Type="Int32" />
                <asp:Parameter Name="MaximumPercentagePerDay" Type="Int32" />
                <asp:Parameter Name="MinimumPercentagePerWeek" Type="Int32" />
                <asp:Parameter Name="MaximumPercentagePerWeek" Type="Int32" />
                <asp:Parameter Name="LockAllPreviousTimesheets" Type="Boolean" />
                <asp:Parameter Name="LockAllFutureTimesheets" Type="Boolean" />
                <asp:Parameter Name="LockPreviousTimesheetPeriods" Type="Int32" />
                <asp:Parameter Name="LockFutureTimsheetPeriods" Type="Int32" />
                <asp:Parameter Name="LockPreviousNextMonthTimesheetOn" Type="Int32" />
                <asp:Parameter Name="EnableBalanceValidationForTimeOff" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountWorkingDayTypeFormViewObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountWorkingDayTypeByAccountWorkingDayTypeId"
            TypeName="AccountWorkingDayTypeBLL" 
            UpdateMethod="UpdateAccountWorkingDayType" 
            InsertMethod="AddAccountWorkingDayType">
            <UpdateParameters>
                <asp:Parameter Name="AccountWorkingDayType" Type="String" />
                <asp:Parameter Name="WeekStartDay" Type="Int16" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="HoursPerDay" Type="Double" />
                <asp:Parameter Name="MinimumHoursPerDay" Type="Double" />
                <asp:Parameter Name="MaximumHoursPerDay" Type="Double" />
                <asp:Parameter Name="MinimumHoursPerWeek" Type="Double" />
                <asp:Parameter Name="MaximumHoursPerWeek" Type="Double" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
                <asp:Parameter Name="Original_AccountWorkingDayTypeId" DbType="Guid" />
                <asp:Parameter Name="AccountTimesheetPeriodTypeId" DbType="Guid" />
                <asp:Parameter Name="TimesheetOverdueAfterDays" Type="Int16" />
                <asp:Parameter Name="MinimumPercentagePerDay" Type="Int32" />
                <asp:Parameter Name="MaximumPercentagePerDay" Type="Int32" />
                <asp:Parameter Name="MinimumPercentagePerWeek" Type="Int32" />
                <asp:Parameter Name="MaximumPercentagePerWeek" Type="Int32" />
                <asp:Parameter Name="LockAllPreviousTimesheets" Type="Boolean" />
                <asp:Parameter Name="LockAllFutureTimesheets" Type="Boolean" />
                <asp:Parameter Name="LockPreviousTimesheetPeriods" Type="Int32" />
                <asp:Parameter Name="LockFutureTimsheetPeriods" Type="Int32" />
                <asp:Parameter Name="LockPreviousNextMonthTimesheetOn" Type="Int32" />
                <asp:Parameter Name="EnableBalanceValidationForTimeOff" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="AccountWorkingDayTypeId"
                    PropertyName="SelectedValue" DbType="Guid" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter DefaultValue="55" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountWorkingDayType" Type="String" />
                <asp:Parameter Name="HoursPerDay" Type="Double" />
                <asp:Parameter Name="MinimumHoursPerDay" Type="Double" />
                <asp:Parameter Name="MaximumHoursPerDay" Type="Double" />
                <asp:Parameter Name="MinimumHoursPerWeek" Type="Double" />
                <asp:Parameter Name="MaximumHoursPerWeek" Type="Double" />
                <asp:Parameter Name="WeekStartDay" Type="Int16" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="AccountTimesheetPeriodTypeId" DbType="Guid" />
                <asp:Parameter Name="TimesheetOverdueAfterDays" Type="Int16" />
                <asp:Parameter Name="MinimumPercentagePerDay" Type="Int32" />
                <asp:Parameter Name="MaximumPercentagePerDay" Type="Int32" />
                <asp:Parameter Name="MinimumPercentagePerWeek" Type="Int32" />
                <asp:Parameter Name="MaximumPercentagePerWeek" Type="Int32" />
                <asp:Parameter Name="LockAllPreviousTimesheets" Type="Boolean" />
                <asp:Parameter Name="LockAllFutureTimesheets" Type="Boolean" />
                <asp:Parameter Name="LockPreviousTimesheetPeriods" Type="Int32" />
                <asp:Parameter Name="LockFutureTimsheetPeriods" Type="Int32" />
                <asp:Parameter Name="LockPreviousNextMonthTimesheetOn" Type="Int32" />
                <asp:Parameter Name="EnableBalanceValidationForTimeOff" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource id="dsAccountWorkingDayObjectEdit" runat="server" TypeName="AccountWorkingDayBLL" SelectMethod="GetAccountWorkingDaysByAccountIdForGridEdit" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
        Type="Int32" />
                <asp:ControlParameter ControlID="GridView2" Name="AccountWorkingDayTypeId" 
                    PropertyName="SelectedValue" DbType="Guid" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountWorkingDayTypeId"
            DataSourceID="dsAccountWorkingDayTypeFormViewObject" DefaultMode="Insert" SkinID="formviewSkinEmployee" Width="500px">
            <EditItemTemplate><table class="xFormView" width="600">
                <tr>
                    <td class="caption" colspan="2">
                 <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Day Type Information")%> ' /></td>
                </tr>
                <tr>
                    <td class="FormViewSubHeader" colspan="2">
                 <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Day Type")%> ' /> </td>
                </tr>
                <tr>
                    <td class="FormViewLabelCell" style="width: 35%;" align="right">
                         <SPAN 
                  class=reqasterisk>*</SPAN> 
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="WorkingDayTypeTextBox">
<asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Day Type:")%> ' /></asp:Label></td>
                    <td style="width: 65%">
                        <asp:TextBox ID="WorkingDayTypeTextBox" runat="server" Text='<%# Bind("AccountWorkingDayType") %>' MaxLength="250" Width="215px"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RFVWorkingDayType" runat="server" ControlToValidate="WorkingDayTypeTextBox"
                            CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        
<asp:Label ID="Label12" runat="server" AssociatedControlID="HoursPerDayTextBox">
                        <asp:Literal ID="Literal17" runat="server" Text='<%# ResourceHelper.GetFromResource("Hours Per Day")%> ' />:</asp:Label></td>
                    <td style="width: 65%">
                        <asp:TextBox ID="HoursPerDayTextBox" runat="server" Text='<%# Bind("HoursPerDay") %>'
                            Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="HoursPerDayTextBox"
                            CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="HoursPerDayTextBox"
                            Display="Dynamic" ErrorMessage="Value must be in numeric format" MaximumValue="999999"
                            MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        
<asp:Label ID="Label13" runat="server" AssociatedControlID="MinimumHoursPerDayTextBox">
                        <asp:Literal ID="Literal16" runat="server" Text='<%# ResourceHelper.GetFromResource("Minimum Hours Per Day")%> ' />:</asp:Label></td>
                    <td style="width: 65%">
                        <asp:TextBox ID="MinimumHoursPerDayTextBox" runat="server" Text='<%# Bind("MinimumHoursPerDay") %>'
                            Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RFVMinimumHoursPerDay" runat="server" ControlToValidate="MinimumHoursPerDayTextBox"
                            CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator
                                ID="RVMinimumHoursPerDay" runat="server" ControlToValidate="MinimumHoursPerDayTextBox" Display="Dynamic"
                                ErrorMessage="Value must be in numeric format" MaximumValue="999999" MinimumValue="0"
                                Type="Double"></asp:RangeValidator></td></tr><tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                       
<asp:Label ID="Label14" runat="server" AssociatedControlID="MaximumHoursPerDayTextBox">
                        <asp:Literal ID="Literal15" runat="server" Text='<%# ResourceHelper.GetFromResource("Maximum Hours Per Day")%> ' />:</asp:Label></td><td style="width: 70%">
                        <asp:TextBox ID="MaximumHoursPerDayTextBox" runat="server" Text='<%# Bind("MaximumHoursPerDay") %>'
                            Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RFVMaximumHoursPerDay" runat="server" ControlToValidate="MaximumHoursPerDayTextBox"
                            CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RVMaximumHoursPerDay" runat="server" ControlToValidate="MaximumHoursPerDayTextBox"
                            Display="Dynamic" ErrorMessage="Value must be in numeric format" MaximumValue="999999"
                            MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        
<asp:Label ID="Label15" runat="server" AssociatedControlID="MinimumHoursPerWeekTextBox">
                        <asp:Literal ID="Literal14" runat="server" Text='<%# ResourceHelper.GetFromResource("Minimum Hours Per Week")%> ' />:</asp:Label></td><td style="width: 70%">
                        <asp:TextBox ID="MinimumHoursPerWeekTextBox" runat="server" Text='<%# Bind("MinimumHoursPerWeek") %>'
                            Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RFVMinimumHoursPerWeek" runat="server" ControlToValidate="MinimumHoursPerWeekTextBox"
                            CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RVMinimumHoursPerWeek" runat="server" ControlToValidate="MinimumHoursPerWeekTextBox"
                            Display="Dynamic" ErrorMessage="Value must be in numeric format" MaximumValue="999999"
                            MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        
<asp:Label ID="Label16" runat="server" AssociatedControlID="MaximumHoursPerWeekTextBox">
                        <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("Maximum Hours Per Week")%> ' />:</asp:Label></td>
                    <td style="width: 65%">
                        <asp:TextBox ID="MaximumHoursPerWeekTextBox" runat="server" Text='<%# Bind("MaximumHoursPerWeek") %>'
                            Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RFVMaximumHoursPerWeek" runat="server" ControlToValidate="MaximumHoursPerWeekTextBox"
                            CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RVMaximumHoursPerWeek" runat="server" ControlToValidate="MaximumHoursPerWeekTextBox"
                            Display="Dynamic" ErrorMessage="Value must be in numeric format" MaximumValue="999999"
                            MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                    <td 
                        align="right" class="FormViewLabelCell" style="width: 35%">Minimum Percentage Per Day:</td><td 
                        style="width: 65%"><asp:TextBox ID="MinimumPercentagePerDayTextBox" 
                            runat="server" Text='<%# Bind("MinimumPercentagePerDay") %>' Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                            ID="RFVMinimumPercentagePerDay" runat="server" 
                            ControlToValidate="MinimumPercentagePerDayTextBox" CssClass="ErrorMessage" 
                            Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                            ID="RVMinimumPercentagePerDay" runat="server" 
                            ControlToValidate="MinimumPercentagePerDayTextBox" Display="Dynamic" 
                            ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr><tr>
                    <td 
                        align="right" class="FormViewLabelCell" style="width: 35%">Maximum Percentage Per Day:</td><td 
                        style="width: 65%"><asp:TextBox ID="MaximumPercentagePerDayTextBox" 
                            runat="server" Text='<%# Bind("MaximumPercentagePerDay") %>' Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                            ID="RFVMaximumPercentagePerDay" runat="server" 
                            ControlToValidate="MaximumPercentagePerDayTextBox" CssClass="ErrorMessage" 
                            Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                            ID="RVMaximumPercentagePerDay" runat="server" 
                            ControlToValidate="MaximumPercentagePerDayTextBox" Display="Dynamic" 
                            ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr><tr>
                    <td 
                        align="right" class="FormViewLabelCell" style="width: 35%">Minimum Percentage Per Period:</td><td 
                        style="width: 65%"><asp:TextBox ID="MinimumPercentagePerWeekTextBox" 
                            runat="server" Text='<%# Bind("MinimumPercentagePerWeek") %>' Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                            ID="RFVMinimumPercentagePerWeek" runat="server" 
                            ControlToValidate="MinimumPercentagePerWeekTextBox" CssClass="ErrorMessage" 
                            Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                            ID="RVMinimumPercentagePerWeek" runat="server" 
                            ControlToValidate="MinimumPercentagePerWeekTextBox" Display="Dynamic" 
                            ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr><tr>
                    <td 
                        align="right" class="FormViewLabelCell" style="width: 35%">Maximum Percentage Per Period:</td><td 
                        style="width: 65%"><asp:TextBox ID="MaximumPercentagePerWeekTextBox" 
                            runat="server" Text='<%# Bind("MaximumPercentagePerWeek") %>' Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                            ID="RFVMaximumPercentagePerWeek" runat="server" 
                            ControlToValidate="MaximumPercentagePerWeekTextBox" CssClass="ErrorMessage" 
                            Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                            ID="RVMaximumPercentagePerWeek" runat="server" 
                            ControlToValidate="MaximumPercentagePerWeekTextBox" Display="Dynamic" 
                            ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr><tr>
                    <td 
                        align="right" class="FormViewLabelCell" style="width: 35%">Timesheet Overdue: <td 
                        style="width: 65%"><asp:TextBox ID="txtTimesheetOverdue" runat="server" 
                            Width="92px"></asp:TextBox>Days After Due Date <asp:Label ID="Label17" 
                            runat="server" AssociatedControlID="HoursPerDayTextBox" ForeColor="Red">
                            (0 = On Due Date)</asp:Label><asp:RequiredFieldValidator 
                            ID="RFVTimesheetOverdue" runat="server" ControlToValidate="txtTimesheetOverdue" 
                            CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                            ID="RVMaximumHoursPerWeek0" runat="server" 
                            ControlToValidate="txtTimesheetOverdue" Display="Dynamic" 
                            ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator></td></td></tr>
                <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        Lock Previous Timesheet Periods:</td>
                    <td style="width: 65%">
                        <asp:TextBox ID="LockPreviousTimesheetPeriodsTextBox" runat="server" 
                            Width="92px"></asp:TextBox>
                        <asp:Label ID="Label20" runat="server" 
                            AssociatedControlID="LockPreviousTimesheetPeriodsTextBox" ForeColor="Red"> 
                        (0 = No Locking)</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="LockPreviousTimesheetPeriodsTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RVLockPreviousTimesheetPeriods" runat="server" 
                            ControlToValidate="LockPreviousTimesheetPeriodsTextBox" Display="Dynamic" 
                            ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr><td 
                        align="right" class="FormViewLabelCell" style="width: 35%">Lock Next 
                    Timesheet Periods:</td>
                    <td style="width: 65%">
                        <asp:TextBox ID="LockFutureTimsheetPeriodsTextBox" runat="server" Width="92px"></asp:TextBox>
                        <asp:Label ID="Label19" runat="server" 
                            AssociatedControlID="LockFutureTimsheetPeriodsTextBox" ForeColor="Red"> (0 = 
                        No Locking)</asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="LockFutureTimsheetPeriodsTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RVLockFutureTimsheetPeriods" runat="server" 
                            ControlToValidate="LockFutureTimsheetPeriodsTextBox" Display="Dynamic" 
                            ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                            <tr>
                                <td align="right" class="FormViewLabelCell" style="width: 35%">
                                    Lock Previous/Next Timesheets On:</td>
                                <td style="width: 65%">
                                    <asp:TextBox ID="LockPreviousNextMonthTimesheetOnTextBox" runat="server" 
                                        Width="92px"></asp:TextBox>
                                    Day of Month<asp:Label ID="Label18" runat="server" 
                                        AssociatedControlID="LockPreviousNextMonthTimesheetOnTextBox" ForeColor="Red"> 
                                    (0 = No Locking)</asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="LockPreviousNextMonthTimesheetOnTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RVLockPreviousNextMonthTimesheetOn" runat="server" 
                                        ControlToValidate="LockPreviousNextMonthTimesheetOnTextBox" Display="Dynamic" 
                                        ErrorMessage="Value must be in numeric format" MaximumValue="30" 
                                        MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                </td>
                </tr>
                            <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        <asp:Literal ID="Literal19" runat="server" Text='<%# ResourceHelper.GetFromResource("Timesheet Period Type:")%> ' />
                    <td style="width: 65%">
                        <asp:DropDownList ID="ddlTimesheetPeriodTypeId" runat="server" Width="100px" DataSourceID="dsTimesheetPeriodTypeObject" DataTextField="SystemTimesheetPeriodType" DataValueField="AccountTimesheetPeriodTypeId">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="FormViewLabelCell" style="width: 35%" align="right">
                          <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Week Start Day:")%> ' />
                    <td 
                              style="width: 65%; "><asp:DropDownList ID="ddlWeekStartDay" runat="server" 
                                  DataSourceID="dsWeekStartDayObject" DataTextField="WorkingDay" 
                                  DataValueField="WorkingDayNo" SelectedValue='<%# Bind("WeekStartDay") %>' 
                                  Width="100px"></asp:DropDownList><asp:RequiredFieldValidator 
                                  ID="RFVWeekStartDay" runat="server" ControlToValidate="ddlWeekStartDay" 
                                  CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td></td></tr>
                <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        Lock All Previous Timesheets:</td>
                    <td style="width: 65%">
                        <asp:CheckBox ID="chkLockAllPreviousTimesheets" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        Lock All Next Timesheets:</td>
                    <td style="width: 65%">
                        <asp:CheckBox ID="chkLockAllFutureTimesheets" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%">
                        Enable Balance Validation For Time Off:
                    </td>
                    <td style="width: 65%">
                        <asp:CheckBox ID="chkEnableBalanceValidationForTimeOff" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%" valign="top">
                          <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Days:")%> ' />
                          <td style="width: 65%; ">
                              <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                  DataKeyNames="AccountWorkingDayId,WorkingDayNo" 
                                  DataSourceID="dsAccountWorkingDayObjectEdit" SkinID="xgridviewSkinEmployee" 
                                  Width="232px">
                                  <Columns>
                                      <asp:BoundField DataField="WorkingDayNo" HeaderText="WorkingDayNo" 
                                          SortExpression="WorkingDayNo" Visible="False" />
                                      <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                                          SortExpression="AccountId" Visible="False" />
                                      <asp:BoundField DataField="AccountWorkingDayId" HeaderText="Id" 
                                          InsertVisible="False" ReadOnly="True" SortExpression="AccountWorkingDayId" 
                                          Visible="False" />
                                      <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Working Day %>">
                                          <edititemtemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" __designer:wfdid="w43" 
                                                  Text='<%# Bind("WorkingDay") %>'></asp:TextBox>
                                          </edititemtemplate>
                                          <itemtemplate>
                                              <asp:Label ID="Label4" runat="server" __designer:wfdid="w42" 
                                                  Text='<%#GetGlobalResourceObject("TimeLive.Web", Eval("WorkingDay"))%>'></asp:Label>
                                          </itemtemplate>
                                          <headerstyle horizontalalign="Left" />
                                          <itemstyle horizontalalign="Left" width="175px" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Selected_text %>">
                                          <itemtemplate>
                                              <asp:CheckBox ID="chkSelected" runat="server" __designer:wfdid="w274" 
                                                  Checked='<%# IIF(IsDBNull(Eval("AccountWorkingDayId")),"false","true") %>' />
                                          </itemtemplate>
                                          <ItemStyle HorizontalAlign="Center" Width="55px" />
                                      </asp:TemplateField>
                                  </Columns>
                              </x:GridView>
                          </td>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 35%" valign="top">
                         <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:TimeLive.Web, Disabled:%> " />
                    </td>
                    <td style="width: 65%">
                        <asp:CheckBox ID="chkIsDisabled" runat="server" Checked='<%# Bind("IsDisabled") %>' Enabled='<%# IIF(NOT IsDbnull(Eval("MasterWorkingDayTypeId")),"False","True") %>' /></td>
                </tr>
                <tr>
                    <td class="FormViewLabelCell" style="width: 35%" align="right">
                    </td>
                    <td style="width: 65%">
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="<%$ Resources:TimeLive.Web, Update_Text%> " Width="80px" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="<%$ Resources:TimeLive.Web, Cancel_Text%> " Width="80px" ValidationGroup="CB" OnClick="btnCancel_Click" />
                        <asp:Label ID="lblException" runat="server" Font-Bold="True" Font-Names="Tahoma"
                            Font-Size="Smaller" ForeColor="Red" Text="Label" Visible="False"></asp:Label></td></tr></table></EditItemTemplate><InsertItemTemplate>
                <table class="xFormView" width="600">
                    <tr>
                        <td class="caption" colspan="2">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Day Type Information")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2">
                             <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Day Type")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="style9" align="right">
                           <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="WorkingDayTypeTextBox">
<asp:Literal ID="Literal9" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Day Type:")%> ' /></asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="WorkingDayTypeTextBox" runat="server" Text='<%# Bind("AccountWorkingDayType") %>' MaxLength="250" Width="215px"></asp:TextBox><asp:RequiredFieldValidator ID="RFVWorkingDayType" runat="server" ControlToValidate="WorkingDayTypeTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr>
                        <td align="right" class="style9">
                            
<asp:Label ID="Label8" runat="server" AssociatedControlID="HoursPerDayTextBox">
                            <asp:Literal ID="Literal16" runat="server" Text='<%# ResourceHelper.GetFromResource("Hours Per Day")%> ' />:</asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="HoursPerDayTextBox" runat="server" Text='<%# Bind("HoursPerDay") %>'
                                Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="HoursPerDayTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="HoursPerDayTextBox"
                                Display="Dynamic" ErrorMessage="Value must be in numeric format" MaximumValue="999999"
                                MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                        <td align="right" class="style9">
                            
<asp:Label ID="Label9" runat="server" AssociatedControlID="MinimumHoursPerDayTextBox">
                            <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Minimum Hours Per Day")%> ' />:</asp:Label></td><td style="width: 70%;">
                            <asp:TextBox ID="MinimumHoursPerDayTextBox" runat="server" Text='<%# Bind("MinimumHoursPerDay") %>'
                                Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RFVMinimumHoursPerDay" runat="server" ControlToValidate="MinimumHoursPerDayTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator
                                    ID="RVMinimumHoursPerDay" runat="server" ControlToValidate="MinimumHoursPerDayTextBox" Display="Dynamic"
                                    ErrorMessage="Value must be in numeric format" MaximumValue="999999" MinimumValue="0"
                                    Type="Double"></asp:RangeValidator></td></tr><tr>
                        <td align="right" class="style9">
                           
<asp:Label ID="Label10" runat="server" AssociatedControlID="MaximumHoursPerDayTextBox">
                            <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Maximum Hours Per Day")%> ' />:</asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="MaximumHoursPerDayTextBox" runat="server" Text='<%# Bind("MaximumHoursPerDay") %>'
                                Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RFVMaximumHoursPerDay" runat="server" ControlToValidate="MaximumHoursPerDayTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator
                                    ID="RVMaximumHoursDay" runat="server" ControlToValidate="MaximumHoursPerDayTextBox" Display="Dynamic"
                                    ErrorMessage="Value must be in numeric format" MaximumValue="999999" MinimumValue="0"
                                    Type="Double"></asp:RangeValidator></td></tr><tr>
                        <td align="right" class="style9">
                            <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("Minimum Hours Per Week")%> ' />:</td><td style="width: 70%">
                            <asp:TextBox ID="MinimumHoursPerWeekTextBox" runat="server" Text='<%# Bind("MinimumHoursPerWeek") %>'
                                Width="92px"></asp:TextBox><asp:RequiredFieldValidator ID="RFVMinimumHoursPerWeek" runat="server" ControlToValidate="MinimumHoursPerWeekTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator ID="RVMinimumHoursPerWeek" runat="server" ControlToValidate="MinimumHoursPerWeekTextBox"
                                Display="Dynamic" ErrorMessage="Value must be in numeric format" MaximumValue="999999"
                                MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                        <td 
                            align="right" class="style9"><asp:Label ID="Label11" 
                                runat="server" AssociatedControlID="MaximumHoursPerWeekTextBox">
                            <asp:Literal ID="Literal11" runat="server" Text='<%# ResourceHelper.GetFromResource("Maximum Hours Per Week")%> ' />:</asp:Label></td><td 
                            style="width: 70%"><asp:TextBox 
                                ID="MaximumHoursPerWeekTextBox" runat="server" Text='<%# Bind("MaximumHoursPerWeek") %>'
                                Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                                ID="RFVMaximumHoursPerWeek" runat="server" ControlToValidate="MaximumHoursPerWeekTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                                ID="RVMaximumHoursPerWeek" runat="server" ControlToValidate="MaximumHoursPerWeekTextBox"
                                Display="Dynamic" ErrorMessage="Value must be in numeric format" MaximumValue="999999"
                                MinimumValue="0" Type="Double"></asp:RangeValidator></td></tr><tr>
                        <td align="right" class="style9">
                            
Minimum Percentage Per Day:</td><td style="width: 70%">
                            <asp:TextBox ID="MinimumPercentagePerDayTextBox" 
                                runat="server" Text='<%# Bind("MinimumPercentagePerDay") %>' Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                                ID="RFVMinimumPercentagePerDay" runat="server" 
                                ControlToValidate="MinimumPercentagePerDayTextBox" CssClass="ErrorMessage" 
                                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                                ID="RVMinimumPercentagePerDay" runat="server" 
                                ControlToValidate="MinimumPercentagePerDayTextBox" Display="Dynamic" 
                                ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                                MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr><tr>
                        <td 
                            align="right" class="style9">Maximum Percentage Per Day:</td><td 
                            style="width: 70%"><asp:TextBox ID="MaximumPercentagePerDayTextBox" 
                                runat="server" Text='<%# Bind("MaximumPercentagePerDay") %>' Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                                ID="RFVMaximumPercentagePerDay" runat="server" 
                                ControlToValidate="MaximumPercentagePerDayTextBox" CssClass="ErrorMessage" 
                                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                                ID="RVMaximumPercentagePerDay" runat="server" 
                                ControlToValidate="MaximumPercentagePerDayTextBox" Display="Dynamic" 
                                ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                                MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr><tr>
                        <td 
                            align="right" class="style9">Minimum Percentage Per Period:</td><td 
                            style="width: 70%"><asp:TextBox ID="MinimumPercentagePerWeekTextBox" 
                                runat="server" Text='<%# Bind("MinimumPercentagePerWeek") %>' Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                                ID="RFVMinimumPercentagePerWeek" runat="server" 
                                ControlToValidate="MinimumPercentagePerWeekTextBox" CssClass="ErrorMessage" 
                                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                                ID="RVMinimumPercentagePerWeek" runat="server" 
                                ControlToValidate="MinimumPercentagePerWeekTextBox" Display="Dynamic" 
                                ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                                MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr><tr>
                        <td 
                            align="right" class="style9">Maximum Percentage Per Period:</td><td 
                            style="width: 70%"><asp:TextBox ID="MaximumPercentagePerWeekTextBox" 
                                runat="server" Text='<%# Bind("MaximumPercentagePerWeek") %>' Width="92px"></asp:TextBox><asp:RequiredFieldValidator 
                                ID="RFVMaximumPercentagePerWeek" runat="server" 
                                ControlToValidate="MaximumPercentagePerWeekTextBox" CssClass="ErrorMessage" 
                                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator 
                                ID="RVMaximumPercentagePerWeek" runat="server" 
                                ControlToValidate="MaximumPercentagePerWeekTextBox" Display="Dynamic" 
                                ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                                MinimumValue="0" Type="Integer"></asp:RangeValidator></td></tr><tr>
                        <td 
                            align="right" class="style9">Timesheet Overdue: <td 
                            style="width: 70%"><asp:TextBox ID="txtTimesheetOverdue" runat="server" 
                                Text='<%# Bind("TimesheetOverdueAfterDays") %>' Width="92px"></asp:TextBox>Days After Due Date <asp:Label 
                                ID="Label12" runat="server" AssociatedControlID="HoursPerDayTextBox" 
                                ForeColor="Red">
                            (0 = On Due Date)</asp:Label><asp:RangeValidator ID="RVMaximumHoursPerWeek0" 
                                runat="server" ControlToValidate="txtTimesheetOverdue" Display="Dynamic" 
                                ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                                MinimumValue="0" Type="Integer"></asp:RangeValidator></td></td></tr>
                    <tr>
                        <td align="right" class="style9">
                            Lock Previous Timesheet Periods:</td>
                        <td style="width: 70%">
                            <asp:TextBox ID="LockPreviousTimesheetPeriodsTextBox" runat="server" 
                                Text='<%# Bind("LockPreviousTimesheetPeriods") %>' Width="92px"></asp:TextBox>
                            <asp:Label ID="Label21" runat="server" 
                                AssociatedControlID="LockPreviousTimesheetPeriodsTextBox" ForeColor="Red"> 
                            (0 = No Locking)</asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="LockPreviousTimesheetPeriodsTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RVLockPreviousTimesheetPeriods" runat="server" 
                                ControlToValidate="LockPreviousTimesheetPeriodsTextBox" Display="Dynamic" 
                                ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                                MinimumValue="0" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            Lock Next Timesheet Periods:</td>
                        <td style="width: 70%">
                            <asp:TextBox ID="LockFutureTimesheetPeriodsTextBox" runat="server" 
                                Text='<%# Bind("LockFutureTimsheetPeriods") %>' Width="92px"></asp:TextBox>
                            <asp:Label ID="Label20" runat="server" 
                                AssociatedControlID="LockFutureTimesheetPeriodsTextBox" ForeColor="Red"> (0 
                            = No Locking)</asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="LockFutureTimesheetPeriodsTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RVLockFutureTimesheetPeriods" runat="server" 
                                ControlToValidate="LockFutureTimesheetPeriodsTextBox" Display="Dynamic" 
                                ErrorMessage="Value must be in numeric format" MaximumValue="999999" 
                                MinimumValue="0" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            Lock Previous/Next Timesheets On:</td>
                        <td style="width: 70%">
                            <asp:TextBox ID="LockPreviousNextMonthTimesheetOnTextBox" runat="server" 
                                Text='<%# Bind("LockPreviousNextMonthTimesheetOn") %>' Width="92px"></asp:TextBox>
                            Day of Month<asp:Label ID="Label18" runat="server" 
                                AssociatedControlID="LockPreviousNextMonthTimesheetOnTextBox" ForeColor="Red"> 
                            (0 = No Locking)</asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="LockPreviousNextMonthTimesheetOnTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RVLockPreviousNextMonthTimesheetOn" runat="server" 
                                ControlToValidate="LockPreviousNextMonthTimesheetOnTextBox" Display="Dynamic" 
                                ErrorMessage="Value must be in numeric format" MaximumValue="30" 
                                MinimumValue="0" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2">
                            <asp:Literal ID="Literal18" runat="server" Text='<%# ResourceHelper.GetFromResource("Timesheet Period Type:")%> ' />
                        <td style="width: 70%; height: 24px;">
                            <asp:DropDownList ID="ddlTimesheetPeriodTypeId" runat="server" Width="100px" DataSourceID="dsTimesheetPeriodTypeObject" DataTextField="SystemTimesheetPeriodType" DataValueField="AccountTimesheetPeriodTypeId" SelectedValue='<%# Bind("AccountTimesheetPeriodTypeId") %>'>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="style9" align="right">
                             <asp:Literal ID="Literal12" runat="server" Text='<%# ResourceHelper.GetFromResource("Week Start Day:")%> ' />
                        <td 
                                 style="width: 70%; "><asp:DropDownList ID="ddlWeekStartDay" runat="server" 
                                     DataSourceID="dsWeekStartDayObject" DataTextField="WorkingDay" 
                                     DataValueField="WorkingDayNo" SelectedValue='<%# Bind("WeekStartDay") %>' 
                                     Width="100px"></asp:DropDownList><asp:RequiredFieldValidator 
                                     ID="RFVWeekStartDay" runat="server" ControlToValidate="ddlWeekStartDay" 
                                     CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td></td></tr>
                    <tr> 
                        <td align="right" class="style9">
                            Lock All Previous Timesheets:</td>
                        <td style="width: 70%">
                            <asp:CheckBox ID="CheckBox1" runat="server" 
                                Checked='<%# Bind("LockAllPreviousTimesheets") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            Lock All Next Timesheets:</td>
                        <td style="width: 70%">
                            <asp:CheckBox ID="CheckBox2" runat="server" 
                                Checked='<%# Bind("LockAllFutureTimesheets") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            Enable Balance Validation For Time Off:</td>
                        <td style="width: 70%">
                            <asp:CheckBox ID="CheckBox3" runat="server" 
                                Checked='<%# Bind("EnableBalanceValidationForTimeOff") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style9" valign="top">
                             <asp:Literal ID="Literal13" runat="server" Text='<%# ResourceHelper.GetFromResource("Working Days:")%> ' />
                             <td style="width: 70%; ">
                                 <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                     DataKeyNames="AccountWorkingDayId,WorkingDayNo" 
                                     DataSourceID="dsAccountWorkingDayObject" SkinID="xgridviewSkinEmployee" 
                                     Width="232px">
                                     <Columns>
                                         <asp:BoundField DataField="WorkingDayNo" HeaderText="WorkingDayNo" 
                                             SortExpression="WorkingDayNo" Visible="False" />
                                         <asp:BoundField DataField="AccountId" HeaderText="AccountId" 
                                             SortExpression="AccountId" Visible="False" />
                                         <asp:BoundField DataField="AccountWorkingDayId" HeaderText="Id" 
                                             InsertVisible="False" ReadOnly="True" SortExpression="AccountWorkingDayId" 
                                             Visible="False" />
                                         <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Working Day %>">
                                             <edititemtemplate>
                                                 <asp:TextBox ID="TextBox1" runat="server" __designer:wfdid="w43" 
                                                     Text='<%# Bind("WorkingDay") %>'></asp:TextBox>
                                             </edititemtemplate>
                                             <itemtemplate>
                                                 <asp:Label ID="Label4" runat="server" __designer:wfdid="w42" 
                                                     Text='<%#GetGlobalResourceObject("TimeLive.Web", Eval("WorkingDay"))%>'></asp:Label>
                                             </itemtemplate>
                                             <headerstyle horizontalalign="Left" />
                                             <itemstyle horizontalalign="Left" width="175px" />
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Selected_text %>">
                                             <itemtemplate>
                                                 <asp:CheckBox ID="chkSelected" runat="server" __designer:wfdid="w44" 
                                                     Checked='<%# IIF(IsDBNull(Eval("AccountWorkingDayId")),"false","true") %>' />
                                             </itemtemplate>
                                             <ItemStyle HorizontalAlign="Center" Width="55px" />
                                         </asp:TemplateField>
                                     </Columns>
                                 </x:GridView>
                             </td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9" align="right">
                        </td>
                        <td style="width: 70%">
                            <asp:Button ID="btnAdd" runat="server" CommandName="Insert" Text="<%$ Resources:TimeLive.Web, Add_Text%> " Width="70px" OnClick="btnAdd_Click" /><asp:Button
                                ID="btnCancel" runat="server" CommandName="Cancel" OnClick="btnCancel_Click"
                                Text="<%$ Resources:TimeLive.Web, Cancel_text%>" ValidationGroup="Add" Width="68px" />
                            <asp:Label ID="lblException" runat="server" Font-Bold="True" Font-Names="Tahoma"
                                Font-Size="Smaller" ForeColor="Red" Text="Label" Visible="False"></asp:Label></td></tr></table><asp:ObjectDataSource id="dsAccountWorkingDayObject" runat="server" TypeName="AccountWorkingDayBLL" SelectMethod="GetAccountWorkingDaysByAccountIdForGrid" OldValuesParameterFormatString="original_{0}">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
        Type="Int32" />
                    </SelectParameters>
</asp:ObjectDataSource>
            </InsertItemTemplate>
        </asp:FormView>
                <asp:ObjectDataSource ID="dsWeekStartDayObject" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetWorkingDays" TypeName="SystemDataBLL">
                </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsTimesheetPeriodTypeObject" runat="server"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountTimesheetPeriodTypesByAccountIdandIsDisabled"
                            TypeName="AccountTimesheetPeriodTypeBLL">
                            <SelectParameters>
                                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                                <asp:Parameter DefaultValue="00000000-0000-0000-0000-000000000000"
                                    Name="AccountTimesheetPeriodTypeId" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
