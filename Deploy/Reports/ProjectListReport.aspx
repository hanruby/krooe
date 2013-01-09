<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_ProjectListReport, App_Web_ewyvs0tt" title="TimeLive - All Projects Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlProjectListReport.ascx" TagName="ctlProjectListReport"
    TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlProjectListReport ID="CtlProjectListReport1" runat="server" />
</asp:Content>

