<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountEmployees, App_Web_ivwc32h1" title="TimeLive - Employees" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeList.ascx" TagName="ctlAccountEmployeeForm"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeForm ID="CtlAccountEmployeeForm1" runat="server" />
</asp:Content>

