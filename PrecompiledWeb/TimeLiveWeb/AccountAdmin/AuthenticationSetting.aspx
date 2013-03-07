<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AuthenticationSetting, App_Web_ivwc32h1" title="TimeLive - Authentication Setting" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAuthenticationSetting.ascx" TagName="ctlAuthenticationSetting"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAuthenticationSetting ID="CtlAuthenticationSetting1" runat="server" />
</asp:Content>

