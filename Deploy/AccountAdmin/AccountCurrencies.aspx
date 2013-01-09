<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountCurrencies, App_Web_yaqbagu1" title="TimeLive - Currencies" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountCurrenciesList.ascx" TagName="ctlAccountCurrenciesList" TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountCurrenciesList ID="CtlAccountCurrenciesList1" runat="server" />
</asp:Content>

