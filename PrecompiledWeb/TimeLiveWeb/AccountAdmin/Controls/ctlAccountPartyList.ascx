<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountPartyList, App_Web_j1ru2ref" %>
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
<x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountPartyId"
    DataSourceID="dsAccountPartyObject"  AllowSorting="True" SkinID="xgridviewSkinEmployee" Caption='<%# ResourceHelper.GetFromResource("Client List") %>' CssClass="TableView" Width="98%">
    <Columns>
        <asp:BoundField DataField="AccountPartyId" HeaderText="<%$ Resources:TimeLive.Web, Id %>" InsertVisible="False"
            ReadOnly="True" SortExpression="AccountPartyId" >
            <ItemStyle  Width="2%" HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField SortExpression="PartyName">
            <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w3"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name") %>' CommandArgument="PartyName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("PartyName") %>' __designer:wfdid="w2"></asp:Label> 
</itemtemplate>
            <itemstyle horizontalalign="Left" width="28%" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="EMailAddress">
            <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("EMailAddress") %>' __designer:wfdid="w6"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("EMail Address") %>' CommandArgument="EMailAddress" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("EMailAddress") %>' __designer:wfdid="w5"></asp:Label> 
</itemtemplate>
            <itemstyle horizontalalign="Left" width="20%" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="Country">
            <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("Country") %>' __designer:wfdid="w9"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Country") %>' CommandArgument="Country" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("Country") %>' __designer:wfdid="w8"></asp:Label> 
</itemtemplate>
            <itemstyle width="13%" />
        </asp:TemplateField>
        <asp:TemplateField SortExpression="Telephone1">
            <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("Telephone1") %>' __designer:wfdid="w12"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Telephone1") %>' CommandArgument="Telephone1" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label4" runat="server" Text='<%# Bind("Telephone1") %>' __designer:wfdid="w11"></asp:Label> 
</itemtemplate>
            <itemstyle width="12%" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                    Text="Edit" Visible='<%# not IsDBNull(Eval("AccountPartyId")) %>'></asp:LinkButton>
            
</ItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="3%" cssclass="edit_button" />
        </asp:TemplateField>

                        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
     <ItemTemplate>
 
       <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" 
                    OnClientClick='<%# ResourceHelper.GetDeleteMessageJavascript()%>'
                    Text="Delete" Visible='<%# not  IsDBNull(Eval("AccountPartyId")) %>'/>
     
</ItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="3%" cssclass="delete_button" />
        </asp:TemplateField>
        <asp:HyperLinkField Text="<%$ Resources:TimeLive.Web, Contacts %>" DataNavigateUrlFields="AccountPartyId" DataNavigateUrlFormatString="~/AccountAdmin/AccountPartyContacts.aspx?AccountPartyId={0}" HeaderText="<%$ Resources:TimeLive.Web, Contacts %>" >
            <ItemStyle HorizontalAlign="Center" Width="6%" />
        </asp:HyperLinkField>
        <asp:HyperLinkField DataNavigateUrlFields="AccountPartyId" DataNavigateUrlFormatString="~/AccountAdmin/AccountPartyDepartments.aspx?AccountPartyId={0}"
            HeaderText="<%$ Resources:TimeLive.Web, Departments %>" Text="<%$ Resources:TimeLive.Web, Departments %>"  >
            <ItemStyle HorizontalAlign="Center" Width="6%"/>
           
        </asp:HyperLinkField>
        <asp:TemplateField>
            <HeaderTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Disabled.gif" Visible='<%# IIF(IsDBNull(Eval("IsDisabled")),"False",Eval("IsDisabled")) %>' ToolTip="<%$ Resources:TimeLive.Web, Disabled_text%> " />
            </ItemTemplate>
            <itemstyle width="3%" />
        </asp:TemplateField>
<asp:TemplateField >
        <HeaderTemplate>
            <asp:CheckBox ID="chkCheckAll" runat="server" />
        </HeaderTemplate>
        <ItemTemplate>
            &nbsp;
        <asp:CheckBox id="chkSelect" runat="server"></asp:CheckBox> 
        </ItemTemplate>
        <HeaderStyle HorizontalAlign="Center" Width="1%" />
        <ItemStyle Width="1%" HorizontalAlign="Center" />
</asp:TemplateField>  
    </Columns>
</x:GridView>
        <table style="width: 98%">
            <tr>
                <td align="left">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" 
                        Width="75px" />
                    <asp:Button ID="btnDeleteSelectedItem" runat="server" 
                        OnClick="btnDeleteSelectedItem_Click" 
                        Text="<%$ Resources:TimeLive.Web, Delete Selected Item%>" Visible="False" 
                        Width="120px" />
                </td>
            </tr>
        </table>
<asp:ObjectDataSource ID="dsAccountPartyObject" runat="server" 
    DeleteMethod="DeleteAccountParty" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetvueAccountPartiesByAccountId" TypeName="AccountPartyBLL" 
    InsertMethod="AddAccountParty" UpdateMethod="UpdateAccountParty">
    <DeleteParameters>
        <asp:Parameter Name="original_AccountPartyId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="PartyName" Type="String" />
        <asp:Parameter Name="PartyNick" Type="String" />
        <asp:Parameter Name="EMailAddress" Type="String" />
        <asp:Parameter Name="Address1" Type="String" />
        <asp:Parameter Name="Address2" Type="String" />
        <asp:Parameter Name="CountryId" Type="Int16" />
        <asp:Parameter Name="State" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="ZipCode" Type="String" />
        <asp:Parameter Name="Telephone1" Type="String" />
        <asp:Parameter Name="Telephone2" Type="String" />
        <asp:Parameter Name="Fax" Type="String" />
        <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="IsDeleted" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
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
        <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="PartyTypeId" Type="Int16" />
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="PartyName" Type="String" />
        <asp:Parameter Name="PartyNick" Type="String" />
        <asp:Parameter Name="EMailAddress" Type="String" />
        <asp:Parameter Name="Address1" Type="String" />
        <asp:Parameter Name="Address2" Type="String" />
        <asp:Parameter Name="CountryId" Type="Int16" />
        <asp:Parameter Name="State" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="ZipCode" Type="String" />
        <asp:Parameter Name="Telephone1" Type="String" />
        <asp:Parameter Name="Telephone2" Type="String" />
        <asp:Parameter Name="Fax" Type="String" />
        <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="IsDeleted" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="Original_AccountPartyId" Type="Int32" />
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
    </UpdateParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="dsAccountPartyForm" runat="server" DeleteMethod="DeleteAccountParty"
    InsertMethod="AddAccountParty" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetAccountPartiesByAccountPartyId" TypeName="AccountPartyBLL" 
            UpdateMethod="UpdateAccountParty">
    <DeleteParameters>
        <asp:Parameter Name="original_AccountPartyId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="PartyTypeId" Type="Int16" />
        <asp:SessionParameter DefaultValue="" Name="AccountId" SessionField="AccountId" 
            Type="Int32" />
        <asp:Parameter Name="PartyName" Type="String" />
        <asp:Parameter Name="PartyNick" Type="String" />
        <asp:Parameter Name="EMailAddress" Type="String" />
        <asp:Parameter Name="Address1" Type="String" />
        <asp:Parameter Name="Address2" Type="String" />
        <asp:Parameter Name="CountryId" Type="Int16" />
        <asp:Parameter Name="State" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="ZipCode" Type="String" />
        <asp:Parameter Name="Telephone1" Type="String" />
        <asp:Parameter Name="Telephone2" Type="String" />
        <asp:Parameter Name="Fax" Type="String" />
        <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="IsDeleted" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="Original_AccountPartyId" Type="Int32" />
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
    </UpdateParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="AccountPartyId" PropertyName="SelectedValue"
            Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:SessionParameter DefaultValue="23" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:Parameter Name="PartyName" Type="String" />
        <asp:Parameter Name="PartyNick" Type="String" />
        <asp:Parameter Name="EMailAddress" Type="String" />
        <asp:Parameter Name="Address1" Type="String" />
        <asp:Parameter Name="Address2" Type="String" />
        <asp:Parameter Name="CountryId" Type="Int16" />
        <asp:Parameter Name="State" Type="String" />
        <asp:Parameter Name="City" Type="String" />
        <asp:Parameter Name="ZipCode" Type="String" />
        <asp:Parameter Name="Telephone1" Type="String" />
        <asp:Parameter Name="Telephone2" Type="String" />
        <asp:Parameter Name="Fax" Type="String" />
        <asp:Parameter Name="DefaultBillingRate" Type="Decimal" />
        <asp:Parameter Name="Website" Type="String" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter Name="IsDisabled" Type="Boolean" />
        <asp:Parameter Name="IsDeleted" Type="Boolean" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
        <asp:Parameter Name="ModifiedOn" Type="DateTime" />
        <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
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
</asp:ObjectDataSource>
        
<asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountPartyId" DataSourceID="dsAccountPartyForm"
    DefaultMode="Insert" Width="85%" SkinID="formviewSkinEmployee" OnItemInserting="FormView1_ItemInserting" OnItemUpdated="FormView1_ItemUpdated">
    <EditItemTemplate><table style="width: 100%" class="xview">
        <tr>
            <td class="caption" colspan="2" style="height: 21px; width: 40%;" width="40%">
                <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Clients Information") %>' /></td>
        </tr>
        <tr>
            <td class="FormViewSubHeader" colspan="2" style="width: 40%; height: 21px" width="40%">
                <asp:Literal ID="Literal2" runat="server" Text='<%# ResourceHelper.GetFromResource("Clients") %>' /></td>
        </tr>
        <tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                                    <SPAN 
                  class=reqasterisk>*</SPAN>
<asp:Label ID="UserNameLabel" runat="server" 

AssociatedControlID="PartyNameTextBox"> <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="PartyNameTextBox" runat="server" Text='<%# Bind("PartyName") %>' Width="360px" MaxLength="200"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="PartyNameTextBox"
                    Display="Dynamic" ErrorMessage="*" Width="1px"></asp:RequiredFieldValidator></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                                    <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="Label5" runat="server" AssociatedControlID="PartyNickTextBox">
                  <asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Nick:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="PartyNickTextBox" runat="server" Text='<%# Bind("PartyNick") %>' MaxLength="50" Width="225px"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="PartyNickTextBox"
                    Display="Dynamic" ErrorMessage="*" Width="1px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                                    
                                    
<asp:Label ID="Label8" runat="server" AssociatedControlID="EMailAddressTextBox">
                                    <asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Email Address:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="EMailAddressTextBox" runat="server" Text='<%# Bind("EMailAddress") %>' Width="225px" MaxLength="50"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EMailAddressTextBox"
                    CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Incorrect EMail Address"
                    Font-Bold="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td></tr><tr style="color: #000000">
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                
                
<asp:Label ID="Label10" runat="server" AssociatedControlID="Address1TextBox">
                <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Address1:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' Width="225px" MaxLength="250"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                
<asp:Label ID="Label11" runat="server" AssociatedControlID="Address2TextBox">
                <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Address2:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' Width="225px" MaxLength="250"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                <asp:Literal ID="Literal8" runat="server" Text='<%# ResourceHelper.GetFromResource("Country:") %>' /></td>
            <td style="height: 26px; width: 70%;">
                <asp:DropDownList ID="ddlCountryId" runat="server" DataSourceID="dsCountryObject"
                        DataTextField="Country" DataValueField="CountryId" SelectedValue='<%# Bind("CountryId") %>' Width="180px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                <asp:Literal ID="Literal9" runat="server" Text='<%# ResourceHelper.GetFromResource("State:") %>' /></td>
            <td style="height: 26px; width: 70%;">
                <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' MaxLength="20" Width="180px"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                
<asp:Label ID="Label14" runat="server" AssociatedControlID="CityTextBox">
                <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("City:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' MaxLength="50" Width="180px"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                <asp:Literal ID="Literal11" runat="server" Text='<%# ResourceHelper.GetFromResource("ZipCode") %>' /></td>
            <td style="height: 26px; width: 70%;">
                <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' Width="180px" MaxLength="50"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                
<asp:Label ID="Label16" runat="server" AssociatedControlID="Telephone1TextBox">
                <asp:Literal ID="Literal12" runat="server" Text='<%# ResourceHelper.GetFromResource("Telephone1:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="Telephone1TextBox" runat="server" Text='<%# Bind("Telephone1") %>' Width="225px" MaxLength="50"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                
<asp:Label ID="Label17" runat="server" AssociatedControlID="Telephone2TextBox">
                <asp:Literal ID="Literal13" runat="server" Text='<%# ResourceHelper.GetFromResource("Telephone2:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="Telephone2TextBox" runat="server" Text='<%# Bind("Telephone2") %>' Width="225px" MaxLength="50"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                
<asp:Label ID="Label21" runat="server" AssociatedControlID="FaxTextBox">
                <asp:Literal ID="Literal14" runat="server" Text='<%# ResourceHelper.GetFromResource("Fax:") %>' /></asp:Label></td><td>
                <asp:TextBox ID="FaxTextBox" runat="server" Text='<%# Bind("Fax") %>' Width="225px" MaxLength="50"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
               
<asp:Label ID="Label22" runat="server" AssociatedControlID="DefaultBillingRateTextBox">
                <asp:Literal ID="Literal16" runat="server" Text='<%# ResourceHelper.GetFromResource("Default Billing Rate:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="DefaultBillingRateTextBox" runat="server" Text='<%# Bind("DefaultBillingRate") %>' Width="70px"></asp:TextBox><br /><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="DefaultBillingRateTextBox"
                    Display="Dynamic" ErrorMessage="Numeric Required" Font-Bold="False" Type="Double" MaximumValue="999999999" MinimumValue="0" CssClass="ErrorMessage"></asp:RangeValidator></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                
<asp:Label ID="Label24" runat="server" AssociatedControlID="WebsiteTextBox">
                <asp:Literal ID="Literal17" runat="server" Text='<%# ResourceHelper.GetFromResource("Website:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="WebsiteTextBox" runat="server" Text='<%# Bind("Website") %>' Width="225px" MaxLength="100"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right" valign="top">
               
<asp:Label ID="Label26" runat="server" AssociatedControlID="NotesTextBox">
                <asp:Literal ID="Literal18" runat="server" Text='<%# ResourceHelper.GetFromResource("Notes:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' Rows="4" TextMode="MultiLine" Width="472px" MaxLength="500"></asp:TextBox></td></tr><tr>
            <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                <asp:Literal ID="Literal19" runat="server" Text='<%# ResourceHelper.GetFromResource("Disabled:") %>' /></td>
            <td style="width: 70%; height: 26px">
                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsDisabled") %>' ValidationGroup="edit" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Table ID="CustomTableEdit" 
                    runat="server" Width="100%" Height="100%"></asp:Table></td>
            </tr>
    <tr><td align="right" class="FormViewLabelCell" style="height: 26px; width: 30%;" 
                valign="baseline" width="40%"></td><td style="height: 26px; width: 70%;"><asp:Button 
                    ID="Update" runat="server" CommandName="Update" OnClick="Update_Click" 
                    Text="<%$ Resources:TimeLive.Web, Update_text%>" Width="68px" /><asp:Button 
                    ID="Cancel" runat="server" CommandName="Cancel" OnClick="Cancel_Click" 
                    Text="<%$ Resources:TimeLive.Web, Cancel_text%>" Width="68px" /></td></tr></table>
    </EditItemTemplate>
    <InsertItemTemplate>
        <table width="100%" style="width: 100%" class="xview">
            <tr>
                <td class="caption" colspan="2" style="height: 21px; width: 40%;" width="40%">
                    <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Add Client") %>' /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 40%; height: 21px" width="40%">
                    <asp:Literal ID="Literal20" runat="server" Text='<%# ResourceHelper.GetFromResource("Clients") %>' /></td>
            </tr>
            <tr>
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="PartyNameTextBox"><asp:Literal ID="Literal21" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Name:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="PartyNameTextBox" runat="server" Text='<%# Bind("PartyName") %>' Width="360px" MaxLength="200"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="PartyNameTextBox"
                        Display="Dynamic" ErrorMessage="*" Width="1px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td></tr><tr>
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                                        <SPAN 
                  class=reqasterisk>*</SPAN><asp:Label ID="Label6" runat="server" AssociatedControlID="PartyNickTextBox">
                  <asp:Literal ID="Literal22" runat="server" Text='<%# ResourceHelper.GetFromResource("Client Nick:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="PartyNickTextBox" runat="server" Text='<%# Bind("PartyNick") %>' MaxLength="50" Width="225px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server" ControlToValidate="PartyNickTextBox"
                        Display="Dynamic" ErrorMessage="*" Width="1px" CssClass="ErrorMessage"></asp:RequiredFieldValidator></td></tr><tr>
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                                        <SPAN 
                  class=reqasterisk></SPAN> 
                  
<asp:Label ID="Label7" runat="server" AssociatedControlID="EMailAddressTextBox">
                  <asp:Literal ID="Literal23" runat="server" Text='<%# ResourceHelper.GetFromResource("EMail Address:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="EMailAddressTextBox" runat="server" Text='<%# Bind("EMailAddress") %>' Width="225px" MaxLength="50"></asp:TextBox><br /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EMailAddressTextBox"
                        CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Incorrect EMail Address"
                        Font-Bold="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    
                    
<asp:Label ID="Label9" runat="server" AssociatedControlID="Address1TextBox">
                    <asp:Literal ID="Literal24" runat="server" Text='<%# ResourceHelper.GetFromResource("Address1:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="Address1TextBox" runat="server" Text='<%# Bind("Address1") %>' Width="225px" MaxLength="250"></asp:TextBox></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    
<asp:Label ID="Label12" runat="server" AssociatedControlID="Address2TextBox">

                    <asp:Literal ID="Literal25" runat="server" Text='<%# ResourceHelper.GetFromResource("Address2:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="Address2TextBox" runat="server" Text='<%# Bind("Address2") %>' Width="225px" MaxLength="250"></asp:TextBox></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    <asp:Literal ID="Literal26" runat="server" Text='<%# ResourceHelper.GetFromResource("Country:") %>' /></td>
                <td 
                    style="height: 26px; width: 70%;"><asp:DropDownList ID="ddlCountryId" runat="server" DataSourceID="dsCountryObject"
                        DataTextField="Country" DataValueField="CountryId" Width="180px">
                    </asp:DropDownList></td>
            </tr>
            <tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    <asp:Literal ID="Literal27" runat="server" Text='<%# ResourceHelper.GetFromResource("State:") %>' /></td>
                <td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' MaxLength="25" Width="180px"></asp:TextBox></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    
<asp:Label ID="Label15" runat="server" AssociatedControlID="CityTextBox">
                    <asp:Literal ID="Literal28" runat="server" Text='<%# ResourceHelper.GetFromResource("City:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' MaxLength="50" Width="180px"></asp:TextBox></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    
<asp:Label ID="Label13" runat="server" AssociatedControlID="ZipCodeTextBox">
                    <asp:Literal ID="Literal29" runat="server" Text='<%# ResourceHelper.GetFromResource("ZipCode:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' Width="180px" MaxLength="50"></asp:TextBox></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    
<asp:Label ID="Label18" runat="server" AssociatedControlID="Telephone1TextBox">
                    <asp:Literal ID="Literal30" runat="server" Text='<%# ResourceHelper.GetFromResource("Telephone1:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="Telephone1TextBox" runat="server" Text='<%# Bind("Telephone1") %>' Width="225px" MaxLength="50"></asp:TextBox></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    
<asp:Label ID="Label19" runat="server" AssociatedControlID="Telephone2TextBox">
                    <asp:Literal ID="Literal31" runat="server" Text='<%# ResourceHelper.GetFromResource("Telephone2:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="Telephone2TextBox" runat="server" Text='<%# Bind("Telephone2") %>' Width="225px" MaxLength="50"></asp:TextBox></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    
<asp:Label ID="Label20" runat="server" AssociatedControlID="FaxTextBox">
                    <asp:Literal ID="Literal32" runat="server" Text='<%# ResourceHelper.GetFromResource("Fax:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="FaxTextBox" runat="server" Text='<%# Bind("Fax") %>' Width="225px" MaxLength="50"></asp:TextBox></td></tr><tr>
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                
<asp:Label ID="Label23" runat="server" AssociatedControlID="DefaultBillingRateTextBox">
                <asp:Literal ID="Literal16" runat="server" Text='<%# ResourceHelper.GetFromResource("Default Billing Rate:") %>' /></asp:Label></td><td style="height: 26px; width: 70%;">
                <asp:TextBox ID="DefaultBillingRateTextBox" runat="server" Text='<%# Bind("DefaultBillingRate") %>' Width="70px"></asp:TextBox><br /><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="DefaultBillingRateTextBox"
                    Display="Dynamic" ErrorMessage="Numeric Required" Font-Bold="False" Type="Double" MaximumValue="999999999" MinimumValue="0" CssClass="ErrorMessage"></asp:RangeValidator></td></tr><tr>
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right">
                    
<asp:Label ID="Label25" runat="server" AssociatedControlID="WebsiteTextBox">
                    <asp:Literal ID="Literal35" runat="server" Text='<%# ResourceHelper.GetFromResource("Website:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="WebsiteTextBox" runat="server" Text='<%# Bind("Website") %>' Width="225px" MaxLength="100"></asp:TextBox></td></tr><tr >
                <td class="FormViewLabelCell" style="height: 26px; width: 30%;" width="40%" align="right" valign="top">
                    
<asp:Label ID="Label27" runat="server" AssociatedControlID="NotesTextBox">
                    <asp:Literal ID="Literal36" runat="server" Text='<%# ResourceHelper.GetFromResource("Notes:") %>' /></asp:Label></td><td 
                    style="height: 26px; width: 70%;"><asp:TextBox ID="NotesTextBox" runat="server" 
                        Text='<%# Bind("Notes") %>' Rows="4" TextMode="MultiLine" Width="400px" 
                        MaxLength="500"></asp:TextBox></td></tr><tr >
                <td 
                    colspan="2"><asp:Table ID="CustomTable" runat="server" 
                    style="margin-left: 0px" Width="100%"></asp:Table></td>
                </tr>
        <tr><td align="right" class="FormViewLabelCell" style="height: 26px; width: 30%;" 
                    valign="baseline" width="40%"></td><td style="height: 26px; width: 70%;"><asp:Button 
                        ID="Add" runat="server" CommandName="Insert" OnClick="Add_Click" 
                        Text="<%$ Resources:TimeLive.Web, Add_text%>" Width="68px" /><asp:Button 
                        ID="btnCancel" runat="server" CommandName="Cancel" OnClick="btnCancel_Click" 
                        Text="<%$ Resources:TimeLive.Web, Cancel_text%>" ValidationGroup="Add" 
                        Width="68px" /></td></tr></table>
    </InsertItemTemplate>
    <ItemTemplate>
        AccountPartyId: <asp:Label ID="AccountPartyIdLabel" runat="server" Text='<%# Eval("AccountPartyId") %>'>
        </asp:Label><br />PartyTypeId: <asp:Label ID="PartyTypeIdLabel" runat="server" Text='<%# Bind("PartyTypeId") %>'>
        </asp:Label><br />AccountId: <asp:Label ID="AccountIdLabel" runat="server" Text='<%# Bind("AccountId") %>'></asp:Label><br />PartyName: <asp:Label ID="PartyNameLabel" runat="server" Text='<%# Bind("PartyName") %>'></asp:Label><br />PartyNick: <asp:Label ID="PartyNickLabel" runat="server" Text='<%# Bind("PartyNick") %>'></asp:Label><br />EMailAddress: <asp:Label ID="EMailAddressLabel" runat="server" Text='<%# Bind("EMailAddress") %>'>
        </asp:Label><br />Address1: <asp:Label ID="Address1Label" runat="server" Text='<%# Bind("Address1") %>'></asp:Label><br />Address2: <asp:Label ID="Address2Label" runat="server" Text='<%# Bind("Address2") %>'></asp:Label><br />CountryId: <asp:Label ID="CountryIdLabel" runat="server" Text='<%# Bind("CountryId") %>'></asp:Label><br />State: <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>'></asp:Label><br />City: <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>'></asp:Label><br />ZipCode: <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>'></asp:Label><br />Telephone1: <asp:Label ID="Telephone1Label" runat="server" Text='<%# Bind("Telephone1") %>'>
        </asp:Label><br />Telephone2: <asp:Label ID="Telephone2Label" runat="server" Text='<%# Bind("Telephone2") %>'>
        </asp:Label><br />Fax: <asp:Label ID="FaxLabel" runat="server" Text='<%# Bind("Fax") %>'></asp:Label><br />DefaultCurrencyId: <asp:Label ID="DefaultCurrencyIdLabel" runat="server" Text='<%# Bind("DefaultCurrencyId") %>'>
        </asp:Label><br />DefaultBillingRate: <asp:Label ID="DefaultBillingRateLabel" runat="server" Text='<%# Bind("DefaultBillingRate") %>'>
        </asp:Label><br /><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit">
        </asp:LinkButton><asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
            Text="Delete">
        </asp:LinkButton><asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New">
        </asp:LinkButton></ItemTemplate></asp:FormView><asp:ObjectDataSource ID="dsCurrencyObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetCurrencies" TypeName="SystemDataBLL"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsCountryObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetCountries" TypeName="SystemDataBLL"></asp:ObjectDataSource>
    