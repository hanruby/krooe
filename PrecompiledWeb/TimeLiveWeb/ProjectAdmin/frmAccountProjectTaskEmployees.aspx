<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_frmAccountProjectTaskEmployees, App_Web_nvpfcf1t" title="Untitled Page" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountProjectTaskEmployeeList.ascx" TagName="ctlAccountProjectTaskEmployeeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountProjectTaskEmployeeList ID="CtlAccountProjectTaskEmployeeList1" runat="server" />
</asp:Content>

