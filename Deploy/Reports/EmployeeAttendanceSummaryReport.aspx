<%@ page language="VB" masterpagefile="~/Masters/MasterPageemployee.master" autoeventwireup="false" inherits="Reports_EmployeeAttendanceSummaryReport, App_Web_ewyvs0tt" title="TimeLive - Employee Attendance Summary Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlEmployeeAttendanceSummaryReport.ascx" TagName="ctlEmployeeAttendanceSummaryReport"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlEmployeeAttendanceSummaryReport ID="CtlEmployeeAttendanceSummaryReport1" runat="server" />
</asp:Content>

