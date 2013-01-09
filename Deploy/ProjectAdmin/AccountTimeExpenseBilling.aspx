<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_AccountTimeExpenseBilling, App_Web_1c4dlxqz" title="TimeLive - Time Expense Billing" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTimeExpenseBilling.ascx" TagName="ctlAccountTimeExpenseBilling"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTimeExpenseBilling ID="ctlAccountTimeExpenseBilling" runat="server" />
</asp:Content>


