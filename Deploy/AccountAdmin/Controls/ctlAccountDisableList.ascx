<%@ control language="VB" autoeventwireup="false" inherits="AccountAdmin_Controls_ctlAccountDisableList, App_Web_yhen42r4" %>
<table style="width: 600px" class="xFormView">
    <tr>
        <td colspan="2" class="caption">
            
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Disable Your Account%> " /></td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <span style="color: red; font-size: 13px; font-family: Tahoma;"><strong>
            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Disabling account will stop any activities in your TimeLive account. Your employee will not be able to login in TimeLive. %> " />
            </td>
            
            
    </tr>
    <tr>
        <td align="right" style="width: 200px">
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Administrator Username:%> " /></td>
        <td style="width: 400px">
            <asp:TextBox ID="UserNameTextBox" runat="server" Width="207px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserNameTextBox"
                CssClass="ErrorMessage" ErrorMessage="*"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td align="right" style="width: 200px">
            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Administrator Password:%> " /></td>
        </td>
        <td style="width: 400px">
            <asp:TextBox ID="PasswordTextBox" runat="server" Width="207px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox"
                CssClass="ErrorMessage" ErrorMessage="*"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td align="right" style="width: 200px">
        </td>
        <td style="width: 400px">
            <asp:Button ID="btnDisabled" runat="server" Text="<%$ Resources:TimeLive.Web, Disable My Account%> " Width="150px" OnClientClick="return confirm('Are you sure you want to disable this account?');" /></td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Names="Tahoma" Font-Size="Smaller" ForeColor="Red"
                Text="<%$ Resources:TimeLive.Web, Invalid username or password%> " Visible="False"></asp:Label></td>
    </tr>
</table>
