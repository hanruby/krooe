<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_AccountProjectRole, App_Web_nvpfcf1t" title="TimeLive - Project Role" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountProjectRoleList.ascx" TagName="ctlAccountProjectRoleList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountProjectRoleList ID="CtlAccountProjectRoleList1" runat="server" />
</asp:Content>

