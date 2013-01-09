<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlMyTimeOff, App_Web_k5jcht5i" %>
<%@ Register Src="ctlTimeOffStatusReadOnly.ascx" TagName="ctlTimeOffStatusReadOnly"
    TagPrefix="uc1" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" SkinID="xgridviewSkinEmployee" AllowSorting="True" runat="server" AutoGenerateColumns="False" DataSourceID="dsEmployeeTimeOffRequestGridViewObject" Width="98%" Caption="<%$ Resources:TimeLive.Web, Time Off Request%> "  DataKeyNames="AccountEmployeeTimeOffRequestId">
            <Columns>
                <asp:BoundField DataField="AccountTimeOffType" HeaderText="<%$ Resources:TimeLive.Web, Time Off Type%> "  SortExpression="AccountTimeOffType" >
                    <ItemStyle Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="<%$ Resources:TimeLive.Web, Description%> "  SortExpression="Description" >
                    <ItemStyle Width="30%" />
                </asp:BoundField>
                <asp:BoundField DataField="HoursOff" HeaderText="<%$ Resources:TimeLive.Web, Hours Off%> "  SortExpression="HoursOff" >
                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="StartDate" HeaderText="<%$ Resources:TimeLive.Web, Begin Date%> "  SortExpression="StartDate" DataFormatString="{0:d}" HtmlEncode="False" >
                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="EndDate" HeaderText="<%$ Resources:TimeLive.Web, End Date%> "  SortExpression="EndDate" DataFormatString="{0:d}" HtmlEncode="False" >
                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="ApprovalStatus" HeaderText="<%$ Resources:TimeLive.Web, Approval Status%> "  SortExpression="ApprovalStatus" />
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Edit_text %>">
                    <itemstyle cssclass="edit_button" horizontalalign="Center" verticalalign="Middle"
                        />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:HyperLink id="EditHyperLink" runat="server" NavigateUrl='<%# Eval("AccountEmployeeTimeOffRequestId", "~/Employee/TimeOffRequest.aspx?AccountEmployeeTimeOffRequestId={0}") %>' Visible='<%# IIF(IsDbNull(Eval("AccountEmployeeTimeOffRequestId")),"False","True") %>' __designer:wfdid="w44">[HyperLink1]</asp:HyperLink> 
</itemtemplate>
                </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Delete_text %>" ShowHeader="False">
            <ItemStyle HorizontalAlign="Center"  cssclass="delete_button"  />
            <HeaderStyle HorizontalAlign="Center" />
     <ItemTemplate>
<asp:LinkButton id="DeleteLinkButton" runat="server" Visible='<%# IIF(IsDbNull(Eval("AccountEmployeeTimeOffRequestId")),"False","True") %>' __designer:wfdid="w2" OnClientClick="<%# ResourceHelper.GetDeleteMessageJavascript() %>" CommandName="Delete" CausesValidation="False"></asp:LinkButton> 
</ItemTemplate>
        </asp:TemplateField>
            </Columns>
        </x:GridView>
        <br />
        <asp:ObjectDataSource ID="dsEmployeeTimeOffRequestGridViewObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountEmployeeTimeOffRequestByAccountIdAndAccountEmployeeId"
            TypeName="AccountEmployeeTimeOffRequestBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
                <asp:SessionParameter Name="AccountEmployeeId" SessionField="AccountEmployeeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="<%$ Resources:TimeLive.Web, Add Time Off Request%>" />
       </ContentTemplate>
</asp:UpdatePanel>
 <br />
<uc1:ctlTimeOffStatusReadOnly ID="CtlTimeOffStatusReadOnly1" runat="server" />

