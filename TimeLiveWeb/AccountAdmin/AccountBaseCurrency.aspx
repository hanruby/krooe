<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountBaseCurrency.aspx.vb" Inherits="AccountAdmin_AccountBaseCurrency" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="../Styles.css" rel="stylesheet" type="text/css" />
    <title>TimeLive - Base Currency</title>
</head>
<body onunload="opener.location.reload();">
    <form id="form1" runat="server">
    <div>
                <asp:FormView ID="FormView1" runat="server"
                    DefaultMode="Edit" Width="400px" DataKeyNames="AccountId" DataSourceID="dsAccountBaseCurrencyFormViewObject" SkinID="formviewSkinEmployee">
                    <EditItemTemplate>
                        <table width="400">
                            <tr>
                                <td class="FormViewSubHeader" colspan="2">
                                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Base Currency%> " /></td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 35%">
                                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Update existing records:%> " /></td>
                                </td>
                                <td style="width: 65%">
                                    <asp:CheckBox ID="CheckBox1" runat="server" /></td>
                            </tr>
                            <tr>
                                <td style="width: 35%" align="right">
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Name:%> " /></td>
                                </td>
                                <td style="width: 65%">
                                    <asp:DropDownList ID="ddlAccountCurrencyId" runat="server" Width="150px" DataSourceID="dsAccountCurrencyObject" DataTextField="Currency" DataValueField="AccountCurrencyId" SelectedValue='<%# Bind("AccountBaseCurrencyId") %>'>
                                    </asp:DropDownList>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 35%" align="right">
                                </td>
                                <td style="width: 65%">
                                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="<%$ Resources:TimeLive.Web, Update_text%> " OnClientClick= "window.close();" OnClick="btnUpdate_Click" /></td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        AccountCurrencyExchangeRateId:
                        <asp:TextBox ID="AccountCurrencyExchangeRateIdTextBox" runat="server" Text='<%# Bind("AccountCurrencyExchangeRateId") %>'>
                        </asp:TextBox><br />
                        SystemCurrencyId:
                        <asp:TextBox ID="SystemCurrencyIdTextBox" runat="server" Text='<%# Bind("SystemCurrencyId") %>'>
                        </asp:TextBox><br />
                        AccountId:
                        <asp:TextBox ID="AccountIdTextBox" runat="server" Text='<%# Bind("AccountId") %>'>
                        </asp:TextBox><br />
                        Disabled:
                        <asp:CheckBox ID="DisabledCheckBox" runat="server" Checked='<%# Bind("Disabled") %>' /><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert">
                        </asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel">
                        </asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        AccountCurrencyId:
                        <asp:Label ID="AccountCurrencyIdLabel" runat="server" Text='<%# Eval("AccountCurrencyId") %>'>
                        </asp:Label><br />
                        AccountCurrencyExchangeRateId:
                        <asp:Label ID="AccountCurrencyExchangeRateIdLabel" runat="server" Text='<%# Bind("AccountCurrencyExchangeRateId") %>'>
                        </asp:Label><br />
                        SystemCurrencyId:
                        <asp:Label ID="SystemCurrencyIdLabel" runat="server" Text='<%# Bind("SystemCurrencyId") %>'>
                        </asp:Label><br />
                        AccountId:
                        <asp:Label ID="AccountIdLabel" runat="server" Text='<%# Bind("AccountId") %>'></asp:Label><br />
                        Disabled:
                        <asp:CheckBox ID="DisabledCheckBox" runat="server" Checked='<%# Bind("Disabled") %>'
                            Enabled="false" /><br />
                    </ItemTemplate>
                </asp:FormView>
                &nbsp;</div>
        <asp:ObjectDataSource ID="dsAccountBaseCurrencyFormViewObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetPreferencesByAccountId" TypeName="AccountBLL" UpdateMethod="UpdateAccountBaseCurrencyId">
            <UpdateParameters>
                <asp:SessionParameter DefaultValue="5" Name="Original_AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter DefaultValue="" Name="AccountBaseCurrencyId" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountCurrencyObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByAccountIdforBaseCurrency" 
        TypeName="AccountCurrencyBLL" DeleteMethod="DeleteAccountCurrency" 
        InsertMethod="AddAccountCurrency" UpdateMethod="UpdateAccountCurrency">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" 
                    SessionField="AccountId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
