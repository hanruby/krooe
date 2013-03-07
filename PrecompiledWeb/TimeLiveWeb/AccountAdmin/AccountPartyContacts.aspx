<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountPartyContacts, App_Web_ivwc32h1" title="TimeLive - Client Contacts" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountPartyContactList.ascx" TagName="ctlAccountPartyContactList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountPartyContactList ID="CtlAccountPartyContactList1" runat="server" />
</asp:Content>

