<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_EmployeeListReport, App_Web_ewyvs0tt" title="TimeLive - All Employees Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlEmployeeListReport.ascx" TagName="ctlEmployeeListReport"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlEmployeeListReport ID="CtlEmployeeListReport1" runat="server" />
</asp:Content>

