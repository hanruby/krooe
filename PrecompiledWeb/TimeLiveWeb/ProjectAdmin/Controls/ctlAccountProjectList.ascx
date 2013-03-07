<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountProjectList, App_Web_lth4bcqk" %>
<%@ Register Assembly="eWorld.UI"
    Namespace="eWorld.UI" TagPrefix="ew" %>
    <script type="text/javascript">
        function ChangeCheckBoxState(id, checkState) {
            var cb = document.getElementById(id);
            if (cb != null)
                cb.checked = checkState;
        }

        function ChangeAllCheckBoxStates(checkState) {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs != null) {
                for (var i = 0; i < CheckBoxIDs.length; i++)
                    ChangeCheckBoxState(CheckBoxIDs[i], checkState);
            }
        }

        function ChangeHeaderAsNeeded() {
            // Whenever a checkbox in the GridView is toggled, we need to
            // check the Header checkbox if ALL of the GridView checkboxes are
            // checked, and uncheck it otherwise
            if (CheckBoxIDs != null) {
                // check to see if all other checkboxes are checked
                for (var i = 1; i < CheckBoxIDs.length; i++) {
                    var cb = document.getElementById(CheckBoxIDs[i]);
                    if (!cb.checked) {
                        // Whoops, there is an unchecked checkbox, make sure
                        // that the header checkbox is unchecked
                        ChangeCheckBoxState(CheckBoxIDs[0], false);
                        return;
                    }
                }

                // If we reach here, ALL GridView checkboxes are checked
                ChangeCheckBoxState(CheckBoxIDs[0], true);
            }
        }
    </script>
<x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountProjectId"
    DataSourceID="dsAccountProjectObject" SkinID="xgridviewSkinEmployee" AllowSorting="True" Caption='<%# ResourceHelper.GetFromResource("Project List") %>' Width="98%" OnRowDeleted="GridView1_RowDeleted" Visible="False">
    <Columns>
        <asp:BoundField DataField="AccountProjectId" HeaderText="<%$ Resources:TimeLive.Web, Id %>" InsertVisible="False"
            ReadOnly="True" SortExpression="AccountProjectId" >
            <ItemStyle HorizontalAlign="Center" Width="8%" />
        </asp:BoundField>
        <asp:TemplateField SortExpression="ProjectCode">
            <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w105"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Code") %>' CommandArgument="ProjectCode" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w104"></asp:Label>
</itemtemplate>
            <itemstyle horizontalalign="Left" width="12%" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="ProjectName">
            <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("ProjectName") %>' __designer:wfdid="w108"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' CommandArgument="ProjectName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("ProjectName") %>' __designer:wfdid="w107"></asp:Label>
</itemtemplate>
            <itemstyle horizontalalign="Left" width="23%" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="PartyName">
            <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w111"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name") %>' CommandArgument="PartyName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w110"></asp:Label>
</itemtemplate>
            <itemstyle horizontalalign="Left" width="25%" />
        </asp:TemplateField>
        <asp:BoundField DataField="PartyDepartmentName" HeaderText="Client Department" 
            SortExpression="PartyDepartmentName" />
        <asp:TemplateField SortExpression="StartDate">
            <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("StartDate") %>' __designer:wfdid="w115"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Start Date") %>' CommandArgument="StartDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label4" runat="server" Text='<%# Bind("StartDate", "{0:d}") %>' __designer:wfdid="w114"></asp:Label>
</itemtemplate>
            <itemstyle horizontalalign="Left" width="10%" />
        </asp:TemplateField>
        <asp:CommandField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>" SelectText="Edit" ShowSelectButton="True" >
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="3%"  cssclass="edit_button" />
        </asp:CommandField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
     <ItemTemplate>
 
       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                    OnClientClick='<%# ResourceHelper.GetDeleteMessageJavascript()%>'
                    />
     
</ItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="2%"  cssclass="delete_button" />
        </asp:TemplateField>
      
        
                <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("AccountProjectId",IIf(me.request.querystring("IsTemplate") is nothing,"~/ProjectAdmin/AccountProjectTaskGantt.aspx?AccountProjectId={0}","~/ProjectAdmin/AccountProjectTaskGantt.aspx?AccountProjectId={0}&IsTemplate=True&Source=ProjectTemplates")) %>'
                    Text='<%# ResourceHelper.GetFromResource("Gantt") %>'></asp:HyperLink>
            
</ItemTemplate>
            <ItemStyle Width="5%" />
        </asp:TemplateField>
       
        <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("AccountProjectId",IIf(me.request.querystring("IsTemplate") is nothing,"~/ProjectAdmin/AccountProjectTasks.aspx?AccountProjectId={0}","~/ProjectAdmin/AccountProjectTasks.aspx?AccountProjectId={0}&IsTemplate=True&Source=ProjectTemplates")) %>'
                    Text='<%# ResourceHelper.GetFromResource("Tasks") %>'></asp:HyperLink>
            
</ItemTemplate>
            <ItemStyle Width="5%" />
        </asp:TemplateField>
                <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# Eval("AccountProjectId",IIf(me.request.querystring("IsTemplate") is nothing,"~/ProjectAdmin/AccountProjectEmployees.aspx?AccountProjectId={0}","~/ProjectAdmin/AccountProjectEmployees.aspx?AccountProjectId={0}&IsTemplate=True&Source=ProjectTemplates")) %>'
                    Text='<%# ResourceHelper.GetFromResource("Team") %>'></asp:HyperLink>
            
</ItemTemplate>
            <ItemStyle Width="5%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("AccountProjectId", IIF(Me.Request.QueryString("IsTemplate") is Nothing,"~/ProjectAdmin/AccountProjectMilestones.aspx?AccountProjectId={0}","~/ProjectAdmin/AccountProjectMilestones.aspx?AccountProjectId={0}&IsTemplate=True&Source=ProjectTemplates")) %>'
                    Text='<%# ResourceHelper.GetFromResource("Milestones") %>'></asp:HyperLink>
</ItemTemplate>
            <ItemStyle Width="5%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink id="HyperLinkAttachment" runat="server" __designer:wfdid="w46" onclick="window.open (this.href, 'popupwindow', 'width=800,height=400,left=300,top=300,scrollbars=yes'); return false;" NavigateUrl='<%# "~/ProjectAdmin/AccountProjectAttachmentsPopUp.aspx?AccountProjectId=" & DataBinder.Eval(Container.DataItem,"AccountProjectId") & "&AccountAttachmentTypeId=1"%>' >
                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Attachment%> " /></asp:HyperLink></ItemTemplate>
            <ItemStyle HorizontalAlign="Left" Width="1%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl="~/Images/Preferences.gif"
                    NavigateUrl='<%# Eval("AccountProjectId", IIF(Me.Request.QueryString("IsTemplate") Is Nothing,"~/ProjectAdmin/AccountEMailNotificationPreferences.aspx?AccountProjectId={0}","~/ProjectAdmin/AccountEMailNotificationPreferences.aspx?AccountProjectId={0}&IsTemplate=True&Source=ProjectTemplates")) %>'
                    Text="EMail Preference" ToolTip="<%$ Resources:TimeLive.Web, EMail Preference%> "></asp:HyperLink>
            
</ItemTemplate>
            <ItemStyle Width="1%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            
</HeaderTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" Visible='<%# IIF(IsDBNull(Eval("IsDisabled")),"false",Eval("IsDisabled")) %>' ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
</ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="1%" />
        </asp:TemplateField>
<asp:TemplateField >
     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
     <ItemStyle Width="1%" />
        <HeaderTemplate>
            <asp:CheckBox ID="chkCheckAll" runat="server" />
        </HeaderTemplate>
<ItemTemplate>
    &nbsp; <asp:CheckBox id="chkSelect" runat="server" ></asp:CheckBox> 
</ItemTemplate>
</asp:TemplateField>  
    </Columns>
</x:GridView>
        <table style="width: 98%">
            <tr>
                <td align="left">
                    <asp:Button ID="btnAddProject" runat="server" OnClick="btnAddProject_Click1"
                        Text="<%$ Resources:TimeLive.Web, Add_text %>" Width="75px" />
                    <asp:Button ID="btnDeleteSelectedItem" runat="server" 
                        OnClick="btnDeleteSelectedItem_Click" 
                        Text="<%$ Resources:TimeLive.Web, Delete Selected Item%>" Visible="False" 
                        Width="120px" />
                </td>
            </tr>
        </table>
<asp:ObjectDataSource ID="dsAccountProjectObject" runat="server" 
    DeleteMethod="DeleteAccountProject" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountProjectsForGridView" TypeName="AccountProjectBLL">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:QueryStringParameter DefaultValue="False" Name="IsTemplate" QueryStringField="IsTemplate"
            Type="Boolean" />
    </SelectParameters>
</asp:ObjectDataSource>

