<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_ProjectSummaryReport, App_Web_ewyvs0tt" title="TimeLive - Project Activity Summary Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlProjectSummary.ascx" TagName="ctlProjectSummary"
    TagPrefix="uc2" %>

<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc2:ctlProjectSummary ID="CtlProjectSummary1" runat="server" />
</asp:Content>

