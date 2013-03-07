    <%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountProjectEmployees, App_Web_nvpfcf1t" title="TimeLive - Project Employees" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlAccountProjectEmployee.ascx" TagName="ctlAccountProjectEmployee"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountProjectEmployee ID="CtlAccountProjectEmployee" runat="server" />
</asp:Content>
