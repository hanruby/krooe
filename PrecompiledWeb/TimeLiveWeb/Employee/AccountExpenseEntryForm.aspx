<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AccountExpenseEntryForm, App_Web_v0exk3tf" title="TimeLive - My Expense Entries" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlAccountExpenseEntryList.ascx" TagName="ctlAccountExpenseEntryList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
 <uc1:ctlAccountExpenseEntryList ID="CtlAccountExpenseEntryList1" runat="server" />
</asp:Content>

