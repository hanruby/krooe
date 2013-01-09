<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlExpenseEntryArchive, App_Web_yhen42r4" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table  style="width: 550px" class="xFormView">
            <tr>
                <td class="caption" colspan="2">
                    <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Expense Entry Archive%> " /></td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="height: 21px">
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Search Parameters%> " /></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 40%">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Employees%> " />:</td>
                <td align="left" style="width: 60%">
                    &nbsp;<asp:DropDownList ID="ddlEmployees" runat="server" AppendDataBoundItems="True"
                        DataTextField="EmployeeNameWithCodeWithDisabled" DataValueField="AccountEmployeeId"
                        Width="80%" DataSourceID="dsEmployeesObject">
                        <asp:ListItem Selected="True" Value="0" Label ID="Label15" runat="server" Text="<%$ Resources:TimeLive.Web, All%> "></asp:ListItem>
                    </asp:DropDownList>&nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 40%">
                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, Approved%> " />:</td>
                <td align="left" style="width: 60%">
                    &nbsp;<asp:DropDownList ID="ddlApproved" runat="server" AppendDataBoundItems="True">
                        <%--<asp:ListItem Value="1">Approved</asp:ListItem>--%>
                        <asp:ListItem Value="1" Label ID="Label4" runat="server" Text="<%$ Resources:TimeLive.Web, Approved%> "></asp:ListItem>
                        <%--<asp:ListItem Value="0">Not Approved</asp:ListItem>--%>
                        <asp:ListItem Value="0" Label ID="Label5" runat="server" Text="<%$ Resources:TimeLive.Web, Not Approved%> "></asp:ListItem>
                        <%--<asp:ListItem Selected="True" Value="-1">Both</asp:ListItem>--%>
                        <asp:ListItem Selected="True" Value="-1" Label ID="Label6" runat="server" Text="<%$ Resources:TimeLive.Web, Both%> "></asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 40%">
                    <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:TimeLive.Web, Include Date Range%> " />:</td>
                <td align="left" style="width: 60%">
                    <asp:CheckBox ID="chkIncludeDateRange" runat="server" /></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 40%">
                    <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:TimeLive.Web, Start Date%> " />:</td>
                <td align="left" style="width: 60%">
                    &nbsp;<ew:calendarpopup id="StartDate" runat="server" SkinId="DatePicker"></ew:calendarpopup></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 40%">
                    <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:TimeLive.Web, End Date%> " />:</td>
                <td align="left" style="width: 60%">
                    &nbsp;<ew:calendarpopup id="EndDate" runat="server" SkinId="DatePicker"></ew:calendarpopup></td>
            </tr>
            <tr>
                <td align="right" class="formviewlabelcell" style="width: 40%; height: 26px">
                </td>
                <td align="left" style="width: 60%; height: 26px">
                    &nbsp;<asp:Button ID="Show" runat="server" OnClick="Show_Click" Text="<%$ Resources:TimeLive.Web, Show_text%> " Width="68px" /></td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsClientsObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountPartiesByAccountId" TypeName="AccountPartyBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="99" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsEmployeesObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountEmployeesViewByAccountIdWithDisabled" TypeName="AccountEmployeeBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsProjectsObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountProjectsForGridView" TypeName="AccountProjectBLL" DeleteMethod="DeleteAccountProject" InsertMethod="AddAccountProject" UpdateMethod="UpdateProjectDescription">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:Parameter DefaultValue="False" Name="IsTemplate" Type="Boolean" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProjectDescription" Type="String" />
                <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
            </UpdateParameters>
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
                <asp:Parameter Name="DeadLine" Type="DateTime" />
                <asp:Parameter Name="ProjectStatusId" Type="Int32" />
                <asp:Parameter Name="LeaderEmployeeId" Type="Int32" />
                <asp:Parameter Name="ProjectManagerEmployeeId" Type="Int32" />
                <asp:Parameter Name="TimeSheetApprovalTypeId" Type="Int32" />
                <asp:Parameter Name="ExpenseApprovalTypeId" Type="Int32" />
                <asp:Parameter Name="EstimatedDuration" Type="Int32" />
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
            </InsertParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountEmployeeExpenseSheetId"
            DataSourceID="dsUpdateExpenseEntryArchive" SkinID="xgridviewSkinEmployee" Caption="<%$ Resources:TimeLive.Web, Expense Entry Archive %>" Width="98%">
            <Columns>
                <asp:TemplateField>
                    <itemtemplate>
<asp:CheckBox id="chkDelete" runat="server" __designer:wfdid="w3"></asp:CheckBox> 
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
                    <itemstyle width="30%" />
                    <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=800,height=400,left=300,top=300,scrollbars=yes'); return false;" runat="server" Text='<%# Bind("EmployeeName") %>' NavigateUrl='<%# Eval("AccountEmployeeExpenseSheetId", "~/Employee/AccountExpenseEntryReadOnly.aspx?AccountEmployeeExpenseSheetId={0}&IsFromArchive=True") %>'  __designer:wfdid="w6"></asp:HyperLink>
</itemtemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ExpenseSheetDate" DataFormatString="{0:d}" HeaderText="<%$ Resources:TimeLive.Web, Date %>"
                    HtmlEncode="False" SortExpression="ExpenseSheetDate" ReadOnly="True">
                    <itemstyle horizontalalign="Center" width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="<%$ Resources:TimeLive.Web, Description %>" ReadOnly="True"
                    SortExpression="Description" >
                    <itemstyle horizontalalign="Left" width="30%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Amount %>" SortExpression="Amount">
                    <EditItemTemplate>
<asp:Label id="Label2" runat="server" Text='<%# Eval("CurrencyCode") %>' __designer:wfdid="w3"></asp:Label> <asp:Label id="Label1" runat="server" Text='<%# Eval("Amount", "{0:N}") %>' __designer:wfdid="w4"></asp:Label> 
</EditItemTemplate>
                    <ItemStyle HorizontalAlign="Right" width="10%" />
                    <ItemTemplate>
<asp:Label id="Label2" runat="server" Text='<%# Eval("CurrencyCode") %>' __designer:wfdid="w1"></asp:Label> <asp:Label id="Label1" runat="server" Text='<%# Eval("Amount", "{0:N}") %>' __designer:wfdid="w2"></asp:Label> 
</ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="Submitted" HeaderText="<%$ Resources:TimeLive.Web, Submitted %>" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="Approved" HeaderText="<%$ Resources:TimeLive.Web, Approved %>"  >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CheckBoxField>
                <asp:CommandField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>" ShowEditButton="True" EditImageUrl="~/Images/edit.gif" >
                </asp:CommandField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
                <itemstyle cssclass="delete_button" />
                    <ItemTemplate>
<asp:LinkButton id="LinkButton1" runat="server" Text="<%$ Resources:TimeLive.Web, Delete_text %>" CausesValidation="False" CommandName="Delete" OnClientClick="<%# ResourceHelper.GetDeleteMessageJavascript()%>" __designer:wfdid="w10"></asp:LinkButton> 
</ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <div style="text-align: right">
            <table style="width: 100%">
                <tr>
                    <td align="left" style="width: 256px">
        <asp:LinkButton ID="CheckAll" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates1(true);" Visible="False" OnClick="CheckAll_Click">
            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All %>"></asp:Literal></asp:LinkButton>
                        <asp:LinkButton
                ID="UnCheckAll" runat="server" CssClass="FeatureHeadingIcon" OnClientClick="ChangeAllCheckBoxStates1(false);"
                Visible="False" OnClick="UnCheckAll_Click">
                <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All %>"></asp:Literal></asp:LinkButton></td>
                    <td align="right">
                        <asp:Button ID="btnDeleteSelectedItem" runat="server" Text="<%$ Resources:TimeLive.Web, Delete Selected Item%>"
            Width="138px" OnClick="btnDeleteSelectedItem_Click" Visible="False" /></td>
                </tr>
            </table>
        </div>
        <asp:ObjectDataSource ID="dsUpdateExpenseEntryArchive" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataForExpenseEntryArchiveByExpenseSheet" TypeName="AccountExpenseEntryBLL"
            UpdateMethod="UpdateExpenseEntryArchive" >
            <UpdateParameters>
                <asp:Parameter Name="Original_AccountEmployeeExpenseSheetId" Type="Object" />
                <asp:Parameter Name="Approved" Type="Boolean" />
                <asp:Parameter Name="Submitted" Type="Boolean" />
                <asp:Parameter Name="EmployeeName" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:ControlParameter ControlID="ddlEmployees" DefaultValue="" Name="AccountEmployees"
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" Name="IncludeDateRange" PropertyName="Checked"
                    Type="Boolean" />
                <asp:Parameter Name="AccountExpenseEntryStartDate" Type="DateTime" DefaultValue="11/02/2008" />
                <asp:Parameter Name="AccountExpenseEntryEndDate" Type="DateTime" DefaultValue="11/02/2008" />
                <asp:ControlParameter ControlID="ddlApproved" DefaultValue="" Name="Approval" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
