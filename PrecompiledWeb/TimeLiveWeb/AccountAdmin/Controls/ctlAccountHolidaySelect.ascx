<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountHolidaySelect, App_Web_j1ru2ref" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
<x:GridView id="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Holiday List%>" CssClass="TableView" DataSourceID="dsHolidaySelectObject" SkinID="xgridviewSkinEmployee" Width="98%" DataKeyNames="MasterHolidayTypeId,HolidayType" OnRowDataBound="GridView1_RowDataBound" OnDataBound="GridView1_DataBound"><Columns>
<asp:BoundField DataField="HolidayType" HeaderText="<%$ Resources:TimeLive.Web, Holidays%>" SortExpression="HolidayType">
<ItemStyle Width="90%"></ItemStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Selected_text %>"><ItemTemplate>
<asp:CheckBox id="chkSelected" runat="server" __designer:wfdid="w5"></asp:CheckBox> 
</ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
</asp:TemplateField>
</Columns>

<HeaderStyle BorderColor="Black"></HeaderStyle>
</x:GridView><TABLE style="WIDTH: 98%" __designer:dtid="9851624184872966"><TBODY><TR __designer:dtid="9851624184872967"><TD align=left __designer:dtid="9851624184872973"><asp:Button id="btnAdd" onclick="btnAdd_Click" runat="server" Width="60px" Text="<%$ Resources:TimeLive.Web, Update_text%>" __designer:wfdid="w3"></asp:Button></TD></TR></TBODY></TABLE><asp:ObjectDataSource id="dsHolidaySelectObject" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetvueMasterHolidaySelect" TypeName="AccountHolidayTypeBLL" InsertMethod="AddAccountHolidaySelect"><InsertParameters>
<asp:Parameter Name="AccountId" Type="Int32"></asp:Parameter>
<asp:Parameter Name="MasterHolidayTypeId"></asp:Parameter>
<asp:Parameter Name="HolidayType" Type="String"></asp:Parameter>
<asp:Parameter Name="CreatedOn" Type="DateTime"></asp:Parameter>
<asp:Parameter Name="CreatedByEmployeeId" Type="Int32"></asp:Parameter>
<asp:Parameter Name="ModifiedOn" Type="DateTime"></asp:Parameter>
<asp:Parameter Name="ModifiedByEmployeeId" Type="Int32"></asp:Parameter>
</InsertParameters>
</asp:ObjectDataSource> 
</ContentTemplate>
</asp:UpdatePanel>
