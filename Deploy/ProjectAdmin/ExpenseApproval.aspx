<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_ExpenseApproval, App_Web_1c4dlxqz" title="TimeLive - Expense Approval" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountExpenseEntryApproval.ascx" TagName="ctlAccountExpenseEntryApproval"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountExpenseEntryApproval ID="CtlAccountExpenseEntryApproval1" runat="server" />
</asp:Content>

