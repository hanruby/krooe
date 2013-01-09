<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountPaymentMethod, App_Web_yaqbagu1" title="TimeLive - Payment Method" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountPaymentMethodList.ascx" TagName="ctlAccountPaymentMethodList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountPaymentMethodList ID="CtlAccountPaymentMethodList1" runat="server" />
</asp:Content>

