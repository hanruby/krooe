<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountParty, App_Web_yaqbagu1" title="TimeLive - Clients" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountPartyList.ascx" TagName="ctlAccountPartyList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountPartyList ID="CtlAccountPartyList1" runat="server" />
</asp:Content>

