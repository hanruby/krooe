<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountTaxZone, App_Web_ivwc32h1" title="TimeLive - Tax Zone" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTaxZoneList.ascx" TagName="ctlAccountTaxZoneList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTaxZoneList ID="CtlAccountTaxZoneList1" runat="server" />
</asp:Content>

