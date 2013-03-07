<%@ control language="VB" autoeventwireup="false" inherits="ProjectAdmin_Controls_ctlAccountInvoiceForm, App_Web_lth4bcqk" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style3
    {
        width: 63px;
    }
    .style4
    {
        width: 100px;
    }
</style>
<script language="javascript" type="text/javascript">

function TABLE1_onclick() {
}
// ]]>
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="dsAccountTimeExpenseBillingObject" Width="600px" SkinID="formviewSkinEmployee" DefaultMode="Insert" DataKeyNames="AccountCurrencyId,IsPaid,AccountTimeExpenseBillingId,AccountClientId" >
            <EditItemTemplate><table class="xview" width="100%">
                <tr>
                    <td class="caption" colspan="2">
                        <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Invoice") %>' /></td>
                </tr>
                <tr>
                    <td class="FormViewSubHeader" colspan="2" style="height: 21px;">
                        <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Invoice Information") %>' /></td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="InvoiceNoTextBox">
                        <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Invoice No:") %>' /></asp:Label></td><td style="width: 338px;">
                        <asp:TextBox ID="InvoiceNoTextBox" runat="server" Text='<%# Bind("InvoiceNumber") %>' Width="155px" ReadOnly="True"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator5" runat="server" ControlToValidate="InvoiceNoTextBox"
                    Display="Dynamic" ErrorMessage="*" Width="16px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td></tr><tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Invoice Date:") %>' /></td>
                    <td style="width: 338px;">
                        <ew:CalendarPopup ID="InvoiceDateTextBox" runat="server" 
                            SkinId="DatePicker" PostedDate=""
                            SelectedDate='<%# Bind("InvoiceDate") %>' SelectedValue="07/03/2009 16:01:03"
                            UpperBoundDate="12/31/9999 23:59:59" VisibleDate="07/03/2009 16:01:03" Width="126px">
                        </ew:CalendarPopup>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        
<asp:Label ID="Label1" runat="server" AssociatedControlID="PONumberTextBox">
                        <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("PO Number:") %>' /></asp:Label></td><td style="width: 338px;">
                        <asp:TextBox ID="PONumberTextBox" runat="server" Text='<%# Bind("PONumber") %>' Width="155px"></asp:TextBox></tr><tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name:") %>' /></td>
                    <td>
                        <asp:DropDownList ID="ddlClientId" runat="server" DataSourceID="dsAccountClientObjectEdit"
                                DataTextField="PartyName" DataValueField="AccountPartyId" Width="95%" OnSelectedIndexChanged="ddlClientId_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell">
                        <asp:Literal ID="Literal15" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' />:</td><td>
                        <asp:DropDownList ID="ddlAccountProjectId" runat="server" AppendDataBoundItems="True" Width="95%">
                            <asp:ListItem Value="0" Selected="True">Select</asp:ListItem></asp:DropDownList><aspToolkit:CascadingDropDown ID="CascadingDropDown2" runat="server"
                        LoadingText="Loading" ParentControlID="ddlClientId" PromptText="<%$ Resources:TimeLive.Web, <All>%>"
                        ServiceMethod="GetAccountProjectForInvoice" ServicePath="~/Services/ProjectService.asmx"
                        TargetControlID="ddlAccountProjectId" Category="Project">
                        </aspToolkit:CascadingDropDown></td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 40%">
                    <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Billable") %>' />:</td><td align="left" style="width: 60%">
                    <asp:DropDownList ID="ddlBillable" runat="server" AppendDataBoundItems="True" Width="86px">
                        <asp:ListItem Selected="True" Value="-1" Label ID="Label3" runat="server" Text="<%$ Resources:TimeLive.Web, Both%> "></asp:ListItem><asp:ListItem Value="1" Label ID="Label4" runat="server" Text="<%$ Resources:TimeLive.Web, Billable%> "></asp:ListItem><asp:ListItem Value="0" Label ID="Label5" runat="server" Text="<%$ Resources:TimeLive.Web, Non Billable%> "></asp:ListItem></asp:DropDownList></td></tr><tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        <asp:Literal ID="Literal8" runat="server" Text='<%# ResourceHelper.GetFromResource("Currency:") %>' /></td>
                    <td>
                        <asp:DropDownList ID="ddlCurrencyId" runat="server" DataSourceID="dsAccountTimeExpenseBillingExpenseObject"
                            DataTextField="CurrencyCode" DataValueField="AccountCurrencyId" Width="95%" SelectedValue='<%# Bind("AccountCurrencyId") %>' AutoPostBack="True">
                        </asp:DropDownList><asp:ObjectDataSource ID="dsAccountTimeExpenseBillingExpenseObject"
                            runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled"
                            TypeName="AccountCurrencyBLL" UpdateMethod="UpdateAccountCurrency" DeleteMethod="DeleteAccountCurrency" InsertMethod="AddAccountCurrency">
                            <UpdateParameters>
                                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
                                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                                <asp:Parameter Name="AccountId" Type="Int32" />
                                <asp:Parameter Name="Disabled" Type="Boolean" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="91" Name="AccountId" SessionField="AccountId"
                                    Type="Int32" />
                                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                                <asp:Parameter Name="AccountId" Type="Int32" />
                                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                                <asp:Parameter Name="Disabled" Type="Boolean" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        Group Timesheet Billing List By:</td>
                    <td>
                        <asp:DropDownList ID="ddlInvoiceGroup" runat="server" 
                            AppendDataBoundItems="True" Width="30%">
                            <asp:ListItem Value="Task">Task</asp:ListItem>
                            <asp:ListItem Value="TimeEntry">Time Entry</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        Group Expense Billing List By:</td>
                    <td>
                        <asp:DropDownList ID="ddlExpenseInvoiceGroup" runat="server" 
                            AppendDataBoundItems="True" Width="30%">
                            <asp:ListItem Value="ExpenseName">Expense Name</asp:ListItem>
                            <asp:ListItem Value="ExpenseEntry">Expense Entry</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        <asp:Literal ID="Literal9" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Cycle Start Date:") %>' /></td>
                    <td style="width: 338px;">
                        <ew:CalendarPopup ID="BillingCycleStartDateTextBox" runat="server" 
                        SkinId="DatePicker" SelectedDate='<%# Bind("BillingCycleStartDate") %>' SelectedValue="07/14/2009 19:52:43" UpperBoundDate="12/31/9999 23:59:59" Width="126px">
                        </ew:CalendarPopup>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Cycle End Date:") %>' /></td>
                    <td style="width: 338px;">
                        <ew:CalendarPopup ID="BillingCycleEndDateTextBox" runat="server" 
                        SkinId="DatePicker" SelectedDate='<%# Bind("BillingCycleEndDate") %>' SelectedValue="07/14/2009 19:52:43" UpperBoundDate="12/31/9999 23:59:59" Width="126px">
                        </ew:CalendarPopup>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 33%;">
                        </td>
                    <td style="width: 338px;" align="right">
                            <asp:Button ID="btnPopulateUpdate" runat="server" OnClick="btnPopulateUpdate_Click" OnClientClick="<%# ResourceHelper.GetPopulateMessageJavascriptForInvoice %>" Text='<%# ResourceHelper.GetFromResource("Populate Un-Billed Records") %>'
                                Width="178px" /></td>
                </tr>
            </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table class="xview" style="width: 100%">
                    <tr>
                        <td class="caption" colspan="2">
                            <asp:Literal ID="Literal101" runat="server" Text='<%# ResourceHelper.GetFromResource("Invoice Information") %>' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2" style="height: 21px;">
                            <asp:Literal ID="Literal11" runat="server" Text='<%# ResourceHelper.GetFromResource("Account Time Expense Billing") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 38%;">
                            
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="InvoiceNoTextBox">
                            <asp:Literal ID="Literal12" runat="server" Text='<%# ResourceHelper.GetFromResource("Invoice No:") %>' /></asp:Label></td><td>
                            &nbsp;<asp:TextBox ID="InvoiceNoTextBox" runat="server" Width="134px" AutoPostBack="True" OnTextChanged="InvoiceNoTextBox_TextChanged"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator5" runat="server" ControlToValidate="InvoiceNoTextBox"
                    Display="Dynamic" ErrorMessage="*" Width="16px" CssClass="ErrorMessage"></asp:RequiredFieldValidator><asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="InvoiceNoTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Invoice No already exist."
                                OnServerValidate="CustomValidator2_ServerValidate1" Width="185px"></asp:CustomValidator><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="InvoiceNoTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="0 to 9999" MaximumValue="99999"
                                MinimumValue="0"></asp:RangeValidator></td></tr><tr>
                        <td align="right" class="formviewlabelcell" style="width: 38%;">
                            <asp:Literal ID="Literal13" runat="server" Text='<%# ResourceHelper.GetFromResource("Invoice Date:") %>' /></td>
                       <td>
                           &nbsp;<ew:CalendarPopup ID="InvoiceDateTextBox" runat="server" SkinId="DatePicker" Width="134px">
                           </ew:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 38%;">
                            
<asp:Label ID="Label6" runat="server" AssociatedControlID="PONumberTextBox">
                            <asp:Literal ID="Literal14" runat="server" Text='<%# ResourceHelper.GetFromResource("PO Number:") %>' /></asp:Label></td><td>
                            &nbsp;<asp:TextBox ID="PONumberTextBox" runat="server" Text='<%# Bind("PONumber") %>' Width="134px"></asp:TextBox></tr><tr>
                        <td align="right" class="formviewlabelcell">
                           <asp:Literal ID="Literal16" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name:") %>' /></td>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlClientId" runat="server" DataSourceID="dsAccountClientObject"
                                DataTextField="PartyName" DataValueField="AccountPartyId" Width="95%" SelectedValue='<%# Bind("AccountClientId") %>' AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlClientId_SelectedIndexChanged">
                            </asp:DropDownList><asp:ObjectDataSource ID="dsAccountClientObject" runat="server"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountPartiesByAccountIdAndAccountPartyId"
                                TypeName="AccountPartyBLL">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="69" Name="AccountId" SessionField="AccountId"
                                        Type="Int32" />
                                    <asp:Parameter DefaultValue="0" Name="AccountPartyId" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                            <asp:Literal ID="Literal27" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' />:</td><td>
                            &nbsp;<asp:DropDownList ID="ddlAccountProjectId" runat="server"
                                Width="95%" AppendDataBoundItems="True">
                                <asp:ListItem Value="0" Selected="True">Select</asp:ListItem></asp:DropDownList><aspToolkit:CascadingDropDown ID="CascadingDropDown2" runat="server"
                        LoadingText="Loading" ParentControlID="ddlClientId" PromptText="<%$ Resources:TimeLive.Web, <All>%>"
                        ServiceMethod="GetAccountProjectForInvoice" ServicePath="~/Services/ProjectService.asmx"
                        TargetControlID="ddlAccountProjectId" Category="Project">
                        </aspToolkit:CascadingDropDown></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 40%">
                    <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Billable") %>' />:</td><td align="left">
                    &nbsp;<asp:DropDownList ID="ddlBillable" runat="server" Width="30%">
                        <asp:ListItem Selected="True" Value="-1" Label ID="Label3" runat="server" Text="<%$ Resources:TimeLive.Web, Both%> "></asp:ListItem><asp:ListItem Value="1" Label ID="Label4" runat="server" Text="<%$ Resources:TimeLive.Web, Billable%> "></asp:ListItem><asp:ListItem Value="0" Label ID="Label5" runat="server" Text="<%$ Resources:TimeLive.Web, Non Billable%> "></asp:ListItem></asp:DropDownList></td></tr><tr>
                        <td align="right" class="formviewlabelcell" style="width: 38%;">
                            <asp:Literal ID="Literal17" runat="server" Text='<%# ResourceHelper.GetFromResource("Currency:") %>' /></td>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlCurrencyId" runat="server" DataSourceID="dsAccountCurrencyObject"
                                DataTextField="CurrencyCode" DataValueField="AccountCurrencyId" SelectedValue='<%# Bind("AccountCurrencyId") %>'
                                Width="95%" AutoPostBack="True">
                            </asp:DropDownList><asp:ObjectDataSource ID="dsAccountCurrencyObject" runat="server"
                                DeleteMethod="DeleteAccountCurrency" InsertMethod="AddAccountCurrency" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL"
                                UpdateMethod="UpdateAccountCurrency">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                                    <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
                                    <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                                    <asp:Parameter Name="AccountId" Type="Int32" />
                                    <asp:Parameter Name="Disabled" Type="Boolean" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="55" Name="AccountId" SessionField="AccountId"
                                        Type="Int32" />
                                    <asp:Parameter Name="AccountCurrencyId" Type="Int32" DefaultValue="0" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                                    <asp:Parameter Name="AccountId" Type="Int32" />
                                    <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                                    <asp:Parameter Name="Disabled" Type="Boolean" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 38%;">
                            Group Timesheet Billing List By:</td>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlInvoiceGroup" runat="server" 
                                AppendDataBoundItems="True" Width="30%">
                                <asp:ListItem Value="Task">Task</asp:ListItem>
                                <asp:ListItem Value="TimeEntry">Time Entry</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 38%;">
                            Group Expense Billing List By:</td>
                        <td>
                            &nbsp;<asp:DropDownList ID="ddlExpenseInvoiceGroup" runat="server" 
                                AppendDataBoundItems="True" Width="30%">
                                <asp:ListItem Value="ExpenseName">Expense Name</asp:ListItem>
                                <asp:ListItem Value="ExpenseEntry">Expense Entry</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 38%;">
                            <asp:Literal ID="Literal18" runat="server" 
                                Text='<%# ResourceHelper.GetFromResource("Billing Cycle Start Date:") %>' />
                        </td>
                        <td>
                            &nbsp;<ew:CalendarPopup ID="BillingCycleStartDateTextBox" runat="server" 
                                SkinId="DatePicker" Width="134px">
                            </ew:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                            <asp:Literal ID="Literal19" runat="server" Text='<%# ResourceHelper.GetFromResource("Billing Cycle End Date:") %>' /></td>
                        <td>
                            &nbsp;<ew:CalendarPopup ID="BillingCycleEndDateTextBox" runat="server" 
                            SkinId="DatePicker" Width="134px">
                            </ew:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                        </td>
                        <td align="right">
                <asp:Button ID="btnPopulate" runat="server" OnClick="btnPopulate_Click" Text='<%# ResourceHelper.GetFromResource("Populate Un-Billed Records") %>' Width="174px" /></td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                AccountTimeExpenseBillingId: <asp:Label ID="AccountTimeExpenseBillingIdLabel" runat="server" Text='<%# Eval("AccountTimeExpenseBillingId") %>'>
                </asp:Label><br />AccountId: <asp:Label ID="AccountIdLabel" runat="server" Text='<%# Bind("AccountId") %>'></asp:Label><br />AccountClientId: <asp:Label ID="AccountClientIdLabel" runat="server" Text='<%# Bind("AccountClientId") %>'>
                </asp:Label><br />BillDate: <asp:Label ID="BillDateLabel" runat="server" Text='<%# Bind("BillDate") %>'></asp:Label><br />BillingCycleStartDate: <asp:Label ID="BillingCycleStartDateLabel" runat="server" Text='<%# Bind("BillingCycleStartDate") %>'>
                </asp:Label><br />BillingCycleEndDate: <asp:Label ID="BillingCycleEndDateLabel" runat="server" Text='<%# Bind("BillingCycleEndDate") %>'>
                </asp:Label><br />InvoiceNumber: <asp:Label ID="InvoiceNumberLabel" runat="server" Text='<%# Bind("InvoiceNumber") %>'>
                </asp:Label><br />PONumber: <asp:Label ID="PONumberLabel" runat="server" Text='<%# Bind("PONumber") %>'></asp:Label><br />CreatedOn: <asp:Label ID="CreatedOnLabel" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:Label><br />CreatedByEmployeeId: <asp:Label ID="CreatedByEmployeeIdLabel" runat="server" Text='<%# Bind("CreatedByEmployeeId") %>'>
                </asp:Label><br />ModifiedOn: <asp:Label ID="ModifiedOnLabel" runat="server" Text='<%# Bind("ModifiedOn") %>'>
                </asp:Label><br />ModifiedByEmployeeId: <asp:Label ID="ModifiedByEmployeeIdLabel" runat="server" Text='<%# Bind("ModifiedByEmployeeId") %>'>
                </asp:Label><br />IsDisabled: <asp:CheckBox ID="IsDisabledCheckBox" runat="server" Checked='<%# Bind("IsDisabled") %>'
                    Enabled="false" /><br />
                InvoiceDate: <asp:Label ID="InvoiceDateLabel" runat="server" Text='<%# Bind("InvoiceDate") %>'>
                </asp:Label><br /></ItemTemplate></asp:FormView><asp:ObjectDataSource ID="dsAccountTimeExpenseBillingObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountTimeExpenseBillingByAccountIdAndAccountTimeExpenseBillingId" TypeName="AccountTimeExpenseBillingBLL" InsertMethod="AddAccountTimeExpenseBilling" UpdateMethod="UpdateAccountTimeExpenseBilling">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="57" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountTimeExpenseBillingId" 
                    DbType="Guid" /></SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Original_AccountTimeExpenseBillingId" 
                    DbType="Guid" /><asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountClientId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="BillingCycleStartDate" Type="DateTime" />
                <asp:Parameter Name="BillingCycleEndDate" Type="DateTime" />
                <asp:Parameter Name="InvoiceDate" Type="DateTime" />
                <asp:Parameter Name="InvoiceNo" Type="String" />
                <asp:Parameter Name="PONumber" Type="String" />
                <asp:Parameter Name="SubTotal" Type="Double" />
                <asp:Parameter Name="TaxCode1" Type="Double" />
                <asp:Parameter Name="TaxCode2" Type="Double" />
                <asp:Parameter Name="GrandTotal" Type="Double" />
            <asp:Parameter Name="Terms" 
                    Type="String" /><asp:Parameter Name="BankDetails" Type="String" /></UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter DefaultValue="53" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountClientId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="BillingCycleStartDate" Type="DateTime" />
                <asp:Parameter Name="BillingCycleEndDate" Type="DateTime" />
                <asp:Parameter Name="InvoiceDate" Type="DateTime" />
                <asp:Parameter Name="InvoiceNo" Type="String" />
                <asp:Parameter Name="PONumber" Type="String" />
                <asp:Parameter Name="SubTotal" Type="Double" />
                <asp:Parameter Name="TaxCode1" Type="Double" />
                <asp:Parameter Name="TaxCode2" Type="Double" />
                <asp:Parameter Name="GrandTotal" Type="Double" />
                <asp:Parameter Name="IsPaid" Type="Boolean" />
            <asp:Parameter Name="Terms" 
                    Type="String" /><asp:Parameter Name="BankDetails" Type="String" /></InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectObject" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountClientByAccountProjectIdandIsDisabled"
            TypeName="AccountProjectBLL">
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="AccountClientId" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="AccountProjectId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccountClientObjectEdit" runat="server"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountPartiesByAccountIdAndAccountPartyId"
                                TypeName="AccountPartyBLL">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="39" Name="AccountId" SessionField="AccountId"
                                    Type="Int32" />
                                <asp:Parameter DefaultValue="" Name="AccountPartyId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <table style="width: 100%" >
            <tr>
                <td>
                    <table id="Table3" class="xview" width="98%">
                        <tr>
                            <td align="right">
                                <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="<%$ Resources:TimeLive.Web, Back_text %>" Width="89px" Height="24px" />
                                <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" Text="<%$ Resources:TimeLive.Web, Print Invoice %>" Width="89px" Height="24px" />&nbsp;<asp:Button
                                    ID="btnUpdate" runat="server" Height="24px" OnClick="btnUpdate_Click" Text="<%$ Resources:TimeLive.Web, Update_text %>"
                                    Width="89px" />
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="DisabledButton" OnClientClick='<%# ResourceHelper.GetSaveMessageJavascript()%>' Text="<%$ Resources:TimeLive.Web, Update Time Entry and Expense Entry Records As Billed %>" Width="308px" Height="24px" Visible="False" /><br />
                    <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("Timesheet Billing List") %>'
                        SkinID="xgridviewSkinEmployee" 
                                    DataSourceID="dsAccountTimeExpenseBillingTimesheetObject" 
                                    DataKeyNames="BillingRate,AccountProjectId,AccountProjectTaskId,Description,AccountTimeExpenseBillingTimesheetId,AccountTimeExpenseBillingId,TotalAmount,ActualHours,ExchangeRate,AccountEmployeeTimeEntryId" 
                                    OnRowDataBound="GridView1_RowDataBound" Width="100%" 
                                    OnRowDeleting="GridView1_RowDeleting" OnDataBound="GridView1_DataBound">
                        <Columns> 
                                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Project Name %>">
                                    <itemtemplate>
<asp:DropDownList id="ddlAccountProjectId" runat="server" Width="100%" DataSourceID="dsAccountProjectObjectTimesheet" DataValueField="AccountProjectId" DataTextField="ProjectName" __designer:wfdid="w105"></asp:DropDownList><asp:ObjectDataSource id="dsAccountProjectTasksObject" runat="server" TypeName="AccountProjectTaskBLL" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w106"><SelectParameters>
<asp:ControlParameter ControlID="ddlAccountProjectId" PropertyName="SelectedValue" DefaultValue="9" Name="AccountProjectId" Type="Int32"></asp:ControlParameter>
<asp:SessionParameter SessionField="AccountEmployeeId" DefaultValue="39" Name="AccountEmployeeId" Type="Int32"></asp:SessionParameter>
<asp:Parameter Name="AccountProjectTaskId" Type="Int32"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource> 
</itemtemplate>
                                <itemstyle width="19%" horizontalalign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Task Name %>">
                                <itemtemplate>
<asp:DropDownList id="ddlAccountProjectTaskId" runat="server" __designer:dtid="1970324836974684" Width="100%" __designer:wfdid="w1" DataTextField="TaskName" DataValueField="AccountProjectTaskId"></asp:DropDownList><aspToolkit:CascadingDropDown id="ddlAccountProjectTaskIdCascadingDropDown" runat="server" __designer:dtid="1970324836974685" __designer:wfdid="w2" LoadingText="Loading" ParentControlID="ddlAccountProjectId" PromptText="<%$ Resources:TimeLive.Web, Select Tasks%>" ServiceMethod="GetAccountProjectTasksForInvoice" ServicePath="~/Services/ProjectService.asmx" TargetControlID="ddlAccountProjectTaskId" Category="Tasks"></aspToolkit:CascadingDropDown> 
</itemtemplate>
                                <itemstyle width="19%" horizontalalign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Description %>">
                                <edititemtemplate>
<asp:TextBox id="DescriptionTextBox" runat="server" Width="94%" Text='<%# Bind("Description") %>' __designer:wfdid="w257" TextMode="MultiLine"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblDescription" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' __designer:wfdid="w258"></asp:Label></headertemplate><itemtemplate>
<asp:TextBox id="DescriptionTextBox" runat="server" Width="94%" Text='<%# Bind("Description") %>' __designer:wfdid="w256" TextMode="MultiLine"></asp:TextBox></itemtemplate><itemstyle width="19%" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("BillingRate") %>' __designer:wfdid="w39"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblActualBillingRate" runat="server" Text='<%# IIF(dbutilities.isinvoicebillingtypedaily=true,"Actual Day Rate","Actual Billing Rate") %>' __designer:wfdid="w40"></asp:Label></headertemplate><itemtemplate>
<asp:Label id="Label4" runat="server" Text='<%# Bind("BillingRate") %>' __designer:wfdid="w38"></asp:Label></itemtemplate><itemstyle width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billing Rate %>">
                                <edititemtemplate>
<asp:TextBox id="BillingRateTextBox" runat="server" Width="98%" Text='<%# Bind("BillingRate") %>' AutoPostBack="True" __designer:wfdid="w29"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblBillingRate" runat="server" Text='<%# IIF(dbutilities.isinvoicebillingtypedaily=true,"Day Rate","Billing Rate") %>' __designer:wfdid="w30"></asp:Label></headertemplate><itemtemplate>
<asp:TextBox id="BillingRateTextBox" runat="server" Width="98%" Text='<%# Bind("BillingRate") %>' OnTextChanged="BillingRateTextBox_TextChanged" AutoPostBack="True" __designer:wfdid="w28" OnLoad="BillingRateTextBox_Load"></asp:TextBox></itemtemplate><itemstyle width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Actual Hours %>">
                                <edititemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("ActualHours") %>'></asp:Label></edititemtemplate><headertemplate>
<asp:Label id="lblActualHours" runat="server" Text='<%# IIF(dbutilities.isinvoicebillingtypedaily=true,"Actual Days","Actual Hours") %>'></asp:Label></headertemplate><itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("ActualHours") %>'></asp:Label></itemtemplate><itemstyle width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Bill Hours %>">
                                <edititemtemplate>
<asp:TextBox id="BillHoursTextBox" runat="server" Width="98%" Text='<%# Bind("BillHours") %>' OnTextChanged="BillHoursTextBox_TextChanged" AutoPostBack="True" __designer:wfdid="w35"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblBillHours" runat="server" Text='<%# IIF(dbutilities.isinvoicebillingtypedaily=true,"Days","Bill Hours") %>' __designer:wfdid="w36"></asp:Label></headertemplate><itemtemplate>
<asp:TextBox id="BillHoursTextBox" runat="server" Width="98%" Text='<%# Bind("BillHours") %>' OnTextChanged="BillHoursTextBox_TextChanged" AutoPostBack="True" __designer:wfdid="w34" OnLoad="BillHoursTextBox_Load"></asp:TextBox></itemtemplate><itemstyle width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Tax 1 %>">
                                <headertemplate>
<asp:Label id="lblTax1" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax 1") %>' __designer:wfdid="w33"></asp:Label></headertemplate><itemtemplate>
<asp:DropDownList id="ddlAccountTaxCodeId1" runat="server" Width="98%" DataSourceID="dsAccountTaxCodeObject" AutoPostBack="True" __designer:wfdid="w31" OnSelectedIndexChanged="ddlAccountTaxCodeId1_SelectedIndexChanged" AppendDataBoundItems="True" DataValueField="AccountTaxCodeId" DataTextField="TaxCode"><asp:ListItem Selected="True" Value="0">Select</asp:ListItem></asp:DropDownList><asp:ObjectDataSource id="dsAccountTaxCodeObject" runat="server" UpdateMethod="UpdateAccountTaxCodes" InsertMethod="AddAccountTaxCode" TypeName="AccountTaxCodeBLL" SelectMethod="GetAccountTaxCodeByAccountId" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w32" DeleteMethod="DeleteAccountTaxCode"><DeleteParameters>
<asp:Parameter Type="Int32" Name="Original_AccountTaxCodeId"></asp:Parameter>
</DeleteParameters>
<UpdateParameters>
<asp:Parameter Type="Int32" Name="AccountId"></asp:Parameter>
<asp:Parameter Type="String" Name="TaxCode"></asp:Parameter>
<asp:Parameter Type="Int32" Name="Original_AccountTaxCodeId"></asp:Parameter>
</UpdateParameters>
<SelectParameters>
<asp:SessionParameter SessionField="AccountId" Type="Int32" DefaultValue="55" Name="AccountId"></asp:SessionParameter>
</SelectParameters>
<InsertParameters>
<asp:Parameter Type="Int32" Name="AccountId"></asp:Parameter>
<asp:Parameter Type="String" Name="TaxCode"></asp:Parameter>
<asp:Parameter Type="String" Name="Formula"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AccountTaxZoneId"></asp:Parameter>
</InsertParameters>
</asp:ObjectDataSource> 
</itemtemplate>
                                <itemstyle width="11%" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Tax 2 %>">
        <headertemplate>
<asp:Label id="lblTax2" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax 2") %>'></asp:Label></headertemplate><itemtemplate>
<asp:DropDownList id="ddlAccountTaxCodeId2" runat="server" Width="98%" DataSourceID="dsAccountTaxCodeObject2" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlAccountTaxCodeId2_SelectedIndexChanged" DataValueField="AccountTaxCodeId" DataTextField="TaxCode"><asp:ListItem Selected="True" Value="0">Select</asp:ListItem></asp:DropDownList><asp:ObjectDataSource id="dsAccountTaxCodeObject2" runat="server" UpdateMethod="UpdateAccountTaxCodes" InsertMethod="AddAccountTaxCode" TypeName="AccountTaxCodeBLL" SelectMethod="GetAccountTaxCodeByAccountId" OldValuesParameterFormatString="original_{0}" DeleteMethod="DeleteAccountTaxCode"><DeleteParameters>
<asp:Parameter Type="Int32" Name="Original_AccountTaxCodeId"></asp:Parameter>
</DeleteParameters>
<UpdateParameters>
<asp:Parameter Type="Int32" Name="AccountId"></asp:Parameter>
<asp:Parameter Type="String" Name="TaxCode"></asp:Parameter>
<asp:Parameter Type="Int32" Name="Original_AccountTaxCodeId"></asp:Parameter>
</UpdateParameters>
<SelectParameters>
<asp:SessionParameter SessionField="AccountId" Type="Int32" DefaultValue="55" Name="AccountId"></asp:SessionParameter>
</SelectParameters>
<InsertParameters>
<asp:Parameter Type="Int32" Name="AccountId"></asp:Parameter>
<asp:Parameter Type="String" Name="TaxCode"></asp:Parameter>
<asp:Parameter Type="String" Name="Formula"></asp:Parameter>
<asp:Parameter Type="Int32" Name="AccountTaxZoneId"></asp:Parameter>
</InsertParameters>
</asp:ObjectDataSource> 
</itemtemplate>
        <itemstyle width="11%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Total Amount %>">
                                <edititemtemplate>
<asp:TextBox id="TotalAmountTextBox" runat="server" Width="90%" Text='<%# Bind("TotalAmount", "{0:N}") %>' Enabled="False"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblTotalAmount" runat="server" Text='<%# ResourceHelper.GetFromResource("Total Amount") %>'></asp:Label></headertemplate><itemtemplate>
<asp:TextBox id="TotalAmountTextBox" runat="server" Width="90%" Text='<%# Bind("TotalAmount", "{0:N}") %>' Enabled="False"></asp:TextBox></itemtemplate><itemstyle width="5%" />
                            </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
     <ItemTemplate>
<asp:LinkButton id="LinkButton1" runat="server" OnClientClick="<%# ResourceHelper.GetDeleteMessageJavascript() %>" __designer:wfdid="w50" CommandName="Delete" CausesValidation="False"></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" width="1%" />
            <ItemStyle HorizontalAlign="Justify" cssclass="delete_button" width="1%"/>
        </asp:TemplateField>
                        </Columns>
                    </x:GridView><asp:ObjectDataSource ID="dsAccountProjectObjectTimesheet" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetAccountClientByAccountProjectIdandIsDisabled" TypeName="AccountProjectBLL">
                        <SelectParameters>
                            <asp:Parameter Name="AccountClientId" Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="AccountProjectId" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                            &nbsp; &nbsp;&nbsp; </tr><tr>
                            <td>
                                <x:GridView ID="GridView2" runat="server" 
                                    Caption='<%# ResourceHelper.GetFromResource("Expense Billing List") %>' 
                                    SkinID="xgridviewSkinEmployee" AutoGenerateColumns="False" 
                                    DataSourceID="dsAccountTimeExpenseBillingExpenseObject" Width="100%" 
                                    DataKeyNames="AccountProjectId,AccountExpenseTypeId,AccountExpenseId,Description,AccountTimeExpenseBillingExpenseId,AccountTimeExpenseBillingId,ActualExpenseAmount,BilledExpenseAmount,ExchangeRate,AccountExpenseEntryId" 
                                    OnRowDeleting="GridView2_RowDeleting">
                                    <Columns>
                                        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Project Name %>">
                                            <itemtemplate>
<asp:DropDownList id="ddlAccountProjectId" runat="server" Width="100%" DataSourceID="dsAccountProjectObjectExpense" DataValueField="AccountProjectId" DataTextField="ProjectName" __designer:wfdid="w104"></asp:DropDownList> 
</itemtemplate>
                                            <itemstyle width="20%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Expense Name %>">
                                            <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("AccountExpenseName") %>' __designer:wfdid="w55"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblExpenseName" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Name") %>' __designer:wfdid="w56"></asp:Label></headertemplate><itemtemplate>
<asp:DropDownList id="ddlExpenseName" runat="server" Width="100%" DataSourceID="dsAccountExpenseObject" __designer:wfdid="w53" DataTextField="AccountExpenseName" DataValueField="AccountExpenseId" AutoPostBack="True" AppendDataBoundItems="True"><asp:ListItem Selected="True" Value="0">Select</asp:ListItem></asp:DropDownList><BR /><asp:ObjectDataSource id="dsAccountExpenseObject" runat="server" TypeName="AccountExpenseBLL" SelectMethod="GetAccountExpensesByAccountIdAndIsDisabled" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w54">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32"  />
                <asp:Parameter Name="AccountExpenseId" Type="Int32"  />
            </SelectParameters>
        </asp:ObjectDataSource> 
</itemtemplate>
                                            <itemstyle width="14%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("ExpenseType") %>' __designer:wfdid="w59"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblExpenseType" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Type") %>' __designer:wfdid="w60"></asp:Label></headertemplate><itemtemplate>
<asp:DropDownList id="ddlExpenseType" runat="server" Width="100%" DataSourceID="dsAccountExpenseTypeObject" __designer:wfdid="w57" DataTextField="ExpenseType" DataValueField="AccountExpenseTypeId" AutoPostBack="True" AppendDataBoundItems="True"><asp:ListItem Selected="True" Value="0">Select</asp:ListItem></asp:DropDownList><BR /><asp:ObjectDataSource id="dsAccountExpenseTypeObject" runat="server" TypeName="AccountExpenseTypeBLL" SelectMethod="GetAccountExpenseTypesByAccountId" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w58"><SelectParameters>
<asp:SessionParameter SessionField="AccountId" DefaultValue="64" Name="AccountId" Type="Int32"></asp:SessionParameter>
</SelectParameters>
</asp:ObjectDataSource> 
</itemtemplate>
                                            <itemstyle width="14%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Description %>">
                                            <edititemtemplate>
<asp:TextBox id="DescriptionTextBox" runat="server" Width="98%" Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblDescription" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>'></asp:Label></headertemplate><itemtemplate>
<asp:TextBox id="DescriptionTextBox" runat="server" Width="98%" Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox></itemtemplate><itemstyle width="20%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Actual Amount %>">
                                            <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ActualExpenseAmount") %>' __designer:wfdid="w62"></asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblActualAmount" runat="server" Text='<%# ResourceHelper.GetFromResource("Actual Amount") %>' __designer:wfdid="w63"></asp:Label></headertemplate><itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("ActualExpenseAmount") %>' __designer:wfdid="w61"></asp:Label></itemtemplate><itemstyle width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Tax 1 %>">
                                            <headertemplate>
<asp:Label id="lblTax1" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax 1") %>' __designer:wfdid="w66"></asp:Label></headertemplate><itemtemplate>
<asp:DropDownList id="ddlAccountTaxCodeId1" runat="server" Width="100%" DataSourceID="dsAccountTaxCodeObject" __designer:wfdid="w64" DataTextField="TaxCode" DataValueField="AccountTaxCodeId" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlAccountTaxCodeId1_SelectedIndexChanged"><asp:ListItem Selected="True" Value="0">Select</asp:ListItem></asp:DropDownList><BR /><asp:ObjectDataSource id="dsAccountTaxCodeObject" runat="server" UpdateMethod="UpdateAccountTaxCodes" InsertMethod="AddAccountTaxCode" TypeName="AccountTaxCodeBLL" SelectMethod="GetAccountTaxCodeByAccountId" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w65" DeleteMethod="DeleteAccountTaxCode"><DeleteParameters>
<asp:Parameter Name="Original_AccountTaxCodeId" Type="Int32"></asp:Parameter>
</DeleteParameters>
<UpdateParameters>
<asp:Parameter Name="AccountId" Type="Int32"></asp:Parameter>
<asp:Parameter Name="TaxCode" Type="String"></asp:Parameter>
<asp:Parameter Name="Original_AccountTaxCodeId" Type="Int32"></asp:Parameter>
</UpdateParameters>
<SelectParameters>
<asp:SessionParameter SessionField="AccountId" DefaultValue="55" Name="AccountId" Type="Int32"></asp:SessionParameter>
</SelectParameters>
<InsertParameters>
<asp:Parameter Name="AccountId" Type="Int32"></asp:Parameter>
<asp:Parameter Name="TaxCode" Type="String"></asp:Parameter>
<asp:Parameter Name="Formula" Type="String"></asp:Parameter>
<asp:Parameter Name="AccountTaxZoneId" Type="Int32"></asp:Parameter>
</InsertParameters>
</asp:ObjectDataSource> 
</itemtemplate>
                                            <itemstyle width="11%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Tax 2 %>">
                                            <headertemplate>
<asp:Label id="lblTax2" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax 2") %>' __designer:wfdid="w69"></asp:Label></headertemplate><itemtemplate>
<asp:DropDownList id="ddlAccountTaxCodeId2" runat="server" Width="100%" DataSourceID="dsAccountTaxCodeObject2" __designer:wfdid="w67" DataTextField="TaxCode" DataValueField="AccountTaxCodeId" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlAccountTaxCodeId2_SelectedIndexChanged"><asp:ListItem Selected="True" Value="0">Select</asp:ListItem></asp:DropDownList><asp:ObjectDataSource id="dsAccountTaxCodeObject2" runat="server" UpdateMethod="UpdateAccountTaxCodes" InsertMethod="AddAccountTaxCode" TypeName="AccountTaxCodeBLL" SelectMethod="GetAccountTaxCodeByAccountId" OldValuesParameterFormatString="original_{0}" __designer:wfdid="w68" DeleteMethod="DeleteAccountTaxCode"><DeleteParameters>
<asp:Parameter Name="Original_AccountTaxCodeId" Type="Int32"></asp:Parameter>
</DeleteParameters>
<UpdateParameters>
<asp:Parameter Name="AccountId" Type="Int32"></asp:Parameter>
<asp:Parameter Name="TaxCode" Type="String"></asp:Parameter>
<asp:Parameter Name="Original_AccountTaxCodeId" Type="Int32"></asp:Parameter>
</UpdateParameters>
<SelectParameters>
<asp:SessionParameter SessionField="AccountId" DefaultValue="55" Name="AccountId" Type="Int32"></asp:SessionParameter>
</SelectParameters>
<InsertParameters>
<asp:Parameter Name="AccountId" Type="Int32"></asp:Parameter>
<asp:Parameter Name="TaxCode" Type="String"></asp:Parameter>
<asp:Parameter Name="Formula" Type="String"></asp:Parameter>
<asp:Parameter Name="AccountTaxZoneId" Type="Int32"></asp:Parameter>
</InsertParameters>
</asp:ObjectDataSource> 
</itemtemplate>
                                            <itemstyle width="11%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billed Amount %>" >
                                            <edititemtemplate>
<asp:TextBox id="BilledAmountTextbox" runat="server" Width="96%" OnTextChanged="BilledAmountTextbox_TextChanged" AutoPostBack="True" __designer:wfdid="w26">0</asp:TextBox></edititemtemplate><headertemplate>
<asp:Label id="lblBilledAmount" runat="server" Text='<%# ResourceHelper.GetFromResource("Billed Amount") %>' __designer:wfdid="w27"></asp:Label></headertemplate><itemtemplate>
<asp:TextBox id="BilledAmountTextbox" runat="server" Width="96%" OnTextChanged="BilledAmountTextbox_TextChanged" AutoPostBack="True" __designer:wfdid="w25" OnLoad="BilledAmountTextbox_Load">0</asp:TextBox></itemtemplate><itemstyle width="5%" />
                                        </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
     <ItemTemplate>
<asp:LinkButton id="LinkButton1" runat="server" OnClientClick="<%# ResourceHelper.GetDeleteMessageJavascript() %>" CausesValidation="False" CommandName="Delete"></asp:LinkButton></ItemTemplate><HeaderStyle HorizontalAlign="Center" width="1%" />
            <ItemStyle HorizontalAlign="Center" cssclass="delete_button" width="1%"/>
        </asp:TemplateField>
                                    </Columns>
                                </x:GridView>
                                <asp:ObjectDataSource ID="dsAccountProjectObjectExpense" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetAccountClientByAccountProjectIdandIsDisabled" TypeName="AccountProjectBLL">
                                    <SelectParameters>
                                        <asp:Parameter Name="AccountClientId" Type="Int32" />
                                        <asp:Parameter DefaultValue="0" Name="AccountProjectId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                </td>
                        </tr>
                        <tr>
                            <td>
                            <asp:FormView ID="FormView2" runat="server" DataKeyNames="AccountTimeExpenseBillingId" SkinID="formviewSkinEmployee"
                                DataSourceID="dsAccountTimeExpenseBilling" DefaultMode="Insert" Width="100%" Visible="False">
                                <EditItemTemplate>
                                    <table style="width: 100%" border="0" cellpadding="0" cellspacing="0"><tr>
                                            <td align="right" 
                                                    style="width: 83%"><asp:Literal ID="Literal19" runat="server" Text='<%# ResourceHelper.GetFromResource("Sub Total:") %>' /></td>
                                            <td 
                                                    align="left" style="width: 17%;"><asp:TextBox ID="SubTotalTextBox" 
                                                        runat="server" ReadOnly="True" Text='<%# Bind("SubTotal", "{0:N}") %>'></asp:TextBox></td></tr><tr>
                                            <td 
                                                    align="right" style="width: 83%; "><asp:Literal ID="Literal20" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax 1:") %>' /></td>
                                            <td 
                                                    align="left" style="width: 17%; "><asp:TextBox ID="Tax1TextBox" runat="server" 
                                                        ReadOnly="True" Text='<%# Eval("TaxCode1", "{0:N}") %>'></asp:TextBox></td></tr><tr>
                                            <td 
                                                    align="right" style="width: 83%"><asp:Literal ID="Literal21" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax 2:") %>' /></td>
                                            <td 
                                                    align="left" style="width: 17%"><asp:TextBox ID="Tax2TextBox" runat="server" 
                                                        ReadOnly="True" Text='<%# Bind("TaxCode2", "{0:N}") %>'></asp:TextBox></td></tr><tr>
                                            <td 
                                                    align="right" style="width: 83%"><asp:Literal ID="Literal22" runat="server" Text='<%# ResourceHelper.GetFromResource("Grand Total:") %>' /></td>
                                            <td 
                                                    align="left" style="width: 17%;"><asp:TextBox ID="GrandTotalTextBox" 
                                                        runat="server" ReadOnly="True" Text='<%# Bind("GrandTotal", "{0:N}") %>'></asp:TextBox></td></tr></table><table 
                                            class="style1" border="0" cellpadding="0" cellspacing="0"><tr><td align="right" 
                                                    class="style4" valign="top"><strong>Description:</strong> </td><td><asp:TextBox 
                                                    ID="DescriptionTextBox" runat="server" Height="50px" 
                                                    Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="99%"></asp:TextBox></td></tr></table></EditItemTemplate><InsertItemTemplate>
                                        <table 
                                            width="100%" border="0" cellpadding="0" cellspacing="0"><tr>
                                            <td align="right" 
                                                    style="width: 83%"><asp:Literal ID="Literal19" runat="server" Text='<%# ResourceHelper.GetFromResource("Sub Total:") %>' /></td>
                                                <td 
                                                    align="left"><asp:TextBox ID="SubTotalTextBox" runat="server" ReadOnly="True" >0</asp:TextBox></td></tr><tr>
                                                <td 
                                                    align="right" style="width: 83%"><asp:Literal ID="Literal23" runat="server" 
                                                    Text='<%# ResourceHelper.GetFromResource("Tax 1:") %>' /></td>
                                                <td 
                                                    align="left"><asp:TextBox ID="Tax1TextBox" runat="server" 
                                                        ReadOnly="True" Text="0"></asp:TextBox></td></tr><tr>
                                            <td align="right" 
                                                    style="width: 83%"><asp:Literal ID="Literal24" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax 2:") %>' /></td>
                                            <td 
                                                    align="left"><asp:TextBox ID="Tax2TextBox" runat="server" Text='0' ReadOnly="True" ></asp:TextBox></td></tr><tr>
                                            <td 
                                                    align="right" style="width: 83%"><asp:Literal ID="Literal25" runat="server" 
                                                    Text='<%# ResourceHelper.GetFromResource("Grand Total:") %>' /></td>
                                            <td 
                                                    align="left"><asp:TextBox ID="GrandTotalTextBox" runat="server" 
                                                        ReadOnly="True" >0</asp:TextBox></td></tr></table><table 
                                            class="style1" border="0" cellpadding="0" cellspacing="0"><tr><td class="style3" 
                                                    align="right" valign="top"><strong>Description:</strong> </td><td><asp:TextBox 
                                                    ID="DescriptionTextBox" runat="server" Height="50px" 
                                                    Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="98%"></asp:TextBox></td></tr></table></InsertItemTemplate><ItemTemplate>
                                    AccountTimeExpenseBillingId: <asp:Label ID="AccountTimeExpenseBillingIdLabel" runat="server" Text='<%# Eval("AccountTimeExpenseBillingId") %>'>
                                    </asp:Label><br />AccountId: <asp:Label ID="AccountIdLabel" runat="server" Text='<%# Bind("AccountId") %>'></asp:Label><br />AccountClientId: <asp:Label ID="AccountClientIdLabel" runat="server" Text='<%# Bind("AccountClientId") %>'>
                                    </asp:Label><br />BillDate: <asp:Label ID="BillDateLabel" runat="server" Text='<%# Bind("BillDate") %>'></asp:Label><br />BillingCycleStartDate: <asp:Label ID="BillingCycleStartDateLabel" runat="server" Text='<%# Bind("BillingCycleStartDate") %>'>
                                    </asp:Label><br />BillingCycleEndDate: <asp:Label ID="BillingCycleEndDateLabel" runat="server" Text='<%# Bind("BillingCycleEndDate") %>'>
                                    </asp:Label><br />InvoiceNumber: <asp:Label ID="InvoiceNumberLabel" runat="server" Text='<%# Bind("InvoiceNumber") %>'>
                                    </asp:Label><br />PONumber: <asp:Label ID="PONumberLabel" runat="server" Text='<%# Bind("PONumber") %>'></asp:Label><br />CreatedOn: <asp:Label ID="CreatedOnLabel" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:Label><br />CreatedByEmployeeId: <asp:Label ID="CreatedByEmployeeIdLabel" runat="server" Text='<%# Bind("CreatedByEmployeeId") %>'>
                                    </asp:Label><br />ModifiedOn: <asp:Label ID="ModifiedOnLabel" runat="server" Text='<%# Bind("ModifiedOn") %>'>
                                    </asp:Label><br />ModifiedByEmployeeId: <asp:Label ID="ModifiedByEmployeeIdLabel" runat="server" Text='<%# Bind("ModifiedByEmployeeId") %>'>
                                    </asp:Label><br />IsDisabled: <asp:CheckBox ID="IsDisabledCheckBox" runat="server" Checked='<%# Bind("IsDisabled") %>'
                                        Enabled="false" /><br />
                                    InvoiceDate: <asp:Label ID="InvoiceDateLabel" runat="server" Text='<%# Bind("InvoiceDate") %>'>
                                    </asp:Label><br />AccountCurrencyId: <asp:Label ID="AccountCurrencyIdLabel" runat="server" Text='<%# Bind("AccountCurrencyId") %>'>
                                    </asp:Label><br />Description: <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>'>
                                    </asp:Label><br />SubTotal: <asp:TextBox ID="SubTotalTextBox" runat="server"></asp:TextBox><br />TaxCode1: <asp:Label ID="TaxCode1Label" runat="server" Text='<%# Bind("TaxCode1") %>'></asp:Label><br />TaxCode2: <asp:Label ID="TaxCode2Label" runat="server" Text='<%# Bind("TaxCode2") %>'></asp:Label><br />GrandTotal: <asp:Label ID="GrandTotalLabel" runat="server" Text='<%# Bind("GrandTotal") %>'>
                                    </asp:Label><br /><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit">
                                    </asp:LinkButton><asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete">
                                    </asp:LinkButton><asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New">
                                    </asp:LinkButton></ItemTemplate></asp:FormView></td></tr></table></td></tr></table><asp:ObjectDataSource ID="dsAccountTimeExpenseBilling" runat="server"
                        InsertMethod="AddAccountTimeExpenseBilling" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetAccountTimeExpenseBillingByAccountIdAndAccountTimeExpenseBillingId"
                        TypeName="AccountTimeExpenseBillingBLL" UpdateMethod="UpdateAccountTimeExpenseBilling">
                        <UpdateParameters>
                            <asp:Parameter  Name="Original_AccountTimeExpenseBillingId" />
                            <asp:Parameter Name="AccountId" Type="Int32" />
                            <asp:Parameter Name="AccountClientId" Type="Int32" />
                            <asp:Parameter Name="AccountProjectId" Type="Int32" />
                            <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="BillingCycleStartDate" Type="DateTime" />
                            <asp:Parameter Name="BillingCycleEndDate" Type="DateTime" />
                            <asp:Parameter Name="InvoiceDate" Type="DateTime" />
                            <asp:Parameter Name="InvoiceNo" Type="String" />
                            <asp:Parameter Name="PONumber" Type="String" />
                            <asp:Parameter Name="SubTotal" Type="Double" />
                            <asp:Parameter Name="TaxCode1" Type="Double" />
                            <asp:Parameter Name="TaxCode2" Type="Double" />
                            <asp:Parameter Name="GrandTotal" Type="Double" />
                        <asp:Parameter Name="Terms" 
                                Type="String" /><asp:Parameter Name="BankDetails" Type="String" /></UpdateParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="55" Name="AccountId" SessionField="AccountId"
                                Type="Int32" />
                            <asp:Parameter  Name="AccountTimeExpenseBillingId" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AccountId" Type="Int32" />
                            <asp:Parameter Name="AccountClientId" Type="Int32" />
                            <asp:Parameter Name="AccountProjectId" Type="Int32" />
                            <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="BillingCycleStartDate" Type="DateTime" />
                            <asp:Parameter Name="BillingCycleEndDate" Type="DateTime" />
                            <asp:Parameter Name="InvoiceDate" Type="DateTime" />
                            <asp:Parameter Name="InvoiceNo" Type="String" />
                            <asp:Parameter Name="PONumber" Type="String" />
                            <asp:Parameter Name="SubTotal" Type="Double" />
                            <asp:Parameter Name="TaxCode1" Type="Double" />
                            <asp:Parameter Name="TaxCode2" Type="Double" />
                            <asp:Parameter Name="GrandTotal" Type="Double" />
                            <asp:Parameter Name="IsPaid" Type="Boolean" />
                        <asp:Parameter Name="Terms" 
                                Type="String" /><asp:Parameter Name="BankDetails" Type="String" /></InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                        InsertMethod="UpdateAccountExpenseEntryBillStatus" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetAccountExpenseEntryByAccountProjectIdandAccountExpenseId"
                        TypeName="AccountTimeExpenseBillingBLL">
                        <SelectParameters>
                            <asp:Parameter Name="AccountProjectId" Type="Int32" />
                            <asp:Parameter Name="AccountExpenseId" Type="Int32" />
                            <asp:Parameter Name="ExpenseEntryStartDate" Type="DateTime" />
                            <asp:Parameter Name="ExpenseEntryEndDate" Type="DateTime" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AccountTimeExpenseBillingExpenseId" />
                            <asp:Parameter Name="AccountProjectId" Type="Int32" />
                            <asp:Parameter Name="AccountExpenseId" Type="Int32" />
                            <asp:Parameter Name="Billed" Type="Boolean" />
                            <asp:Parameter Name="ExpenseEntryStartDate" Type="DateTime" />
                            <asp:Parameter Name="ExpenseEntryEndDate" Type="DateTime" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetAccountEmployeeTimeEntryByAccountTimeExpenseBillingTimesheeetId"
                        TypeName="AccountTimeExpenseBillingBLL" InsertMethod="UpdateAccountEmployeeTimeEntryBillStatus">
                        <SelectParameters>
                            <asp:Parameter Name="AccountProjectId" Type="Int32" />
                            <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
                            <asp:Parameter Name="AccountTimeExpenseBillingTimesheetId" Type="Int32" />
                            <asp:Parameter Name="TimeEntryStartDate" Type="DateTime" />
                            <asp:Parameter Name="TimeEntryEndDate" Type="DateTime" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="AccountProjectId" Type="Int32" />
                            <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
                            <asp:Parameter Name="AccountTimeExpenseBillingTimesheetId" />
                            <asp:Parameter Name="Billed" Type="Boolean" />
                            <asp:Parameter Name="TimeEntryStartDate" Type="DateTime" />
                            <asp:Parameter Name="TimeEntryEndDate" Type="DateTime" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                                <asp:ObjectDataSource ID="dsAccountTimeExpenseBillingExpenseObject" runat="server"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountTimeExpenseBillingExpenseByAccountTimeExpenseBillingId"
                                    TypeName="AccountTimeExpenseBillingBLL" InsertMethod="AddAccountTimeExpenseBillingExpense" UpdateMethod="UpdateAccountTimeExpenseBillingExpense">
                                    <SelectParameters>
                                        <asp:Parameter  Name="AccountTimeExpenseBillingId" DbType="Guid" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter  Name="Original_AccountTimeExpenseBillingExpenseId" 
                                            DbType="Guid" />
                                        <asp:Parameter  Name="AccountTimeExpenseBillingId" DbType="Guid" />
                                        <asp:Parameter Name="AccountId" Type="Int32" />
                                        <asp:Parameter Name="AccountProjectId" Type="Int32" />
                                        <asp:Parameter Name="AccountExpenseId" Type="Int32" />
                                        <asp:Parameter Name="AccountExpenseTypeId" Type="Int32" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:Parameter Name="ActualExpenseAmount" Type="Double" />
                                        <asp:Parameter Name="BilledExpenseAmount" Type="Double" />
                                        <asp:Parameter Name="AccountTaxCodeId1" Type="Int32" />
                                        <asp:Parameter Name="AccountTaxCodeId2" Type="Int32" />
                                        <asp:Parameter Name="TaxCode1" Type="Double" />
                                        <asp:Parameter Name="TaxCode2" Type="Double" />
                                        <asp:Parameter Name="AccountExpenseEntryId" Type="Int32" />
                                    </UpdateParameters>
                                    <InsertParameters>
                                        <asp:Parameter  Name="AccountTimeExpenseBillingId" DbType="Guid" />
                                        <asp:Parameter Name="AccountId" Type="Int32" />
                                        <asp:Parameter Name="AccountProjectId" Type="Int32" />
                                        <asp:Parameter Name="AccountExpenseTypeId" Type="Int32" />
                                        <asp:Parameter Name="AccountExpenseId" Type="Int32" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:Parameter Name="ActualExpenseAmount" Type="Double" />
                                        <asp:Parameter Name="BilledExpenseAmount" Type="Double" />
                                        <asp:Parameter Name="AccountTaxCodeId1" Type="Int32" />
                                        <asp:Parameter Name="AccountTaxCodeId2" Type="Int32" />
                                        <asp:Parameter Name="TaxCode1" Type="Double" />
                                        <asp:Parameter Name="TaxCode2" Type="Double" />
                                        <asp:Parameter Name="AccountExpenseEntryId" Type="Int32" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsAccountTimeExpenseBillingTimesheetObject" runat="server"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountTimeExpenseBillingTimesheetByAccountTimeExpenseBillingId"
                        TypeName="AccountTimeExpenseBillingBLL" UpdateMethod="UpdateAccountTimeExpenseBillingTimesheet" InsertMethod="AddAccountTimeExpenseBillingTimesheet">
                        <SelectParameters>
                            <asp:Parameter  Name="AccountTimeExpenseBillingId" DbType="Guid" />
                            <asp:Parameter DefaultValue="" Name="IsPopulate" Type="Boolean" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter  Name="AccountTimeExpenseBillingId" DbType="Guid" />
                            <asp:Parameter Name="AccountId" Type="Int32" />
                            <asp:Parameter Name="AccountProjectId" Type="Int32" />
                            <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="ActualBillingRate" Type="Double" />
                            <asp:Parameter Name="BillingRate" Type="Double" />
                            <asp:Parameter Name="ActualHours" Type="Double" />
                            <asp:Parameter Name="BillHours" Type="Double" />
                            <asp:Parameter Name="AccountTaxCodeId1" Type="Int32" />
                            <asp:Parameter Name="AccountTaxCodeId2" Type="Int32" />
                            <asp:Parameter Name="TotalAmount" Type="Double" />
                            <asp:Parameter Name="TaxCode1" Type="Double" />
                            <asp:Parameter Name="TaxCode2" Type="Double" />
                            <asp:Parameter Name="AccountEmployeeTimeEntryId" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter  Name="Original_AccountTimeExpenseBillingTimesheetId" 
                                DbType="Guid" />
                            <asp:Parameter  Name="AccountTimeExpenseBillingId" DbType="Guid" />
                            <asp:Parameter Name="AccountId" Type="Int32" />
                            <asp:Parameter Name="AccountProjectId" Type="Int32" />
                            <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="ActualBillingRate" Type="Double" />
                            <asp:Parameter Name="BillingRate" Type="Double" />
                            <asp:Parameter Name="ActualHours" Type="Double" />
                            <asp:Parameter Name="BillHours" Type="Double" />
                            <asp:Parameter Name="AccountTaxCodeId1" Type="Int32" />
                            <asp:Parameter Name="AccountTaxCodeId2" Type="Int32" />
                            <asp:Parameter Name="TotalAmount" Type="Double" />
                            <asp:Parameter Name="TaxCode1" Type="Double" />
                            <asp:Parameter Name="TaxCode2" Type="Double" />
                            <asp:Parameter Name="AccountEmployeeTimeEntryId" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
