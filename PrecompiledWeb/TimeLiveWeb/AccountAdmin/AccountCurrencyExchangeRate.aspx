<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountCurrencyExchangeRate, App_Web_ivwc32h1" title="TimeLive - Exchange Rate" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountCurrencyExchangeRateList.ascx" TagName="AccountCurrencyExchangeRateList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:AccountCurrencyExchangeRateList ID="AccountCurrencyExchangeRateList1" runat="server" />
</asp:Content>

