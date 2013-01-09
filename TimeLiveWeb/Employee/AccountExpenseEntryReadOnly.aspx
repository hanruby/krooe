<%@ Page Language="VB" AutoEventWireup="false" title="TimeLive - Expense Entry Read-only" CodeFile="AccountExpenseEntryReadOnly.aspx.vb" Inherits="Employee_AccountExpenseEntryReadOnly" Theme="SkinFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Src="Controls/ctlAccountExpenseEntryReadOnly.ascx" TagName="ctlAccountExpenseEntryReadOnly"
    TagPrefix="uc1" %>
    
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="../Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:ctlAccountExpenseEntryReadOnly ID="CtlAccountExpenseEntryReadOnly2" runat="server" />
           </div>
    </form>
</body>
</html>
