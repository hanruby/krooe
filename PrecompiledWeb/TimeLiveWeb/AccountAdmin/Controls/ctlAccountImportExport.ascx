<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountImportExport, App_Web_j1ru2ref" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<table style="width: 600px" class="xFormView" >
    <tr><td class="caption" colspan=2 style="height: 21px"><asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:TimeLive.Web, CSV Import Export%> " /></td></tr>
    <tr>
        <td style="width: 150px; height: 22px;" align="right">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Import / Export%> " /></td>
        <td style="width: 450px; height: 22px;">
            <asp:RadioButton ID="radExport" runat="server" AutoPostBack="True" GroupName="ImportExport"
                Text="<%$ Resources:TimeLive.Web, Export %>" /><asp:RadioButton ID="radImport" runat="server" AutoPostBack="True"
                    GroupName="ImportExport" Text="<%$ Resources:TimeLive.Web, Import %>" /></td>
    </tr>
    <tr>
        <td style="width: 150px" align="right">
            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:TimeLive.Web, File Type: %>" /></td>
        <td style="width: 450px">
            <asp:RadioButton ID="radDelimited" runat="server" AutoPostBack="True" GroupName="ExportType"
                Text="<%$ Resources:TimeLive.Web, CSV %>" /><asp:RadioButton ID="radIIF" runat="server" AutoPostBack="True"
                    GroupName="ExportType" Text="<%$ Resources:TimeLive.Web, Quickbooks (IIF) %>" />
            <asp:RadioButton ID="radMicrosoftProject" runat="server" AutoPostBack="True"
                    GroupName="ExportType" Text="Microsoft Project" /></td>                    
    </tr>
      <tr>
        <td style="width: 150px" align="right">
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Data Source:%> " /></td>
        <td style="width: 450px">
            <asp:DropDownList ID="ddlDataSource" runat="server" Width="167px" AutoPostBack="True">
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="dsProjectObject"
                DataTextField="ProjectName" DataValueField="AccountProjectId" Visible="False"
                Width="250px"></asp:DropDownList></td>
    </tr>
        <%  If Me.IsImport <> True And (Me.ddlDataSource.Text = "Expense Entry" And Me.radImport.Checked <> True) Or (Me.ddlDataSource.Text = "Time Entry" And Me.radImport.Checked <> True) Or (Me.ddlDataSource.Text = "Time Off Request" And Me.radImport.Checked <> True) Or (Me.ddlDataSource.Text = "Time Off" And Me.radImport.Checked <> True) Then%>  
    <tr>
        <td style="width: 150px;" align="right">
            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Start Date:%> " /></td>
      
        <td style="width: 450px;">
            <ew:CalendarPopup ID="StartTimeTextBox" runat="server" Width="138px">
            </ew:CalendarPopup>
        </td>
    </tr>
    <tr>
        <td style="width: 150px;" align="right">
            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, End Date:%> " /></td>
        
        <td style="width: 450px;">
            <ew:CalendarPopup ID="EndDateTextBox" runat="server" Width="138px">
            </ew:CalendarPopup>
        </td>
    </tr>
    <tr>
        <td style="width: 150px; height: 24px;" align="right">
            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Select Employee:%> " /></td>
        
        <td style="width: 450px; height: 24px;">
            <asp:DropDownList ID="ddlAccountEmployeeId" runat="server" Width="250px" DataSourceID="dsEmployeeObject" DataTextField="EmployeeNameWithCodeWithDisabled" DataValueField="AccountEmployeeId" AppendDataBoundItems="True">
                <asp:ListItem Value="-1">&lt;All&gt;</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <% end if %>
    <% If Me.IsImport <> True And (Me.ddlDataSource.Text = "Project Task" And Me.radImport.Checked <> True) Or (Me.ddlDataSource.Text = "Tasks Users" And Me.radImport.Checked <> True) Or (Me.ddlDataSource.Text = "Projects Team" And Me.radImport.Checked <> True) Or (Me.ddlDataSource.Text = "Projects Roles" And Me.radImport.Checked <> True) Or (Me.ddlDataSource.Text = "Time Entry" And Me.radImport.Checked <> True) Then%>
 <tr>
        <td align="right" style="width: 150px; height: 24px;">
            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Select Project:%> " /></td>
        <td style="width: 450px; height: 24px;">
            <asp:DropDownList ID="ddlAccountProjectId" runat="server" Width="250px" DataSourceID="dsProjectObject" DataTextField="ProjectName" DataValueField="AccountProjectId" AppendDataBoundItems="True">
                <asp:ListItem Value="-1">&lt;All&gt;</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
    <% End If%>
    <%  If Me.IsImport Or Me.radImport.Checked <> False Then%>  
       <tr>
        <td style="width: 150px;" align="right">
            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, Upload File%> " /></td>
        <td style="width: 450px;">
            <asp:FileUpload ID="txtFileUpload" runat="server" Width="100%" /></td>
    </tr>
    <%end if %>
     <%  If Me.IsImport <> True And (Me.ddlDataSource.Text = "Time Entry" And Me.radImport.Checked <> True) Then%>  
    <tr>
        <td align="right" style="width: 150px">
            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:TimeLive.Web, Billing Type: %>" /></td>
        <td style="width: 450px">
            <asp:RadioButton ID="rdBoth" runat="server" GroupName="Billing" Text="<%$ Resources:TimeLive.Web, Both%> " Checked="True" />
            <asp:RadioButton ID="rdBillable" runat="server" GroupName="Billing" Text="<%$ Resources:TimeLive.Web, Billable%>" />
            <asp:RadioButton ID="rdNonBillable" runat="server" GroupName="Billing" Text="<%$ Resources:TimeLive.Web, Non-Billable%>" /></td>
    </tr>
    <% End If%>
    <tr>
        <td style="width: 150px;" align="right">
        </td>
        <td style="width: 450px;">
            <asp:Button ID="cmdProceed" runat="server" Text="<%$ Resources:TimeLive.Web, Proceed_text%> " /></td>
    </tr>
    <tr>
        <td style="width: 150px" align="right">
        </td>
        <td style="width: 450px">
        </td>
    </tr>
</table>
<asp:ObjectDataSource ID="dsEmployeeObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountEmployeesViewByAccountIdWithDisabled" TypeName="AccountEmployeeBLL">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="22" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsProjectObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountProjectsByAccountIdWithoutDeletedForIsDeleted" 
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
        <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProjectDescription" Type="String" />
        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
<br />
<asp:Label ID="lblException" Text="" runat="server" CssClass="ErrorMessage" Font-Bold="True"
    Font-Names="Tahoma" Font-Size="Medium"></asp:Label><asp:Label
        ID="lblRowsInserted" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Medium"
        ForeColor="Blue"></asp:Label><br />
<asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns=False cssclass="xGridView" Caption="Column Mapping" Width="96%">
    <Columns>
        <asp:BoundField HeaderText="TimeLive Column" />
        <asp:BoundField DataField="DBColumnName" HeaderText="TimeLive Column" />
        <asp:TemplateField HeaderText="FileColumnName">
            <EditItemTemplate>
                &nbsp;
            </EditItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:DropDownList ID="ddlFileColumnName" runat="server" Width="98%" AppendDataBoundItems="True">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Required" HeaderText="Required" />
    </Columns>
</asp:GridView><asp:Button ID="cmdImport" runat="server" Text="Start" Visible="False" Width="68px" />
