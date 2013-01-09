<%@ Page Language="VB" AutoEventWireup="false"  title="TimeLive - AccountProjectAttachments" CodeFile="AccountProjectAttachmentsPopUp.aspx.vb" Inherits="ProjectAdmin_AccountProjectAttachmentsPopUp" %>
<%@ Register Src="Controls/ctlAccountProjectAttachmentList.ascx" TagName="ctlAccountProjectAttachmentList"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
       <link href="../Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager runat="server" ID="ScriptManager2" >
    </asp:ScriptManager>
     <uc1:ctlAccountProjectAttachmentList ID="CtlAccountProjectAttachmentList1" runat="server" />
    </div>
    </form>
</body>
</html>
