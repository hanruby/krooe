<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlAccountPagePermissionList.ascx.vb" Inherits="AccountAdmin_Controls_ctlAccountPagePermissionList" %>
<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="c1i" %>
<%@ Register Assembly="eWorld.UI.Compatibility, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI.Compatibility" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <%If Me.GridView1.Visible <> False Then%>
        <table class="xFormView" width="98%">
            <tr>
                <td class="HighlightedText" style="width:100px; height: 24px;">
                    <asp:Label ID="lblSelectRole" runat="server" Text="<%$ Resources:TimeLive.Web, Select Role %> "></asp:Label></td>
                <td style="height: 24px">
        <asp:DropDownList ID="ddlAccountRoleId" runat="server" DataSourceID="dsAccountRoleObject"
            DataTextField="Role" DataValueField="AccountRoleId" AutoPostBack="True" OnSelectedIndexChanged="ddlAccountRoleId_SelectedIndexChanged" Width="250px">
        </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="HighlightedText" style="width:100px;">
                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:TimeLive.Web, Default Page%> "></asp:Label></td>
                <td>
<asp:DropDownList ID="ddlDefaultAccountPageId" runat="server"
    DataTextField="SystemCategoryPageDescription" DataValueField="SystemSecurityCategoryPageId" Width="250px" AppendDataBoundItems="True">
    <asp:ListItem Selected="True" Text="<%$ Resources:TimeLive.Web, Select %>" Value="0"></asp:ListItem>
</asp:DropDownList></td>
            </tr>
        </table>
    <%End If%>
        <asp:ObjectDataSource ID="dsAccountRoleObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAccountRolesByAccountId"
            TypeName="AccountRoleBLL">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="64" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
<asp:ObjectDataSource ID="dsDefaultAccountPageObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetSystemSecurityCategoryPagesByIsSiteMapPage" TypeName="AccountPagePermissionBLL" DeleteMethod="DeleteAccountPagePermissionId" InsertMethod="UpdateAccountPagePermission">
    <DeleteParameters>
        <asp:Parameter Name="Original_AccountPagePermissionId" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="IsSiteMapPage" Type="Boolean" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="AccountId" Type="Int32" />
        <asp:Parameter Name="AccountRoleId" Type="Int32" />
        <asp:Parameter Name="SystemSecurityCategoryPageId" Type="Int32" />
        <asp:Parameter Name="SystemPermissionId" Type="Int32" />
        <asp:Parameter Name="ShowAllData" Type="Boolean" />
        <asp:Parameter Name="ShowMyData" Type="Boolean" />
        <asp:Parameter Name="ShowMyProjectsData" Type="Boolean" />
        <asp:Parameter Name="ShowMyTeamsData" Type="Boolean" />
        <asp:Parameter Name="TillDate" Type="DateTime" />
        <asp:Parameter Name="TillHours" Type="Int32" />
        <asp:Parameter Name="Original_AccountPagePermissionId" Type="Int32" />
        <asp:Parameter Name="IsDelete" Type="Boolean" />
    </InsertParameters>
</asp:ObjectDataSource>
        
<x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    DataKeyNames="SystemSecurityCategoryPageId,IsAllowList,IsAllowAdd,IsAllowEdit,IsAllowDelete,IsShowTillOptions,IsShowDataOptions" DataSourceID="dsAccountPagePermissionObject"
    PageSize="500" Caption="<%$ Resources:TimeLive.Web, Page Permissions %>" SkinID="xgridviewSkinEmployee" Width="98%">
    <Columns>
        <asp:TemplateField SortExpression="SystemSecurityCategory" HeaderText="<%$ Resources:TimeLive.Web, Category %>">
            <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("SystemSecurityCategory") %>' __designer:wfdid="w67"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Category") %>' CommandArgument="SystemSecurityCategory" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemstyle verticalalign="Middle" width="15%" />
            <itemtemplate>
<asp:Label id="Label4" runat="server" Text='<%#GetGlobalResourceObject("TimeLive.Web", Eval("SystemSecurityCategory"))%>' __designer:wfdid="w66"></asp:Label> 
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField InsertVisible="False" SortExpression="SystemSecurityCategoryPageId"
            Visible="False">
            <edititemtemplate>
<asp:Label id="Label1" runat="server" Text='<%# Eval("SystemSecurityCategoryPageId") %>' __designer:wfdid="w74"></asp:Label>
</edititemtemplate>
            <itemstyle width="0%" />
            <itemtemplate>
<asp:Label id="Label2" runat="server" Text='<%# Bind("SystemSecurityCategoryPageId") %>' __designer:wfdid="w73"></asp:Label>
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField SortExpression="SystemCategoryPageDescription" HeaderText="<%$ Resources:TimeLive.Web, Page Description %>">
            <edititemtemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("SystemCategoryPageDescription") %>' __designer:wfdid="w76"></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Page Description") %>' CommandArgument="SystemCategoryPageDescription" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemstyle verticalalign="Middle" width="25%" />
            <itemtemplate>
<asp:Label id="Label1" runat="server" Text='<%#GetGlobalResourceObject("TimeLive.Web", Eval("SystemCategoryPageDescription"))%>' __designer:wfdid="w75"></asp:Label> 
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Permissions %>">
            <headertemplate>
<asp:Label id="lblPermissions" runat="server" Text='<%# ResourceHelper.GetFromResource("Permissions") %>' __designer:wfdid="w25"></asp:Label> 
</headertemplate>
        
        

            <ItemStyle VerticalAlign="Middle" Width="40%" />
            <ItemTemplate>
<TABLE class="xTableWithoutBorder" cellSpacing=0 cellPadding=0 width="100%" border=0><TBODY><TR><TD style="WIDTH: 90px; HEIGHT: auto; TEXT-ALIGN: left" class="labeltext"><asp:CheckBox id="chkListView" runat="server" Text="<%$ Resources:TimeLive.Web, List / View %>" Width="90px" __designer:wfdid="w1"></asp:CheckBox></TD><TD style="WIDTH: 50px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkListViewShowAllData" runat="server" Text="<%$ Resources:TimeLive.Web, All%> " Width="50px" __designer:wfdid="w2"></asp:CheckBox></TD><TD style="WIDTH: 50px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkListViewShowMyData" runat="server" Text="<%$ Resources:TimeLive.Web, My%> " Width="50px" __designer:wfdid="w3"></asp:CheckBox></TD><TD style="WIDTH: 85px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkListViewShowMyProjectsData" runat="server" Text="<%$ Resources:TimeLive.Web, My Projects%> " Width="85px" __designer:wfdid="w4"></asp:CheckBox></TD><TD style="WIDTH: 75px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkListViewShowMyTeamsData" runat="server" Text="<%$ Resources:TimeLive.Web, My Teams%> " Width="75px" __designer:wfdid="w5"></asp:CheckBox></TD><TD style="WIDTH: 130px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkListViewShowMySubOrdinatesData" runat="server" Text="<%$ Resources:TimeLive.Web, My Sub-Ordinates%> " Width="130px" __designer:wfdid="w6"></asp:CheckBox></TD></TR><TR><TD style="WIDTH: 90px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkAdd" runat="server" Text="<%$ Resources:TimeLive.Web, Add_text %>" Width="90px" __designer:wfdid="w7"></asp:CheckBox></TD><TD style="WIDTH: 50px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkAddShowAllData" runat="server" Text="<%$ Resources:TimeLive.Web, All%> " Width="50px" __designer:wfdid="w8"></asp:CheckBox></TD><TD style="WIDTH: 50px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkAddShowMyData" runat="server" Text="<%$ Resources:TimeLive.Web, My%> " Width="50px" __designer:wfdid="w9"></asp:CheckBox></TD><TD style="WIDTH: 85px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkAddShowMyProjectsData" runat="server" Text="<%$ Resources:TimeLive.Web, My Projects%> " Width="85px" __designer:wfdid="w10"></asp:CheckBox></TD><TD style="WIDTH: 75px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkAddShowMyTeamsData" runat="server" Text="<%$ Resources:TimeLive.Web, My Teams%> " Width="75px" __designer:wfdid="w11"></asp:CheckBox></TD><TD style="WIDTH: 130px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkAddShowMySubOrdinatesData" runat="server" Text="<%$ Resources:TimeLive.Web, My Sub-Ordinates%> " Width="130px" __designer:wfdid="w12"></asp:CheckBox></TD></TR><TR><TD style="WIDTH: 90px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkEdit" runat="server" Text="<%$ Resources:TimeLive.Web, Edit_text %>" Width="90px" __designer:wfdid="w13"></asp:CheckBox></TD><TD style="WIDTH: 50px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkEditShowAllData" runat="server" Text="<%$ Resources:TimeLive.Web, All%> " Width="50px" __designer:wfdid="w14"></asp:CheckBox></TD><TD style="WIDTH: 50px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkEditShowMyData" runat="server" Text="<%$ Resources:TimeLive.Web, My%> " Width="50px" __designer:wfdid="w15"></asp:CheckBox></TD><TD style="WIDTH: 85px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkEditShowMyProjectsData" runat="server" Text="<%$ Resources:TimeLive.Web, My Projects%> " Width="85px" __designer:wfdid="w16"></asp:CheckBox></TD><TD style="WIDTH: 75px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkEditShowMyTeamsData" runat="server" Text="<%$ Resources:TimeLive.Web, My Teams%> " Width="75px" __designer:wfdid="w17"></asp:CheckBox></TD><TD style="WIDTH: 130px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkEditShowMySubOrdinatesData" runat="server" Text="<%$ Resources:TimeLive.Web, My Sub-Ordinates%> " Width="130px" __designer:wfdid="w18"></asp:CheckBox></TD></TR><TR><TD style="WIDTH: 90px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkDelete" runat="server" Text="<%$ Resources:TimeLive.Web, Delete_text%> " Width="90px" __designer:wfdid="w19"></asp:CheckBox></TD><TD style="WIDTH: 50px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkDeleteShowAllData" runat="server" Text="<%$ Resources:TimeLive.Web, All%> " Width="50px" __designer:wfdid="w20"></asp:CheckBox></TD><TD style="WIDTH: 50px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkDeleteShowMyData" runat="server" Text="<%$ Resources:TimeLive.Web, My%> " Width="50px" __designer:wfdid="w21"></asp:CheckBox></TD><TD style="WIDTH: 85px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkDeleteShowMyProjectsData" runat="server" Text="<%$ Resources:TimeLive.Web, My Projects%> " Width="85px" __designer:wfdid="w22"></asp:CheckBox></TD><TD style="WIDTH: 75px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkDeleteShowMyTeamsData" runat="server" Text="<%$ Resources:TimeLive.Web, My Teams%> " Width="75px" __designer:wfdid="w23"></asp:CheckBox></TD><TD style="WIDTH: 130px; HEIGHT: auto; TEXT-ALIGN: left" class="formviewlabelcell"><asp:CheckBox id="chkDeleteShowMySubOrdinatesData" runat="server" Text="<%$ Resources:TimeLive.Web, My Sub-Ordinates%> " Width="130px" __designer:wfdid="w24"></asp:CheckBox></TD></TR></TBODY></TABLE>
</ItemTemplate>
        </asp:TemplateField>
    </Columns>
</x:GridView>
        <asp:ObjectDataSource ID="dsAccountPagePermissionObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetSystemSecurityCategoryPageView" TypeName="AccountPagePermissionBLL" DeleteMethod="DeleteAccountPagePermissionId">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccountPagePermissionId" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="55" Name="AccountId" SessionField="AccountId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="<%$ Resources:TimeLive.Web, Update_text%> " Width="68px" />
    </ContentTemplate>
</asp:UpdatePanel>
