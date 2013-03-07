<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountFeatureManagement, App_Web_j1ru2ref" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
            Caption="Feature Management" CssClass="TableView"
            DataSourceID="dsFeatureManagementObject" OnRowDataBound="GridView1_RowDataBound"
            SkinID="xgridviewSkinEmployee" Width="98%" DataKeyNames="SystemFeatureId,AccountId,AccountFeatureId,SystemFeatureName">
            <Columns>
<asp:BoundField DataField="SystemFeatureName" HeaderText="Feature"
                    SortExpression="SystemFeatureName">
<itemstyle width="90%" />
</asp:BoundField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Selected_text %>"><itemtemplate>
<asp:CheckBox id="chkSelected" runat="server" Checked='<%# IIF(Isdbnull(Eval("AccountFeatureId")),"False","True") %>' __designer:wfdid="w4"></asp:CheckBox> 
</itemtemplate>

<itemstyle horizontalalign="Center" width="10%" />
</asp:TemplateField>
</Columns>
            <HeaderStyle BorderColor="Black" />
        </x:GridView>
        <table style="width: 98%">
            <tbody>
                <tr>
                    <td align="left">
                        <asp:Button ID="btnUpdate" runat="server" Text="<%$ Resources:TimeLive.Web, Update_text%>"
                            Width="60px" OnClick="btnUpdate_Click" /></td>
                </tr>
            </tbody>
        </table>
        <asp:ObjectDataSource ID="dsFeatureManagementObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountFeatureByAccountId"
            TypeName="AccountFeatureManagementBLL" DataObjectTypeName="System.Guid" DeleteMethod="DeleteAccountFeature" InsertMethod="AddAccountFeatures">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="SystemFeatureId" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
