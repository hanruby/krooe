<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountProjectEmployee, App_Web_wln1wvyv" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<%@ Register Src="ctlProjectView.ascx" TagName="ctlProjectView" TagPrefix="uc1" %>
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
<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <uc1:ctlProjectView ID="CtlProjectView1" runat="server" />
    <br />
    <% Dim AccountProjectBLL as new AccountProjectBLL%>
    <% If AccountProjectBLL.GetProjectBillingRateTypeId(Request.QueryString("AccountProjectId")) = 3 Then%>
    
    <table class="xFormView" style="width: 500px">
        <tr>
            <td align="right" class="formviewlabelcell" style="width: 20%">
                <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Work Type:%> " /></td>
            <td align="left" colspan="3" style="width: 80%">
    <asp:DropDownList ID="ddlAccountWorkTypeId" runat="server" AutoPostBack="True" DataSourceID="dsAccountWorkTypeObject"
        DataTextField="AccountWorkType" DataValueField="AccountWorkTypeId" OnSelectedIndexChanged="ddlAccountWorkTypeId_SelectedIndexChanged"
        Width="200px">
    </asp:DropDownList>
                <asp:Label ID="lblWorkTypeValue" runat="server" Visible="False"></asp:Label></td>
        </tr>
    </table>
    <br />
    <% End If%>
<x:GridView id="GridView1" runat="server" AutoGenerateColumns="False" PageSize="25" DataSourceID="dsAccountProjectEmployee" SkinID="xgridviewSkinEmployee" Caption="<%$ Resources:TimeLive.Web, Project Employee List %>" Width="775px" DataKeyNames="AccountProjectEmployeeId,AccountEmployeeId,AccountBillingRateId,StartDate,EndDate" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound"><Columns>
    <asp:BoundField DataField="AccountProjectId" HeaderText="<%$ Resources:TimeLive.Web, Id %>" InsertVisible="False"
        ReadOnly="True" SortExpression="AccountProjectId" Visible="False" >
        <itemstyle width="0%" />
    </asp:BoundField>
    <asp:BoundField HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>" SortExpression="FullName" DataField="FullName" >
        <itemstyle width="225px" />
    </asp:BoundField>
    <asp:BoundField DataField="DepartmentName" HeaderText="<%$ Resources:TimeLive.Web, Department Name %>" SortExpression="DepartmentName" >
    <ItemStyle Width="225px" />
    </asp:boundfield>
    <asp:BoundField DataField="AccountLocation" HeaderText="<%$ Resources:TimeLive.Web, Location %>" SortExpression="AccountLocation" >
    <ItemStyle Width="225px" />
    </asp:boundfield>
    <asp:BoundField HeaderText="<%$ Resources:TimeLive.Web, Last Name %>" SortExpression="LastName" Visible="False" >
        <itemstyle width="0%" />
    </asp:BoundField>
    <asp:BoundField DataField="AccountEmployeeId" HeaderText="AccountEmployeeId" InsertVisible="False"
        ReadOnly="True" SortExpression="AccountEmployeeId" Visible="False" >
        <itemstyle width="0%" />
    </asp:BoundField>
    <asp:BoundField DataField="AccountProjectEmployeeId" HeaderText="AccountProjectEmployeeId"
        InsertVisible="False" ReadOnly="True" SortExpression="AccountProjectEmployeeId" Visible="False" >
        <itemstyle width="0%" />
    </asp:BoundField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Role %>" Visible="False" SortExpression="Role">
        <ItemStyle Width="350px" horizontalalign="Center" verticalalign="Middle" />
        <ItemTemplate>
<asp:DropDownList id="ddlAccountRoleId" runat="server" Width="350px" DataValueField="AccountRoleId" DataTextField="Role" DataSourceID="dsAccountRoleObject" __designer:wfdid="w222"></asp:DropDownList><asp:ObjectDataSource id="dsAccountRoleObject" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountRolesByAccountProjectId" TypeName="AccountRoleBLL" __designer:wfdid="w223" DeleteMethod="DeleteAccountRole">
                <SelectParameters>
                    <asp:QueryStringParameter Name="AccountProjectId" QueryStringField="AccountProjectId"
                        Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="original_AccountRoleId" Type="Int32" />
                </DeleteParameters>
            </asp:ObjectDataSource> 
</ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>" SortExpression="EmployeeName">
        <ItemStyle Width="350px" horizontalalign="Center" verticalalign="Middle" />
        <ItemTemplate>
<asp:DropDownList id="ddlAccountEmployeeId" runat="server" Width="350px" DataValueField="AccountEmployeeId" DataTextField="FullName" DataSourceID="dsAccountEmployeeObject" __designer:wfdid="w11" AppendDataBoundItems="True"><asp:ListItem Value="0"></asp:ListItem>
</asp:DropDownList><asp:ObjectDataSource id="dsAccountEmployeeObject" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountEmployeesByAccountIdAndIsDisabled" TypeName="AccountEmployeeBLL" __designer:wfdid="w12"><SelectParameters>
<asp:SessionParameter SessionField="AccountId" Type="Int32" DefaultValue="64" Name="AccountId"></asp:SessionParameter>
<asp:Parameter Type="Int32" Name="AccountEmployeeId"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource> 
</ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billing Rate Currency %>">
        <itemstyle horizontalalign="Center" verticalalign="Middle" width="55px" />
        <itemtemplate>
<asp:DropDownList id="ddlBillingRateCurrencyId" runat="server" Width="55px" DataValueField="AccountCurrencyId" DataTextField="CurrencyCode" DataSourceID="dsBillingRateCurrencyObject" __designer:wfdid="w217"></asp:DropDownList><BR /><asp:ObjectDataSource id="dsBillingRateCurrencyObject" runat="server" __designer:dtid="281474976710724" OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL" __designer:wfdid="w218"><SelectParameters __designer:dtid="281474976710725">
<asp:SessionParameter SessionField="AccountId" Name="AccountId" Type="Int32" __designer:dtid="281474976710726"></asp:SessionParameter>
<asp:Parameter Name="AccountCurrencyId" Type="Int32" __designer:dtid="281474976710727"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource> 
</itemtemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billing Rate %>">
        <itemstyle width="50px" horizontalalign="Center" verticalalign="Middle" />
        <ItemTemplate>
<asp:TextBox id="BillingRateTextBox" runat="server" Width="50px" __designer:wfdid="w204"></asp:TextBox> 
</ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Employee Rate Currency %>">
        <itemstyle horizontalalign="Center" verticalalign="Middle" width="55px" />
        <itemtemplate>
<asp:DropDownList id="ddlEmployeeRateCurrencyId" runat="server" Width="55px" DataValueField="AccountCurrencyId" DataTextField="CurrencyCode" DataSourceID="dsEmployeeRateCurrencyObject" __designer:wfdid="w205"></asp:DropDownList><asp:ObjectDataSource id="dsEmployeeRateCurrencyObject" runat="server" __designer:dtid="281474976710724" OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL" __designer:wfdid="w206"><SelectParameters __designer:dtid="281474976710725">
<asp:SessionParameter SessionField="AccountId" Name="AccountId" Type="Int32" __designer:dtid="281474976710726"></asp:SessionParameter>
<asp:Parameter Name="AccountCurrencyId" Type="Int32" __designer:dtid="281474976710727"></asp:Parameter>
</SelectParameters>
</asp:ObjectDataSource> 
</itemtemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Employee Rate %>">
        <itemstyle width="50px" wrap="True" horizontalalign="Center" verticalalign="Middle" />
        <itemtemplate>
<asp:TextBox id="EmployeeRateTextBox" runat="server" Width="50px" __designer:wfdid="w207"></asp:TextBox> 
</itemtemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Start Date %>">
        <itemstyle width="100px" horizontalalign="Center" verticalalign="Middle" />
        <ItemTemplate>
<cc1:CalendarPopup id="StartDateTextBox" runat="server" Text="..." Width="50px" __designer:wfdid="w209"></cc1:CalendarPopup> 
</ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, End Date %>">
        <itemstyle width="100px" horizontalalign="Center" verticalalign="Middle" />
        <ItemTemplate>
<cc1:CalendarPopup id="EndDateTextBox" runat="server" Text="..." Width="50px" __designer:wfdid="w210"></cc1:CalendarPopup> 
</ItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Selected %>">
        <ItemStyle HorizontalAlign="Center" Width="0px" verticalalign="Middle" />
        <HeaderTemplate>
            <asp:CheckBox ID="chkCheckAll" runat="server" __designer:wfdid="w109" />
        </HeaderTemplate>
    <ItemTemplate>
        &nbsp; <asp:CheckBox id="chkSelect" runat="server" __designer:wfdid="w109"></asp:CheckBox> 
</ItemTemplate>
    </asp:TemplateField>    
    <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billing Rate History %>">
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <itemstyle horizontalalign="Center" verticalalign="Middle" width="0px" />
        <ItemTemplate>
<asp:HyperLink id="HyperLink1" runat="server" Text="History" __designer:wfdid="w226" Visible='<%# IIF(IsDBNULL(Eval("AccountBillingRateId")) orelse Eval("AccountBillingRateId")=0,False,True) %>'></asp:HyperLink> 
</ItemTemplate>
    </asp:TemplateField>
</Columns>
</x:GridView> 
    <asp:Button ID="Update" runat="server"  Text="<%$ Resources:TimeLive.Web, Update_text%> " OnClick="Update_Click1" Width="70px" /><br />
    <asp:ObjectDataSource id="dsAccountProjectEmployee" runat="server" TypeName="AccountProjectEmployeeBLL" SelectMethod="GetAccountProjectEmployeesForSelectionByAccountWorkTypeId" OldValuesParameterFormatString="original_{0}" OnInserting="dsAccountProjectEmployee_Inserting">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                Type="Int32" />
            <asp:QueryStringParameter DefaultValue="1" Name="AccountProjectId" QueryStringField="AccountProjectId"
                Type="Int32" />
            <asp:Parameter Name="AccountWorkTypeId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource id="dsFilledAccountProjectEmployee" runat="server" TypeName="AccountProjectEmployeeBLL" SelectMethod="GetFilledRowsOfAccountProjectEmployee" OldValuesParameterFormatString="original_{0}" OnInserting="dsAccountProjectEmployee_Inserting">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="AccountProjectId" QueryStringField="AccountProjectId"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccountWorkTypeObject" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAccountWorkTypesByAccountId" TypeName="AccountWorkTypeBLL">
        <SelectParameters>
            <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccountCurrencyObject" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL">
        <SelectParameters>
            <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
            <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</ContentTemplate>
</asp:UpdatePanel>
