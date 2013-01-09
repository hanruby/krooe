<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlProjectView.ascx.vb" Inherits="ProjectAdmin_Controls_ctlProjectView" %>
<table class="xFormView" style="width: 500px">
    <tr>
        <td class="caption" colspan="4">
            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Project Information%> " /></td>
    </tr>
    <tr>
        <td align="right" class="formviewlabelcell" style="width: 20%">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Project Id:%> " /></td>
        <td align="left" style="width: 30%">
            <asp:TextBox ID="txtProjectId" runat="server" ReadOnly="True" Width="75px"></asp:TextBox>
        </td>
        <td align="right" class="formviewlabelcell" style="width: 20%">
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Project Code:%> " /></td>
        <td align="left" style="width: 30%">
            <asp:TextBox ID="txtProjectCode" runat="server" ReadOnly="True" Width="125px"></asp:TextBox></td>
    </tr>
    <tr>
        <td align="right" class="formviewlabelcell" style="width: 20%">
            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Project Name:%> " /></td>
        <td align="left" colspan="3" style="width: 80%">
            <asp:TextBox ID="txtProjectName" runat="server" ReadOnly="True" Width="374px"></asp:TextBox></td>
    </tr>
</table>
