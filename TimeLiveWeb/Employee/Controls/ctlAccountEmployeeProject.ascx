<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountEmployeeProject.ascx.vb" Inherits="Employee_Controls_ctlAccountEmployeeProject" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
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
    <% Dim AccountProjectBLL as new AccountProjectBLL%>
<% If AccountProjectBLL.GetProjectBillingRateTypeId(Request.QueryString("AccountProjectId")) = 3 Then%>
<% End If%>
<x:GridView id="GridView1" runat="server" AutoGenerateColumns="False" PageSize="25" DataSourceID="dsAccountProjectEmployee" SkinID="xgridviewSkinEmployee" Caption="Employee Project List " Width="775px" DataKeyNames="AccountProjectId,AccountProjectEmployeeId" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound"><Columns>
        <asp:BoundField DataField="AccountProjectId" HeaderText="Id"
            InsertVisible="False" ReadOnly="True" SortExpression="AccountProjectId">
            <itemstyle width="5%" />
        </asp:BoundField>
        <asp:BoundField DataField="ClientName" HeaderText="Client Name" 
            SortExpression="ClientName" >
        <ItemStyle Width="30%" />
        </asp:BoundField>
        <asp:BoundField DataField="ProjectName" HeaderText="Project Name" SortExpression="ProjectName" >
            <itemstyle width="35%" />
        </asp:BoundField>
        <asp:BoundField DataField="ClientDepartment" HeaderText="Client Department" 
            SortExpression="ClientDepartment">
            <ItemStyle Width="20%" />
        </asp:BoundField>
        <asp:BoundField DataField="AccountEmployeeId" HeaderText="AccountEmployeeId" InsertVisible="False"
            ReadOnly="True" SortExpression="AccountEmployeeId" Visible="False">
            <itemstyle width="0%" />
        </asp:BoundField>
        <asp:BoundField DataField="AccountProjectEmployeeId" HeaderText="AccountProjectEmployeeId"
            InsertVisible="False" ReadOnly="True" SortExpression="AccountProjectEmployeeId"
            Visible="False">
            <itemstyle width="0%" />
        </asp:BoundField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Selected %>">
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <ItemStyle HorizontalAlign="Center" Width="8%" verticalalign="Middle" />
        <HeaderTemplate>
            <asp:CheckBox ID="chkCheckAll" runat="server" __designer:wfdid="w109" />
        </HeaderTemplate>
    <ItemTemplate>
        &nbsp; <asp:CheckBox id="chkSelect" runat="server" __designer:wfdid="w109" 
            Checked='<%# IIF(Isdbnull(Eval("AccountProjectEmployeeId")),"False","True") %>'></asp:CheckBox> 
</ItemTemplate>
    </asp:TemplateField>
    </Columns>
</x:GridView>
<asp:Button ID="Update" runat="server" Text="<%$ Resources:TimeLive.Web, Update_text%> " /><br />
<asp:ObjectDataSource ID="dsAccountProjectEmployee" runat="server" OldValuesParameterFormatString="original_{0}"
    OnInserting="dsAccountProjectEmployee_Inserting" SelectMethod="GetvueAccountEmployeeProjectByAccountIdandAccountEmployeeId"
    TypeName="AccountProjectEmployeeBLL" DeleteMethod="DeleteAccountProjectEmployeeId" InsertMethod="AddAccountProjectEmployee" UpdateMethod="UpdateAccountProjectEmployee">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
            Type="Int32" />
        <asp:QueryStringParameter DefaultValue="151" Name="AccountEmployeeId" QueryStringField="AccountEmployeeId"
            Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountProjectEmployeeId" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="AccountProjectId" Type="Int32" />
        <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
        <asp:Parameter Name="AccountRoleId" Type="Int32" />
        <asp:Parameter Name="AccountBillingRateId" Type="Int32" />
        <asp:Parameter Name="Original_AccountProjectEmployeeId" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="AccountProjectId" Type="Int32" />
        <asp:Parameter Name="AccountEmployeeId" Type="Int32" />
        <asp:Parameter Name="AccountRoleId" Type="Int32" />
        <asp:Parameter Name="AccountBillingRateId" Type="Int32" />
    </InsertParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsFilledAccountProjectEmployee" runat="server" OldValuesParameterFormatString="original_{0}"
    OnInserting="dsAccountProjectEmployee_Inserting" SelectMethod="GetFilledRowsOfAccountProjectEmployee"
    TypeName="AccountProjectEmployeeBLL">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="1" Name="AccountProjectId" QueryStringField="AccountProjectId"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsAccountCurrencyObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetvueAccountCurrencyByAccountIdAndDisabled" TypeName="AccountCurrencyBLL">
    <SelectParameters>
        <asp:SessionParameter Name="AccountId" SessionField="AccountId" Type="Int32" />
        <asp:Parameter Name="AccountCurrencyId" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
