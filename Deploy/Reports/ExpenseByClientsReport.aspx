<%@ page language="VB" masterpagefile="~/Masters/MasterPageemployee.master" autoeventwireup="false" inherits="Reports_ExpenseByClientsReport, App_Web_ewyvs0tt" title="TimeLive - Expense By Clients Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlExpenseByClientReport.ascx" TagName="ctlExpenseByClientReport"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlExpenseByClientReport ID="CtlExpenseByClientReport1" runat="server" />
</asp:Content>

