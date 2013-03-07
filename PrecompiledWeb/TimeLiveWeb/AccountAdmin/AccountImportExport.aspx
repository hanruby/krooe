<%@ page language="VB" autoeventwireup="false" masterpagefile="~/Masters/MasterPageEmployee.master" inherits="AccountAdmin_AccountImportExport, App_Web_ivwc32h1" title="TimeLive - Import Export" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountImportExport.ascx" TagName="ctlAccountImportExport"
    TagPrefix="uc1" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
        <uc1:ctlAccountImportExport ID="CtlAccountImportExport1" runat="server" />
</asp:Content>