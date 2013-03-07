<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_TimeEntryArchive, App_Web_ivwc32h1" title="TimeLive - Time Entry Archive" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlTimeEntryArchive.ascx" TagName="ctlTimeEntryArchive"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlTimeEntryArchive ID="CtlTimeEntryArchive1" runat="server" />
</asp:Content>

