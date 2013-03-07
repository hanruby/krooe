<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_TimeOffStatus, App_Web_v0exk3tf" title="TimeLive - Time Off Status" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlTimeOffStatus.ascx" TagName="ctlTimeOffStatus" TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlTimeOffStatus ID="CtlTimeOffStatus1" runat="server" />
</asp:Content>

