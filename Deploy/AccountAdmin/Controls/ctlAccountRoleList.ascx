<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountRoleList, App_Web_yhen42r4" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountRoleId"
    DataSourceID="AccountRoleDataSource" Width="98%" SkinID="xgridviewSkinEmployee" AllowSorting="True" Caption='<%# ResourceHelper.GetFromResource("Role List") %>'>
    <Columns>
        <asp:TemplateField InsertVisible="False" SortExpression="AccountRoleId">
            <edititemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Eval("AccountRoleId") %>' __designer:wfdid="w19"></asp:Label> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Id") %>' CommandArgument="AccountRoleId" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("AccountRoleId") %>' __designer:wfdid="w18"></asp:Label> 
</itemtemplate>
            <itemstyle horizontalalign="Center" width="40px" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="Role">
            <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Role") %>' __designer:wfdid="w22"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Role") %>' CommandArgument="Role" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("Role") %>' __designer:wfdid="w21"></asp:Label> 
</itemtemplate>
            <headerstyle horizontalalign="Left" />
            <itemstyle horizontalalign="Left" width="250px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Edit_Text %>" ShowHeader="False">
            <ItemTemplate>
<asp:LinkButton id="LinkButton1" runat="server" Visible='<%# IsDBNull(Eval("MasterAccountRoleId")) %>' Text="<%$ Resources:TimeLive.Web, Edit_Text%> " CommandName="Select" CausesValidation="False" __designer:wfdid="w17"></asp:LinkButton> 
</ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="6%" cssclass="edit_button" />
        </asp:TemplateField>
        
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_Text %>" ShowHeader="False">
     <ItemTemplate>
 
       <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                    OnClientClick='<%# ResourceHelper.GetDeleteMessageJavascript()%>'
                    Text="<%$ Resources:TimeLive.Web, Delete_Text%> " Visible='<%# IsDBNull(Eval("MasterAccountRoleId")) %>'/>
     
</ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="6%" cssclass="delete_button" />
        </asp:TemplateField>
        <asp:TemplateField>
            <HeaderTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            
</HeaderTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" Visible='<%# IIF(IsDBNull(Eval("IsDisabled")),"False",Eval("IsDisabled")) %>' ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            
</ItemTemplate>
            <ItemStyle Width="6%" />
        </asp:TemplateField>
    </Columns>
</x:GridView>
<asp:ObjectDataSource ID="AccountRoleDataSource" runat="server" DeleteMethod="DeleteAccountRole" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountRolesByAccountId"
    TypeName="AccountRoleBLL" UpdateMethod="UpdateAccountRole" InsertMethod="AddAccountRole">
    <DeleteParameters>
        <asp:Parameter Name="original_AccountRoleId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="Role" Type="String" />
        <asp:Parameter Name="original_AccountRoleId" Type="Int32" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="IsDeleted" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="LDAPRole" Type="String" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="Role" Type="String" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="LDAPRole" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsAccountRole" runat="server" DeleteMethod="DeleteAccountRole"
    InsertMethod="AddAccountRole" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountRolesByAccountRoleId"
    TypeName="AccountRoleBLL" UpdateMethod="UpdateAccountRole" OnSelecting="dsAccountRole_Selecting">
    <DeleteParameters>
        <asp:Parameter Name="original_AccountRoleId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="Role" Type="String" />
        <asp:Parameter Name="original_AccountRoleId" Type="Int32" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="IsDeleted" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="LDAPRole" Type="String" />
    </UpdateParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" DefaultValue="" Name="AccountRoleId"
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="Role" Type="String" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="LDAPRole" Type="String" />
    </InsertParameters>
</asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountRoleId" DataSourceID="dsAccountRole"
    DefaultMode="Insert" SkinID="formviewSkinEmployee" Width="350px">
    <EditItemTemplate>
        <table style="width: 100%" class="xview">
            <tr>
                <td class="caption" colspan="2" width="20%" style="height: 21px">
                    <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Role Information")%> ' /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="height: 21px" width="20%">
                    <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Role")%> ' /></td>
            </tr>
            <tr>
                <td class="FormViewLabelCell" width="20%" style="width: 30%; height: 26px" align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN> 

<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="RoleTextBox"><asp:Literal ID="Literal14" runat="server" Text='<%# ResourceHelper.GetFromResource("Role:")%> ' /></asp:Label></td>
                <td style="width: 70%; height: 26px">
        <asp:TextBox ID="RoleTextBox" runat="server" Text='<%# Bind("Role") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RoleTextBox"
                        Display="Dynamic" ErrorMessage="*" Width="1px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%; height: 26px" width="20%">
                    
<asp:Label ID="Label3" runat="server" AssociatedControlID="LDAPRoleTextBox"><asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("LDAP Role:")%> ' /></asp:Label></td>
                <td style="width: 70%; height: 26px">
                    <asp:TextBox ID="LDAPRoleTextBox" runat="server" MaxLength="50" Text='<%# Bind("LDAPRole") %>' ></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 26px; width: 30%;" class="FormViewLabelCell" width="20%" align="right">
                    <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Disabled:%> " /></td>
                <td style="height: 26px; width: 70%;">
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsDisabled") %>' Width="136px" /></td>
            </tr>
            <tr>
                <td style="height: 26px; width: 30%;" width="20%" align="right">
                </td>
                <td style="height: 26px; width: 70%;">
                    <asp:Button ID="Button1" runat="server" CommandName="Update" Text="<%$ Resources:TimeLive.Web, Update_Text%> " Width="68px" /><asp:Button ID="Button2" runat="server" CommandName="Cancel" Text="<%$ Resources:TimeLive.Web, Cancel_Text%> " Width="68px" /></td>
            </tr>
        </table>
    </EditItemTemplate>
    <InsertItemTemplate>
        <table style="width: 100%" class="xview">
            <tr>
                <td class="caption" colspan="2" style="height: 21px" width="20%">
                    <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Role Information")%> ' /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="height: 21px" width="20%">
                    <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Role")%> ' /></td>
            </tr>
            <tr>
                <td style="height: 26px; width: 30%;" class="FormViewLabelCell" width="20%" align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN> 
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="RoleTextBox"><asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Role:")%> ' /></asp:Label></td>
                <td style="height: 26px; width: 70%;" width="80%">
                    <asp:TextBox ID="RoleTextBox" runat="server" Text='<%# Bind("Role") %>' MaxLength="50"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RoleTextBox"
            ErrorMessage="*" Display="Dynamic" Width="1px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="FormViewLabelCell" style="width: 30%; height: 26px" width="20%">
                    
<asp:Label ID="Label4" runat="server" AssociatedControlID="LDAPRoleTextBox"><asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("LDAP Role:")%> ' /></asp:Label></td>
                <td style="width: 70%; height: 26px" width="80%">
                    <asp:TextBox ID="LDAPRoleTextBox" runat="server" MaxLength="50" Text='<%# Bind("LDAPRole") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 26px; width: 30%;" width="20%" align="right">
                </td>
                <td style="height: 26px; width: 70%;" width="80%">
                    <asp:Button ID="btnAdd" runat="server" CommandName="Insert" Text="<%$ Resources:TimeLive.Web, Add_text%> " Width="68px" /></td>
            </tr>
        </table>
    </InsertItemTemplate>
    <ItemTemplate>
        AccountRoleId:
        <asp:Label ID="AccountRoleIdLabel" runat="server" Text='<%# Eval("AccountRoleId") %>'>
        </asp:Label><br />
        AccountId:
        <asp:Label ID="AccountIdLabel" runat="server" Text='<%# Bind("AccountId") %>'></asp:Label><br />
        Role:
        <asp:Label ID="RoleLabel" runat="server" Text='<%# Bind("Role") %>'></asp:Label><br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit">
        </asp:LinkButton>
        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            Text="Delete">
        </asp:LinkButton>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New">
        </asp:LinkButton>
    </ItemTemplate>
</asp:FormView>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
