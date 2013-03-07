<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountDisable, App_Web_ivwc32h1" title="TimeLive - Account Disable" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountDisableList.ascx" TagName="ctlAccountDisableList"
    TagPrefix="uc4" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
 <uc4:ctlAccountDisableList ID="CtlAccountDisableList1" runat="server" />
</asp:Content>

