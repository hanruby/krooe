<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_EmployeeProfile, App_Web_v0exk3tf" title="TimeLive - My Profile" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeProfile.ascx" TagName="ctlAccountEmployeeProfile"
    TagPrefix="uc1" %>

<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeProfile ID="CtlAccountEmployeeProfile1" runat="server" />
</asp:Content>

