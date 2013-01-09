<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_MyProjects, App_Web_pv0uxbk0" title="My Projects" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlMyProjects.ascx" TagName="ctlMyProjects" TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlMyProjects ID="CtlMyProjects1" runat="server" />
</asp:Content>

