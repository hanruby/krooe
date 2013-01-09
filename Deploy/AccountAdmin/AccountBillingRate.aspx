<%@ page language="VB" masterpagefile="~/Masters/MasterPageemployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountBillingRate, App_Web_yaqbagu1" title="TimeLive - Billing Rate" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountBillingRateList.ascx" TagName="ctlAccountBillingRateList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountBillingRateList ID="CtlAccountBillingRateList1" runat="server" />
</asp:Content>

