<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlMyProjects.ascx.vb" Inherits="AccountAdmin_Controls_ctlMyProjects" %>
<%@ Register Assembly="eWorld.UI"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:UpdatePanel ID="U" runat="server">
    <ContentTemplate>
<x:GridView ID="G" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountProjectId,ProjectManagerEmployeeId,LeaderEmployeeId"
    DataSourceID="dsAccountProjectObject" SkinID="xgridviewSkinEmployee" AllowSorting="True" Caption='<%# ResourceHelper.GetFromResource("Project List") %>' Width="98%" OnDataBound="GridView1_DataBound">
    <Columns>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Id %>" InsertVisible="False" SortExpression="AccountProjectId">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("AccountProjectId") %>'></asp:Label>
            
</EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccountProjectId") %>' Visible='<%# not Eval("AccountProjectId") = 0 %>'></asp:Label>
            
</ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="20px" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="ProjectCode">
            <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w118"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Code") %>' CommandArgument="ProjectCode" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="L2" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w117"></asp:Label> 
</itemtemplate>
            <itemstyle horizontalalign="Left" width="85px" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="ProjectName" HeaderText="<%$ Resources:TimeLive.Web, Project Name %>">
            <headertemplate>
                <asp:LinkButton id="LinkButton11" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' CommandArgument="ProjectName" CommandName="Sort" CausesValidation="False"></asp:LinkButton> 
            </headertemplate>
            <itemtemplate>
                <asp:HyperLink id="HyperLink1" runat="server" Text='<%# Eval("ProjectName") %>' 
                onclick="window.open (this.href, 'popupwindow', 'width=800,height=400,left=300,top=300,scrollbars=yes'); return false;" NavigateUrl='<%# Eval("AccountProjectId", IIF(AccountPagePermissionBLL.IsPageHasPermissionOf(28, 3),"~/ProjectAdmin/AccountProjectAttachmentsPopUp.aspx?AccountProjectId={0}" & "&AccountAttachmentTypeId=1","~/ProjectAdmin/AccountProjectAttachmentsPopUp.aspx")) %>' ></asp:HyperLink>
            </itemtemplate>
                <ItemStyle Width="160px" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="PartyName">
            <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w124"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="L5" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name") %>' CommandArgument="PartyName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="L4" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w123"></asp:Label> 
</itemtemplate>
            <itemstyle horizontalalign="Left" width="170px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Description %>" SortExpression="ProjectDescription">
            <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' CommandArgument="ProjectDescription" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <ItemTemplate>
<asp:Label id="D" runat="server" __designer:wfdid="w2" Text='<%# Eval("ProjectDescription") %>'></asp:Label>
</ItemTemplate>
            <ItemStyle Width="320px" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="Gantt">
            <headertemplate>
<asp:Label id="lblTaskGantt" runat="server" __designer:wfdid="w16" Text='<%# ResourceHelper.GetFromResource("Gantt") %>'></asp:Label> 
</headertemplate>
            <ItemTemplate>
 <asp:HyperLink ID="HyperLinkGantt" runat="server" NavigateUrl='<%# Eval("AccountProjectId", "~/ProjectAdmin/AccountProjectTaskGantt.aspx?AccountProjectId={0}&Source=MyProjects") %>'
                    Text='<%# ResourceHelper.GetFromResource("Gantt") %>'></asp:HyperLink>
</ItemTemplate>
            <HeaderStyle Width="10px" />
            <ItemStyle Width="10px" HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Task %>">
            <headertemplate>
<asp:Label id="lblTask" runat="server" __designer:wfdid="w16" Text='<%# ResourceHelper.GetFromResource("Task") %>'></asp:Label> 
</headertemplate>
            <ItemTemplate>
<asp:HyperLink id="H2" runat="server" __designer:wfdid="w128" 
                    NavigateUrl='<%# Eval("AccountProjectId", "~/ProjectAdmin/AccountProjectTasks.aspx?AccountProjectId={0}&Source=MyProjects") %>' 
                    Text='<%# ResourceHelper.GetFromResource("Task") %>'></asp:HyperLink> 
</ItemTemplate>
            <HeaderStyle Width="10px" />
            <ItemStyle Width="10px" HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Manage %>">
            <headertemplate>
<asp:Label id="lblManage" runat="server" __designer:wfdid="w18" Text='<%# ResourceHelper.GetFromResource("Manage") %>'></asp:Label> 
</headertemplate>
            <ItemTemplate>
<asp:HyperLink id="H1" runat="server" NavigateUrl='<%# "~/ProjectAdmin/ProjectAdmin.aspx?AccountProjectId=" & Eval("AccountProjectId") & "&Source=MyProjects" %>' __designer:wfdid="w13" ToolTip="<%$ Resources:TimeLive.Web, Manage Project %>" ImageUrl="~/Images/ProjectAdmin.gif" Visible="False">[HyperLink1]</asp:HyperLink> 
</ItemTemplate>
            <ControlStyle Width="45px" />
            <HeaderStyle Width="10px" />
            <ItemStyle Width="10px" HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
<asp:HyperLink id="H3" runat="server" NavigateUrl='<%# Eval("AccountProjectId", "~/ProjectAdmin/AccountEMailNotificationPreferences.aspx?AccountProjectId={0}&Source=MyProjects") %>' Visible='<%# IIF(Eval("AccountProjectId")=0,False,True) %>' __designer:wfdid="w10" Text="EMail Preference" ToolTip="<%$ Resources:TimeLive.Web, EMail Preference%> " ImageUrl="~/Images/Preferences.gif"></asp:HyperLink> 
</ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="10px" />
        </asp:TemplateField>
    </Columns>
</x:GridView>
<asp:ObjectDataSource ID="dsAccountProjectObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAssignedAccountProjectsByAccountEmployeeId" 
            TypeName="AccountProjectBLL" DeleteMethod="DeleteAccountProject" 
            InsertMethod="AddAccountProject" UpdateMethod="UpdateProjectDescription">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="AccountProjectTypeId" Type="Int32" />
        <asp:Parameter Name="AccountClientId" Type="Int32" />
        <asp:Parameter Name="AccountPartyContactId" Type="Int32" />
        <asp:Parameter Name="AccountPartyDepartmentId" Type="Int32" />
        <asp:Parameter Name="ProjectBillingTypeId" Type="Int32" />
        <asp:Parameter Name="ProjectName" Type="String" />
        <asp:Parameter Name="ProjectDescription" Type="String" />
        <asp:Parameter Name="StartDate" Type="DateTime" />
        <asp:Parameter Name="Deadline" Type="DateTime" />
        <asp:Parameter Name="ProjectStatusId" Type="Int32" />
        <asp:Parameter Name="LeaderEmployeeId" Type="Int32" />
        <asp:Parameter Name="ProjectManagerEmployeeId" Type="Int32" />
        <asp:Parameter Name="TimeSheetApprovalTypeId" Type="Int32" />
        <asp:Parameter Name="ExpenseApprovalTypeId" Type="Int32" />
        <asp:Parameter Name="EstimatedDuration" Type="Double" />
        <asp:Parameter Name="EstimatedDurationUnit" Type="String" />
        <asp:Parameter Name="ProjectCode" Type="String" />
        <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
        <asp:Parameter Name="ProjectBillingRateTypeId" Type="Int32" />
        <asp:Parameter Name="IsTemplate" Type="Boolean" />
        <asp:Parameter Name="IsProject" Type="Boolean" />
        <asp:Parameter Name="AccountProjectTemplateId" Type="Int32" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="Completed" Type="Boolean" />
        <asp:Parameter Name="CustomField1" Type="String" />
        <asp:Parameter Name="CustomField2" Type="String" />
        <asp:Parameter Name="CustomField3" Type="String" />
        <asp:Parameter Name="CustomField4" Type="String" />
        <asp:Parameter Name="CustomField5" Type="String" />
        <asp:Parameter Name="CustomField6" Type="String" />
        <asp:Parameter Name="CustomField7" Type="String" />
        <asp:Parameter Name="CustomField8" Type="String" />
        <asp:Parameter Name="CustomField9" Type="String" />
        <asp:Parameter Name="CustomField10" Type="String" />
        <asp:Parameter Name="CustomField11" Type="String" />
        <asp:Parameter Name="CustomField12" Type="String" />
        <asp:Parameter Name="CustomField13" Type="String" />
        <asp:Parameter Name="CustomField14" Type="String" />
        <asp:Parameter Name="CustomField15" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProjectDescription" Type="String" />
        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
        
    </ContentTemplate>
</asp:UpdatePanel>


