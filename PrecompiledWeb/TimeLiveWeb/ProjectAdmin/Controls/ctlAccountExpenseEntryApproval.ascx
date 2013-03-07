<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountExpenseEntryApproval, App_Web_lth4bcqk" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24D65337282035F2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
    <script type="text/javascript">
        function ChangeCheckBoxState1(id, checkState1)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState1;
        }
        
        function ChangeAllCheckBoxStates1(checkState1)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs1 != null)
            {
                for (var i = 0; i < CheckBoxIDs1.length; i++)
                   ChangeCheckBoxState1(CheckBoxIDs1[i], checkState1);
            }
        }

    </script>
    
    <script type="text/javascript">
        function ChangeCheckBoxState2(id, checkState2)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState2;
        }
        
        function ChangeAllCheckBoxStates2(checkState2)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs2 != null)
            {
                for (var i = 0; i < CheckBoxIDs2.length; i++)
                   ChangeCheckBoxState2(CheckBoxIDs2[i], checkState2);
            }
        }

    </script>
    
    <script type="text/javascript">
        function ChangeCheckBoxState3(id, checkState3)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState3;
        }
        
        function ChangeAllCheckBoxStates3(checkState3)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs3 != null)
            {
                for (var i = 0; i < CheckBoxIDs3.length; i++)
                   ChangeCheckBoxState3(CheckBoxIDs3[i], checkState3);
            }
        }

    </script>
    
    <script type="text/javascript">
        function ChangeCheckBoxState4(id, checkState4)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState4;
        }
        
        function ChangeAllCheckBoxStates4(checkState4)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs4 != null)
            {
                for (var i = 0; i < CheckBoxIDs4.length; i++)
                   ChangeCheckBoxState4(CheckBoxIDs4[i], checkState4);
            }
        }

    </script>
    
    <script type="text/javascript">
        function ChangeCheckBoxState5(id, checkState5)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState5;
        }
        
        function ChangeAllCheckBoxStates5(checkState5)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs5 != null)
            {
                for (var i = 0; i < CheckBoxIDs5.length; i++)
                   ChangeCheckBoxState5(CheckBoxIDs5[i], checkState5);
            }
        }

    </script>      
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="xFormView" style="width: 450px;">
            <tbody>
                <tr>
                    <td class="caption" colspan="2" style="height: 21px">
                        <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Expense Approval%> " /></td>
                </tr>
                <tr>
                    <td class="FormViewSubHeader" colspan="2" style="height: 21px">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Search Parameters%> " /></td>
                </tr>
                <tr>
                    <td class="formviewlabelcell" style="width: 40%;" align="right">
                        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Name:%> " /></td>
                    <td style="width: 60%;" align="left">
                        &nbsp;<asp:DropDownList ID="ddlAccountEmployeeId" runat="server" DataTextField="EmployeeName" DataValueField="AccountEmployeeId"
                            Width="200px" AppendDataBoundItems="True" DataSourceID="dsAccountEmployeeObject">
                            <asp:ListItem Value="0" Selected="True" Text="<%$ Resources:TimeLive.Web, ALLs%> "></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="formviewlabelcell" style="width: 40%;" align="right">
                        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Include Date Range:%> " /></td>
                    <td style="width: 60%;" align="left">
                        <asp:CheckBox ID="chkIncludeDateRange" runat="server" /></td>
                </tr>
                <tr>
                    <td class="formviewlabelcell" style="width: 40%;" align="right">
                        <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, Expense Entry Start Date:%> " /></td>
                    <td style="width: 60%;" align="left">
                        &nbsp;<ew:CalendarPopup ID="txtExpenseEntryStartDate" runat="server" SkinId="DatePicker">
                        </ew:CalendarPopup>
                    </td>
                </tr>
                <tr>
                    <td class="formviewlabelcell" style="width: 40%;" align="right">
                        <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Expense Entry End Date:%> " /></td>
                    <td style="width: 60%;" align="left">
                        &nbsp;<ew:CalendarPopup ID="txtExpenseEntryEndDate" runat="server" SkinId="DatePicker">
                        </ew:CalendarPopup>
                    </td>
                </tr>
                <tr>
                    <td class="formviewlabelcell" style="width: 40%;" align="right">
                    </td>
                    <td style="width: 60%;" align="left">
                        &nbsp;<asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="<%$ Resources:TimeLive.Web, Show_text%> "
                            Width="50px" />
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <asp:ObjectDataSource ID="dsAccountProjectObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetProjectsForExpenseEntryApproval" TypeName="AccountProjectBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="129" Name="ApproverEmployeeId" SessionField="AccountEmployeeId"
                    Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountEmployeeObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetEmployeesForExpenseEntryApproval" TypeName="AccountEmployeeBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="129" Name="ApproverEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsApprovalEntriesForTeamLeadObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetApprovalEntriesForTeamLeadSummarized" TypeName="AccountExpenseEntryBLL">
            <FilterParameters>
                <asp:Parameter DefaultValue="39" Direction="Output" Name="AccountEmployeeId" Type="Int32" />
            </FilterParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="67" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="67" Name="ExpenseEntryAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryStartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryEndDate" Type="DateTime" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ApprovalEntriesForProjectManagerObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetApprovalEntriesForProjectManagerSummarized"
            TypeName="AccountExpenseEntryBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="67" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="67" Name="ExpenseEntryAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryStartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryEndDate" Type="DateTime" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ApprovalEntriesForSpecificEmployeeObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetApprovalEntriesForSpecificEmployeeSummarized" TypeName="AccountExpenseEntryBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="67" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="67" Name="ExpenseEntryAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryStartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryEndDate" Type="DateTime" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsApprovalEntriesForSpeicifExternalUserObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetApprovalEntriesForSpecificExternalUserSummarized" TypeName="AccountExpenseEntryBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="67" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="67" Name="ExpenseEntryAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryStartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryEndDate" Type="DateTime" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsApprovalEntriesForEmployeeManagerObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetApprovalEntriesForEmployeeManagerSummarized" TypeName="AccountExpenseEntryBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="67" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="67" Name="ExpenseEntryAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryStartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="11/02/2006" Name="ExpenseEntryEndDate" Type="DateTime" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Button ID="btnUpdate1" runat="server" OnClick="btnUpdate1_Click" Text="<%$ Resources:TimeLive.Web, Update Expense Entry Approvals%> "
    Width="250px" /><br />
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("My Team Expense Entry Approvals") %>'
            DataKeyNames="AccountEmployeeExpenseSheetId,ApprovalPathSequence" DataSourceID="dsApprovalEntriesForTeamLeadObject"
            SkinID="xgridviewSkinEmployee" Width="98%">
            <Columns>
        <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
            <edititemtemplate>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes,resizable=yes'); return false;" runat="server" Text='<%# Bind("EmployeeName") %>' __designer:wfdid="w4"></asp:HyperLink> 
</itemtemplate>
            <headerstyle horizontalalign="Center" />
            <itemstyle horizontalalign="Left" width="35%" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w7"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' CommandArgument="Description" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w6"></asp:Label> 
</itemtemplate>
                    <itemstyle width="35%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="ExpenseSheetDate">
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ExpenseSheetDate") %>' __designer:wfdid="w10"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Date") %>' CommandArgument="ExpenseSheetDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("ExpenseSheetDate", "{0:d}") %>' __designer:wfdid="w9"></asp:Label> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" width="8%" />
                </asp:TemplateField>
<asp:TemplateField SortExpression="Amount" HeaderText="<%$ Resources:TimeLive.Web, Amount %>"><EditItemTemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("Amount") %>' __designer:wfdid="w14"></asp:TextBox> 
</EditItemTemplate>
    <headertemplate>
<asp:Label id="lblAmount1" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount") %>' __designer:wfdid="w15"></asp:Label>
</headertemplate>
<ItemTemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("BaseCurrencyCode") %>' __designer:wfdid="w12"></asp:Label> <asp:Label id="Label3" runat="server" Text='<%# Bind("Amount", "{0:N}") %>' __designer:wfdid="w13"></asp:Label> 
</ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle Width="8%"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
<ItemTemplate>
<asp:RadioButton id="chkTeamLead" runat="server" __designer:wfdid="w16"  GroupName="TeamLead"></asp:RadioButton> 
</ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
<ItemTemplate>
<asp:RadioButton id="chkTeamLeadRejected" runat="server" __designer:wfdid="w17" GroupName="TeamLead"></asp:RadioButton> 
</ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>"><EditItemTemplate>
&nbsp; 
</EditItemTemplate>
<ItemTemplate>
<asp:TextBox id="TeamLeadCommentsTextBox" runat="server" Width="100%" __designer:wfdid="w18" TextMode="MultiLine"></asp:TextBox> 
</ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle Width="15%"></ItemStyle>
</asp:TemplateField>
<asp:BoundField ReadOnly="True" DataField="AccountExpenseEntryId" Visible="False" SortExpression="AccountExpenseEntryId" HeaderText="AccountExpenseEntryId"></asp:BoundField>
</Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllTeamLead" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates1(true);" Visible="False">
            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>&nbsp;<asp:LinkButton
                ID="UnCheckAllTeamLead" runat="server" CssClass="FeatureHeadingIcon" OnClientClick="ChangeAllCheckBoxStates1(false);"
                Visible="False">
                <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton>&nbsp;
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("My Projects Expense Entry Approvals") %>'
            DataKeyNames="AccountEmployeeExpenseSheetId,ApprovalPathSequence" DataSourceID="ApprovalEntriesForProjectManagerObject"
            SkinID="xgridviewSkinEmployee" Width="98%">
            <Columns>
                     <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
            <edititemtemplate>
</edititemtemplate>
                         <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes,resizable=yes'); return false;" runat="server" Text='<%# Bind("EmployeeName") %>' __designer:wfdid="w19"></asp:HyperLink> 
</itemtemplate>
            <headerstyle horizontalalign="Center" />
            <itemstyle horizontalalign="Left" width="35%" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w22"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton7" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' CommandArgument="Description" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w21"></asp:Label>
</itemtemplate>
                    <itemstyle width="35%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="ExpenseSheetDate">
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ExpenseSheetDate") %>' __designer:wfdid="w25"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton8" runat="server" Text='<%# ResourceHelper.GetFromResource("Date") %>' CommandArgument="ExpenseSheetDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("ExpenseSheetDate", "{0:d}") %>' __designer:wfdid="w24"></asp:Label>
</itemtemplate>
                    <itemstyle horizontalalign="Center" width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Amount %>" SortExpression="Amount">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("Amount") %>' __designer:wfdid="w29"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:Label id="lblAmount2" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount") %>' __designer:wfdid="w30"></asp:Label>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("BaseCurrencyCode") %>' __designer:wfdid="w27"></asp:Label> <asp:Label id="Label2" runat="server" Text='<%# Bind("Amount", "{0:N}") %>' __designer:wfdid="w28"></asp:Label> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle width="8%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
                    <ItemTemplate>
<asp:RadioButton id="chkProjectManager" runat="server" __designer:wfdid="w31" GroupName="ProjectManager"></asp:RadioButton> 
</ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
                    <EditItemTemplate>
&nbsp; 
</EditItemTemplate>
                    <ItemTemplate>
<asp:RadioButton id="chkProjectManagerRejected" runat="server" __designer:wfdid="w32" GroupName="ProjectManager"></asp:RadioButton> 
</ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
                    <EditItemTemplate>
&nbsp; 
</EditItemTemplate>
                    <ItemTemplate>
<asp:TextBox id="ProjectManagerCommentsTextBox" runat="server" Width="100%" __designer:wfdid="w33" TextMode="MultiLine"></asp:TextBox> 
</ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Width="15%" />
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllProjectManager" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates2(true);" Visible="False">
            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>&nbsp;<asp:LinkButton
                ID="UnCheckAllProjectMananger" runat="server" CssClass="FeatureHeadingIcon" OnClientClick="ChangeAllCheckBoxStates2(false);"
                Visible="False">
                <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel4" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("Specific Employee Expense Entry Approvals") %>'
            DataKeyNames="AccountEmployeeExpenseSheetId,ApprovalPathSequence" DataSourceID="ApprovalEntriesForSpecificEmployeeObject"
            SkinID="xgridviewSkinEmployee" Width="98%">
            <Columns>
                      <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
            <edititemtemplate>
</edititemtemplate>
                          <headertemplate>
<asp:LinkButton id="LinkButton9" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes,resizable=yes'); return false;" runat="server" Text='<%# Bind("EmployeeName") %>' __designer:wfdid="w34"></asp:HyperLink> 
</itemtemplate>
            <headerstyle horizontalalign="Center" />
            <itemstyle horizontalalign="Left" width="35%" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w37"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton10" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' CommandArgument="Description" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w36"></asp:Label>
</itemtemplate>
                    <itemstyle width="35%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="ExpenseSheetDate">
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ExpenseSheetDate") %>' __designer:wfdid="w40"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton11" runat="server" Text='<%# ResourceHelper.GetFromResource("Date") %>' CommandArgument="ExpenseSheetDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("ExpenseSheetDate", "{0:d}") %>' __designer:wfdid="w39"></asp:Label>
</itemtemplate>
                    <itemstyle horizontalalign="Center" width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Amount %>" SortExpression="Amount">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("Amount") %>' __designer:wfdid="w44"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:Label id="lblAmount3" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount") %>' __designer:wfdid="w45"></asp:Label>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("BaseCurrencyCode") %>' __designer:wfdid="w42"></asp:Label> <asp:Label id="Label2" runat="server" Text='<%# Bind("Amount", "{0:N}") %>' __designer:wfdid="w43"></asp:Label> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" width="8%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
                    <ItemTemplate>
<asp:RadioButton id="chkSpecificEmployee" runat="server" __designer:wfdid="w46" GroupName="SpecificEmployee"></asp:RadioButton> 
</ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
                    <EditItemTemplate>
&nbsp; 
</EditItemTemplate>
                    <ItemTemplate>
<asp:RadioButton id="chkSpecificEmployeeRejected" runat="server" __designer:wfdid="w47" GroupName="SpecificEmployee"></asp:RadioButton> 
</ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
                    <EditItemTemplate>
&nbsp; 
</EditItemTemplate>
                    <ItemTemplate>
<asp:TextBox id="SpecificEmployeeCommentsTextBox" runat="server" Width="100%" __designer:wfdid="w48" TextMode="MultiLine"></asp:TextBox> 
</ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                </asp:TemplateField>
                <asp:BoundField DataField="AccountExpenseEntryId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    ReadOnly="True" SortExpression="AccountExpenseEntryId" Visible="False" />
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllSpecificEmployee" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates3(true);" Visible="False">
            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>&nbsp;<asp:LinkButton
                ID="UnCheckAllSpecificEmployee" runat="server" CssClass="FeatureHeadingIcon"
                OnClientClick="ChangeAllCheckBoxStates3(false);" Visible="False">
                <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel5" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("Specific External Expense Entry Approvals") %>'
            DataKeyNames="AccountEmployeeExpenseSheetId,ApprovalPathSequence" DataSourceID="dsApprovalEntriesForSpeicifExternalUserObject"
            SkinID="xgridviewSkinEmployee" Width="98%">
            <Columns>
                    <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
            <edititemtemplate>
</edititemtemplate>
                        <headertemplate>
<asp:LinkButton id="LinkButton12" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes,resizable=yes'); return false;" runat="server" Text='<%# Bind("EmployeeName") %>' __designer:wfdid="w49"></asp:HyperLink> 
</itemtemplate>
            <headerstyle horizontalalign="Center" />
            <itemstyle horizontalalign="Left" width="35%" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w52"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton13" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' CommandArgument="Description" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w51"></asp:Label>
</itemtemplate>
                    <itemstyle width="35%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="ExpenseSheetDate">
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ExpenseSheetDate") %>' __designer:wfdid="w55"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton14" runat="server" Text='<%# ResourceHelper.GetFromResource("Date") %>' CommandArgument="ExpenseSheetDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("ExpenseSheetDate", "{0:d}") %>' __designer:wfdid="w54"></asp:Label>
</itemtemplate>
                    <itemstyle horizontalalign="Center" width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Amount %>" SortExpression="Amount">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("Amount") %>' __designer:wfdid="w59"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:Label id="lblAmount4" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount") %>' __designer:wfdid="w60"></asp:Label>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("BaseCurrencyCode") %>' __designer:wfdid="w57"></asp:Label> <asp:Label id="Label2" runat="server" Text='<%# Bind("Amount", "{0:N}") %>' __designer:wfdid="w58"></asp:Label> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle width="8%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
                    <ItemTemplate>
<asp:RadioButton id="chkSpecificExternalUser" runat="server" GroupName="SpecificExternalUser" __designer:wfdid="w2" ></asp:RadioButton> 
</ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
                    <ItemTemplate>
<asp:RadioButton id="chkSpecificExternalUserRejected" runat="server" GroupName="SpecificExternalUser" __designer:wfdid="w1"></asp:RadioButton> 
</ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
                    <ItemTemplate>
                        <asp:TextBox ID="SpecificExternalUserCommentsTextBox" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    
</ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Width="15%" />
                </asp:TemplateField>
                <asp:BoundField DataField="AccountExpenseEntryId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    ReadOnly="True" SortExpression="AccountExpenseEntryId" Visible="False" />
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllSpecificExternalUser" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates4(true);" Visible="False">
            <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>&nbsp;<asp:LinkButton
                ID="UnCheckAllSpecificExternalUser" runat="server" CssClass="FeatureHeadingIcon"
                OnClientClick="ChangeAllCheckBoxStates4(false);" Visible="False">
                <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel6" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("Employee Manager Expense Entry Approvals") %>'
            DataKeyNames="AccountEmployeeExpenseSheetId,ApprovalPathSequence" DataSourceID="dsApprovalEntriesForEmployeeManagerObject"
            SkinID="xgridviewSkinEmployee" Width="98%">
            <Columns>
                    <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
            <edititemtemplate>
</edititemtemplate>
                        <headertemplate>
<asp:LinkButton id="LinkButton15" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes,resizable=yes'); return false;" runat="server" Text='<%# Bind("EmployeeName") %>' __designer:wfdid="w61"></asp:HyperLink> 
</itemtemplate>
            <headerstyle horizontalalign="Center" />
            <itemstyle horizontalalign="Left" width="35%" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w64"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton16" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' CommandArgument="Description" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w63"></asp:Label>
</itemtemplate>
                    <itemstyle width="35%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" SortExpression="ExpenseSheetDate">
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ExpenseSheetDate") %>' __designer:wfdid="w67"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton17" runat="server" Text='<%# ResourceHelper.GetFromResource("Date") %>' CommandArgument="ExpenseSheetDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("ExpenseSheetDate", "{0:d}") %>' __designer:wfdid="w66"></asp:Label>
</itemtemplate>
                    <itemstyle horizontalalign="Center" width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Amount %>" SortExpression="Amount">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("Amount") %>' __designer:wfdid="w71"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:Label id="lblAmount5" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount") %>' __designer:wfdid="w72"></asp:Label>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("BaseCurrencyCode") %>' __designer:wfdid="w69"></asp:Label> <asp:Label id="Label2" runat="server" Text='<%# Bind("Amount", "{0:N}") %>' __designer:wfdid="w70"></asp:Label> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle width="8%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
                    <itemtemplate>
<asp:RadioButton id="chkEmployeeManager" runat="server" __designer:wfdid="w9" GroupName="EmployeeManager" ></asp:RadioButton> 
</itemtemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
                    <itemtemplate>
<asp:RadioButton id="chkEmployeeManagerRejected" runat="server" __designer:wfdid="w10" GroupName="EmployeeManager"></asp:RadioButton> 
</itemtemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
                    <itemtemplate>
<asp:TextBox id="EmployeeManagerCommentsTextBox" runat="server" Width="100%" TextMode="MultiLine" __designer:wfdid="w5"></asp:TextBox> 
</itemtemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle Width="15%" />
                </asp:TemplateField>
                <asp:BoundField DataField="AccountExpenseEntryId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    ReadOnly="True" SortExpression="AccountExpenseEntryId" Visible="False" />
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllEmployeeManager" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates5(true);" Visible="False">
            <asp:Literal ID="Literal87" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>&nbsp;<asp:LinkButton
                ID="UnCheckAllEmployeeManager" runat="server" CssClass="FeatureHeadingIcon" OnClientClick="ChangeAllCheckBoxStates5(false);"
                Visible="False">
                <asp:Literal ID="Literal88" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton>
    </ContentTemplate>
</asp:UpdatePanel>
