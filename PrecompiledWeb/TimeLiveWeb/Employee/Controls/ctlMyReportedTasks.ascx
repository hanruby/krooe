<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlMyReportedTasks, App_Web_uitpp31g" %>
<asp:UpdatePanel id="U" runat="server"><ContentTemplate>
<x:GridView id="G" runat="server" DataSourceID="AccountProjectTaskHierarchyObject" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, My Reported Tasks%> " SkinID="xgridviewSkinEmployee" Width="99%"><Columns>
<asp:BoundField DataField="AccountProjectTaskId" HeaderText="<%$ Resources:TimeLive.Web, Id%> ">
    <ItemStyle HorizontalAlign="Center" Width="25px" />
</asp:BoundField>
<asp:BoundField DataField="TaskName" HeaderText="<%$ Resources:TimeLive.Web, Task Name%> "></asp:BoundField>
    <asp:BoundField DataField="ProjectCode" HeaderText="<%$ Resources:TimeLive.Web, Project%> " SortExpression="ProjectCode" />
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Assigned By%> ">
        <ItemStyle HorizontalAlign="Center" />
        <ItemTemplate>
            <asp:Label ID="Label3" runat="server" Text='<%# Bind("CreatedByFirstName") %>'></asp:Label>
            <asp:Label ID="Label4" runat="server" Text='<%# Bind("CreatedByLastName") %>'></asp:Label>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="DeadlineDate" DataFormatString="{0:d}" HeaderText="<%$ Resources:TimeLive.Web, Deadline%> "
        HtmlEncode="False">
        <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:BoundField DataField="TaskStatus" HeaderText="<%$ Resources:TimeLive.Web, Status%> ">
        <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:BoundField DataField="Priority" HeaderText="<%$ Resources:TimeLive.Web, Priority%> ">
        <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:BoundField DataField="Completed" HeaderText="<%$ Resources:TimeLive.Web, Completed%> ">
        <ItemStyle HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:HyperLinkField DataNavigateUrlFields="AccountProjectTaskId" DataNavigateUrlFormatString="~/Employee/AccountProjectTaskComments.aspx?AccountProjectTaskId={0}"
        Text="Open" />
</Columns>
</x:GridView> <asp:ObjectDataSource id="AccountProjectTaskHierarchyObject" runat="server" DeleteMethod="DeleteAccountProjectType" InsertMethod="AddAccountProjectTask" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountProjectTasksByCreatedByEmployeeId" TypeName="AccountProjectTaskBLL" UpdateMethod="UpdateAccountProjectTask">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectTaskId" Type="Int32"  />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="AccountProjectId" Type="Int32"  />
        <asp:Parameter Name="ParentAccountProjectTaskId" Type="Int32"  />
        <asp:Parameter Name="TaskName" Type="String"  />
        <asp:Parameter Name="TaskDescription" Type="String"  />
        <asp:Parameter Name="AccountTaskTypeId" Type="Int32"  />
        <asp:Parameter Name="Duration" Type="Int32"  />
        <asp:Parameter Name="DurationUnit" Type="String"  />
        <asp:Parameter Name="CompletedPercent" Type="Int32"  />
        <asp:Parameter Name="Completed" Type="Boolean"  />
        <asp:Parameter Name="DeadlineDate" Type="DateTime"  />
        <asp:Parameter Name="TaskStatusId" Type="Int32"  />
        <asp:Parameter Name="AccountPriorityId" Type="Int32"  />
        <asp:Parameter Name="IsForAllEmployees" Type="Boolean"  />
        <asp:Parameter Name="IsParentTask" Type="Boolean"  />
        <asp:Parameter Name="CreatedOn" Type="DateTime"  />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32"  />
        <asp:Parameter Name="ModifiedOn" Type="DateTime"  />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32"  />
        <asp:Parameter Name="Original_AccountProjectTaskId" Type="Int32"  />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountProjectTaskId" Type="Int32"  />
        <asp:Parameter Name="AccountProjectId" Type="Int32"  />
        <asp:Parameter Name="ParentAccountProjectTaskId" Type="Int32"  />
        <asp:Parameter Name="TaskName" Type="String"  />
        <asp:Parameter Name="TaskDescription" Type="String"  />
        <asp:Parameter Name="AccountTaskTypeId" Type="Int32"  />
        <asp:Parameter Name="Duration" Type="Int32"  />
        <asp:Parameter Name="DurationUnit" Type="String"  />
        <asp:Parameter Name="CompletedPercent" Type="Int32"  />
        <asp:Parameter Name="Completed" Type="Boolean"  />
        <asp:Parameter Name="DeadlineDate" Type="DateTime"  />
        <asp:Parameter Name="TaskStatusId" Type="Int32"  />
        <asp:Parameter Name="AccountPriorityId" Type="Int32"  />
        <asp:Parameter Name="IsForAllEmployees" Type="Boolean"  />
        <asp:Parameter Name="IsParentTask" Type="Boolean"  />
        <asp:Parameter Name="CreatedOn" Type="DateTime"  />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32"  />
        <asp:Parameter Name="ModifiedOn" Type="DateTime"  />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32"  />
    </InsertParameters>
</asp:ObjectDataSource>
</ContentTemplate>
</asp:UpdatePanel>
