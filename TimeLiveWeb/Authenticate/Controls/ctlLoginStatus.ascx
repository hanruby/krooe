<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlLoginStatus.ascx.vb" Inherits="Employee_Controls_ctlLoginStatus" EnableViewState="false" %>
        <%@ Register Src="~/Menus/Controls/ctlSiteMapPath.ascx" TagName="ctlSiteMapPath" TagPrefix="uc4" %>
    <table width=100% align=right>
    <tr>
        <td style="height: 24px" align=left >
        <uc4:ctlSiteMapPath ID="M" runat="server" />
        </td>
        <td style="height: 24px" align=right >
        <% If DBUtilities.IsTimeLiveMobileLogin() = False Then%>
            <asp:HyperLink ID="L" runat="server" NavigateUrl="~/Employee/EmployeeProfile.aspx">
        <asp:Image ID="I" runat="server" AlternateText="Profile" ImageUrl="~/Images/Profile.gif" ToolTip="Profile" />
            </asp:HyperLink>  
            <% End If%>
            <asp:Label ID="LN"  Font-Bold=true runat="server"  Text="<%$ Resources:TimeLive.Web, LoggedIn As:%>" ></asp:Label>
            <asp:Label ID="N"  Font-Bold=true Font-Underline=true runat="server"  Text=""></asp:Label>
        <asp:LoginStatus ID="S" runat="server"  Font-Bold=true  LogoutText="<%$ Resources:TimeLive.Web, Logout%>"  LogoutAction="Redirect" LogoutPageUrl="~/Authenticate/DoLogout.aspx" />
        </td>
    </tr>
</table>