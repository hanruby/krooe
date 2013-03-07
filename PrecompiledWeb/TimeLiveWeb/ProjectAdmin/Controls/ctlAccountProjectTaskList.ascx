<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountProjectTaskList, App_Web_lth4bcqk" %>
<%@ Register Assembly="eWorld.UI"
    Namespace="eWorld.UI" TagPrefix="ew" %>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns=False AllowSorting="True" DataSourceID="AccountProjectTaskHierarchyObject" SkinID="xgridviewSkinEmployee" DataKeyNames="AccountProjectTaskId" Caption='<%# ResourceHelper.GetFromResource("Project Task List") %>' Width="98%" OnDataBound="GridView1_DataBound" OnRowDeleted="GridView1_RowDeleted">
    <Columns>
                  <asp:BoundField HeaderText="<%$ Resources:TimeLive.Web, Id %>" DataField="AccountProjectTaskId" SortExpression="AccountProjectTaskId" >
            <HeaderStyle HorizontalAlign="Left" />
            <ItemStyle HorizontalAlign="Left" Width="20px" />
        </asp:BoundField>
        <asp:TemplateField SortExpression="TaskCode">
            <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("TaskCode") %>' __designer:wfdid="w26"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Task Code") %>' CommandArgument="TaskCode" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("TaskCode") %>' __designer:wfdid="w25"></asp:Label>
</itemtemplate>
            <itemstyle horizontalalign="Center" verticalalign="Middle" width="60px" />
        </asp:TemplateField>
       <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Task Name %>" SortExpression="TaskName">
            <ItemTemplate>
                <table cellpadding=0 cellspacing=0 class="xTableWithoutBorder"><tr>
              <%--  <td>
                </td>--%>
            <td <%#IIf(DataBinder.Eval(Container.DataItem, "IsParentTask"),"class=ParentTaskStyle","")%>>
             <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/clearpixel.gif" width='<%#Int32.Parse(DataBinder.Eval(Container.DataItem, "Depth")) * 10 %>' />
            <%#DataBinder.Eval(Container.DataItem, "TaskName")%>
            
            </td></tr></table>
            
</ItemTemplate>
           <HeaderStyle HorizontalAlign="Left" />
           <ItemStyle Width="180px" />
        </asp:TemplateField>
<asp:TemplateField SortExpression="PartyName">
            <edititemtemplate>
<asp:TextBox id="txtPartyName" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w26"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="lnkPartyName" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name") %>' CommandArgument="PartyName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="lblPartyName" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w25"></asp:Label>
</itemtemplate>
            <itemstyle verticalalign="Middle" width="90px" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="ProjectName">
            <edititemtemplate>
<asp:TextBox id="txtProjectName" runat="server" Text='<%# Bind("ProjectName") %>' __designer:wfdid="w26"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="lnkProjectName" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' CommandArgument="ProjectName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="lblProjectName" runat="server" Text='<%# Bind("ProjectName") %>' __designer:wfdid="w25"></asp:Label>
</itemtemplate>
            <itemstyle verticalalign="Middle" width="90px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Assigned By %>" SortExpression="CreatedByFirstName">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CreatedByFirstName") %>'></asp:TextBox>
            
</EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("CreatedByFirstName") %>'></asp:Label>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("CreatedByLastName") %>'></asp:Label>
            
</ItemTemplate>
            <ItemStyle Width="80px" />
        </asp:TemplateField>
                  <asp:TemplateField SortExpression="StartDate">
                      <HeaderTemplate>
                          <asp:LinkButton ID="LinkButton19" runat="server" CausesValidation="False" 
                              CommandArgument="StartDate" CommandName="Sort" 
                              Text='<%# ResourceHelper.GetFromResource("Start Date") %>'></asp:LinkButton>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label19" runat="server" __designer:wfdid="w38" 
                              Text='<%# Bind("StartDate", "{0:d}") %>'></asp:Label>
                      </ItemTemplate>
                      <ItemStyle Width="60px" />
                  </asp:TemplateField>
        <asp:TemplateField SortExpression="DeadlineDate">
            <edititemtemplate>
<asp:TextBox id="TextBox5" runat="server" Text='<%# Bind("DeadlineDate") %>' __designer:wfdid="w39"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Deadline") %>' CommandArgument="DeadlineDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("DeadlineDate", "{0:d}") %>' __designer:wfdid="w38"></asp:Label>
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField SortExpression="TaskStatus">
            <edititemtemplate>
<asp:TextBox id="TextBox6" runat="server" Text='<%# Bind("TaskStatus") %>' __designer:wfdid="w33"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Task Status") %>' CommandArgument="TaskStatus" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label6" runat="server" Text='<%# Bind("TaskStatus") %>' __designer:wfdid="w32"></asp:Label>
</itemtemplate>
            <itemstyle width="50px" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="Priority">
            <edititemtemplate>
<asp:TextBox id="TextBox7" runat="server" Text='<%# Bind("Priority") %>' __designer:wfdid="w36"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Priority") %>' CommandArgument="Priority" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label7" runat="server" Text='<%# Bind("Priority") %>' __designer:wfdid="w35"></asp:Label>
</itemtemplate>
            <headerstyle horizontalalign="Center" />
            <itemstyle horizontalalign="Left" Width="70px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderImageUrl="~/Images/Completed.gif"  >
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Completed") %>'></asp:TextBox>
            
</EditItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Completed.gif" Visible='<%# IIF(IsDBNull(Eval("Completed")),"false",Eval("Completed")) %>' />
            
</ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="2%" />
        </asp:TemplateField>
        <asp:CommandField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>" SelectText="Edit" ShowSelectButton="True" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="25px" cssclass="edit_button" />
        </asp:CommandField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
     <ItemTemplate>
 
       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                    OnClientClick='<%# ResourceHelper.GetDeleteMessageJavascript()%>'
                    Text="Delete" />
     
</ItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="38px" cssclass="delete_button" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Attachment %>">
             <ItemTemplate>
<asp:HyperLink id="HyperLink1" runat="server" __designer:wfdid="w46" onclick="window.open (this.href, 'popupwindow', 'width=800,height=400,left=300,top=300,scrollbars=yes'); return false;" NavigateUrl='<%# "~/ProjectAdmin/AccountProjectTaskAttachmentsPopUp.aspx?AccountProjectTaskId=" & DataBinder.Eval(Container.DataItem,"AccountProjectTaskId") & "&AccountAttachmentTypeId=1"%>' >
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Attachment%> " /></asp:HyperLink></ItemTemplate>
            <ItemStyle HorizontalAlign="Left" Width="1%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Disabled.gif" Tooltip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            
</HeaderTemplate>
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Disabled.gif" Visible='<%# IIF(IsDBNull(Eval("IsDisabled")),"false",Eval("IsDisabled")) %>' Tooltip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            
</ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="2%" />
        </asp:TemplateField>
    </Columns>
        

        </x:GridView>
<table style="width: 100%">
    <tr>
        <td align="left">
            <asp:Button ID="btnAddTask" runat="server" OnClick="btnAddTask_Click" Text="Add"
                Width="75px" /></td>
    </tr>
</table>

<asp:ObjectDataSource ID="AccountProjectTaskHierarchyObject"
    runat="server" DeleteMethod="DeleteAccountProjectType" InsertMethod="AddAccountProjectTask"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountProjectTaskHierarchyCached"
    TypeName="AccountProjectTaskBLL" UpdateMethod="UpdateAccountProjectTask">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectTaskId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="AccountProjectId" Type="Int32" />
        <asp:Parameter Name="ParentAccountProjectTaskId" Type="Int32" />
        <asp:Parameter Name="TaskName" Type="String" />
        <asp:Parameter Name="TaskDescription" Type="String" />
        <asp:Parameter Name="AccountTaskTypeId" Type="Int32" />
        <asp:Parameter Name="Duration" Type="Int32" />
        <asp:Parameter Name="DurationUnit" Type="String" />
        <asp:Parameter Name="CompletedPercent" Type="Int32" />
        <asp:Parameter Name="Completed" Type="Boolean" />
        <asp:Parameter Name="DeadlineDate" Type="DateTime" />
        <asp:Parameter Name="TaskStatusId" Type="Int32" />
        <asp:Parameter Name="AccountPriorityId" Type="Int32" />
        <asp:Parameter Name="IsForAllEmployees" Type="Boolean" />
        <asp:Parameter Name="IsParentTask" Type="Boolean" />
        <asp:Parameter Name="AccountProjectMilestoneId" Type="Int32" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="EstimatedCost" Type="Double" />
        <asp:Parameter Name="EstimatedTimeSpent" Type="Double" />
        <asp:Parameter Name="EstimatedTimeSpentUnit" Type="String" />
        <asp:Parameter Name="IsBillable" Type="Boolean" />
        <asp:Parameter Name="Original_AccountProjectTaskId" Type="Int32" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="TaskCode" Type="String" />
        <asp:Parameter Name="IsForAllProjectTask" Type="Boolean" />
        <asp:Parameter Name="EstimatedCurrencyId" Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="1" Name="AccountProjectId" QueryStringField="AccountProjectId"
            Type="Int64" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountProjectId" Type="Int32" />
        <asp:Parameter Name="ParentAccountProjectTaskId" Type="Int32" />
        <asp:Parameter Name="TaskName" Type="String" />
        <asp:Parameter Name="TaskDescription" Type="String" />
        <asp:Parameter Name="AccountTaskTypeId" Type="Int32" />
        <asp:Parameter Name="Duration" Type="Int32" />
        <asp:Parameter Name="DurationUnit" Type="String" />
        <asp:Parameter Name="CompletedPercent" Type="Int32" />
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
    </InsertParameters>
</asp:ObjectDataSource>
