<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountTaxCode, App_Web_yaqbagu1" title="TimeLive - Tax Code" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTaxCodeList.ascx" TagName="ctlAccountTaxCodeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTaxCodeList ID="CtlAccountTaxCodeList1" runat="server" />
</asp:Content>

