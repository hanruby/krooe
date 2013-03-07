<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountEmployeeTypeList, App_Web_j1ru2ref" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" SkinID="xgridviewSkinEmployee"  AllowSorting="True" Width="98%" AutoGenerateColumns="False" DataKeyNames="AccountEmployeeTypeId" DataSourceID="dsAccountEmployeeTypeObjectGridView" Caption='<%# ResourceHelper.GetFromResource("Employee Type List") %>'>
            <Columns>
                <asp:TemplateField SortExpression="AccountEmployeeType">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" __designer:wfdid="w2" Text='<%# Bind("AccountEmployeeType") %>'></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" __designer:wfdid="w3" Text='<%# ResourceHelper.GetFromResource("Employee Type") %>' CausesValidation="False" CommandName="Sort" CommandArgument="AccountEmployeeType"></asp:LinkButton> 
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" __designer:wfdid="w1" Text='<%# Bind("AccountEmployeeType") %>'></asp:Label> 
</itemtemplate>
                </asp:TemplateField>
                        <asp:CommandField HeaderText="<%$ Resources:TimeLive.Web, Edit_Text %>" SelectText="Edit" ShowSelectButton="True">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="6%" cssclass="edit_button" />
        </asp:CommandField>
               <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
     <ItemTemplate>
 
       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                    OnClientClick='<%# ResourceHelper.GetDeleteMessageJavascript()%>' 
                     />
     
</ItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="6%" cssclass="delete_button"  />
        </asp:TemplateField>
         <asp:TemplateField>
            <HeaderTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            
</HeaderTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" Visible='<%# IIF(IsDBNull(Eval("IsDisabled")),"False",Eval("IsDisabled")) %>' ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            
</ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="6%" />
        </asp:TemplateField>
            </Columns>
        </x:GridView>
        <asp:ObjectDataSource ID="dsAccountEmployeeTypeObjectGridView" runat="server" InsertMethod="AddAccountEmployeeType"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountEmployeeTypeByAccountId"
            TypeName="AccountEmployeeTypeBLL" UpdateMethod="UpdateAccountEmployeeType">
            <UpdateParameters>
                <asp:Parameter Name="AccountEmployeeType" Type="String" />
                <asp:Parameter Name="Original_AccountEmployeeTypeId" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
                <asp:Parameter Name="IsVendor" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountEmployeeType" Type="String" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsVendor" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountEmployeeTypeFormViewObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountEmployeeTypeByAccountEmployeeTypeId"
            TypeName="AccountEmployeeTypeBLL" InsertMethod="AddAccountEmployeeType" UpdateMethod="UpdateAccountEmployeeType">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="AccountEmployeeTypeId"
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountEmployeeType" Type="String" />
                <asp:Parameter Name="Original_AccountEmployeeTypeId" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
                <asp:Parameter Name="IsVendor" Type="Boolean" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter DefaultValue="55" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountEmployeeType" Type="String" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsVendor" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" SkinID="formviewSkinEmployee" DataKeyNames="AccountEmployeeTypeId" DataSourceID="dsAccountEmployeeTypeFormViewObject" DefaultMode="Insert" Width="400px">
            <InsertItemTemplate>
                <table width="100%" class="xview">
                    <tr>
                        <td colspan="2" class="caption">
                             <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Type Information")%> ' /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="FormViewSubHeader">
                             <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Type")%> ' /></td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 30%;" class="FormViewLabelCell">
                           <SPAN 
                  class=reqasterisk>*</SPAN>  

<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtEmployeeType"><asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Type:")%> ' /></asp:Label></td>
                        <td style="width: 70%;">
                            <asp:TextBox ID="txtEmployeeType" runat="server" Width="200px" MaxLength="50" Text='<%# Bind("AccountEmployeeType") %>'></asp:TextBox><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployeeType"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            IsVendor:</td>
                        <td style="width: 70%">
                            <asp:CheckBox ID="IsVendorCheckBox" runat="server" Checked='<%# Bind("IsVendor") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                        </td>
                        <td style="width: 70%">
                            <asp:Button ID="btnAdd" runat="server" CommandName="Insert" Text="<%$ Resources:TimeLive.Web, Add_text%> " /></td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <EditItemTemplate><table width="100%" class="xview">
                <tr>
                    <td colspan="2" class="caption">
                        <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Type Information")%> ' /></td>
                </tr>
                <tr>
                    <td colspan="2" class="FormViewSubHeader">
                        <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Type")%> ' /></td>
                </tr>
                <tr>
                    <td align="right" style="width: 30%" class="FormViewLabelCell">
                       <SPAN 
                  class=reqasterisk>*</SPAN> 
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtEmployeeType"><asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Type:")%> ' /></asp:Label></td>
                    <td style="width: 70%">
                        <asp:TextBox ID="txtEmployeeType" runat="server" Width="200px" MaxLength="50" Text='<%# Bind("AccountEmployeeType") %>'></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployeeType"
                            CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 30%;">
                        IsVendor:</td>
                    <td style="width: 70%;">
                        <asp:CheckBox ID="IsVendorCheckBox" runat="server" /></td>
                </tr>
                <tr>
                    <td align="right" class="FormViewLabelCell" style="width: 30%">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Disabled:%> " /></td>
                    <td style="width: 70%">
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsDisabled") %>' Enabled='<%# IIF(NOT IsDbnull(Eval("MasterEmployeeTypeId")),"False","True") %>' /></td>
                </tr>
                <tr>
                    <td align="right" style="width: 30%" class="FormViewLabelCell">
                    </td>
                    <td style="width: 70%">
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="<%$ Resources:TimeLive.Web, Update_text%> " /><asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" ValidationGroup="Cancel1" /></td>
                </tr>
            </table>
            </EditItemTemplate>
        </asp:FormView>
        &nbsp;&nbsp;&nbsp;
    </ContentTemplate>
</asp:UpdatePanel>
