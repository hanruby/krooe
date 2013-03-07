<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_Controls_frmAccountRoles, App_Web_ivwc32h1" title="TimeLive - Roles" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountRoleList.ascx" TagName="ctlAccountRoleList"
    TagPrefix="uc3" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    
    <uc3:ctlAccountRoleList ID="CtlAccountRoleList1" runat="server" />
    
</asp:Content>

