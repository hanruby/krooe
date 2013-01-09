<%@ control language="VB" autoeventwireup="false" inherits="Authenticate_Controls_ctlPasswordChange, App_Web_m01bsgis" %>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<table width="500" class="member" border="1" style="border-color :Black " cellpadding="0" cellspacing="0" align ="center" valign ="middle">
 
    <tr>
        <td class="heading" colspan="2" style="height: 21px"  valign="middle" align="center"  >
            TimeLive - You must change your password.</td>
    </tr>

    <tr>
        <td align="right" class="FormViewLabelCell" style="width: 65px; height: 30px">
            Current Password:</td>
        <td style="width: 65%">
            <asp:TextBox ID="txtCurrentPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCurrentPassword"
                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td align="right" class="FormViewLabelCell" style="width: 65px; height: 30px">
            New Password:
        </td>
        <td style="width: 65%">
            <asp:TextBox ID="txtNewPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword"
                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNewPassword"
                Display="Dynamic" SkinID="PasswordValidator" ValidationExpression="(?=^.{8,}$)(?=.*\d)(?=.*\W+)(?![.\n]).*$"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td align="right" class="FormViewLabelCell" style="width: 65px; height: 30px">
            Re-Type Password:
        </td>
        <td style="width: 65%">
            <asp:TextBox ID="txtReTypePassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtReTypePassword"
                CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtReTypePassword"
                                ControlToValidate="txtNewPassword" CssClass="ErrorMessage" ErrorMessage="(Mismatch)" Display="Dynamic"></asp:CompareValidator>
                               </td>
    </tr>
    <tr>
        <td align="right" class="FormViewLabelCell" style="width: 35%">
        </td>
        <td style="width: 65%">
            <asp:Button ID="btnPassword" runat="server" Text="Change Password And Login" /></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblIncorrect" runat="server" Text="Incorrect current password."
                Visible="False" CssClass="ErrorMessage" Width="100%" Font-Bold="True" Font-Size="Larger"></asp:Label><asp:Label ID="lblSameError" runat="server" Text="The New Password cannot be the same as the Current Password. Please enter a new password."
                Visible="False" ForeColor="Red" Width="100%" Font-Bold="True" Font-Size="Larger"></asp:Label></td>
    </tr>
</table>
