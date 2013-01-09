<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountTimeOffTypeList, App_Web_yhen42r4" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountTimeOffTypeId"
            DataSourceID="dsAccountTimeOffTypeGridViewObject" Caption="<%$ Resources:TimeLive.Web, Time Off Types List%>" Width="98%" SkinID="xgridviewSkinEmployee" AllowSorting="True" >
            <Columns>
                <asp:BoundField DataField="AccountTimeOffType" HeaderText="<%$ Resources:TimeLive.Web, Time off types %>" SortExpression="AccountTimeOffType" >
                    <ItemStyle Width="70%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Request Required %>" SortExpression="IsTimeOffRequestRequired">
                    <EditItemTemplate>
                                           
</EditItemTemplate>
                    <ItemTemplate>
<asp:Label id="lblTimeOffRequest" runat="server" __designer:wfdid="w78"></asp:Label>
</ItemTemplate>
                    <ItemStyle Width="12%" horizontalalign="Center" />
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
        <asp:ObjectDataSource ID="dsAccountTimeOffTypeGridViewObject" runat="server" InsertMethod="AddAccountTimeOffTypes"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountTimeOffTypesByAccountIdForGridView"
            TypeName="AccountTimeOffTypeBLL" UpdateMethod="UpdateAccountTimeOffTypes">
            <UpdateParameters>
                <asp:Parameter Name="AccountTimeOffType" Type="String" />
                <asp:Parameter Name="IsTimeOffRequestRequired" Type="Boolean" />
                <asp:Parameter   Name="Original_AccountTimeOffTypeId" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountTimeOffType" Type="String" />
                <asp:Parameter Name="IsTimeOffRequestRequired" Type="Boolean" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountTimeOffTypeFormViewObject" runat="server" InsertMethod="AddAccountTimeOffTypes"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountTimeOffTypesByAccountTimeOffTypeId"
            TypeName="AccountTimeOffTypeBLL" UpdateMethod="UpdateAccountTimeOffTypes">
            <UpdateParameters>
                <asp:Parameter Name="AccountTimeOffType" Type="String" />
                <asp:Parameter Name="IsTimeOffRequestRequired" Type="Boolean" />
                <asp:Parameter   Name="Original_AccountTimeOffTypeId" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1"   Name="AccountTimeOffTypeId"
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountTimeOffType" Type="String" />
                <asp:Parameter Name="IsTimeOffRequestRequired" Type="Boolean" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" SkinID="formviewSkinEmployee" runat="server" DataKeyNames="AccountTimeOffTypeId" DataSourceID="dsAccountTimeOffTypeFormViewObject" DefaultMode="Insert" Width="500px">
            <EditItemTemplate>
                <table class="xview" width="100%">
                    <tr>
                        <td class="caption" colspan="2">
                            <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Types Information")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Types")%> ' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtTimeOffType">
                            <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Types")%> ' />:</asp:Label></td>
                        </td>
                        <td style="width: 70%">
                            &nbsp;<asp:TextBox ID="txtTimeOffType" runat="server" MaxLength="50" Text='<%# Bind("AccountTimeOffType") %>'
                                Width="200px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                    runat="server" ControlToValidate="txtTimeOffType" CssClass="ErrorMessage" Display="Dynamic"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Request Required:")%> ' /></td>
                        </td>
                        <td style="width: 70%">
                            <asp:CheckBox ID="chkTimeOffRequired" runat="server" Checked='<%# Bind("IsTimeOffRequestRequired") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Disabled:")%> ' /></td>
                        </td>
                        <td style="width: 70%">
                            <asp:CheckBox ID="DisabledCheckBox" runat="server" Checked='<%# Bind("IsDisabled") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                        </td>
                        <td style="width: 70%">
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="<%$ Resources:TimeLive.Web, Update_text%> " /><asp:Button
                                ID="btnCancel" runat="server" CommandName="Cancel" Text="<%$ Resources:TimeLive.Web, Cancel_text%> " /></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table class="xview" width="100%">
                    <tr>
                        <td class="caption" colspan="2">
                            <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Types Information")%> ' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2">
                            <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Types")%> ' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="txtTimeOffType">
                            <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Types:")%> ' /></asp:Label></td>
                        </td>
                        <td style="width: 70%">
                            &nbsp;<asp:TextBox ID="txtTimeOffType" runat="server" MaxLength="50" Text='<%# Bind("AccountTimeOffType") %>'
                                Width="200px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                    runat="server" ControlToValidate="txtTimeOffType" CssClass="ErrorMessage" Display="Dynamic"
                                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                            <asp:Literal ID="Literal8" runat="server" Text='<%# ResourceHelper.GetFromResource("Time Off Request Required:")%> ' /></td>
                        </td>
                        <td style="width: 70%">
                            <asp:CheckBox ID="chkTimeOffRequired" runat="server" Checked='<%# Bind("IsTimeOffRequestRequired") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="FormViewLabelCell" style="width: 30%">
                        </td>
                        <td style="width: 70%">
                            <asp:Button ID="btnAdd" runat="server" CommandName="Insert" Text="<%$ Resources:TimeLive.Web, Add_text%> " /></td>
                    </tr>
                </table>
            </InsertItemTemplate>
        </asp:FormView>
        &nbsp;
    </ContentTemplate>
</asp:UpdatePanel>
&nbsp;
