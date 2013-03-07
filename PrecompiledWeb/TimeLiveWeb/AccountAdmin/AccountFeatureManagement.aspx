<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountFeatureManagement, App_Web_ivwc32h1" title="TimeLive - Feature Management" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountFeatureManagement.ascx" TagName="ctlAccountFeatureManagement"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountFeatureManagement ID="ctlAccountFeatureManagement1" runat="server" />
</asp:Content>