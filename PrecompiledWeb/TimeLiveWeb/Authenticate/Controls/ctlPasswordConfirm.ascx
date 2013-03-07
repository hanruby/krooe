<%@ control language="VB" autoeventwireup="false" inherits="Authenticate_Controls_ctlPasswordConfirm, App_Web_tjqiwiyi" %>
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
    </table>
