<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AccountExpenseEntry, App_Web_pv0uxbk0" title="TimeLive - My Expense Sheet" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountExpenseSheetList.ascx" TagName="ctlAccountExpenseSheetList"
    TagPrefix="uc1" %>


<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountExpenseSheetList ID="CtlAccountExpenseSheetList1" runat="server" />
   
</asp:Content>

