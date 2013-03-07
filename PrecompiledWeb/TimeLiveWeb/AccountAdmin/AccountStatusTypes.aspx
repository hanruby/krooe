<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountStatusTypes, App_Web_ivwc32h1" title="TimeLive - Status" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountStatusList.ascx" TagName="ctlAccountStatusList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountStatusList ID="CtlAccountStatusList1" runat="server" />
</asp:Content>

