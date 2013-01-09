<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AccountExpenseEntryAudit, App_Web_pv0uxbk0" title="TimeLive - Expense Sheet Audit" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountExpenseEntryAuditList.ascx" TagName="ctlAccountExpenseEntryAuditList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountExpenseEntryAuditList ID="CtlAccountExpenseEntryAuditList1" runat="server" />
</asp:Content>

