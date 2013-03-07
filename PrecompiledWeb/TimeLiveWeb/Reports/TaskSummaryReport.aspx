<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_TaskSummaryReport, App_Web_m2vvsnbz" title="TimeLive - Task Summary Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlTaskSummaryReport.ascx" TagName="ctlTaskSummaryReport"
    TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlTaskSummaryReport ID="CtlTaskSummaryReport1" runat="server" />
</asp:Content>

