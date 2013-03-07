<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountApprovalList, App_Web_j1ru2ref" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="98%">
            <tr>
                <td>
                    <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsAccountApprovalObject" Caption='<%# ResourceHelper.GetFromResource("Approval Type List") %>' DataKeyNames="AccountApprovalTypeId" SkinID="xgridviewSkinEmployee" Width="100%">
                        <Columns>
                            <asp:TemplateField SortExpression="ApprovalTypeName">
                                <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("ApprovalTypeName") %>' __designer:wfdid="w42"></asp:TextBox>
</edititemtemplate>
                                <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Approval Type Name") %>' CommandArgument="ApprovalTypeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                                <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("ApprovalTypeName") %>' __designer:wfdid="w41"></asp:Label>
</itemtemplate>
                                <itemstyle width="90%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time Off Approval" SortExpression="IsTimeOffApprovalTypes">
                                <itemtemplate>
<asp:Label id="lblIsTimeOff" runat="server" __designer:wfdid="w1"></asp:Label>
</itemtemplate>
                                <itemstyle horizontalalign="Center" />
                            </asp:TemplateField>
                            <asp:HyperLinkField DataNavigateUrlFields="AccountApprovalTypeId" DataNavigateUrlFormatString="~/AccountAdmin/AccountApproval.aspx?AccountApprovalTypeId={0}"
                                HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>" Text="<%$ Resources:TimeLive.Web, Edit_text %>">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%"  cssclass="edit_button" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowDeleteButton="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%"  cssclass="delete_button"  />
                            </asp:CommandField>
                        </Columns>
                    </x:GridView>
                    <asp:ObjectDataSource ID="dsAccountApprovalObject" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetvueAccountApprovalsByAccountId" TypeName="AccountApprovalBLL" DeleteMethod="DeleteAccountApprovals">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                                Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="Original_AccountApprovalTypeId" Type="Int32" />
                        </DeleteParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btnAdd" runat="server" Text="<%$ Resources:TimeLive.Web, Add_text%>" Width="68px" /></td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
