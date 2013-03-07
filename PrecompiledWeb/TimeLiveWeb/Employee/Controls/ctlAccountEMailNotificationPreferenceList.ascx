<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlAccountEMailNotificationPreferenceList, App_Web_uitpp31g" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table width="100%">
            <tr>
                <td style="width: 100px">
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("EMail Notification Preferences") %>'
            DataKeyNames="AccountEMailNotificationPreferenceId,SystemEMailNotificationId,SystemEMailNotificationTypeId"
            DataSourceID="dsAccountEMailNotificationPreferenceObject"
            SkinID="xgridviewSkinEmployee" Width="750px" PageSize="25">
            <Columns>
                <asp:BoundField DataField="AccountEMailNotificationPreferenceId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    InsertVisible="False" ReadOnly="True" SortExpression="AccountEMailNotificationPreferenceId" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="4%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, EMail Notification %>" SortExpression="SystemEMailNotification">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("SystemEMailNotification") %>' __designer:wfdid="w64"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:Label id="lblEMailNotification" runat="server" Text='<%# ResourceHelper.GetFromResource("EMail Notification") %>' __designer:wfdid="w65"></asp:Label>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label7" runat="server" Text='<%#GetGlobalResourceObject("TimeLive.Web", Eval("SystemEMailNotification"))%>' __designer:wfdid="w63"></asp:Label> 
</itemtemplate>
                    <itemstyle width="79%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText= "<%$ Resources:TimeLive.Web, Enable Disable %>">
                    <headertemplate>
<asp:Label id="lblEnableDisable" runat="server" Text='<%# ResourceHelper.GetFromResource("Enable / Disable") %>' __designer:wfdid="w67"></asp:Label>
</headertemplate>
                    <ItemTemplate>
<asp:CheckBox id="chkEnableDisable" runat="server" __designer:wfdid="w66" Checked='<%# IIF(Isdbnull(Eval("Enabled")),False,Eval("Enabled")) %>'></asp:CheckBox> 
</ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
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
        <asp:QueryStringParameter Name="AccountEmployeeId" QueryStringField="AccountEmployeeId"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
