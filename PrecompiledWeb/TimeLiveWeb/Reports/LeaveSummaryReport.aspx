<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_LeaveSummaryReport, App_Web_m2vvsnbz" title="TimeLive - Leave Summary Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlLeaveSummaryReport.ascx" TagName="ctlLeaveSummaryReport"
    TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlLeaveSummaryReport ID="CtlLeaveSummaryReport1" runat="server" />
</asp:Content>

