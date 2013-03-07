<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlAccountExpenseEntryList, App_Web_cfwk0kvw" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Src="ctlStatusLegend.ascx" TagName="ctlStatusLegend" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24D65337282035F2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
    <%@ Register Src="ctlAccountEmployeeExpenseSheetApprovalDetailReadOnly.ascx" TagName="ctlAccountEmployeeExpenseSheetApprovalDetailReadOnly"
    TagPrefix="uc2" %>
<style type="text/css">
    .style1
    {
        width: 98%;
    }
</style>
<script type = "text/javascript" language='JavaScript'>

</script>
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
            <table class="xFormView" width="98%">
    <tr>
        <td class="HighlightedTextMedium" style="width: 20%" align="left" 
            valign="middle">
            <asp:Literal ID="Literal26" runat="server" Text="<%$ Resources:TimeLive.Web, Expense Sheet Status%> " />
        </td>
               <td class="HighlightedTextMedium" colspan="1" style="width: 78%" align="left" valign="middle">
            <asp:Image ID="imgES" runat="server" ImageAlign="Middle" ImageUrl="~/Images/clearpixel.gif"
                Width="10px" />&nbsp; &nbsp;<asp:Label ID="lblExpenseStatus" runat="server" Text="Label" Width="200px"></asp:Label></td>
    </tr>
</table>
        <table width="98%" class="xFormView">
            <tr>
                <td align="left" class="HighlightedTextMedium">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Name:%> " /></td>
                <td align="left" class="HighlightedTextMedium">
                    <asp:DropDownList ID="ddlEmployeeName" runat="server" Width="290px" AutoPostBack="True" OnSelectedIndexChanged="ddlEmployeeName_SelectedIndexChanged">
                    </asp:DropDownList></td>
                <td align="right" class="HighlightedTextMedium">
                </td>
            </tr>
            <tr>
                <td align="left"  class="HighlightedTextMedium">
                                        
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="DescriptionTextBox">
                                        <asp:Literal ID="Literal24" runat="server" Text="<%$ Resources:TimeLive.Web, Description: %> " /></asp:Label></td><td align="left" class="HighlightedTextMedium">
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Width="300px"></asp:TextBox></td><td align="right"  class="HighlightedTextMedium">
                    <asp:Literal ID="Literal111" runat="server" Text="<%$ Resources:TimeLive.Web, Reimbursement Currency:%> " />&nbsp;
                    &nbsp;<asp:DropDownList ID="ddlReimbursementCurrency" runat="server" AutoPostBack="True"
                        DataSourceID="dsReimbursementCurrencyObject" DataTextField="CurrencyCode" DataValueField="AccountCurrencyId"
                        OnSelectedIndexChanged="ddlReimbursementCurrency_SelectedIndexChanged" Width="90px" >
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="left"  class="HighlightedTextMedium">
                                        <asp:Literal ID="Literal25" runat="server" Text="<%$ Resources:TimeLive.Web, Date:%> " /></td><td align="left" class="HighlightedTextMedium">
                    <ew:CalendarPopup ID="ExpenseSheetDate" runat="server" SkinId="DatePicker" 
                Width="100px">
                                        </ew:CalendarPopup>
                                        <asp:Button ID="btnMasterUpdate" runat="server" 
                        OnClick="btnMasterUpdate_Click" Text="<%$ Resources:TimeLive.Web, Update%> " />
                                        </td>
                <td align="right"  class="HighlightedTextMedium">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Total Reimbursement%> " />&nbsp;
                    &nbsp; <asp:TextBox Width="80px" ID="txtTotalReimbursement" runat="server" ReadOnly="True" /></td>
            </tr>
            
        </table>
        <br />

            <div class="xFormView" style="width:500px;">
                        <asp:Table ID="CustomTable" runat="server" Height="100%" Width="100%">
                        </asp:Table>
                        </div>
            <br />
            


        <asp:ObjectDataSource ID="dsExpenseSheetObject" runat="server" InsertMethod="AddAccountEmployeeExpenseSheet"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountEmployeeExpenseSheetByAccountEmployeeExpenseSheetId"
            TypeName="AccountEmployeeExpenseSheetBLL" 
                UpdateMethod="UpdateAccountEmployeeExpenseSheet" 
                DataObjectTypeName="System.Guid" 
                DeleteMethod="DeleteAccountEmployeeExpenseSheet">
            <UpdateParameters>
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="ExpenseSheetDate" Type="DateTime" />
                <asp:Parameter Name="Original_AccountEmployeeExpenseSheetId" DbType="Guid" />
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
                <asp:Parameter Name="AccountEmployeeExpenseSheetId" DbType="Guid" />
            </SelectParameters>
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
        <asp:ObjectDataSource ID="dsAccountReimbursementCurrencyFormViewObject" OldValuesParameterFormatString="original_{0}" runat="server" SelectMethod="GetPreferencesByAccountId" TypeName="AccountBLL" >
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsReimbursementCurrencyObject" OldValuesParameterFormatString="original_{0}" runat="server" SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL" >
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountExpenseEntryId"
            DataSourceID="dsAccountExpenseEntryObject" AllowSorting="True" SkinID="xgridviewSkinEmployee" Caption='<%# ResourceHelper.GetFromResource("Expense Entry List") %>' ShowFooter="True" Width="98%">
            <Columns>
                <asp:BoundField DataField="AccountExpenseEntryId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    ReadOnly="True" >
                    <ItemStyle HorizontalAlign="Center" Width="4%" />
                </asp:BoundField>
                <asp:TemplateField>
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("AccountExpenseEntryDate") %>' __designer:wfdid="w40"></asp:TextBox></edititemtemplate><headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Date") %>' CommandArgument="AccountExpenseEntryDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton></headertemplate><itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("AccountExpenseEntryDate", "{0:d}") %>' __designer:wfdid="w39"></asp:Label></itemtemplate><itemstyle width="10%" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ProjectName") %>' __designer:wfdid="w43"></asp:TextBox></edititemtemplate><headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' CommandArgument="ProjectName" CommandName="Sort" CausesValidation="False"></asp:LinkButton></headertemplate><itemtemplate>
<asp:Label id="Label4" runat="server" Text='<%# Bind("ProjectName") %>' __designer:wfdid="w42"></asp:Label></itemtemplate><itemstyle width="17%" />
                  </asp:TemplateField>
                <asp:TemplateField HeaderText="Task Name">
                    <edititemtemplate>
<asp:TextBox id="TextBox6" runat="server" Text='<%# Bind("TaskName") %>' __designer:wfdid="w6"></asp:TextBox></edititemtemplate><itemtemplate>
<asp:Label id="Label7" runat="server" Text='<%# Bind("TaskName") %>' __designer:wfdid="w1"></asp:Label></itemtemplate><itemstyle width="13%" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("AccountExpenseName") %>' __designer:wfdid="w46"></asp:TextBox></edititemtemplate><headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Name") %>' CommandArgument="AccountExpenseName" CommandName="Sort" CausesValidation="False"></asp:LinkButton></headertemplate><itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("AccountExpenseName") %>' __designer:wfdid="w45"></asp:Label></itemtemplate><itemstyle width="15%" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <edititemtemplate>
<asp:TextBox id="TextBox5" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w49"></asp:TextBox></edititemtemplate><headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' CommandArgument="Description" CommandName="Sort" CausesValidation="False"></asp:LinkButton></headertemplate><itemtemplate>
<asp:Label id="Label6" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w48"></asp:Label></itemtemplate><itemstyle width="21%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Amount %>">
                    <EditItemTemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Amount") %>' __designer:wfdid="w53"></asp:TextBox></EditItemTemplate><headertemplate>
<asp:Label id="lblNetAmount" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount") %>' __designer:wfdid="w54"></asp:Label></headertemplate><ItemTemplate>
<asp:Label id="Label2" runat="server" Text='<%# Eval("CurrencyCode") %>' __designer:wfdid="w51"></asp:Label><asp:Label id="Label1" runat="server" Text='<%# Bind("Amount", "{0:N}") %>' __designer:wfdid="w52"></asp:Label></ItemTemplate><ItemStyle HorizontalAlign="Right" Width="13%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select"
                            Text="Edit"></asp:LinkButton></ItemTemplate><ItemStyle HorizontalAlign="Center" Width="3%" cssclass="edit_button" />
                </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
     <ItemTemplate>
 
       <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                    OnClientClick='<%# ResourceHelper.GetDeleteMessageJavascript()%>'
                    Text="Delete" />
     
</ItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="3%" cssclass="delete_button" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Attachment %>">
                    <ItemTemplate>
<asp:HyperLink id="HyperLink1" runat="server" __designer:wfdid="w46" onclick="window.open (this.href, 'popupwindow', 'width=800,height=400,left=300,top=300,scrollbars=yes'); return false;" NavigateUrl='<%# "~/AccountAdmin/AccountAttachmentsPopUp.aspx?AccountExpenseEntryId=" & DataBinder.Eval(Container.DataItem,"AccountExpenseEntryId") & "&AccountEmployeeExpenseSheetId=" & DataBinder.Eval(Container.DataItem,"AccountEmployeeExpenseSheetId").tostring() & "&AccountAttachmentTypeId=1"%>' ><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Attachment%> " /></asp:HyperLink></ItemTemplate><ItemStyle HorizontalAlign="Left" Width="5%" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" Visible="False">
                    <itemtemplate>
<asp:Image id="imgStatus" runat="server" Width="10px" ImageAlign="AbsMiddle" __designer:wfdid="w37" Visible="False"></asp:Image><BR /><asp:Panel style="DISPLAY: none" id="P0" title="Description" runat="server" __designer:wfdid="w38" CssClass="innerPopup"><asp:Label id="lblStatus" runat="server" Width="100%" __designer:wfdid="w39" Font-Size="X-Small" ForeColor="White" align="left"></asp:Label><asp:TextBox id="DS0" runat="server" Width="350px" __designer:wfdid="w40" Font-Size="X-Small" TextMode="MultiLine" Height="100px" Font-Bold="False" MaxLength="500" ReadOnly="True"></asp:TextBox><BR /><asp:Label id="lblStatusNote" runat="server" Width="100%" __designer:wfdid="w41" Font-Size="X-Small" ForeColor="White" align="left"></asp:Label></asp:Panel><cc2:PopupControlExtender id="PopupControlExtender1" runat="server" __designer:wfdid="w42" OffsetX="-350" PopupControlID="P0" TargetControlID="imgStatus"></cc2:PopupControlExtender> 
</itemtemplate>
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <table style="width: 98%">
            <tr>
                <td align="right" style="width: 98%">
                    <asp:Button ID="btnPrint" runat="server" Text="<%$ Resources:TimeLive.Web, Print %>" Width="100px" />
                    <asp:Button ID="btnSubmit" runat="server" Width="100px" OnClick="btnSubmit_Click" Text="<%$ Resources:TimeLive.Web, Submit_text%> " ToolTip="<%$ Resources:TimeLive.Web, Submit for Approval%> " /></td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsAccountExpenseEntryObject" runat="server" 
            DeleteMethod="DeleteAccountExpenseEntry" OldValuesParameterFormatString="original_{0}"
            
            SelectMethod="GetvueAccountExpenseEntryWithLastStausByEmployeeExpenseSheetId" 
            TypeName="AccountExpenseEntryBLL"><DeleteParameters>
                <asp:Parameter Name="Original_AccountExpenseEntryId" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter DbType="Guid" DefaultValue="" 
                    Name="AccountEmployeeExpenseSheetId" 
                    QueryStringField="AccountEmployeeExpenseSheetId" /></SelectParameters>
            </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountExpenseEntryFormObject" runat="server" DeleteMethod="DeleteAccountExpenseEntry"
            InsertMethod="AddAccountExpenseEntry" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountExpenseEntriesByAccountExpenseEntryId" TypeName="AccountExpenseEntryBLL"
            UpdateMethod="UpdateAccountExpenseEntry" >
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountExpenseEntryId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountExpenseEntryDate" Type="DateTime" />
                <asp:Parameter Name="Original_AccountExpenseEntryId" Type="Int32" />
                <asp:Parameter DefaultValue="" Name="AccountEmployeeId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
                <asp:Parameter Name="AccountExpenseId" Type="Int32" />
                <asp:Parameter Name="Amount" Type="Double" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="IsBillable" Type="Boolean" />
                <asp:Parameter Name="Reimburse" Type="Boolean" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Double" />
                <asp:Parameter Name="Rate" Type="Double" />
                <asp:Parameter Name="AmountBeforeTax" Type="Double" />
                <asp:Parameter Name="TaxAmount" Type="Double" />
                <asp:Parameter Name="AccountPaymentMethodId" Type="Int32" />
                <asp:Parameter Name="AccountTaxZoneId" Type="Int32" />
                <asp:Parameter Name="Rejected" Type="Boolean" />
                <asp:Parameter Name="Submitted" Type="Boolean" />
                <asp:Parameter 
                    Name="AccountEmployeeExpenseSheetId" DbType="Guid" /><asp:Parameter 
                    Name="CustomField1" Type="String" /><asp:Parameter Name="CustomField2" 
                    Type="String" /><asp:Parameter Name="CustomField3" Type="String" /><asp:Parameter 
                    Name="CustomField4" Type="String" /><asp:Parameter Name="CustomField5" 
                    Type="String" /><asp:Parameter Name="CustomField6" Type="String" /><asp:Parameter 
                    Name="CustomField7" Type="String" /><asp:Parameter Name="CustomField8" 
                    Type="String" /><asp:Parameter Name="CustomField9" Type="String" /><asp:Parameter 
                    Name="CustomField10" Type="String" /><asp:Parameter Name="CustomField11" 
                    Type="String" /><asp:Parameter Name="CustomField12" Type="String" /><asp:Parameter 
                    Name="CustomField13" Type="String" /><asp:Parameter Name="CustomField14" 
                    Type="String" /><asp:Parameter Name="CustomField15" Type="String" /></UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="AccountExpenseEntryId" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountExpenseEntryDate" Type="DateTime" />
                <asp:Parameter DefaultValue="" Name="AccountEmployeeId" Type="Int32" />
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
                <asp:Parameter Name="AccountExpenseId" Type="Int32" />
                <asp:Parameter Name="Amount" Type="Double" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="IsBillable" Type="Boolean" />
                <asp:Parameter Name="Reimburse" Type="Boolean" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Double" />
                <asp:Parameter Name="Rate" Type="Double" />
                <asp:Parameter Name="AmountBeforeTax" Type="Double" />
                <asp:Parameter Name="TaxAmount" Type="Double" />
                <asp:Parameter Name="AccountPaymentMethodId" Type="Int32" />
                <asp:Parameter Name="ExchangeRate" Type="Double" />
                <asp:Parameter Name="AccountTaxZoneId" Type="Int32" />
                <asp:Parameter Name="Submitted" Type="Boolean" />
                <asp:Parameter 
                    Name="AccountEmployeeExpenseSheetId" DbType="Guid" /><asp:Parameter Name="Approved" Type="Boolean" />
                <asp:Parameter Name="Rejected" Type="Boolean" />
                <asp:Parameter Name="IsFromImportClass" Type="Boolean" />
            <asp:Parameter 
                    Name="CustomField1" Type="String" /><asp:Parameter Name="CustomField2" 
                    Type="String" /><asp:Parameter Name="CustomField3" Type="String" /><asp:Parameter 
                    Name="CustomField4" Type="String" /><asp:Parameter Name="CustomField5" 
                    Type="String" /><asp:Parameter Name="CustomField6" Type="String" /><asp:Parameter 
                    Name="CustomField7" Type="String" /><asp:Parameter Name="CustomField8" 
                    Type="String" /><asp:Parameter Name="CustomField9" Type="String" /><asp:Parameter 
                    Name="CustomField10" Type="String" /><asp:Parameter Name="CustomField11" 
                    Type="String" /><asp:Parameter Name="CustomField12" Type="String" /><asp:Parameter 
                    Name="CustomField13" Type="String" /><asp:Parameter Name="CustomField14" 
                    Type="String" /><asp:Parameter Name="CustomField15" Type="String" /></InsertParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AccountExpenseEntryId"
            DataSourceID="dsAccountExpenseEntryFormObject" DefaultMode="Insert" SkinID="formviewSkinEmployee"
            Width="500px" OnDataBound="FormView1_DataBound" >
            <EditItemTemplate><table width="100%" class="xview">
                <tr>
                    <td class="caption" colspan="2" >
                        <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Entry Information") %>' /></td>
                </tr>
                <tr>
                    <td class="FormViewSubHeader" colspan="2">
                        <asp:Literal ID="Literal3" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Entry") %>' /></td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 30%">
                        <SPAN 
                  class=reqasterisk>*</span><asp:Literal ID="Literal4" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name:") %>' /></td>
                    <td style="width: 70%">
                        <asp:DropDownList ID="ddlProjectName" runat="server" DataSourceID="dsAccountProjectObject"
                                DataTextField="ProjectName" DataValueField="AccountProjectId" Width="85%">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlProjectName"
                            Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><%  If LocaleUtilitiesBLL.ShowTaskInExpenseSheet = True Then%><tr>
                    <td align="right" class="formviewlabelcell" style="width: 30%">
                        Task (Optional): </td><td style="width: 70%">
                        <asp:DropDownList ID="ddlAccountProjectTaskId" runat="server" DataTextField="TaskName"
                            DataValueField="AccountProjectTaskId" Width="85%">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="dsAccountProjectTasksObject" runat="server" OldValuesParameterFormatString="original_{0}"
                            TypeName="AccountProjectTaskBLL">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="" Name="AccountProjectId" Type="Int32" />
                                <asp:Parameter DefaultValue="" Name="AccountEmployeeId" Type="Int32" />
                                <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <aspToolkit:CascadingDropDown ID="ddlAccountProjectTaskIdCascadingDropDown" runat="server"
                                Category="Tasks" LoadingText="Loading" ParentControlID="ddlProjectName"
                                PromptText="<%$ Resources:TimeLive.Web, Select Tasks%>" ServiceMethod="GetAccountProjectTasksInExpensesheet"
                                ServicePath="~/Services/ProjectService.asmx" TargetControlID="ddlAccountProjectTaskId">
                        </aspToolkit:CascadingDropDown>
                    </td>
                </tr>
              <%  End If %>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 30%">
                        <SPAN 
                  class=reqasterisk>*</span><asp:Literal ID="Literal5" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Name:") %>' /></td>
                    <td style="width: 70%">
                        <asp:DropDownList ID="ddlExpenseNameEdit" runat="server" DataSourceID="dsAccountExpenseObject"
                                DataTextField="AccountExpenseName" DataValueField="AccountExpenseId" Width="85%" AutoPostBack="True" OnSelectedIndexChanged="ddlExpenseName_SelectedIndexChanged1">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlExpenseNameEdit"
                            Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr >
                    <td align="right" class="formviewlabelcell" style="width: 30%" valign="top" >
                        

<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="DescriptionTextBox">
                        <asp:Literal ID="Literal6" runat="server" Text='<%# ResourceHelper.GetFromResource("Description:") %>' /></asp:Label></td><td style="width: 70%">
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Height="75px" Text='<%# Bind("Description") %>'
                            TextMode="MultiLine" Width="350px"></asp:TextBox></td></tr><tr>
                    <td align="right" class="formviewlabelcell" style="width: 30%" valign="top">
                        <asp:Literal ID="Literal23" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Entry Date:") %>' /></td>
                    <td style="width: 70%">
                        <ew:CalendarPopup ID="txtDate" runat="server" SkinId="DatePicker"
                Width="104px" SelectedDate='<%# Bind("AccountExpenseEntryDate") %>' SelectedValue="10/05/2009 13:38:08" VisibleDate="10/05/2009 13:38:08">
                        </ew:CalendarPopup>
                    </td>
                </tr>
                <tr >
                    <td align="right" class="formviewlabelcell" style="width: 30%" >
                        <asp:Literal ID="Literal7" runat="server" Text='<%# ResourceHelper.GetFromResource("Reimburse:") %>' /></td>
                    <td style="width: 70%">
                        <asp:CheckBox ID="chkReimburse" runat="server" Checked='<%# Bind("Reimburse") %>' /></td>
                </tr>
                <tr >
                    <td align="right" class="formviewlabelcell" style="width: 30%" >
                        <asp:Literal ID="Literal8" runat="server" Text='<%# ResourceHelper.GetFromResource("Payment Method:") %>' /></td>
                    <td style="width: 70%">
                        <asp:DropDownList ID="ddlAccountPaymentMethodId" runat="server" AppendDataBoundItems="True"
                            DataSourceID="dsAccountPaymentMethodObject" DataTextField="PaymentMethod" DataValueField="AccountPaymentMethodId"
                            Width="159px">
                            <asp:ListItem Value="0" Label ID="Label1" runat="server" Text="<%$ Resources:TimeLive.Web, None%> "></asp:ListItem><%--<asp:ListItem Value="0">&lt;None&gt;</asp:ListItem>--%></asp:DropDownList></td></tr><tr >
                    <td align="right" class="formviewlabelcell" style="width: 30%">
                        <asp:Literal ID="Literal9" runat="server" Text='<%# ResourceHelper.GetFromResource("Currency:") %>' /></td>
                    <td style="width: 70%">
                        <asp:DropDownList ID="ddlAccountCurrencyId" runat="server" DataSourceID="dsAccountCurrencyObject"
                            DataTextField="CurrencyCode" DataValueField="AccountCurrencyId" Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlAccountCurrencyId_SelectedIndexChanged1">
                        </asp:DropDownList></td>
                </tr>
                 <% If CType(Me.FormView1.FindControl("lblQuantity"), Label).Visible <> False Then %>
                <tr style="color: #000000">
                    <td align="right" class="formviewlabelcell" style="width: 30%" >
                        <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label></td><td style="width: 70%">
                        <asp:TextBox ID="QuantityTextBox" runat="server" AutoPostBack="True" OnTextChanged="QuantityTextBox_TextChanged1"
                            Text='<%# Bind("Quantity") %>' Width="25%"></asp:TextBox></td></tr><tr >
                    <td align="right" class="formviewlabelcell" style="width: 30%" >
                        <asp:Label ID="lblRate" runat="server" Text='<%# ResourceHelper.GetFromResource("Rate:") %>' ></asp:Label></td><td style="width: 70%">
                        <asp:TextBox ID="RateTextBox" runat="server" AutoPostBack="True" OnTextChanged="RateTextBox_TextChanged1"
                            Text='<%# Bind("Rate") %>' Width="25%"></asp:TextBox></td></tr><%End If %><% If CType(Me.FormView1.FindControl("lblNetAmount"), Label).Visible <> False Then%><tr style="color: #000000">
                    <td align="right" class="formviewlabelcell" style="width: 30%" >
                        

                        <asp:Label ID="lblNetAmount" runat="server" Text='<%# ResourceHelper.GetFromResource("Net Amount:") %>' ></asp:Label></td><td style="width: 70%">
                        <asp:TextBox ID="NetAmountTextBox" runat="server" AutoPostBack="True" OnTextChanged="NetAmountTextBox_TextChanged1"
                            Text='<%# Bind("AmountBeforeTax") %>' Width="25%" ValidationGroup="NetAmount"></asp:TextBox><asp:Label ID="lblNetAmountNR" runat="server" ForeColor="Red" Text="Numeric Required"
                            Visible="False"></asp:Label></td></tr><tr style="color: #000000">
                    <td align="right" class="formviewlabelcell" style="width: 30%">
                        <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax Zone:") %>' /></td>
                    <td style="width: 70%">
                        <asp:DropDownList ID="ddlAccountTaxZoneId" runat="server" DataSourceID="dsAccountTaxZoneObject"
                            DataTextField="AccountTaxZone" DataValueField="AccountTaxZoneId" Width="25%" AutoPostBack="True" OnSelectedIndexChanged="ddlAccountTaxZoneId_SelectedIndexChanged1">
                        </asp:DropDownList></td>
                </tr>
                <tr >
                    <td align="right" class="formviewlabelcell" style="width: 30%" >
                        <asp:Label ID="lblTax" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax:") %>'></asp:Label></td><td style="width: 70%">
                        <asp:TextBox ID="TaxAmountTextBox" runat="server" AutoPostBack="True" OnTextChanged="TaxAmountTextBox_TextChanged1"
                            Text='<%# Bind("TaxAmount") %>' Width="25%"></asp:TextBox></td></tr><%End if %><tr>
                    <td align="right" class="formviewlabelcell" style="width: 30%;">
                        <SPAN 
                  class=reqasterisk>*</span><asp:Label ID="Label10" runat="server" AssociatedControlID="AmountTextBox">
                  <asp:Literal ID="Literal22" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount:") %>' /></asp:Label></td><td style="width: 70%;">
                        <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' Width="25%" OnTextChanged="AmountTextBox_TextChanged" ValidationGroup="NetAmount" AutoPostBack="True"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RFVNetAmountEdit" runat="server" ControlToValidate="AmountTextBox" CssClass="ErrorMessage"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="NetAmount"></asp:RequiredFieldValidator><asp:Label ID="lblAmountNR" runat="server" ForeColor="Red" Text="Numeric Required"
                            Visible="False"></asp:Label></td></tr><tr>
                    <td align="right" class="formviewlabelcell" style="width: 30%">
                        <asp:Literal ID="Literal11" runat="server" Text='<%# ResourceHelper.GetFromResource("Billable:") %>' /></td>
                    <td style="width: 70%">
                        <asp:CheckBox ID="chkIsBillable" runat="server" /></td>
                </tr>
                <tr >
                <td 
                    colspan="2"><asp:Table ID="CustomTableEdit" runat="server" 
                    style="margin-left: 0px" Width="100%"></asp:Table></td>
                </tr>
                <tr>
                    <td align="right" class="formviewlabelcell" style="width: 30%">
                    </td>
                    <td style="width: 70%">
                        <asp:Button ID="Button1" runat="server" CommandName="Update" Text="<%$ Resources:TimeLive.Web, Update_text%> " Width="55px" OnClick="Button1_Click" ValidationGroup="NetAmount" /><asp:Button ID="Button2" runat="server" Text="<%$ Resources:TimeLive.Web, Cancel_text%> " Width="55px" OnClick="Button2_Click" /></td>
                </tr>
            </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table width="500" class="xview">
                    <tr>
                        <td class="caption" colspan="2">
                            <asp:Literal ID="Literal10" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Entry Information") %>' /></td>
                    </tr>
                    <tr>
                        <td class="FormViewSubHeader" colspan="2">
                            <asp:Literal ID="Literal12" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Entry") %>' /></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%">
                            <SPAN 
                  class=reqasterisk>*</span><asp:Literal ID="Literal13" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name:") %>' /></td>
                        <td style="width: 70%">
                            <asp:DropDownList ID="ddlProjectName" runat="server" DataSourceID="dsAccountProjectObjectInsert"
                                DataTextField="ProjectName" DataValueField="AccountProjectId" Width="85%">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlProjectName"
                                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*" ValidationGroup="NetAmount"></asp:RequiredFieldValidator>&nbsp;<asp:ObjectDataSource
                                    ID="dsAccountProjectTasksObject" runat="server" OldValuesParameterFormatString="original_{0}"
                                    TypeName="AccountProjectTaskBLL">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="" Name="AccountProjectId" Type="Int32" />
                                        <asp:Parameter DefaultValue="" Name="AccountEmployeeId" Type="Int32" />
                                        <asp:Parameter Name="AccountProjectTaskId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
    </td>
                    </tr>
                    <%  If LocaleUtilitiesBLL.ShowTaskInExpenseSheet = True Then%>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%">
                            Task (Optional):</td><td style="width: 70%">
                            <asp:DropDownList ID="ddlAccountProjectTaskId" runat="server" DataTextField="TaskName"
                                DataValueField="AccountProjectTaskId" Width="85%">
                            </asp:DropDownList><aspToolkit:CascadingDropDown ID="ddlAccountProjectTaskIdCascadingDropDown" runat="server"
                                Category="Tasks" LoadingText="Loading" ParentControlID="ddlProjectName"
                                PromptText="<%$ Resources:TimeLive.Web, Select Tasks%>" ServiceMethod="GetAccountProjectTasksInExpensesheet"
                                ServicePath="~/Services/ProjectService.asmx" TargetControlID="ddlAccountProjectTaskId">
                            </aspToolkit:CascadingDropDown>
                        </td>
                    </tr>
                    <%  End If %>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%">
                            <SPAN 
                  class=reqasterisk>*</span><asp:Literal ID="Literal14" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Name:") %>' /></td>
                        <td style="width: 70%">
                            <asp:DropDownList ID="ddlExpenseName" runat="server" DataSourceID="dsAccountExpenseObjectInsert"
                                DataTextField="AccountExpenseName" DataValueField="AccountExpenseId" SelectedValue='<%# Bind("AccountExpenseId") %>' Width="85%" AutoPostBack="True" OnSelectedIndexChanged="ddlExpenseName_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlExpenseName"
                                Display="Dynamic" ErrorMessage="*" CssClass="ErrorMessage" ValidationGroup="NetAmount"></asp:RequiredFieldValidator></td></tr><tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%" valign="top">
                           
                           
<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="DescriptionTextBox">
                            <asp:Literal ID="Literal15" runat="server" Text='<%# ResourceHelper.GetFromResource("Description:") %>' /></asp:Label></td><td style="width: 70%">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Height="75px" Text='<%# Bind("Description") %>'
                                TextMode="MultiLine" Width="350px"></asp:TextBox></td></tr><tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%" valign="top">
                            <asp:Literal ID="Literal1" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Entry Date:") %>' /></td>
                        <td style="width: 70%">
                            <ew:CalendarPopup ID="txtDate" runat="server"  SkinId="DatePicker"
                Width="104px">
                            </ew:CalendarPopup>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%">
                            <asp:Literal ID="Literal16" runat="server" Text='<%# ResourceHelper.GetFromResource("Reimburse:") %>' /></td>
                        <td style="width: 70%">
                            <asp:CheckBox ID="chkReimburse" runat="server" Checked='<%# Bind("Reimburse") %>'
                                OnPreRender="chkReimburse_PreRender" /></td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%">
                            <asp:Literal ID="Literal17" runat="server" Text='<%# ResourceHelper.GetFromResource("Payment Method:") %>' /></td>
                        <td style="width: 70%">
                            <asp:DropDownList ID="ddlAccountPaymentMethodId" runat="server" AppendDataBoundItems="True"
                                DataSourceID="dsAccountPaymentMethodObjectInsert" DataTextField="PaymentMethod"
                                DataValueField="AccountPaymentMethodId" SelectedValue='<%# Bind("AccountPaymentMethodId") %>'
                                Width="168px">
                                <asp:ListItem Value="0" Label ID="Label2" runat="server" Text="<%$ Resources:TimeLive.Web, None%> "></asp:ListItem><%--<asp:ListItem Value="0">&lt;None&gt;</asp:ListItem>--%></asp:DropDownList></td></tr><tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%">
                            <asp:Literal ID="Literal18" runat="server" Text='<%# ResourceHelper.GetFromResource("Currency:") %>' /></td>
                        <td style="width: 70%">
                            <asp:DropDownList ID="ddlAccountCurrencyId" runat="server" DataSourceID="dsAccountCurrencyObjectInsert"
                                DataTextField="CurrencyCode" DataValueField="AccountCurrencyId" SelectedValue='<%# Bind("AccountCurrencyId") %>'
                                Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlAccountCurrencyId_SelectedIndexChanged">
                            </asp:DropDownList></td>
                    </tr>
                     <% If CType(Me.FormView1.FindControl("lblQuantity"), Label).Visible <> False Then%>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%; height: 26px;">
                            <asp:Label ID="lblQuantity" runat="server" Text='<%# ResourceHelper.GetFromResource("Quantity:") %>'></asp:Label></td><td style="width: 70%; height: 26px;">
                            <asp:TextBox ID="QuantityTextBox" runat="server" AutoPostBack="True" OnTextChanged="QuantityTextBox_TextChanged"
                                Text='<%# Bind("Quantity") %>' Width="25%" CausesValidation="True"></asp:TextBox></td></tr><tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%; height: 26px;">
                            <asp:Label ID="lblRate" runat="server" Text='<%# ResourceHelper.GetFromResource("Rate:") %>'></asp:Label></td><td style="width: 70%; height: 26px;">
                            <asp:TextBox ID="RateTextBox" runat="server" AutoPostBack="True" OnTextChanged="RateTextBox_TextChanged"
                                Text='<%# Bind("Rate") %>' Width="25%"></asp:TextBox></td></tr><% End If%><% If CType(Me.FormView1.FindControl("lblNetAmount"), Label).Visible <> False Then%><tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%; height: 26px;">
                            

                            <asp:Label ID="lblNetAmount" runat="server" Text='<%# ResourceHelper.GetFromResource("Net Amount:") %>'></asp:Label>&nbsp; </td><td style="width: 70%; height: 26px;">
                            <asp:TextBox ID="NetAmountTextBox" runat="server" AutoPostBack="True" OnTextChanged="NetAmountTextBox_TextChanged"
                                Text='<%# Bind("AmountBeforeTax") %>' Width="25%" CausesValidation="True" ValidationGroup="NetAmount"  ></asp:TextBox>&nbsp;<asp:Label
                                    ID="lblNetAmountNR" runat="server" ForeColor="Red" Text="Numeric Required" Visible="False"></asp:Label></td></tr><tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%; height: 24px;">
                            <asp:Literal ID="Literal19" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax Zone:") %>' /></td>
                        <td style="width: 70%; height: 24px;">
                            <asp:DropDownList ID="ddlAccountTaxZoneId" runat="server" DataSourceID="dsAccountTaxZoneObjectInsert"
                                DataTextField="AccountTaxZone" DataValueField="AccountTaxZoneId"
                                Width="25%" AutoPostBack="True" OnSelectedIndexChanged="ddlAccountTaxZoneId_SelectedIndexChanged" SelectedValue='<%# Bind("AccountTaxZoneId") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%; height: 26px;">
                            <asp:Label ID="lblTax" runat="server" Text='<%# ResourceHelper.GetFromResource("Tax:") %>'></asp:Label></td><td style="width: 70%; height: 26px;">
                            <asp:TextBox ID="TaxAmountTextBox" runat="server" AutoPostBack="True" OnTextChanged="TaxAmountTextBox_TextChanged"
                                Text='<%# Bind("TaxAmount") %>' Width="25%" CausesValidation="True"></asp:TextBox></td></tr><%End If%><tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%; height: 26px;">
                            <SPAN 
                  class=reqasterisk>*</span><asp:Label ID="Label9" runat="server" AssociatedControlID="AmountTextBox">
                  <asp:Literal ID="Literal20" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount:") %>' /></asp:Label></td><td style="width: 70%; height: 24px;">
                            <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' Width="25%" CausesValidation="True" ValidationGroup="NetAmount" AutoPostBack="True" OnTextChanged="AmountTextBox_TextChanged2"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AmountTextBox"
                                Display="Dynamic" ErrorMessage="*" CssClass="ErrorMessage"></asp:RequiredFieldValidator><asp:Label ID="lblAmountNR" runat="server" ForeColor="Red" Text="Numeric Required"
                                Visible="False"></asp:Label></td></tr><tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%; height: 22px;">
                            <asp:Literal ID="Literal21" runat="server" Text='<%# ResourceHelper.GetFromResource("Billable:") %>' /></td>
                        <td style="width: 70%; height: 22px;">
                            <asp:CheckBox ID="chkIsBillable" runat="server" Checked='<%# Bind("IsBillable") %>' /></td>
                    </tr>
                  <tr><td colspan="2"><asp:Table ID="CustomTable" runat="server" Height="100%" 
                        Width="100%"></asp:Table></td></tr>
                    <tr>
                        <td align="right" class="formviewlabelcell" style="width: 30%">
                        </td>
                        <td style="width: 70%">
                            <asp:Button ID="btnAdd" runat="server" CommandName="Insert" Text="<%$ Resources:TimeLive.Web, Add_text%> " Width="62px" ValidationGroup="NetAmount" OnClick="btnAdd_Click"/></td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                AccountExpenseEntryId: <asp:Label ID="AccountExpenseEntryIdLabel" runat="server" Text='<%# Eval("AccountExpenseEntryId") %>'>
                </asp:Label><br />AccountExpenseEntryDate: <asp:Label ID="AccountExpenseEntryDateLabel" runat="server" Text='<%# Bind("AccountExpenseEntryDate") %>'>
                </asp:Label><br />AccountId: <asp:Label ID="AccountIdLabel" runat="server" Text='<%# Bind("AccountId") %>'></asp:Label><br />AccountEmployeeId: <asp:Label ID="AccountEmployeeIdLabel" runat="server" Text='<%# Bind("AccountEmployeeId") %>'>
                </asp:Label><br />AccountProjectId: <asp:Label ID="AccountProjectIdLabel" runat="server" Text='<%# Bind("AccountProjectId") %>'>
                </asp:Label><br />AccountExpenseId: <asp:Label ID="AccountExpenseIdLabel" runat="server" Text='<%# Bind("AccountExpenseId") %>'>
                </asp:Label><br />Amount: <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount") %>'></asp:Label><br />CreatedOn: <asp:Label ID="CreatedOnLabel" runat="server" Text='<%# Bind("CreatedOn") %>'></asp:Label><br />CreatedByEmployeeId: <asp:Label ID="CreatedByEmployeeIdLabel" runat="server" Text='<%# Bind("CreatedByEmployeeId") %>'>
                </asp:Label><br />ModifiedOn: <asp:Label ID="ModifiedOnLabel" runat="server" Text='<%# Bind("ModifiedOn") %>'>
                </asp:Label><br />ModifiedByEmployeeId: <asp:Label ID="ModifiedByEmployeeIdLabel" runat="server" Text='<%# Bind("ModifiedByEmployeeId") %>'>
                </asp:Label><br /><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit">
                </asp:LinkButton><asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete">
                </asp:LinkButton><asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New">
                </asp:LinkButton></ItemTemplate></asp:FormView><asp:ObjectDataSource ID="dsAccountExpenseObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountExpensesByAccountIdAndIsDisabled" TypeName="AccountExpenseBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountExpenseId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsAccountExpenseObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountExpensesByAccountIdAndIsDisabled" TypeName="AccountExpenseBLL" DeleteMethod="DeleteAccountExpense" InsertMethod="AddAccountExpense" UpdateMethod="UpdateAccountExpense">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountExpenseId" Type="Int32" DefaultValue="0" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountExpenseId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountExpenseName" Type="String" />
                <asp:Parameter Name="AccountExpenseTypeId" Type="Int32" />
                <asp:Parameter Name="Original_AccountExpenseId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsBillable" Type="Boolean" />
                <asp:Parameter Name="IsDisabled" Type="Boolean" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountExpenseName" Type="String" />
                <asp:Parameter Name="AccountExpenseTypeId" Type="Int32" />
                <asp:Parameter Name="CreatedOn" Type="DateTime" />
                <asp:Parameter Name="CreatedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="ModifiedOn" Type="DateTime" />
                <asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="IsBillable" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectId" TypeName="AccountProjectBLL" DeleteMethod="DeleteAccountProject">
            <SelectParameters>
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter DefaultValue="67" Name="AccountEmployeeId" Type="Int32" />
                <asp:QueryStringParameter Name="IsTemplate" QueryStringField="IsTemplate" Type="Boolean" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
            </DeleteParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountProjectObjectInsert" 
            runat="server" OldValuesParameterFormatString="original_{0}"
            
            SelectMethod="GetAssignedAccountProjectsByAccountEmployeeIdAndAccountProjectIdForIsDeleted" 
            TypeName="AccountProjectBLL" DeleteMethod="DeleteAccountProject" 
            InsertMethod="AddAccountProject" UpdateMethod="UpdateProjectDescription"><DeleteParameters>
                <asp:Parameter Name="Original_AccountProjectId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters><asp:Parameter Name="AccountId" Type="Int32" /><asp:Parameter 
                    Name="AccountProjectTypeId" Type="Int32" /><asp:Parameter 
                    Name="AccountClientId" Type="Int32" /><asp:Parameter 
                    Name="AccountPartyContactId" Type="Int32" /><asp:Parameter 
                    Name="AccountPartyDepartmentId" Type="Int32" /><asp:Parameter 
                    Name="ProjectBillingTypeId" Type="Int32" /><asp:Parameter 
                    Name="ProjectName" Type="String" /><asp:Parameter Name="ProjectDescription" 
                    Type="String" /><asp:Parameter Name="StartDate" Type="DateTime" /><asp:Parameter 
                    Name="Deadline" Type="DateTime" /><asp:Parameter Name="ProjectStatusId" 
                    Type="Int32" /><asp:Parameter Name="LeaderEmployeeId" Type="Int32" /><asp:Parameter 
                    Name="ProjectManagerEmployeeId" Type="Int32" /><asp:Parameter 
                    Name="TimeSheetApprovalTypeId" Type="Int32" /><asp:Parameter 
                    Name="ExpenseApprovalTypeId" Type="Int32" /><asp:Parameter 
                    Name="EstimatedDuration" Type="Double" /><asp:Parameter 
                    Name="EstimatedDurationUnit" Type="String" /><asp:Parameter 
                    Name="ProjectCode" Type="String" /><asp:Parameter Name="DefaultBillingRate" 
                    Type="Decimal" /><asp:Parameter Name="ProjectBillingRateTypeId" 
                    Type="Int32" /><asp:Parameter Name="IsTemplate" Type="Boolean" /><asp:Parameter 
                    Name="IsProject" Type="Boolean" /><asp:Parameter 
                    Name="AccountProjectTemplateId" Type="Int32" /><asp:Parameter 
                    Name="CreatedOn" Type="DateTime" /><asp:Parameter 
                    Name="CreatedByEmployeeId" Type="Int32" /><asp:Parameter Name="ModifiedOn" 
                    Type="DateTime" /><asp:Parameter Name="ModifiedByEmployeeId" Type="Int32" /><asp:Parameter 
                    Name="Completed" Type="Boolean" /><asp:Parameter Name="CustomField1" 
                    Type="String" /><asp:Parameter Name="CustomField2" Type="String" /><asp:Parameter 
                    Name="CustomField3" Type="String" /><asp:Parameter Name="CustomField4" 
                    Type="String" /><asp:Parameter Name="CustomField5" Type="String" /><asp:Parameter 
                    Name="CustomField6" Type="String" /><asp:Parameter Name="CustomField7" 
                    Type="String" /><asp:Parameter Name="CustomField8" Type="String" /><asp:Parameter 
                    Name="CustomField9" Type="String" /><asp:Parameter Name="CustomField10" 
                    Type="String" /><asp:Parameter Name="CustomField11" Type="String" /><asp:Parameter 
                    Name="CustomField12" Type="String" /><asp:Parameter Name="CustomField13" 
                    Type="String" /><asp:Parameter Name="CustomField14" Type="String" /><asp:Parameter 
                    Name="CustomField15" Type="String" /></InsertParameters><SelectParameters>
                <asp:Parameter Name="AccountProjectId" Type="Int32" />
                <asp:Parameter DefaultValue="67" Name="AccountEmployeeId" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="" Name="IsTemplate" QueryStringField="IsTemplate"
                    Type="Boolean" />
            </SelectParameters>
        <UpdateParameters><asp:Parameter Name="ProjectDescription" Type="String" /><asp:Parameter 
                    Name="Original_AccountProjectId" Type="Int32" /></UpdateParameters></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountCurrencyObject" runat="server" DeleteMethod="DeleteAccountCurrency"
            InsertMethod="AddAccountCurrency" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL"
            UpdateMethod="UpdateAccountCurrency">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountCurrencyObjectInsert" runat="server" DeleteMethod="DeleteAccountCurrency"
            InsertMethod="AddAccountCurrency" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL"
            UpdateMethod="UpdateAccountCurrency">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:Parameter Name="Original_AccountCurrencyId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="AccountCurrencyId" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="SystemCurrencyId" Type="Int32" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="AccountCurrencyExchangeRateId" Type="Int32" />
                <asp:Parameter Name="Disabled" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountPaymentMethodObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountPaymentMethodByAccountIdAndIsDisabled" TypeName="AccountPaymentMethodBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountPaymentMethodId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountPaymentMethodObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountPaymentMethodByAccountIdAndIsDisabled" TypeName="AccountPaymentMethodBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="151" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="AccountPaymentMethodId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountTaxZoneObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountTaxZonesByAccountIdAndIsDisabled" TypeName="AccountTaxZoneBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="3" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter Name="AccountTaxZoneId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccountTaxZoneObjectInsert" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountTaxZonesByAccountIdAndIsDisabled" TypeName="AccountTaxZoneBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="3" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="AccountTaxZoneId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        &nbsp;</ContentTemplate></asp:UpdatePanel><br />
<uc1:ctlStatusLegend ID="CtlStatusLegend1" runat="server" />
<uc2:ctlAccountEmployeeExpenseSheetApprovalDetailReadOnly ID="CW2"
runat="server" />
