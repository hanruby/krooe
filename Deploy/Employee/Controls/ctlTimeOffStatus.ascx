<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlTimeOffStatus, App_Web_dsdjiwop" %>
<asp:Button ID="btnResetButton" runat="server" Text="<%$ Resources:TimeLive.Web, Reset Policy%> " /><br />
<table class="xFormView" width="98%">
    <tr>
        <td class="caption" colspan="2">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Information%> " /></td>
    </tr>
    <tr>
        <td class="FormViewSubHeader">
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Name:%> " /></td>
        <td class="FormViewSubHeader" style="width: 82%">
            <asp:TextBox ID="txtEmployeeName" runat="server" Width="100%"></asp:TextBox></td>
    </tr>
</table>
<br />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Time Off Status%> "
            DataSourceID="dsTimeOffStatusGridViewObject" Width="98%" SkinID="xgridviewSkinEmployee" DataKeyNames="AccountEmployeeTimeOffId">
            <Columns>
                <asp:BoundField DataField="AccountTimeOffType" HeaderText="<%$ Resources:TimeLive.Web, Time Off Type%> " SortExpression="AccountTimeOffType">
                    <ItemStyle Width="50%" />
                </asp:BoundField>
                <asp:BoundField DataField="Earned" HeaderText="<%$ Resources:TimeLive.Web, Earned%> ">
                    <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="Consume" HeaderText="<%$ Resources:TimeLive.Web, Consumed%> ">
                    <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="CarryForward" HeaderText="<%$ Resources:TimeLive.Web, Carry Forward%> ">
                    <itemstyle width="10%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Available%> ">
                    <ItemTemplate>
<asp:TextBox id="AvailableTextBox" Text='<%# Bind("Available") %>' runat="server" Width="90%" __designer:wfdid="w15" Visible='<%# IIF(Isdbnull(Eval("AccountEmployeeTimeOffId")),"false","true") %>'></asp:TextBox><asp:RangeValidator id="RangeValidator1" runat="server" __designer:wfdid="w16" Display="Dynamic" CssClass="ErrorMessage" ControlToValidate="AvailableTextBox" Type="Double" MinimumValue="-99999" MaximumValue="99999" ErrorMessage="Incorrect Value"></asp:RangeValidator> 
</ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:BoundField DataField="LastEarnedDate" HeaderText="<%$ Resources:TimeLive.Web, Last Earned Date%> " DataFormatString="{0:d}" HtmlEncode="False">
                    <ItemStyle Width="10%" horizontalalign="Center" />
                </asp:BoundField>
                                <asp:BoundField DataField="LastResetDate" HeaderText="<%$ Resources:TimeLive.Web, Last Reset Date%> " DataFormatString="{0:d}" HtmlEncode="False">
                    <ItemStyle Width="10%" horizontalalign="Center" />
                </asp:BoundField>
            </Columns>
        </x:GridView>
        <asp:ObjectDataSource ID="dsTimeOffStatusGridViewObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountEmployeeTimeOffByAccountEmployeeId" TypeName="AccountEmployeeTimeOffBLL">
            <SelectParameters>
                <asp:QueryStringParameter Name="AccountEmployeeId" QueryStringField="AccountEmployeeId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="<%$ Resources:TimeLive.Web, Update Time Off%> " />
    </ContentTemplate>
</asp:UpdatePanel>
