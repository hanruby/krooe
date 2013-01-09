<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_TimeOffRequest, App_Web_pv0uxbk0" title="Time Off Request" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlTimeOffRequest.ascx" TagName="ctlTimeOffRequest" TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlTimeOffRequest ID="CtlTimeOffRequest1" runat="server" />
</asp:Content>

