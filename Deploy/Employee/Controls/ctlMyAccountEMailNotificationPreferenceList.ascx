<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlMyAccountEMailNotificationPreferenceList, App_Web_dsdjiwop" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="100%">
            <tr>
                <td style="width: 100%">
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, EMail Notification Preferences %>"
            DataKeyNames="AccountEMailNotificationPreferenceId,SystemEMailNotificationId,SystemEMailNotificationTypeId"
            DataSourceID="dsAccountEMailNotificationPreferenceObject"
            SkinID="xgridviewSkinEmployee" Width="98%" PageSize="500">
            <Columns>
                <asp:BoundField DataField="AccountEMailNotificationPreferenceId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    InsertVisible="False" ReadOnly="True" SortExpression="AccountEMailNotificationPreferenceId" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="4%" />
                </asp:BoundField>
                <asp:TemplateField SortExpression="SystemEMailNotification" HeaderText="<%$ Resources:TimeLive.Web, EMail Notification %>">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("SystemEMailNotification") %>' __designer:wfdid="w133"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:Label id="lblEmailNotification" runat="server" Text='<%# ResourceHelper.GetFromResource("EMail Notification") %>' __designer:wfdid="w136"></asp:Label>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label7" runat="server" Text='<%#GetGlobalResourceObject("TimeLive.Web", Eval("SystemEMailNotification"))%>' __designer:wfdid="w132"></asp:Label> 
</itemtemplate>
                    <itemstyle width="79%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Enable Disable %>">
                    <headertemplate>
<asp:Label id="lblEnableDisable" runat="server" Text='<%# ResourceHelper.GetFromResource("Enable / Disable") %>' __designer:wfdid="w138"></asp:Label>
</headertemplate>
                    <ItemTemplate>
<asp:CheckBox id="chkEnableDisable" runat="server" __designer:wfdid="w137" Checked='<%# IIF(IsDBNull(Eval("Enabled")),False,Eval("Enabled"))%>'></asp:CheckBox> 
</ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                </asp:TemplateField>
            </Columns>
        </x:GridView>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    <asp:Button ID="btnUpdateEMailNotificationPreferences" runat="server" Text="<%$ Resources:TimeLive.Web, Update EMail Notification Preferences%> " OnClick="btnUpdateEMailNotificationPreferences_Click" /></td>
            </tr>
        </table>
<asp:ObjectDataSource ID="dsAccountEMailNotificationPreferenceObject" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountEMailNotificationPreferencessByAccountEmployeeId"
    TypeName="AccountEMailNotificationPreferenceBLL">
    <SelectParameters>
        <asp:SessionParameter Name="AccountEmployeeId" SessionField="AccountEmployeeId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
