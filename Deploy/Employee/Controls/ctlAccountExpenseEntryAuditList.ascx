<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlAccountExpenseEntryAuditList, App_Web_dsdjiwop" %>
<table cellpadding="2" cellspacing="2">
    <tr>
        <td style="width: 100px">
 <x:GridView ID="gvExpenseSheetAudit" runat="server" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Expense Sheet Audit %>" SkinID="xgridviewSkinEmployee" Width="800px" PageSize="500"><Columns>
     <asp:TemplateField>
         <edititemtemplate>
<asp:TextBox runat="server" Text='<%# Bind("UpdateDate") %>' id="TextBox1"></asp:TextBox>
</edititemtemplate>
         <itemtemplate>
<asp:Label runat="server" Text='<%# Bind("UpdateDate") %>' id="Label1"></asp:Label>
</itemtemplate>
         <itemstyle horizontalalign="Left" width="125px" />
     </asp:TemplateField>
<asp:BoundField DataField="PK" HeaderText="<%$ Resources:TimeLive.Web, Id %>" Visible="False">
<FooterStyle HorizontalAlign="Center"></FooterStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:BoundField>
<asp:TemplateField><EditItemTemplate>
<asp:TextBox id="TextBox2" runat="server" __designer:wfdid="w8" Text='<%# Bind("FieldName") %>'></asp:TextBox> 
</EditItemTemplate>
<HeaderTemplate>
<asp:Label id="lblFieldName" runat="server" __designer:wfdid="w9" Text='<%# ResourceHelper.GetFromResource("Field Name") %>'></asp:Label> 
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="lblFieldName" runat="server" __designer:wfdid="w7" Text='<%# Bind("FieldName") %>'></asp:Label> 
</ItemTemplate>
    <itemstyle width="150px" />
</asp:TemplateField>
<asp:TemplateField><EditItemTemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("OldValue") %>' __designer:wfdid="w16"></asp:TextBox> 
</EditItemTemplate>
<HeaderTemplate>
<asp:Label id="lblOldValue" runat="server" Text='<%# ResourceHelper.GetFromResource("Old Value") %>' __designer:wfdid="w17"></asp:Label> 
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="lblOldValue" runat="server" Text='<%# Bind("OldValue") %>' __designer:wfdid="w15"></asp:Label> 
</ItemTemplate>

<ItemStyle HorizontalAlign="Left" width="200px"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField><EditItemTemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("NewValue") %>' __designer:wfdid="w19"></asp:TextBox> 
</EditItemTemplate>
<HeaderTemplate>
<asp:Label id="lblNewValue" runat="server" Text='<%# ResourceHelper.GetFromResource("New Value") %>' __designer:wfdid="w20"></asp:Label> 
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="lblNewValue" runat="server" Text='<%# Bind("NewValue") %>' __designer:wfdid="w18"></asp:Label> 
</ItemTemplate>

<ItemStyle HorizontalAlign="Left" width="200px"></ItemStyle>
</asp:TemplateField>
<asp:BoundField DataField="UpdateBy" HeaderText="<%$ Resources:TimeLive.Web, Update By %>" >
    <itemstyle horizontalalign="Left" width="150px" />
</asp:BoundField>
</Columns>
</x:GridView>
         <asp:ObjectDataSource ID="dsAccountEmployeeExpenseSheetAuditGridViewObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountEmployeeExpenseSheetAuditByEmployeeExpenseSheetId" TypeName="AccountExpenseEntryAuditBLL">
            <SelectParameters>
                <asp:QueryStringParameter Name="AccountEmployeeExpenseSheetId" QueryStringField="AccountEmployeeExpenseSheetId"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
            <br />
<x:gridview id="gvExpenseEntryAudit" runat="server" autogeneratecolumns="False" caption="<%$ Resources:TimeLive.Web, Expense Entry Audit %>"  skinid="xgridviewSkinEmployee"
    width="1295px" PageSize="500"><Columns>
        <asp:TemplateField>
            <edititemtemplate>
<asp:TextBox runat="server" Text='<%# Bind("UpdateDate") %>' id="TextBox1"></asp:TextBox>
</edititemtemplate>
            <itemtemplate>
<asp:Label runat="server" Text='<%# Bind("UpdateDate") %>' id="Label1"></asp:Label>
</itemtemplate>
            <itemstyle horizontalalign="Left" width="125px" />
        </asp:TemplateField>
        <asp:BoundField DataField="ProjectName" HeaderText="<%$ Resources:TimeLive.Web, Project Name %>" >
            <itemstyle width="200px" />
        </asp:BoundField>
        <asp:BoundField DataField="AccountExpenseName" HeaderText="<%$ Resources:TimeLive.Web, Expense Name %>" >
            <itemstyle width="200px" />
        </asp:BoundField>
        <asp:BoundField DataField="Amount" HeaderText="<%$ Resources:TimeLive.Web, Amount %>"  DataFormatString="{0:N}">
            <itemstyle width="70px" horizontalalign="Center" />
        </asp:BoundField>
<asp:BoundField DataField="PK" HeaderText="<%$ Resources:TimeLive.Web, Id %>" Visible="False">
<FooterStyle HorizontalAlign="Center"></FooterStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:BoundField>
<asp:TemplateField><EditItemTemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("FieldName") %>' __designer:wfdid="w3"></asp:TextBox> 
</EditItemTemplate>
<HeaderTemplate>
<asp:Label id="lblFieldName" runat="server" Text='<%# ResourceHelper.GetFromResource("Field Name") %>' __designer:wfdid="w4"></asp:Label> 
</HeaderTemplate>
<ItemTemplate >
<asp:Label id="lblFieldName" runat="server" Text='<%# Bind("FieldName") %>' __designer:wfdid="w2"></asp:Label> 
</ItemTemplate>
    <itemstyle width="150px" />
</asp:TemplateField>
<asp:TemplateField><EditItemTemplate>
<asp:TextBox id="TextBox3" runat="server" Text='<%# Bind("OldValue") %>' __designer:wfdid="w6"></asp:TextBox> 
</EditItemTemplate>
<HeaderTemplate>
<asp:Label id="lblOldValue" runat="server" Text='<%# ResourceHelper.GetFromResource("Old Value") %>' __designer:wfdid="w7"></asp:Label> 
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="lblOldValue" runat="server" Text='<%# Bind("OldValue") %>' __designer:wfdid="w5"></asp:Label> 
</ItemTemplate>

<ItemStyle HorizontalAlign="Left" width="200px"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField><EditItemTemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("NewValue") %>' __designer:wfdid="w9"></asp:TextBox> 
</EditItemTemplate>
<HeaderTemplate>
<asp:Label id="lblNewValue" runat="server" Text='<%# ResourceHelper.GetFromResource("New Value") %>' __designer:wfdid="w10"></asp:Label> 
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="lblNewValue" runat="server" Text='<%# Bind("NewValue") %>' __designer:wfdid="w8"></asp:Label> 
</ItemTemplate>

<ItemStyle HorizontalAlign="Left" width="200px"></ItemStyle>
</asp:TemplateField>
<asp:BoundField DataField="UpdatedBy" HeaderText="<%$ Resources:TimeLive.Web, Updated By %>" >
    <itemstyle width="150px" />
</asp:BoundField>
</Columns>
</x:gridview>
<asp:ObjectDataSource ID="dsAccountExpenseEntryAuditGridViewObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAccountExpenseEntryAuditByEmployeeExpenseSheetId" TypeName="AccountExpenseEntryAuditBLL">
    <SelectParameters>
        <asp:QueryStringParameter Name="AccountEmployeeExpenseSheetId" QueryStringField="AccountEmployeeExpenseSheetId" />
    </SelectParameters>
</asp:ObjectDataSource>
        </td>
    </tr>
</table>
