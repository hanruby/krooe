<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlLogin.ascx.vb" Inherits="Auth_Controls_ctlLogin1" %>

<style type="text/css">
    .style1
    {
        height: 27px;
    }
    .style2
    {
        height: 45px;
    }
    .btn {
  display: inline-block;
  *border-left: 1px solid #cccccc;
        border-right: 1px solid #cccccc;
        border-top: 1px solid #cccccc;
        border-bottom: 1px solid #b3b3b3;
        display: inline;
  /* IE7 inline-block hack */

  *zoom: 1;
        padding: 4px 10px 4px;
        margin-bottom: 0;
        font-size: 12px;
        line-height: 18px;
        color: #FFFFFF;
        text-align: center;
        text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
        vertical-align: middle;
        background-color: #f5f5f5;
        background-repeat: repeat-x;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        cursor: pointer;
        margin-left: .3em;
        background-image: linear-gradient(top, #ffffff, #e6e6e6);
    }
.btn:hover,
.btn:active,
.btn.active,
.btn.disabled,
.btn[disabled] {
  background-color: #e6e6e6;
}
.btn:active,
.btn.active {
  background-color: #cccccc \9;
}
.btn:first-child {
  *margin-left: 0;
}
.btn:hover {
  color: #FFFFFF;
  text-decoration: none;
  background-color: #e6e6e6;
  background-position: 0 -15px;
  -webkit-transition: background-position 0.1s linear;
  -moz-transition: background-position 0.1s linear;
  -ms-transition: background-position 0.1s linear;
  -o-transition: background-position 0.1s linear;
  transition: background-position 0.1s linear;
}
.btn:focus {
  outline: thin dotted #333;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}
.btn.active,
.btn:active {
  background-image: none;
  -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
  -moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
  box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.05);
  background-color: #e6e6e6;
  background-color: #d9d9d9 \9;
  outline: 0;
}
.btn.disabled,
.btn[disabled] {
  cursor: default;
  background-image: none;
  background-color: #e6e6e6;
  opacity: 0.65;
  filter: alpha(opacity=65);
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
}
.btn-primary {
  background-color: #0074cc;
  background-repeat: repeat-x;
        background-image: linear-gradient(top, #0088cc, #0055cc);
        border-left-color: #0055cc;
        border-right-color: #0055cc;
        border-top-color: #0055cc;
        border-bottom-color: #003580;
    }
.btn-primary:hover,
.btn-primary:active,
.btn-primary.active,
.btn-primary.disabled,
.btn-primary[disabled] {
  background-color: #0055cc;
}
.btn-primary:active,
.btn-primary.active {
  background-color: #004099 \9;
}
.btn-info {
  background-color: #49afcd;
  background-repeat: repeat-x;
        background-image: linear-gradient(top, #5bc0de, #2f96b4);
        border-left-color: #2f96b4;
        border-right-color: #2f96b4;
        border-top-color: #2f96b4;
        border-bottom-color: #1f6377;
    }
.btn-info:hover,
.btn-info:active,
.btn-info.active,
.btn-info.disabled,
.btn-info[disabled] {
  background-color: #2f96b4;
}
.btn-info:active,
.btn-info.active {
  background-color: #24748c \9;
}
</style>

<asp:Login ID="Login1" runat="server" Width="586px" Height="75px">
    <LayoutTemplate>

<head>
    <link href="MainLnk/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="MainLnk/bootstrap.js" type="text/javascript"></script>
    <script src="MainLnk/jquery-1.8.1.js" type="text/javascript"></script>
</head>

<body>
<header>
  <div class="container">
    <h1 style="margin-left: 75px; font-size: 42; color: #8DCBD2; letter-spacing: -0.08em; font-weight: bold; width: 108px;">krooe</h1>
    <p class="lead" 
          style="margin-left: 100px; font-size: 18; letter-spacing: -0.05em; height: 30px; width: 400px;">Timesheets. Expenses. Coordination.</p>
    <h4 style="margin-left: 150px; font-size: 14; letter-spacing: -0.05em; height: 24px; width: 400px;"> crew, n. (kroo-e) A group of people working together;</h4>
  </div>
</header>

<table>
     <tr>
         <td  colspan="2" class="heading" style="color:White"><asp:Literal ID="TimeLiveLogin" runat="server" Text="TimeLive Login" /></td>
     </tr>
    <tr>
                        <td class="style1">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email</asp:Label>
                        </td>
                        <tr>
                            <td colspan="2" style="height: 24px">
                                <asp:TextBox ID="UserName" runat="server" CssClass="txtBox" Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" CssClass="ErrorMessage" Display="Dynamic" 
                                    ErrorMessage="User Name is required." 
                                    ToolTip="<%$ Resources:TimeLive.Web, Username is required.%> " 
                                    ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style1" colspan="2">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="style2">
                                <asp:TextBox ID="Password" runat="server" CssClass="txtBox" TextMode="Password" 
                                    Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <div>
                            <tr>
                                <td class="style2">
                                    <asp:Button ID="Button1" runat="server" CommandName="Login" class="btn btn-info" 
                                        Text="Login" ValidationGroup="ctl00$Login1" />&nbsp;
                                        <asp:Button ID="Button2" runat="server" class="btn btn-primary" onclick="Button2_Click" 
                                        Text="Sign Up" />
                                </td>
                            </tr>
                        </div>
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:DropDownList ID="ddlUserInterfaceLanguage" runat="server" 
                                        AppendDataBoundItems="True" Width="205px">
                                        <asp:ListItem Value="0">Use Default Language</asp:ListItem>
                                        <asp:ListItem Value="en-US">English (United States)</asp:ListItem>
                                        <asp:ListItem Value="de-DE">German (Germany)</asp:ListItem>
                                        <asp:ListItem Value="fr-FR">French (France)</asp:ListItem>
                                        <asp:ListItem Value="zh-CN">Chinese (Simplified, PRC)</asp:ListItem>
                                        <asp:ListItem Value="it-IT">Italian (Italy)</asp:ListItem>
                                        <asp:ListItem Value="nl-NL">Dutch (Netherlands)</asp:ListItem>
                                        <asp:ListItem Value="es-ES">Spanish (Spain)</asp:ListItem>
                                        <asp:ListItem Value="sv-SE">Swedish (Sweden)</asp:ListItem>
                                        <asp:ListItem Value="pt-PT">Portuguese (Portugal)</asp:ListItem>
                                        <asp:ListItem Value="nn-NO">Norwegian, Nynorsk (Norway)</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td colspan="2">
                                    <a href="Authenticate/PasswordReset.aspx" target="_blank">
                                    <asp:Literal ID="Literal5" runat="server" 
                                        Text="<%$ Resources:TimeLive.Web, Forgot Your Password? Click Here%> " />
                                    </a>
                                </td>
                        </tr>
                            
                        </tr>
                        
</table>
<div class="span10 offset1">
                                        <footer>
                                            <h6 style="color: #000000">
                                                Krooe © 2012 | us@krooe.com</h6>
                                        </footer>
                                </div>
        </body></LayoutTemplate></asp:Login>