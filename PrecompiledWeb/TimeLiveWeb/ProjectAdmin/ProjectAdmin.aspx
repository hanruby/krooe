<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_ProjectAdmin, App_Web_nvpfcf1t" title="TimeLive - Project Admin" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlProjectAdmin.ascx" TagName="ctlProjectAdmin" TagPrefix="uc1" %>

<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlProjectAdmin ID="CtlProjectAdmin1" runat="server" />
</asp:Content>

