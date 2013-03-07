<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlAccountExpenseSheetList, App_Web_uitpp31g" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<table width="98%" class="xFormView">
    <tr>
        <td colspan="2" class="caption">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Expense Sheet%> " /></td>
    </tr>
    <tr>
        <td colspan="2" class="FormViewSubHeader">
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Search Parameter%> " /></td>
    </tr>
    <tr>
        <td align="right" class="HighlightedTextMedium" style="width: 20%">
            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Name:%> " /></td>
        <td style="width: 78%">
            <asp:DropDownList ID="ddlEmployeeName" runat="server" Width="300px" OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td style="width: 20%" class="HighlightedTextMedium" align="right">
            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Approval Status:%> " /></td>
        <td style="width: 78%">
            <asp:DropDownList ID="ddlExpenseSheet" runat="server" Width="300px">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td class="HighlightedTextMedium" style="width: 20%" align="right">
            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Include Date Range:%> " /></td>
        <td style="width: 78%">
            <asp:CheckBox ID="chkIncludeDateRange" runat="server" /></td>
    </tr>
    <tr>
        <td class="HighlightedTextMedium" style="width: 20%" align="right">
            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Start Date:%> " /></td>
        <td style="width: 78%">
         <ew:CalendarPopup ID="StartDateTextBox" runat="server" SkinId="DatePicker"
            Width="100px"></ew:CalendarPopup>
        </td>
    </tr>
    <tr>
        <td class="HighlightedTextMedium" style="width: 20%" align="right">
            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, End Date:%> " /></td>
        <td style="width: 78%"><ew:CalendarPopup ID="EndDateTextBox" runat="server" SkinId="DatePicker"
                Width="100px" >
        </ew:CalendarPopup>
            <asp:Button ID="btnShow" runat="server" Text="<%$ Resources:TimeLive.Web, Show_text%> " OnClick="btnShow_Click" /></td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:Button ID="btnAdd" runat="server" Text="<%$ Resources:TimeLive.Web, Add New Expense Sheet %>" /></td>
    </tr>
    <tr>
        <td align="right"  colspan="2">
</td>
    </tr>
</table>
    </ContentTemplate>
</asp:UpdatePanel>
        <asp:ObjectDataSource ID="dsEmployeeExpenseSheetGridViewObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountEmployeeExpenseSheetByAccountEmployeeIdAndApprovalStatus" TypeName="AccountEmployeeExpenseSheetBLL" InsertMethod="AddAccountEmployeeExpenseSheet" UpdateMethod="UpdateAccountEmployeeExpenseSheet">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlEmployeeName" Name="AccountEmployeeId" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlExpenseSheet" Name="ExpenseSheetStatusId" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" Name="IncludeDateRange" PropertyName="Checked"
                    Type="Boolean" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ExpenseSheetDate" Type="DateTime" />
                <asp:Parameter Name="Original_AccountEmployeeExpenseSheetId" Type="Object" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ExpenseSheetDate" Type="DateTime" />
                <asp:Parameter Name="Approved" Type="Boolean" />
                <asp:Parameter Name="Rejected" Type="Boolean" />
                <asp:Parameter Name="Submitted" Type="Boolean" />
                <asp:Parameter Name="InApproval" Type="Boolean" />
                <asp:Parameter Name="SubmittedDate" Type="DateTime" />
            </InsertParameters>
        </asp:ObjectDataSource>
  

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Expense Sheet List %>"
            DataSourceID="dsEmployeeExpenseSheetGridViewObject"  SkinID="xgridviewSkinEmployee" Width="98%" DataKeyNames="AccountEmployeeExpenseSheetId">
            <Columns>
                <asp:TemplateField SortExpression="ExpenseSheetDate">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("ExpenseSheetDate") %>' __designer:wfdid="w57"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Date") %>' CommandArgument="ExpenseSheetDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("ExpenseSheetDate", "{0:d}") %>' __designer:wfdid="w56"></asp:Label>
</itemtemplate>
                    <itemstyle width="10%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Description">
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w60"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' CommandArgument="Description" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w59"></asp:Label>
</itemtemplate>
                    <itemstyle width="60%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Total Amount %>" SortExpression="Amount">
                    <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Amount") %>' __designer:wfdid="w64"></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount") %>' CommandArgument="Amount" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="lblCurrency" runat="server" Text='<%# Bind("CurrencyCode") %>' __designer:wfdid="w62"></asp:Label> <asp:Label id="lblAmount" runat="server" Text='<%# Bind("Amount", "{0:N}") %>' __designer:wfdid="w63"></asp:Label> 
</itemtemplate>
                    <itemstyle width="10%" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Status">
                    <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("Status") %>' __designer:wfdid="w67"></asp:TextBox>
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Status") %>' CommandArgument="Status" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("Status") %>' __designer:wfdid="w66"></asp:Label>
</itemtemplate>
                    <itemstyle width="10%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>">
                    <itemtemplate>
<asp:HyperLink id="EditHyperLink" runat="server" Visible='<%# IIF(IsDbNull(Eval("AccountEmployeeExpenseSheetId")),"False","True") %>' NavigateUrl='<%# Eval("AccountEmployeeExpenseSheetId", "~/Employee/AccountExpenseEntryForm.aspx?AccountEmployeeExpenseSheetId={0}") %>' __designer:wfdid="w43">[EditHyperLink]</asp:HyperLink> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle cssclass="edit_button" horizontalalign="Center" verticalalign="Middle"
                        width="5%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
                    <itemtemplate>
<asp:LinkButton id="lnkDelete" runat="server" Text="<%$ Resources:TimeLive.Web, Delete_text %>" Visible='<%# IIF(IsDbNull(Eval("AccountEmployeeExpenseSheetId")),"False","True") %>' ToolTip="<%$ Resources:TimeLive.Web, Delete_text %>" CommandName="Delete" CausesValidation="False" OnClientClick="<%# ResourceHelper.GetDeleteMessageJavascript() %>" __designer:wfdid="w42"></asp:LinkButton> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" verticalalign="Middle" />
                    <itemstyle horizontalalign="Center" verticalalign="Middle" width="5%" cssclass="delete_button" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <itemtemplate>
<asp:HyperLink id="CopyHyperLink" runat="server" Text="<%$ Resources:TimeLive.Web, Copy%> " Visible='<%# IIF(IsDbnull(Eval("AccountEmployeeExpenseSheetId")),"False","True") %>' NavigateUrl='<%# Eval("AccountEmployeeExpenseSheetId", "~/Employee/AccountExpenseEntryForm.aspx?AccountEmployeeExpenseSheetId={0}&IsCopy=True") %>' __designer:wfdid="w4"></asp:HyperLink> 
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <itemtemplate>
<asp:HyperLink id="AuditHyperLink" runat="server"  Text="<%$ Resources:TimeLive.Web, Audit%> " Visible='<%# IIF(IsDbnull(Eval("AccountEmployeeExpenseSheetId")),"False","True") %>' NavigateUrl='<%# Eval("AccountEmployeeExpenseSheetId", "~/Employee/AccountExpenseEntryAudit.aspx?AccountEmployeeExpenseSheetId={0}") %>' __designer:wfdid="w4"></asp:HyperLink>
</itemtemplate>
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        &nbsp;
    </ContentTemplate>
</asp:UpdatePanel>
