<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountCurrenciesList, App_Web_yhen42r4" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountCurrencyId"
            DataSourceID="dsAccountCurrencyGridViewObject" SkinID="xgridviewSkinEmployee" Caption='<%# ResourceHelper.GetFromResource("Currencies List") %>' Width="98%">
            <Columns>
                <asp:BoundField DataField="AccountCurrencyId" HeaderText="<%$ Resources:TimeLive.Web, Id %>" ReadOnly="True"
                    SortExpression="AccountCurrencyId" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="3%" />
                </asp:BoundField>
                <asp:TemplateField SortExpression="Currency">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Currency") %>' __designer:wfdid="w213"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Name") %>' CommandArgument="Currency" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("Currency") %>' __designer:wfdid="w212"></asp:Label>
</itemtemplate>
                    <itemstyle width="140px" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="CurrencyCode">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("CurrencyCode") %>' __designer:wfdid="w216"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Symbol") %>' CommandArgument="CurrencyCode" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("CurrencyCode") %>' __designer:wfdid="w215"></asp:Label>
</itemtemplate>
                    <itemstyle width="7px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Exchange Rate %>" SortExpression="ExchangeRate">
                    <headertemplate>
<asp:Label id="lblExchangeRate" runat="server" Text='<%# ResourceHelper.GetFromResource("Exchange Rate") %>' __designer:wfdid="w219"></asp:Label>
</headertemplate>
                    <ItemTemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("ExchangeRate", "{0:N4}") %>' __designer:wfdid="w218"></asp:Label> 
</ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Tooltip="<%$ Resources:TimeLive.Web, Edit_text%> " CommandName="Select">Edit</asp:LinkButton>
                    
</ItemTemplate>
                    <ItemStyle Width="3%" cssclass="edit_button" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Delete" Tooltip="<%$ Resources:TimeLive.Web, Delete_text%> " OnClientClick='<%# ResourceHelper.GetDeleteMessageJavascript()%>'>Delete</asp:LinkButton>
                    
</ItemTemplate>
                    <ItemStyle Width="3%" cssclass="delete_button" HorizontalAlign="Center"   />
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
                    
</HeaderTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> "
                            Visible='<%# IIF(IsDBNull(Eval("Disabled")),"false",Eval("Disabled")) %>' />
                    
</ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="2%" />
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <table width="550">
            <tr>
            <td align="right" style="width: 95%">
                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Tahoma" Font-Size="11px"
                    Text="<%$ Resources:TimeLive.Web, Current Base Currency:%> "></asp:Label>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="11px"
                    Text="Label"></asp:Label>&nbsp;
                <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" Font-Names="Tahoma"
                    Font-Size="11px" ForeColor="Black" onclick= "window.open (this.href, 'popupwindow', 'width=425,height=120,left=300,top=300'); return false;" NavigateUrl="~/AccountAdmin/AccountBaseCurrency.aspx"><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Change Base Currency%> " /></asp:HyperLink></td>
                <td style="width: 5%">
                        <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/Images/Currency.gif" ToolTip="<%$ Resources:TimeLive.Web, Change Base Currency%> " onclick= "window.open (this.href, 'popupwindow', 'width=425,height=120,left=300,top=300'); return false;" NavigateUrl='~/AccountAdmin/AccountBaseCurrency.aspx' ></asp:HyperLink></td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsAccountCurrencyGridViewObject" runat="server" DeleteMethod="DeleteAccountCurrency"
            InsertMethod="AddAccountCurrency" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountCurrencyByAccountId" TypeName="AccountCurrencyBLL" UpdateMethod="UpdateAccountCurrency">
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
            <InsertParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="NotFixTable" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountCurrencyFormViewObject" runat="server" DeleteMethod="DeleteAccountCurrency"
            InsertMethod="AddAccountCurrency" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountCurrencyByAccountCurrencyId" TypeName="AccountCurrencyBLL"
            UpdateMethod="UpdateAccountCurrency">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="AccountCurrencyId" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountCurrencyId" DataSourceID="dsAccountCurrencyFormViewObject"
            DefaultMode="Insert" SkinID="formviewSkinEmployee" Width="450px">
            <EditItemTemplate>
                <table width="450" class="xview">
                    <tr>
                        <td colspan="2" class="caption">
                            <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Currencies Information")%> ' /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="FormViewSubHeader">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Currencies")%> ' /></td>
                    </tr>
                    <tr>
                        <td style="width: 35%" align="right" class="FormViewLabelCell">
                             <SPAN 
                  class=reqasterisk>*</SPAN> <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Name:")%> ' /></td>
                        <td style="width: 65%">
                            <asp:DropDownList ID="NameDropDownList" runat="server" DataSourceID="dsCurrenciesObject"
                                DataTextField="CurrencyWithCode" DataValueField="CurrencyId" SelectedValue='<%# Bind("SystemCurrencyId") %>'
                                Width="220px">
                            </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="NameDropDownList" CssClass="ErrorMessage" Display="Dynamic"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 35%" align="right" class="FormViewLabelCell">
                             <SPAN 
                  class=reqasterisk>*</SPAN> 
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="ExchangeRateTextBox"><asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Exchange Rate:")%> ' /></asp:Label></td>
                        <td style="width: 65%">
                            <asp:TextBox ID="ExchangeRateTextBox" runat="server" Width="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                    runat="server" ControlToValidate="ExchangeRateTextBox" CssClass="ErrorMessage"
                                    Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator><asp:RangeValidator
                                        ID="RangeValidator1" runat="server" ControlToValidate="ExchangeRateTextBox" CssClass="ErrorMessage"
                                        Display="Dynamic" ErrorMessage="Numeric Required" MaximumValue="500000" MinimumValue="0"
                                        Type="Double"></asp:RangeValidator><asp:CustomValidator
                                ID="NetAmountCustomValidatorEdit" runat="server" CssClass="ErrorMessage" Display="Dynamic"
                                ErrorMessage="Value must be > 0" OnServerValidate="NetAmountCustomValidatorEdit_ServerValidate" ></asp:CustomValidator><asp:HyperLink ID="HyperLink1" runat="server" CssClass="NormalURL" NavigateUrl='<%# Eval("AccountCurrencyId", "~/AccountAdmin/AccountCurrencyExchangeRate.aspx?AccountCurrencyId={0}") %>'
                                Text="<%$ Resources:TimeLive.Web, Exchange Rate History%> "></asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td style="width: 35%" align="right" class="FormViewLabelCell">
                            Is Disabled </td>
                        <td style="width: 65%">
                            <asp:CheckBox ID="DisabledCheckBox" runat="server" Checked='<%# Bind("Disabled") %>' /></td>
                    </tr>
                    <tr>
                        <td style="width: 35%" align="right">
                        </td>
                        <td style="width: 65%">
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="<%$ Resources:TimeLive.Web, Update_Text%> " Width="68px" /><asp:Button
                                ID="CancelButton" runat="server" CommandName="Cancel" Text="<%$ Resources:TimeLive.Web, Cancel_Text%> " Width="68px" />
                            <asp:Label ID="lblExceptionText" runat="server" CssClass="ErrorMessage" Text="Currency Already Exist"
                                Visible="False"></asp:Label></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table width="100%" class="xview">
                    <tr>
                        <td class="caption" colspan="2">
                            <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Currencies Information")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2">
                            <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Currencies")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewLabelCell" style="width: 35%" align="right">
                             <SPAN 
                  class=reqasterisk>*</SPAN> <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Name:")%> ' /></td>
                        <td style="width: 65%">
                            <asp:DropDownList ID="NameDropDownList" runat="server" DataSourceID="dsCurrenciesObject"
                                DataTextField="CurrencyWithCode" DataValueField="CurrencyId"
                                Width="220px" SelectedValue='<%# Bind("SystemCurrencyId") %>'>
                            </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="NameDropDownList" CssClass="ErrorMessage" Display="Dynamic"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                    </tr>
                    <tr>
                        <td class="FormViewLabelCell" style="width: 35%" align="right">
                             <SPAN 
                  class=reqasterisk>*</SPAN> 
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="ExchangeRateTextBox"><asp:Literal ID="Literal8" runat="server" Text='<%# ResourceHelper.GetFromResource("Exchange Rate:")%> ' /></asp:Label></td>
                        <td style="width: 65%">
                            <asp:TextBox ID="ExchangeRateTextBox" runat="server" Width="100px"></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="ExchangeRateTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ExchangeRateTextBox"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Numeric Required" MaximumValue="500000"
                                MinimumValue="0" Type="Double"></asp:RangeValidator><asp:CustomValidator
                                ID="NetAmountCustomValidator" runat="server" CssClass="ErrorMessage" Display="Dynamic"
                                ErrorMessage="Value must be > 0" OnServerValidate="NetAmountCustomValidator_ServerValidate" ></asp:CustomValidator></td>
                    </tr>
                    <tr>
                        <td class="FormViewLabelCell" style="width: 35%;" align="right">
                        </td>
                        <td style="width: 65%;">
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="<%$ Resources:TimeLive.Web, Add_text%> " Width="68px" />
                            <asp:Label ID="lblExceptionText" runat="server" CssClass="ErrorMessage" Text="Currency Already Exist"
                                Visible="False"></asp:Label></td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                AccountCurrencyId:
                <asp:Label ID="AccountCurrencyIdLabel" runat="server" Text='<%# Eval("AccountCurrencyId") %>'>
                </asp:Label><br />
                SystemCurrencyId:
                <asp:Label ID="SystemCurrencyIdLabel" runat="server" Text='<%# Bind("SystemCurrencyId") %>'>
                </asp:Label><br />
                Disabled:
                <asp:CheckBox ID="DisabledCheckBox" runat="server" Checked='<%# Bind("Disabled") %>'
                    Enabled="false" /><br />
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
        <asp:ObjectDataSource ID="dsCurrenciesObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetCurrenciesWithCode" TypeName="SystemDataBLL"></asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
