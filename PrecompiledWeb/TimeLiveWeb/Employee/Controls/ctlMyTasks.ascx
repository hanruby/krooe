<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlMyTasks, App_Web_cfwk0kvw" enableviewstate="true" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24D65337282035F2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="eWorld.UI"  Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Src="ctlTaskSearch.ascx" TagName="ctlTaskSearch" TagPrefix="uc1" %>

<ew:CollapsablePanel id="CollapsablePanelSearch" runat="server" Collapsed="True"
    ExpandText="Search" AllowSliding="True" AllowTitleExpandCollapse="True" AllowTitleRowExpandCollapse="True" CollapseImageUrl="~/Images/collapse.jpg" CollapserAlign="Left" ExpandImageUrl="~/Images/expand_blue.jpg" TitleText="<%$ Resources:TimeLive.Web, Search%>" TitleStyle-Font-Names="Tahoma" TitleStyle-Font-Size="14px">
        <table align="left" class="xFormView" style="width: 784px">
            <tr>
                <td class="caption" colspan="4">
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Project Task%> " /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="4">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Search Parameters%> " /></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Task Id:%> " /></td>
                <td align="left">
                    <asp:TextBox ID="txtAccountProjectTaskId" runat="server" Width="120px" ValidationGroup="TaskSearch"></asp:TextBox></td>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Task Type:%> " /></td>
                <td align="left">
                    <asp:DropDownList ID="ddlAccountTaskType" runat="server" AppendDataBoundItems="True"
                        DataSourceID="dsAccountTaskTypeId" DataTextField="TaskType" DataValueField="AccountTaskTypeId"
                        Width="186px" ValidationGroup="TaskSearch">
                        <asp:ListItem Selected="True" Value="0" Label ID="Label1" runat="server" Text="<%$ Resources:TimeLive.Web, All%> "></asp:ListItem>
                        <%--<asp:ListItem Selected="True" Value="0">&lt;ALL&gt;</asp:ListItem>--%>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Project:%> " /></td>
                <td align="left" class="formviewlabelcell">
                    <asp:DropDownList ID="ddlAccountProjectId" runat="server" AppendDataBoundItems="True" DataTextField="ProjectName" DataValueField="AccountProjectId"
                        Width="186px" ValidationGroup="TaskSearch">
                        <asp:ListItem Selected="True" Value="0" Label ID="Label325" runat="server" Text="<%$ Resources:TimeLive.Web, All%> "></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="right" class="formviewlabelcell">
                    <aspToolkit:CascadingDropDown ID="CascadingDropDown1" runat="server" Category="ProjectMilestone"
                        LoadingText="Loading..." ParentControlID="ddlAccountProjectId" PromptText="<%$ Resources:TimeLive.Web, All%> "
                        ServiceMethod="GetAccountProjectMileStones" TargetControlID="ddlAccountProjectMilestoneId" ServicePath="~/Services/ProjectService.asmx">
                    </aspToolkit:CascadingDropDown>
                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, Milestone:%> " />
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddlAccountProjectMilestoneId" runat="server" AppendDataBoundItems="True"
                        DataSourceID="dsAccountProjectMilestone" DataTextField="MilestoneDescription"
                        DataValueField="AccountProjectMilestoneId" Width="186px" ValidationGroup="TaskSearch">
                        <asp:ListItem Selected="True" Value="0" Label ID="Label3" runat="server" Text="<%$ Resources:TimeLive.Web, All%> "></asp:ListItem>
                        <%--<asp:ListItem Selected="True" Value="0">&lt;ALL&gt;</asp:ListItem>--%>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Report By:%> " /></td>
                <td align="left" class="formviewlabelcell">
                    <asp:DropDownList ID="ddlReportBy" runat="server" AppendDataBoundItems="True" DataSourceID="dsAccountEmployee"
                        DataTextField="EmployeeName" DataValueField="AccountEmployeeId" Width="186px" ValidationGroup="TaskSearch">
                        <asp:ListItem Selected="True" Value="0" Label ID="Label4" runat="server" Text="<%$ Resources:TimeLive.Web, All%> "></asp:ListItem>
                        <%--<asp:ListItem Selected="True" Value="0">&lt;ALL&gt;</asp:ListItem>--%>
                    </asp:DropDownList></td>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:TimeLive.Web, Assigned To:%> " /></td>
                <td align="left">
                    <asp:DropDownList ID="ddlAssignedToEmployeeId" runat="server" AppendDataBoundItems="True" DataTextField="EmployeeName" DataValueField="AccountEmployeeId"
                        Height="22px" Width="186px" ValidationGroup="TaskSearch">
                        <asp:ListItem Selected="True" Value="0" Label ID="Label5" runat="server" Text="<%$ Resources:TimeLive.Web, All%> "></asp:ListItem>
                        <%--<asp:ListItem Selected="True" Value="0">&lt;ALL&gt;</asp:ListItem>--%>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:TimeLive.Web, Completed Status:%> " /></td>
                <td align="left" class="formviewlabelcell">
                    <asp:DropDownList ID="ddlCompletedStatus" runat="server" AppendDataBoundItems="True"
                        Width="186px" ValidationGroup="TaskSearch">
                        <asp:ListItem Selected="True" Value="-1" Label ID="Label7" runat="server" Text="<%$ Resources:TimeLive.Web, All%> "></asp:ListItem>
                        <%--<asp:ListItem Selected="True" Value="-1">&lt;ALL&gt;</asp:ListItem>--%>
                        <asp:ListItem Value="1" Label ID="Label8" runat="server" Text="<%$ Resources:TimeLive.Web, Completed%> "></asp:ListItem>
                        <%--<asp:ListItem Value="1">Completed</asp:ListItem>--%>
                        <%--<asp:ListItem Value="0">Uncompleted</asp:ListItem>--%>
                        <asp:ListItem Value="0" Label ID="Label9" runat="server" Text="<%$ Resources:TimeLive.Web, Uncompleted%> "></asp:ListItem>
                    </asp:DropDownList></td>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:TimeLive.Web, Status:%> " /></td>
                <td align="left">
                    <asp:DropDownList ID="ddlAccountStatusId" runat="server" AppendDataBoundItems="True"
                        DataSourceID="dsAccountStatus" DataTextField="Status" DataValueField="AccountStatusId"
                        Height="22px" Width="186px" ValidationGroup="TaskSearch">
                        <asp:ListItem Value="0" Label ID="Label10" runat="server" Text="<%$ Resources:TimeLive.Web, All%> "></asp:ListItem>
                        <%--<asp:ListItem Selected="True" Value="0">&lt;ALL&gt;</asp:ListItem>--%>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:TimeLive.Web, Include Date Range:%> " /></td>
                <td align="left">
                    <asp:CheckBox ID="chkIncludeDateRange" runat="server" ValidationGroup="TaskSearch" /></td>
                <td align="right" class="formviewlabelcell">
                    </td>
                <td align="left">
                    </td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:TimeLive.Web, Created Date From:%> " /></td>
                <td align="left">
                    <ew:CalendarPopup ID="CreatedDateFrom" runat="server" SkinId="DatePicker">
                    </ew:CalendarPopup>
                </td>
                <td align="right" class="formviewlabelcell">
                    <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:TimeLive.Web, Created Date Upto:%> " /></td>
                <td align="left">
                    <ew:CalendarPopup ID="CreatedDateUpto" runat="server" SkinId="DatePicker">
                    </ew:CalendarPopup>
                </td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" valign="top">
                    <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:TimeLive.Web, Description:%> " /></td>
                <td align="left" class="formviewlabelcell">
                    <asp:TextBox ID="txtTaskDescription" runat="server" ValidationGroup="TaskSearch"
                        Width="184px" Height="44px" TextMode="MultiLine"></asp:TextBox></td>
                <td align="right" class="formviewlabelcell">
                </td>
                <td align="left">
                </td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell">
                </td>
                <td align="left" class="formviewlabelcell" colspan="2">
                    <asp:Button ID="btnShow" runat="server" Text="<%$ Resources:TimeLive.Web, Show_text%> " OnClick="btnShow_Click" ValidationGroup="TaskSearch"/></td>
                <td align="left">
                </td>
            </tr>

        </table>

</ew:CollapsablePanel>

<x:GridView id="GridView1"  runat="server" DataSourceID="AccountProjectTaskHierarchyObject" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("My Task List") %>' SkinID="xgridviewSkinEmployee" Width="99%" AllowSorting="True"><Columns>
    <asp:TemplateField SortExpression="AccountProjectTaskId">
        <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("AccountProjectTaskId") %>' __designer:wfdid="w71"></asp:TextBox>
</edititemtemplate>
        <headertemplate>
<asp:Label id="lblId" runat="server" Text='<%# ResourceHelper.GetFromResource("Id") %>' __designer:wfdid="w72"></asp:Label>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label6" runat="server" Text='<%# Bind("AccountProjectTaskId") %>' __designer:wfdid="w70"></asp:Label>
</itemtemplate>
        <itemstyle horizontalalign="Center" width="1%" />
    </asp:TemplateField>
    <asp:BoundField DataField="TaskCode" HeaderText="Task Code" 
        SortExpression="TaskCode">
    <ItemStyle Width="4%" />
    </asp:BoundField>
    <asp:TemplateField SortExpression="MilestoneDescription" 
        HeaderText="<%$ Resources:TimeLive.Web, Milestone Description%>">


        <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Milestone") %>' __designer:wfdid="w3" CommandArgument="TaskName" CommandName="Sort" CausesValidation="False"></asp:LinkButton> 
</headertemplate>
        <itemtemplate>
<asp:HyperLink id="HyperLink2" runat="server" Text='<%# Eval("MilestoneDescription") %>' 
                NavigateUrl='<%# Eval("AccountProjectMilestoneId", IIF(AccountPagePermissionBLL.IsPageHasPermissionOf(30, 3), "~/ProjectAdmin/AccountProjectMilestones.aspx?AccountProjectMilestoneId={0}","~/Employee/MyTasks.aspx")) %>' 
                __designer:wfdid="w76" 
                
                Visible='<%# IIF(AccountPagePermissionBLL.IsPageHasPermissionOf(30, 3),"True","False") %>'></asp:HyperLink>
            <asp:Label id="Label20" runat="server" 
                Text='<%# Eval("MilestoneDescription") %>' __designer:wfdid="w2" 
                
                Visible='<%# IIF(AccountPagePermissionBLL.IsPageHasPermissionOf(30, 3),"False","True") %>'></asp:Label>
</itemtemplate>
<itemstyle verticalalign="Middle" width="10%" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="TaskName" HeaderText="<%$ Resources:TimeLive.Web, Task Name %>">
        <headertemplate>
<asp:LinkButton id="LinkButton11" runat="server" Text='<%# ResourceHelper.GetFromResource("Task Name") %>' __designer:wfdid="w3" CommandArgument="TaskName" CommandName="Sort" CausesValidation="False"></asp:LinkButton> 
</headertemplate>
        <itemtemplate>
<asp:HyperLink id="HyperLink1" runat="server" Text='<%# Eval("TaskName") %>' NavigateUrl='<%# Eval("AccountProjectTaskId", IIF(AccountPagePermissionBLL.IsPageHasPermissionOf(28, 3),"~/Employee/AccountProjectTaskComments.aspx?AccountProjectTaskId={0}","~/Employee/MyTasks.aspx")) %>' __designer:wfdid="w76" Visible='<%# IIF(AccountPagePermissionBLL.IsPageHasPermissionOf(28, 3),"True","False") %>'></asp:HyperLink><asp:Label id="Label12" runat="server" Text='<%# Eval("TaskName") %>' __designer:wfdid="w2" Visible='<%# IIF(AccountPagePermissionBLL.IsPageHasPermissionOf(28, 3),"False","True") %>'></asp:Label><BR /><asp:Label id="Label1" runat="server" Text='<%# Eval("TaskType") %>' __designer:wfdid="w2"></asp:Label>
</itemtemplate>
        <ItemStyle Width="17%" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="ProjectCode">
        <edititemtemplate>
<asp:TextBox id="TextBox6" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w84"></asp:TextBox>
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Project") %>' CommandArgument="ProjectCode" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label8" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w83"></asp:Label>
</itemtemplate>
        <itemstyle width="5%" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="PartyName">
        <edititemtemplate>
<asp:TextBox id="TextBox7" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w87"></asp:TextBox>
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Client") %>' CommandArgument="PartyName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label9" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w86"></asp:Label>
</itemtemplate>
        <itemstyle width="15%" />
    </asp:TemplateField>
    
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Assigned By %>" SortExpression="CreatedByFirstName">
        <ItemTemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("CreatedByFirstName") %>' __designer:wfdid="w89"></asp:Label> <asp:Label id="Label4" runat="server" Text='<%# Bind("CreatedByLastName") %>' __designer:wfdid="w90"></asp:Label> 
</ItemTemplate>
        <ItemStyle Width="10%" />
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Assigned To %>" SortExpression="AssignedTo">
        <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("AssignedTo") %>' __designer:wfdid="w2"></asp:TextBox> 
</edititemtemplate>
        <itemtemplate>
<asp:Label id="lblAssignedTo" runat="server" __designer:wfdid="w42"></asp:Label> 
</itemtemplate>
        <itemstyle width="10%" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="DeadlineDate">
        <edititemtemplate>
<asp:TextBox id="TextBox8" runat="server" Text='<%# Bind("DeadlineDate") %>' __designer:wfdid="w92"></asp:TextBox>
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton10" runat="server" Text='<%# ResourceHelper.GetFromResource("Deadline") %>' CommandArgument="DeadlineDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label10" runat="server" Text='<%# Bind("DeadlineDate", "{0:d}") %>' __designer:wfdid="w91"></asp:Label>
</itemtemplate>
        <itemstyle width="10%" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="TaskStatus" HeaderText="<%$ Resources:TimeLive.Web, Status %>">
        <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("TaskStatus") %>' __designer:wfdid="w96"></asp:TextBox> 
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton7" runat="server" Text='<%# ResourceHelper.GetFromResource("Status") %>' CommandArgument="TaskStatus" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("TaskStatus") %>' __designer:wfdid="w94"></asp:Label>&nbsp;<asp:Label id="Label5" runat="server" Text='<%# Eval("CompletedPercent") & "%" %>' __designer:wfdid="w95" visible='<%# IIF(Eval("AccountProjectTaskId") = 0,False,True)%>'></asp:Label> 
</itemtemplate>
        <itemstyle width="10%" />
    </asp:TemplateField>
    <asp:TemplateField SortExpression="Priority">
        <edititemtemplate>
<asp:TextBox id="TextBox9" runat="server" Text='<%# Bind("Priority") %>' __designer:wfdid="w99"></asp:TextBox>
</edititemtemplate>
        <headertemplate>
<asp:LinkButton id="LinkButton8" runat="server" Text='<%# ResourceHelper.GetFromResource("Priority") %>' CommandArgument="Priority" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
        <itemtemplate>
<asp:Label id="Label11" runat="server" Text='<%# Bind("Priority") %>' __designer:wfdid="w98"></asp:Label>
</itemtemplate>
        <itemstyle width="5%" />
    </asp:TemplateField>
    <asp:TemplateField  HeaderImageUrl="~/Images/Completed.gif">
        <EditItemTemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Completed") %>' __designer:wfdid="w12"></asp:TextBox> 
</EditItemTemplate>
        <ItemTemplate>
&nbsp;<asp:Image id="Image1" runat="server" __designer:wfdid="w11" Visible='<%# IIF(IsDBNull(Eval("Completed")),"false",Eval("Completed")) %>' ImageUrl="~/Images/Completed.gif"></asp:Image> 
</ItemTemplate>
        <ItemStyle HorizontalAlign="Center"  Width="2%"/>
    </asp:TemplateField>
</Columns>
</x:GridView> 
    <table style="width: 100%">
        <tr>
            <td align="right">
                &nbsp;<asp:Button ID="btnAddTask" runat="server" OnClick="btnAddTask_Click"
                    Text="<%$ Resources:TimeLive.Web, Add_text %>" Width="75px" />
                &nbsp; &nbsp;
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource id="AccountProjectTaskHierarchyObject" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountProjectTasksForTaskSearch" TypeName="AccountProjectTaskBLL" >
    <SelectParameters>
        <asp:Parameter DefaultValue="-1" Name="AccountProjectTaskId" Type="Int64" />
        <asp:Parameter Name="AccountProjects" Type="String" />
        <asp:Parameter DefaultValue="0" Name="AccountTaskTypeId" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="ReportedBy" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="IncludeDateRange" Type="String" />
        <asp:Parameter Name="CreatedDateFrom" Type="DateTime" DefaultValue="11/01/2006" />
        <asp:Parameter Name="CreatedDateUpto" Type="DateTime" DefaultValue="11/01/2007" />
        <asp:Parameter DefaultValue="39" Name="AssignedTo" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="TaskStatusId" Type="Int32" />
        <asp:Parameter DefaultValue="0" Name="CompletedStatus" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter DefaultValue="" Name="AccountProjectMilestoneId" Type="Int32" />
        <asp:SessionParameter DefaultValue="" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>

        

        <asp:ObjectDataSource ID="dsAccountTaskTypeId" runat="server" DeleteMethod="DeleteAccountTaskType"
            InsertMethod="AddAccountTaskType" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountTaskTypesByAccountId" TypeName="AccountTaskTypeBLL" UpdateMethod="UpdateAccountTaskType">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountTaskTypeId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="TaskType" Type="String" />
                <asp:Parameter Name="Original_AccountTaskTypeId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="TaskType" Type="String" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountEmployee" runat="server" DeleteMethod="DeleteAccountEmployee"
            InsertMethod="AddAccountEmployee2" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountEmployeesViewByAccountId" TypeName="AccountEmployeeBLL"
            UpdateMethod="UpdateAccountEmployee">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountEmployeeId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Prefix" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="MiddleName" Type="String" />
                <asp:Parameter Name="EMailAddress" Type="String" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountDepartmentId" Type="Int32" />
                <asp:Parameter Name="AccountRoleId" Type="Int32" />
                <asp:Parameter Name="AccountLocationId" Type="Int32" />
                <asp:Parameter Name="AddressLine1" Type="String" />
                <asp:Parameter Name="AddressLine2" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Zip" Type="String" />
                <asp:Parameter Name="CountryId" Type="Int16" />
                <asp:Parameter Name="HomePhoneNo" Type="String" />
                <asp:Parameter Name="WorkPhoneNo" Type="String" />
                <asp:Parameter Name="MobilePhoneNo" Type="String" />
                <asp:Parameter Name="BillingRateCurrencyId" Type="Int16" />
                <asp:Parameter Name="BillingTypeId" Type="Int32" />
                <asp:Parameter Name="BillingRate" Type="Decimal" />
                <asp:Parameter Name="BillingRateStartDate" Type="DateTime" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="TerminationDate" Type="DateTime" />
                <asp:Parameter Name="StatusId" Type="Byte" />
                <asp:Parameter Name="IsDeleted" Type="Boolean" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
                <asp:Parameter Name="DefaultProjectId" Type="Int32" />
                <asp:Parameter Name="TimeZoneId" Type="Int16" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountEmployeeId" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Prefix" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountTaskType" runat="server"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProject" runat="server" DeleteMethod="DeleteAccountProject"
            InsertMethod="AddAccountProject" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectsByAccountId" TypeName="AccountProjectBLL" UpdateMethod="UpdateAccountProject">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountProjectTypeId" Type="Int32" />
                <asp:Parameter Name="AccountClientId" Type="Int32" />
                <asp:Parameter Name="ProjectBillingTypeId" Type="Int32" />
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="ProjectDescription" Type="String" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="DeadLine" Type="DateTime" />
                <asp:Parameter Name="ProjectStatusId" Type="Int32" />
                <asp:Parameter Name="LeaderEmployeeId" Type="Int32" />
                <asp:Parameter Name="ProjectManagerEmployeeId" Type="Int32" />
                <asp:Parameter Name="TimeSheetApprovalPathId" Type="Int32" />
                <asp:Parameter Name="EstimatedDuration" Type="Int32" />
                <asp:Parameter Name="EstimatedDurationUnit" Type="String" />
                <asp:Parameter Name="ProjectCode" Type="String" />
                <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountProjectTypeId" Type="Int32" />
                <asp:Parameter Name="AccountClientId" Type="Int32" />
                <asp:Parameter Name="ProjectBillingTypeId" Type="Int32" />
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="ProjectDescription" Type="String" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="DeadLine" Type="DateTime" />
                <asp:Parameter Name="ProjectStatusId" Type="Int32" />
                <asp:Parameter Name="LeaderEmployeeId" Type="Int32" />
                <asp:Parameter Name="ProjectManagerEmployeeId" Type="Int32" />
                <asp:Parameter Name="TimeSheetApprovalPathId" Type="Int32" />
                <asp:Parameter Name="EstimatedDuration" Type="Int32" />
                <asp:Parameter Name="EstimatedDurationUnit" Type="String" />
                <asp:Parameter Name="ProjectCode" Type="String" />
                <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountStatus" runat="server" DeleteMethod="DeleteAccountStatus"
            InsertMethod="AddAccountStatus" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountsStatusForTask" TypeName="AccountStatusBLL" UpdateMethod="UpdateAccountStatus">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountStatusId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="StatusTypeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountStatusId" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="StatusTypeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectMilestone" runat="server" DeleteMethod="DeleteAccountProjectMilestone"
            InsertMethod="AddAccountProjectMilestone" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectMilestonesByAccountProjectId" TypeName="AccountProjectMilestoneBLL"
            UpdateMethod="UpdateAccountProjectMilestone">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectMilestoneId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="MilestoneDescription" Type="String" />
                <asp:Parameter Name="MilestoneDate" Type="DateTime" />
                <asp:Parameter Name="Original_AccountProjectMilestoneId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAccountProjectId" DefaultValue="1" Name="AccountProjectId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="NotFixTable" Type="Boolean" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="MilestoneDescription" Type="String" />
                <asp:Parameter Name="MilestoneDate" Type="DateTime" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
