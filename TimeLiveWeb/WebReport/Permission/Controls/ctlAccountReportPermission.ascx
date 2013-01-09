<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountReportPermission.ascx.vb" Inherits="WebReport_Permission_Controls_ctlAccountReportPermission" %>
<table class="xFormView" width="98%">
    <tr>
        <td colspan="2" class="caption">
            <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:TimeLive.Web, Report Information%> " /></td>
    </tr>
    <tr>
        <td align="right" class="FormViewSubHeader" style="width: 20%">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Report Id:%> " />
        </td>
        <td style="width: 80%" class="FormViewSubHeader">
            <asp:TextBox ID="ReportIdTextBox" runat="server" Width="100%" ReadOnly="True"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="right" class="FormViewSubHeader" style="width: 20%" >
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Report Name:%> " />
        </td>
        <td style="width: 80%" class="FormViewSubHeader">
            <asp:TextBox ID="ReportNameTextBox" runat="server" Width="100%" ReadOnly="True"></asp:TextBox></td>
    </tr>
</table>
<br />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" PageSize="500" DataSourceID="dsReportPermissionGridViewObject" SkinID="xgridviewSkinEmployee" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Report Permission %>" Width="98%" DataKeyNames="AccountReportId,AccountRoleId,ShowReport,AllowCustomization,AllowAllUser,AllowOwnReport,AllowOwnTeam,AllowOwnProject,AllowOwnSubOrdinates,AccountObjectPermissionId,AllowOwnApproval" >
            <Columns>
                <asp:BoundField DataField="Role" HeaderText="<%$ Resources:TimeLive.Web, Role %>" SortExpression="Role" >
                    <ItemStyle HorizontalAlign="Left" Width="40%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Show Report %>">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:CheckBox ID="chkShowReport" runat="server"   />
                    
</ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Allow Customization %>">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:CheckBox ID="chkAllowCustomization" runat="server"   />
                    
</ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Allow All %>">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:CheckBox ID="chkAllowUser" runat="server"  />
                    
</ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Allow Own Report %>">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:CheckBox ID="chkAllowOwnReport" runat="server" />
                    
</ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Allow Own Team %>">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:CheckBox ID="chkAllowOwnTeam" runat="server"  />
                    
</ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Allow Own Project %>">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemTemplate>
                        <asp:CheckBox ID="chkAllowOwnProject" runat="server"   />
                    
</ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Allow Own Sub-Ordinates %>">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemTemplate>
<asp:CheckBox id="chkAllowOwnSubOridinates" runat="server" __designer:wfdid="w8"></asp:CheckBox> 
</ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Allow Own Approval %>">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" Text='<%# Bind("AllowOwnApproval") %>' runat="server" __designer:wfdid="w10"></asp:TextBox>
</edititemtemplate>
                    <itemtemplate>
<asp:CheckBox id="chkAllowOwnApproval" runat="server" __designer:wfdid="w9"></asp:CheckBox>
</itemtemplate>
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <asp:ObjectDataSource ID="dsReportPermissionGridViewObject" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountObjectPermissionsByAccountIdAndAccountReportId" TypeName="ObjectPermissionBLL" InsertMethod="AddAccountObjectPermission" UpdateMethod="UpdateAccountObjectPermission">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="232" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="" Name="AccountReportId" QueryStringField="AccountReportId" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountReportId" Type="Object" />
                <asp:Parameter Name="AccountRoleId" Type="Int32" />
                <asp:Parameter Name="ShowReport" Type="Boolean" />
                <asp:Parameter Name="AllowCustomization" Type="Boolean" />
                <asp:Parameter Name="AllowAllUser" Type="Boolean" />
                <asp:Parameter Name="AllowOwnReport" Type="Boolean" />
                <asp:Parameter Name="AllowOwnTeam" Type="Boolean" />
                <asp:Parameter Name="AllowOwnProject" Type="Boolean" />
                <asp:Parameter Name="AllowOwnSubOrdinates" Type="Boolean" />
                <asp:Parameter Name="Original_AccountObjectPermissionId" Type="Object" />
                <asp:Parameter Name="AllowOwnApproval" Type="Boolean" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountReportId" Type="Object" />
                <asp:Parameter Name="AccountRoleId" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="ShowReport" Type="Boolean" />
                <asp:Parameter Name="AllowCustomization" Type="Boolean" />
                <asp:Parameter Name="AllowAllUser" Type="Boolean" />
                <asp:Parameter Name="AllowOwnReport" Type="Boolean" />
                <asp:Parameter Name="AllowOwnTeam" Type="Boolean" />
                <asp:Parameter Name="AllowOwnProject" Type="Boolean" />
                <asp:Parameter Name="AllowOwnSubOrdinates" Type="Boolean" />
                <asp:Parameter Name="AllowOwnApproval" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="<%$ Resources:TimeLive.Web, Update%>" />
    </ContentTemplate>
</asp:UpdatePanel>
