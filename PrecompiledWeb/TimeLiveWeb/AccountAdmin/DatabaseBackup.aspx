<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_DatabaseBackup, App_Web_ivwc32h1" title="TimeLive - Database Backup" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlDatabaseBackup.ascx" TagName="ctlDatabaseBackup"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlDatabaseBackup ID="ctlDatabaseBackup1" runat="server" />
</asp:Content>