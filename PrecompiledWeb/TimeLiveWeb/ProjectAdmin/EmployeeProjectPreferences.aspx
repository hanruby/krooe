<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_EmployeeProjectPreferences, App_Web_nvpfcf1t" title="Employee Project Preferences" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeProjectPreferences.ascx" TagName="ctlAccountEmployeeProjectPreferences"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeProjectPreferences ID="CtlAccountEmployeeProjectPreferences1"
        runat="server" />
</asp:Content>

