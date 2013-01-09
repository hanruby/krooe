<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_DetailExpenseReport, App_Web_ewyvs0tt" title="TimeLive - Detail Expense Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlDetailExpenseReport.ascx" TagName="ctlDetailExpenseReport"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlDetailExpenseReport ID="CtlDetailExpenseReport1" runat="server" />
</asp:Content>

