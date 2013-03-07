<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlMyReportedTasksShort, App_Web_uitpp31g" %>
<asp:UpdatePanel id="UpdatePanel1" runat="server"><ContentTemplate>
<x:GridView id="GridView1" runat="server" DataSourceID="AccountProjectTaskHierarchyObject" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("My Reported Tasks") %>' SkinID="xgridviewSkinEmployee" Width="99%" AllowSorting="True"><Columns>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Id %>" SortExpression="AccountProjectTaskId">
        <EditItemTemplate>
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AccountProjectTaskId") %>'></asp:TextBox>
        
</EditItemTemplate>
        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccountProjectTaskId") %>'
                Visible='<%# not Eval("AccountProjectTaskId") = 0 %>'></asp:Label>
        
</ItemTemplate>
        <ItemStyle HorizontalAlign="Center" Width="25px" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="TaskName">
        <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Task Name") %>' CommandArgument="TaskName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:HyperLink id="HyperLink1" runat="server" Text='<%# Eval("TaskName") %>' __designer:wfdid="w40" NavigateUrl='<%# Eval("AccountProjectTaskId", "~/Employee/AccountProjectTaskComments.aspx?AccountProjectTaskId={0}") %>'></asp:HyperLink>
</itemtemplate>
    </asp:TemplateField>
    <asp:TemplateField SortExpression="ProjectCode">
        <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w28"></asp:TextBox> 
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Project") %>' CommandArgument="ProjectCode" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w27"></asp:Label> 
</itemtemplate>
        <itemstyle width="30px" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="TaskType">
        <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("TaskType") %>' __designer:wfdid="w31"></asp:TextBox> 
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Type") %>' CommandArgument="TaskType" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("TaskType") %>' __designer:wfdid="w30"></asp:Label> 
</itemtemplate>
        <itemstyle width="20px" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="Priority">
        <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("Priority") %>' __designer:wfdid="w34"></asp:TextBox> 
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Priority") %>' CommandArgument="Priority" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label4" runat="server" Text='<%# Bind("Priority") %>' __designer:wfdid="w33"></asp:Label> 
</itemtemplate>
        <itemstyle width="30px" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="TaskStatus">
        <edititemtemplate>
<asp:TextBox id="TextBox5" runat="server" Text='<%# Bind("TaskStatus") %>' __designer:wfdid="w38"></asp:TextBox> 
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton7" runat="server" Text='<%# ResourceHelper.GetFromResource("Status") %>' CommandArgument="TaskStatus" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("TaskStatus") %>' __designer:wfdid="w37"></asp:Label> 
</itemtemplate>
        <itemstyle width="58px" wrap="False" />
    </asp:TemplateField>
</Columns>
</x:GridView> <asp:ObjectDataSource id="AccountProjectTaskHierarchyObject" 
        runat="server" DeleteMethod="DeleteAccountProjectType" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetAccountProjectTasksByCreatedByEmployeeId" 
        TypeName="AccountProjectTaskBLL" InsertMethod="AddAccountProjectTask">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectTaskId" Type="Int32"  />
    </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AccountProjectId" Type="Int32" />
            <asp:Parameter Name="ParentAccountProjectTaskId" Type="Int32" />
            <asp:Parameter Name="TaskName" Type="String" />
            <asp:Parameter Name="TaskDescription" Type="String" />
            <asp:Parameter Name="AccountTaskTypeId" Type="Int32" />
            <asp:Parameter Name="Duration" Type="Double" />
            <asp:Parameter Name="DurationUnit" Type="String" />
            <asp:Parameter Name="CompletedPercent" Type="Double" />
            <asp:Parameter Name="Completed" Type="Boolean" />
            <asp:Parameter Name="DeadlineDate" Type="DateTime" />
            <asp:Parameter Name="TaskStatusId" Type="Int32" />
            <asp:Parameter Name="AccountPriorityId" Type="Int32" />
            <asp:Parameter Name="AccountProjectMilestoneId" Type="Int32" />
            <asp:Parameter Name="IsForAllEmployees" Type="Boolean" />
            <asp:Parameter Name="IsParentTask" Type="Boolean" />
            <asp:Parameter Name="CreatedOn" Type="DateTime" />
            <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
            <asp:Parameter Name="ModifiedOn" Type="DateTime" />
            <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            <asp:Parameter Name="EstimatedCost" Type="Double" />
            <asp:Parameter Name="EstimatedTimeSpent" Type="Double" />
            <asp:Parameter Name="EstimatedTimeSpentUnit" Type="String" />
            <asp:Parameter Name="IsBillable" Type="Boolean" />
            <asp:Parameter Name="TaskCode" Type="String" />
            <asp:Parameter Name="AccountBillingRateId" Type="Int32" />
            <asp:Parameter Name="IsForAllProjectTask" Type="Boolean" />
            <asp:Parameter Name="EstimatedCurrencyId" Type="Int32" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
        </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
</ContentTemplate>
</asp:UpdatePanel>
