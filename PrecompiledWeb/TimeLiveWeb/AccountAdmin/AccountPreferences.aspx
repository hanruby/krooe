<%@ page language="VB" masterpagefile="~/Masters/MasterPageemployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountPreferences, App_Web_ivwc32h1" title="TimeLive - Application Preferences" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="../Home/Controls/ctlaccountform.ascx" TagName="ctlaccountform"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlaccountform ID="Ctlaccountform1" runat="server" />
</asp:Content>

