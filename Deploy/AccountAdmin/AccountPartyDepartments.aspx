<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountPartyDepartments, App_Web_yaqbagu1" title="TimeLive - Client Departments" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountPartyDepartmentList.ascx" TagName="ctlAccountPartyDepartmentList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountPartyDepartmentList ID="CtlAccountPartyDepartmentList1" runat="server" />
</asp:Content>

