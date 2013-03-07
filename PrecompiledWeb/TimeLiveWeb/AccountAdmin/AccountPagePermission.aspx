<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountPagePermission, App_Web_ivwc32h1" title="TimeLive - Role Permissions" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountPagePermissionList.ascx" TagName="ctlAccountPagePermissionList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountPagePermissionList ID="CtlAccountPagePermissionList1" runat="server" />
</asp:Content>

