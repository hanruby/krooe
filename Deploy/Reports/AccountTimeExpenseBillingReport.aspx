<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_AccountTimeExpenseBillingReport, App_Web_ewyvs0tt" title="TimeLive - Account Time Expense Billing Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<%@ Register Src="ControlsViewer/AccountTimeExpenseBillingReport.ascx" TagName="AccountTimeExpenseBillingReport"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:AccountTimeExpenseBillingReport ID="AccountTimeExpenseBillingReport1" runat="server" />
</asp:Content>
