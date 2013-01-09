<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountTimeOffPoliciesList.ascx.vb" Inherits="AccountAdmin_Controls_ctlAccountTimeOffPoliciesList" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
               <table width="98%">
            <tr>
                <td colspan="2">
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountTimeOffPolicyId"
            DataSourceID="dsAccountTimeOffPolicyGridViewObject" Width="98%" SkinID="xgridviewSkinEmployee" AllowSorting="True" Caption="<%$ Resources:TimeLive.Web, Time Off Policy List%>">
            <Columns>
                <asp:BoundField DataField="AccountTimeOffPolicy" HeaderText="<%$ Resources:TimeLive.Web, Time Off Policy%>" SortExpression="AccountTimeOffPolicy">
                    <ItemStyle Width="80%" />
                </asp:BoundField>
                <asp:TemplateField ShowHeader="False">
                    <itemstyle cssclass="edit_button" horizontalalign="Center" width="6%" />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:LinkButton id="LinkButton2" runat="server" Text="<%$ Resources:TimeLive.Web, Edit_text%>" CommandName="Select" CausesValidation="False" __designer:wfdid="w108" PostBackUrl='<%# Eval("AccountTimeOffPolicyId", "~/AccountAdmin/AccountTimeOffPoliciesDetail.aspx?AccountTimeOffPolicyId={0}") %>'></asp:LinkButton>
</itemtemplate>
                </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
            <ItemStyle HorizontalAlign="Center" Width="6%" cssclass="delete_button"  />
            <HeaderStyle HorizontalAlign="Center" />
     <ItemTemplate>
<asp:LinkButton id="LinkButton1" runat="server" OnClientClick="<%# ResourceHelper.GetDeleteMessageJavascript()%>" CommandName="Delete" CausesValidation="False" __designer:wfdid="w105"></asp:LinkButton> 
</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderTemplate>
<asp:Image id="Image2" runat="server" __designer:wfdid="w107" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " ImageUrl="~/Images/Disabled.gif"></asp:Image> 
</HeaderTemplate>
            <ItemStyle HorizontalAlign="Center" Width="6%" />
            <ItemTemplate>
<asp:Image id="Image1" runat="server" __designer:wfdid="w106" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " Visible='<%# IIF(IsDBNull(Eval("IsDisabled")),"False",Eval("IsDisabled")) %>' ImageUrl="~/Images/Disabled.gif"></asp:Image> 
</ItemTemplate>
        </asp:TemplateField>
            </Columns>
        </x:GridView>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="btnAdd" runat="server" Text="<%$ Resources:TimeLive.Web, Add_text %>" OnClick="btnAdd_Click" Width="100px" /></td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsAccountTimeOffPolicyGridViewObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountTimeOffPolicyByAccountId" TypeName="AccountTimeOffPolicyBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
