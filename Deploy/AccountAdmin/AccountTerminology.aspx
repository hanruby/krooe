<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountTerminology, App_Web_yaqbagu1" title="TimeLive - Manage Terminology" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTerminologyList.ascx" TagName="ctlAccountTerminologyList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTerminologyList ID="CtlAccountTerminologyList1" runat="server" />
</asp:Content>

