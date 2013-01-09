<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlOtherRecent.ascx.vb" Inherits="Employee_Controls_ctlOtherRecent" %>
<x:GridView ID="G" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("My Task Summary") %>'
     DataSourceID="dsProjectTaskCount" SkinID="xgridviewSkinEmployee" Width="100%">
    <Columns>
        <asp:TemplateField>
            <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w10"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Project") %>' CommandArgument="ProjectCode" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Bind("ProjectCode") %>' __designer:wfdid="w9"></asp:Label> 
</itemtemplate>
            <itemstyle width="40%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("Status") %>' __designer:wfdid="w13"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Status") %>' CommandArgument="Status" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("Status") %>' __designer:wfdid="w12"></asp:Label> 
</itemtemplate>
            <itemstyle width="40%" />
        </asp:TemplateField>
        <asp:TemplateField>
            <edititemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Eval("Count") %>' __designer:wfdid="w16"></asp:Label> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Count") %>' CommandArgument="Count" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemtemplate>
<asp:Label id="Label3" runat="server" Text='<%# Bind("Count") %>' __designer:wfdid="w15"></asp:Label> 
</itemtemplate>
            <itemstyle horizontalalign="Center" width="20%" />
        </asp:TemplateField>
    </Columns>
</x:GridView>
<asp:ObjectDataSource ID="dsProjectTaskCount" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetDataForMyProjectTasksCount" TypeName="TimeLiveDataSetTableAdapters.MyProjectTasksCountTableAdapter">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
