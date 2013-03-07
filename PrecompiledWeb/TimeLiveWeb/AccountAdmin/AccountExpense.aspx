<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountExpense, App_Web_ivwc32h1" title="TimeLive - Expense" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountExpenseList.ascx" TagName="ctlAccountExpenseList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountExpenseList ID="CtlAccountExpenseList1" runat="server" />
</asp:Content>

