<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountExpenseList.ascx.vb" Inherits="AccountAdmin_Controls_ctlAccountExpenseList" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountExpenseId" DataSourceID="dsAccountExpenseObject" SkinID="xgridviewSkinEmployee" Width="98%" Caption='<%# ResourceHelper.GetFromResource("Expense List") %>' >
            <Columns>
                <asp:TemplateField SortExpression="AccountExpenseId">
                    <edititemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Eval("AccountExpenseId") %>' __designer:wfdid="w210"></asp:Label>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Id") %>' CommandArgument="AccountExpenseId" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("AccountExpenseId") %>' __designer:wfdid="w209"></asp:Label>
</itemtemplate>
                    <controlstyle width="7%" />
                    <footerstyle width="7%" />
                    <headerstyle width="7%" />
                    <itemstyle horizontalalign="Center" width="7%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="AccountExpenseName" HeaderText="<%$ Resources:TimeLive.Web, Expense Name %>">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("AccountExpenseName") %>' __designer:wfdid="w191"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Name") %>' CommandArgument="AccountExpenseName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label54" runat="server" Text='<%# Bind("AccountExpenseName") %>' __designer:wfdid="w190"></asp:Label> 
</itemtemplate>
                    <itemstyle width="25%" wrap="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billable %>">
                    <EditItemTemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("IsBillable") %>' __designer:wfdid="w194"></asp:TextBox> 
</EditItemTemplate>
                    <headertemplate>
<asp:Label id="lblBillable" runat="server" Text='<%# ResourceHelper.GetFromResource("Billable") %>' __designer:wfdid="w195"></asp:Label>
</headertemplate>
                    <ItemTemplate>
<asp:Label id="Label1" runat="server" __designer:wfdid="w193"></asp:Label> 
</ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="ExpenseType" HeaderText="<%$ Resources:TimeLive.Web, Expense Type %>">
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ExpenseType") %>' __designer:wfdid="w197"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Type") %>' CommandArgument="ExpenseType" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label55" runat="server" Text='<%# Bind("ExpenseType") %>' __designer:wfdid="w196"></asp:Label> 
</itemtemplate>
                    <itemstyle width="25%" />
                </asp:TemplateField>
                <asp:CommandField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>" SelectText="Edit" ShowSelectButton="True" >
                    <ItemStyle width="3%" cssclass="edit_button" />
                </asp:CommandField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
     <ItemTemplate>
 
       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                    OnClientClick='<%# ResourceHelper.GetDeleteMessageJavascript()%>'
                    Text="<%$ Resources:TimeLive.Web, Delete_text%> " />
     
</ItemTemplate>
            <ItemStyle width="3%"  cssclass="delete_button" />
        </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
                    
</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" Visible='<%# IIF(IsDBNull(Eval("IsDisabled")),"false",Eval("IsDisabled")) %>' ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
                    
</ItemTemplate>
                    <HeaderStyle Width="2%" Wrap="True" />
                    <ItemStyle Width="2%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsBillable" Visible="False">
                    <edititemtemplate>
<asp:CheckBox id="CheckBox1" runat="server" Checked='<%# Bind("IsBillable") %>' __designer:wfdid="w30"></asp:CheckBox> 
</edititemtemplate>
                    <itemtemplate>
<asp:CheckBox id="chkBillable" runat="server" Checked='<%# IIF(isdbnull(Eval("IsBillable")),"False",Eval("IsBillable")) %>' Enabled="False" __designer:wfdid="w27"></asp:CheckBox> 
</itemtemplate>
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <asp:ObjectDataSource ID="dsAccountExpenseObject" runat="server" DeleteMethod="DeleteAccountExpense"
            InsertMethod="AddAccountExpense" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountExpensesByAccountId" TypeName="AccountExpenseBLL" UpdateMethod="UpdateAccountExpense">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountExpenseId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountExpenseName" Type="String" />
                <asp:Parameter Name="AccountExpenseTypeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountExpenseId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsBillable" Type="Boolean" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
                <asp:Parameter Name="DefaultExpenseRate" Type="Double" />
                <asp:Parameter Name="DisabledEditingOfRate" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountExpenseName" Type="String" />
                <asp:Parameter Name="AccountExpenseTypeId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsBillable" Type="Boolean" />
                <asp:Parameter Name="DefaultExpenseRate" Type="Double" />
                <asp:Parameter Name="DisabledEditingOfRate" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountExpenseFormObject" runat="server" DeleteMethod="DeleteAccountExpense" InsertMethod="AddAccountExpense" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountExpensesByAccountExpenseId" TypeName="AccountExpenseBLL" UpdateMethod="UpdateAccountExpense">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountExpenseId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountExpenseName" Type="String" />
                <asp:Parameter Name="AccountExpenseTypeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountExpenseId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsBillable" Type="Boolean" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
                <asp:Parameter Name="DefaultExpenseRate" Type="Double" />
                <asp:Parameter Name="DisabledEditingOfRate" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="AccountExpenseId" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountExpenseName" Type="String" />
                <asp:Parameter Name="AccountExpenseTypeId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsBillable" Type="Boolean" />
                <asp:Parameter Name="DefaultExpenseRate" Type="Double" />
                <asp:Parameter Name="DisabledEditingOfRate" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="dsAccountExpenseFormObject" DataKeyNames="AccountExpenseId" DefaultMode="Insert" Width="450px" SkinID="formviewSkinEmployee" OnDataBound="FormView1_DataBound" OnModeChanging="FormView1_ModeChanging" OnModeChanged="FormView1_ModeChanged">
            <EditItemTemplate><table width="100%" class="xview">
                <tr>
                    <td colspan="2" class="caption">
                        <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Information")%> ' /></td>
                </tr>
                <tr>
                    <td colspan="2" class="FormViewSubHeader">
                        <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense")%> ' /></td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell">
                        <SPAN 
                  class=reqasterisk>*</span> 
                  
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="AccountExpenseNameTextBox">
                  <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Name:")%> ' /></asp:Label></td>
                    <td>
                        <asp:TextBox ID="AccountExpenseNameTextBox" runat="server" Text='<%# Bind("AccountExpenseName") %>' MaxLength="100" Width="250px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ddlExpenseType" runat="server" ControlToValidate="AccountExpenseNameTextBox"
                            Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr style="color: #000000">
                    <td align="right" class="formviewlabelcell">
                        <SPAN 
                  class=reqasterisk>*</span> 
                  <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Type:")%> ' /></td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsAccountExpenseTypeObject" DataTextField="ExpenseType" DataValueField="AccountExpenseTypeId" Width="250px">
                        </asp:DropDownList></td>
                </tr>
                <tr style="color: #000000">
                    <td align="right" class="formviewlabelcell">
                        
<asp:Label ID="Label3" runat="server" AssociatedControlID="ExpenseRateTextBox">
                        <asp:Literal ID="Literal11" runat="server" Text='<%# ResourceHelper.GetFromResource("Default Expense Rate:")%> ' /></asp:Label></td>
                    <td>
                        <asp:TextBox ID="ExpenseRateTextBox" runat="server" MaxLength="100" Text='<%# Bind("DefaultExpenseRate") %>'
                            Width="100px"></asp:TextBox>
                        <asp:RangeValidator ID="ExpenseRateRangeValidator" runat="server" ControlToValidate="ExpenseRateTextBox"
                            ErrorMessage="Value must be in numeric" MaximumValue="99999" MinimumValue="0"
                            Type="Double"></asp:RangeValidator></td>
                </tr>
                <tr style="color: #000000">
                    <td align="right" class="formviewlabelcell">
                        <asp:Literal ID="Literal12" runat="server" Text='<%# ResourceHelper.GetFromResource("Disabled Editing Of Rate:")%> ' /></td>
                    <td>
                        <asp:CheckBox ID="chkDisabledRate" runat="server" Checked='<%# Bind("DisabledEditingOfRate") %>' /></td>
                </tr>
                <tr style="color: #000000">
                    <td align="right" class="formviewlabelcell">
                        <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Billable:")%> ' /></td>
                    <td>
                        <asp:CheckBox ID="chkBillable" runat="server" /></td>
                </tr>
                <tr style="color: #000000">
                    <td align="right" class="formviewlabelcell">
                        <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Disabled:")%> ' /></td>
                    <td>
                        <asp:CheckBox ID="chkIsDisabled" runat="server" Checked='<%# Bind("IsDisabled") %>' /></td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell">
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="<%$ Resources:TimeLive.Web, Update_Text%> " CommandName="Update" Width="68px" /><asp:Button ID="Button2" runat="server" Text="<%$ Resources:TimeLive.Web, Cancel_Text%> " CommandName="Cancel" Width="68px" /></td>
                </tr>
            </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table width="100%" class="xview">
                    <tr>
                        <td colspan="2" class="caption">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Informaion")%> ' /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="FormViewSubHeader">
                            <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense")%> ' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                            <SPAN 
                  class=reqasterisk>*</span> 
                  
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="AccountExpenseNameTextBox">
                  <asp:Literal ID="Literal8" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Name:")%> ' /></asp:Label></td>
                        <td>
                            <asp:TextBox ID="AccountExpenseNameTextBox" runat="server" Text='<%# Bind("AccountExpenseName") %>' MaxLength="100" Width="250px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ddlExpenseType" runat="server" ControlToValidate="AccountExpenseNameTextBox"
                                Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                            <SPAN 
                  class=reqasterisk>*</span> <asp:Literal ID="Literal9" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Type:")%> ' /></td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsAccountExpenseTypeObject" DataTextField="ExpenseType" DataValueField="AccountExpenseTypeId" SelectedValue='<%# Bind("AccountExpenseTypeId") %>' Width="250px">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                            
<asp:Label ID="Label4" runat="server" AssociatedControlID="ExpenseRateTextBox">
                            <asp:Literal ID="Literal11" runat="server" Text='<%# ResourceHelper.GetFromResource("Default Expense Rate:")%> ' /></asp:Label></td>
                        <td>
                            <asp:TextBox ID="ExpenseRateTextBox" runat="server" MaxLength="100" Text='<%# Bind("DefaultExpenseRate") %>'
                                Width="100px"></asp:TextBox>
                            <asp:RangeValidator ID="ExpenseRateRangeValidator" runat="server" ControlToValidate="ExpenseRateTextBox"
                                ErrorMessage="Value must be in numeric" MaximumValue="99999" MinimumValue="0"
                                Type="Double"></asp:RangeValidator></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                            <asp:Literal ID="Literal12" runat="server" Text='<%# ResourceHelper.GetFromResource("Disabled Editing Of Rate:")%> ' /></td>
                        <td>
                            <asp:CheckBox ID="chkDisabledRate" runat="server" Checked='<%# Bind("DisabledEditingOfRate") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                            <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("Billable:")%> ' /></td>
                        <td>
                            <asp:CheckBox ID="chkBillable" runat="server" Checked='<%# Bind("IsBillable") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell">
                        </td>
                        <td>
                            <asp:Button ID="btnAdd" runat="server"  Text="<%$ Resources:TimeLive.Web, Add_text %> " CommandName="Insert" Width="68px" /></td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                AccountExpenseId:
                <asp:Label ID="AccountExpenseIdLabel" runat="server" Text='<%# Eval("AccountExpenseId") %>'>
                </asp:Label><br />
                AccountExpenseName:
                <asp:Label ID="AccountExpenseNameLabel" runat="server" Text='<%# Bind("AccountExpenseName") %>'>
                </asp:Label><br />
                AccountExpenseTypeId:
                <asp:Label ID="AccountExpenseTypeIdLabel" runat="server" Text='<%# Bind("AccountExpenseTypeId") %>'>
                </asp:Label><br />
                AccountId:
                <asp:Label ID="AccountIdLabel" runat="server" Text='<%# Bind("AccountId") %>'></asp:Label><br />
                CreatedOn:
                <asp:Label ID="CreatedOnLabel" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:Label><br />
                CreatedByEmployeeId:
                <asp:Label ID="CreatedByEmployeeIdLabel" runat="server" Text='<%# Bind("CreatedByEmployeeId") %>'>
                </asp:Label><br />
                ModifiedOn:
                <asp:Label ID="ModifiedOnLabel" runat="server" Text='<%# Bind("ModifiedOn") %>'>
                </asp:Label><br />
                ModifiedByEmployeeId:
                <asp:Label ID="ModifiedByEmployeeIdLabel" runat="server" Text='<%# Bind("ModifiedByEmployeeId") %>'>
                </asp:Label><br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit">
                </asp:LinkButton>
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete">
                </asp:LinkButton>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New">
                </asp:LinkButton>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="dsAccountExpenseTypeObject" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountExpenseTypesByAccountIdandIsDisabled" TypeName="AccountExpenseTypeBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="AccountExpenseTypeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
