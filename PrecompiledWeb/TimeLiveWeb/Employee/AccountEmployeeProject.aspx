    <%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AccountEmployeeProject, App_Web_v0exk3tf" title="TimeLive - Employee Project" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlAccountEmployeeProject.ascx" TagName="ctlAccountEmployeeProject"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeProject ID="ctlAccountEmployeeProject" runat="server" />
</asp:Content>
