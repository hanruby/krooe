<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountExpenseType, App_Web_yaqbagu1" title="TimeLive - Expense Type" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountExpenseTypeList.ascx" TagName="ctlAccountExpenseTypeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountExpenseTypeList ID="CtlAccountExpenseTypeList1" runat="server" />
</asp:Content>

