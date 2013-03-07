<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountAttachments, App_Web_ivwc32h1" title="TimeLive - Attachments" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountAttachments.ascx" TagName="ctlAccountAttachments"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountAttachments ID="CtlAccountAttachments1" runat="server" />
</asp:Content>

