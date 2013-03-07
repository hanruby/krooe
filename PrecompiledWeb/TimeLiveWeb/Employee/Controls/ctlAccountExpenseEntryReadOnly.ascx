<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlAccountExpenseEntryReadOnly, App_Web_uitpp31g" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<br />
<table width="98%" cellpadding="0" cellspacing="0" class="xFormView">
    <tr>
        <td colspan="4" valign="middle">
            <asp:Image ID="imgCompanyLogo" runat="server" Height="50px" /></td>
    </tr>
    <tr>

        <td align="left" class="HighlightedTextMedium" valign="middle" style="width: 18%; height: 19px;">
        <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Name:%> "></asp:Literal></td>
        
        <td  valign="middle" class="HighlightedTextMedium" align="left" style="width: 30%; height: 19px;">
            <asp:Label ID="lblEmployeeName" runat="server"></asp:Label></td>
                    <td align="right" class="HighlightedTextMedium" style="width: 40%; height: 19px;" valign="middle">
                        <asp:Literal ID="RCurrencyLiteral" runat="server" Text="<%$ Resources:TimeLive.Web, Reimbursement Currency:%> "></asp:Literal></td>
        <td align="left" class="HighlightedTextMedium" style="width: 10%; height: 19px;" valign="middle">
            <asp:Label ID="lblReimbursCurrency" runat="server"></asp:Label></td>
           </tr>
    <tr>

        <td align="left" class="HighlightedTextMedium" valign="middle" style="width: 18%">
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Description:%> "></asp:Literal></td>
        <td align="left" class="HighlightedTextMedium" valign="middle" style="width: 30%">
            <asp:Label ID="lblDescription" runat="server"></asp:Label></td>
                    <td align="right" class="HighlightedTextMedium" style="width: 40%" valign="middle">
                        <asp:Literal ID="RTotalLiteral" runat="server" Text="<%$ Resources:TimeLive.Web, Total Reimbursement%> "></asp:Literal></td>
        <td align="left" class="HighlightedTextMedium" style="width: 10%" valign="middle">
            <asp:Label ID="lblReimburseAmount" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td align="left" class="HighlightedTextMedium" valign="middle" style="width: 18%;">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Date:%> "></asp:Literal></td>
        <td align="left" class="HighlightedTextMedium" valign="middle" style="width: 30%;">
            <asp:Label ID="lblDate" runat="server"></asp:Label></td>
                    <td align="right" class="HighlightedTextMedium" style="width: 40%;" valign="middle">
        </td>
        <td align="left" class="HighlightedTextMedium" style="width: 10%;" valign="middle">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="4" valign="middle">
        <x:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
    Caption='<%# ResourceHelper.GetFromResource("Expense Entry List") %>' DataKeyNames="AccountExpenseEntryId"
    DataSourceID="dsAccountExpenseEntryObject" ShowFooter="True" SkinID="xgridviewSkinEmployee"
    Width="100%" PageSize="500">
    <Columns>
        <asp:TemplateField>
            <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("AccountExpenseEntryDate") %>' __designer:wfdid="w69"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Date") %>' CommandArgument="AccountExpenseEntryDate" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("AccountExpenseEntryDate", "{0:d}") %>' __designer:wfdid="w68"></asp:Label>
</itemtemplate>
            <itemstyle font-bold="True" horizontalalign="Center" width="7%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <edititemtemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("ProjectName") %>' __designer:wfdid="w72"></asp:TextBox>
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Project Name") %>' CommandArgument="ProjectName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label4" runat="server" Text='<%# Bind("ProjectName") %>' __designer:wfdid="w71"></asp:Label>
</itemtemplate>
            <itemstyle font-bold="True" horizontalalign="Left" width="14%" />
        </asp:TemplateField>
        <asp:BoundField DataField="TaskName" HeaderText="Task Name">
            <itemstyle width="9%" />
        </asp:BoundField>
        <asp:TemplateField>
            <edititemtemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("AccountExpenseName") %>' __designer:wfdid="w18"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Expense Name") %>' __designer:wfdid="w19" CausesValidation="False" CommandName="Sort" CommandArgument="AccountExpenseName"></asp:LinkButton> 
</headertemplate>
            <itemtemplate>
<asp:Label id="Label5" runat="server" Text='<%# Bind("AccountExpenseName") %>' __designer:wfdid="w17"></asp:Label> 
</itemtemplate>
            <itemstyle font-bold="True" horizontalalign="Left" width="13%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <edititemtemplate>
<asp:TextBox id="TextBox5" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w45"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton7" runat="server" Text='<%# ResourceHelper.GetFromResource("Description") %>' __designer:wfdid="w46" CausesValidation="False" CommandName="Sort" CommandArgument="Description"></asp:LinkButton> 
</headertemplate>
            <itemtemplate>
<asp:Label id="Label6" runat="server" Text='<%# Bind("Description") %>' __designer:wfdid="w44"></asp:Label> 
</itemtemplate>
            <itemstyle font-bold="True" horizontalalign="Left" width="14%" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Payment Method">
            <edititemtemplate>
<asp:TextBox id="TextBox8" runat="server" Text='<%# Bind("PaymentMethod") %>' __designer:wfdid="w38"></asp:TextBox>
</edititemtemplate>
            <itemtemplate>
<asp:Label id="Label11" runat="server" Text='<%# Bind("PaymentMethod") %>' __designer:wfdid="w37"></asp:Label>
</itemtemplate>
            <itemstyle font-bold="True" horizontalalign="Left" width="5%" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quantity">
            <edititemtemplate>
<asp:TextBox id="TextBox6" runat="server" Text='<%# Bind("Quantity") %>' __designer:wfdid="w36"></asp:TextBox>
</edititemtemplate>
            <itemtemplate>
<asp:Label id="Label7" runat="server" Text='<%# Bind("QuantityFieldCaption") %>' __designer:wfdid="w34"></asp:Label> <asp:Label id="Label10" runat="server" Text='<%# Bind("Quantity") %>' __designer:wfdid="w35"></asp:Label>
</itemtemplate>
            <itemstyle horizontalalign="Right" width="8%" />
        </asp:TemplateField>
        <asp:BoundField DataField="Rate" HeaderText="Rate">
            <itemstyle horizontalalign="Right" width="5%" />
        </asp:BoundField>
        <asp:BoundField DataField="NetAmount" HeaderText="Net Amount" DataFormatString="{0:N}">
            <footerstyle font-bold="True" />
            <itemstyle horizontalalign="Right" width="3%" />
        </asp:BoundField>
        <asp:BoundField DataField="TaxCode" HeaderText="Tax Code">
            <itemstyle horizontalalign="Right" width="5%" />
        </asp:BoundField>
        <asp:BoundField DataField="TaxAmount" HeaderText="Tax Amount" DataFormatString="{0:N}">
            <footerstyle font-bold="True" />
            <itemstyle horizontalalign="Right" width="4%" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Net Amount %>">
            <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("Amount") %>' __designer:wfdid="w42"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton8" runat="server" Text='<%# ResourceHelper.GetFromResource("Amount") %>' __designer:wfdid="w43" CausesValidation="False" CommandName="Sort" CommandArgument="Amount"></asp:LinkButton> 
</headertemplate>
            <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Eval("CurrencyCode") %>' __designer:wfdid="w40"></asp:Label> <asp:Label id="Label1" runat="server" Text='<%# Bind("Amount", "{0:N}") %>' __designer:wfdid="w41"></asp:Label> 
</itemtemplate>
            <footerstyle font-bold="True" />
            <itemstyle horizontalalign="Right" width="9%" font-bold="False" />
        </asp:TemplateField>
 <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Attachments %>">
                    <ItemTemplate>
<asp:HyperLink id="AttachmentHyperLink" onclick="window.open (this.href, 'popupwindow', 'width=680,height=250,left=300,top=300'); return false;" runat="server" __designer:wfdid="w39" NavigateUrl='<%# Eval("AccountExpenseEntryId", "~/ProjectAdmin/AccountExpenseEntryApprovalAttachment.aspx?AccountExpenseEntryId={0}&AccountAttachmentTypeId=1") %>'>[AttachmentHyperLink]</asp:HyperLink> 
</ItemTemplate>
                    <ItemStyle horizontalalign="Center" />
                </asp:TemplateField>
    </Columns>
</x:GridView>

<asp:TextBox ID="txtExpenseSheetFooter" style="overflow:hidden" runat="server" BorderStyle="None" BorderWidth="0px"
Height="150px" ReadOnly="True" TextMode="MultiLine" Width="99%" Font-Bold="True"></asp:TextBox>
    <br />
    <br />
    <br />
    <%If LocaleUtilitiesBLL.IsShowElectronicSign = True And LocaleUtilitiesBLL.IsElectronicSignExistInSessionAccount = True Then%>
    <asp:Table ID="Table1" runat="server" Width="100%" Height="100%" BorderStyle="None" align="center" 
    BorderColor="White" CssClass="xTableWithoutBorder">
    <asp:TableRow ID="TableRow1" runat="server" Width="100%" BorderStyle="None" 
        BorderColor="White">
        <asp:TableCell ID="TableCell1" runat="server"><tr><td Class="caption" style="Width:100%" colspan="2"><b>Electronic Signature</b></td>
        </tr></asp:TableCell>
        <asp:TableCell ID="TableCell2" runat="server"><tr><td align="left" style="Width:15%"><b>Signed By:</b></td>
        <td align="left" style="Width:85%"><b><asp:Label ID="lblSignedBy" runat="server"></asp:Label></b></td></tr></asp:TableCell>
        <asp:TableCell ID="TableCell3" runat="server"><tr><td align="left" style="Width:15%"><b>Signature:</b></td>
        <td align="left" style="Width:85%"> <asp:Image ID="imgElectronicSignature" runat="server" Height = "50px" align="left" ImageAlign="Top" />
        </td></tr></asp:TableCell>
        <asp:TableCell ID="TableCell4" runat="server"><tr><td align="left" style="Width:15%"><b>Timestamp:</b></td>            
        <td align="left" style="Width:85%"><asp:Label ID="lblTimestamp" runat="server"></asp:Label></td></tr></asp:TableCell>
    </asp:TableRow>
</asp:Table>
<%End If%>
</table>

        <asp:ObjectDataSource ID="dsAccountExpenseEntryObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountExpenseEntriesReadOnly" TypeName="AccountExpenseEntryBLL">
            <SelectParameters>
                <asp:QueryStringParameter Name="AccountEmployeeId" QueryStringField="AccountEmployeeId"
                    Type="Int32" />
                <asp:QueryStringParameter Name="AccountEmployeeExpenseSheetId" QueryStringField="AccountEmployeeExpenseSheetId"
                    Type="Object" />
                <asp:QueryStringParameter Name="ApprovalType" QueryStringField="ApprovalType" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource><asp:ObjectDataSource ID="dsAccountExpenseEntryForPrintObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountExpenseEntryWithLastStausByEmployeeExpenseSheetId" TypeName="AccountExpenseEntryBLL" InsertMethod="AddExpenseApproval">
            <SelectParameters>
                <asp:QueryStringParameter Name="AccountEmployeeExpenseSheetId" QueryStringField="AccountEmployeeExpenseSheetId"
                    Type="Object" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountExpenseEntryId" Type="Int32" />
                <asp:Parameter Name="ExpenseApprovalTypeId" Type="Int32" />
                <asp:Parameter Name="ExpenseApprovalPathId" Type="Int32" />
                <asp:Parameter Name="ApprovedByEmployeeId" Type="Int32" />
                <asp:Parameter Name="Comments" Type="String" />
                <asp:Parameter Name="IsRejected" Type="Boolean" />
                <asp:Parameter Name="IsApproved" Type="Boolean" />
                </InsertParameters>
        </asp:ObjectDataSource>
