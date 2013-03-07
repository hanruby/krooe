<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_TimeBillingWorksheet, App_Web_nvpfcf1t" title="TimeLive - Time Billing Worksheet" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlTimeBillingWorksheet.ascx" TagName="ctlTimeBillingWorksheet"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlTimeBillingWorksheet ID="ctlTimeBillingWorksheet1" runat="server" />
</asp:Content>

